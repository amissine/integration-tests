#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
nvm install 6.9

# env
export BRIDGE_PORT=8000
export COMPLIANCE_EXTERNAL_PORT=80 # 8001
export COMPLIANCE_INTERNAL_PORT=8002
export FI_PORT=8003

function download_all() {
  if [ "$BRIDGE_VERSION" == "master" ]
  then
    export MONOREPO=$GOPATH/src/github.com/stellar/go
    mkdir -p $MONOREPO
    #git clone https://github.com/stellar/go $MONOREPO
    git clone https://github.com/amissine/go $MONOREPO
    cd $MONOREPO
    dep ensure -v
    go build -v ./services/bridge
    go build -v ./services/compliance
    cd -
    # Move binaries to home dir
    mv $MONOREPO/bridge $MONOREPO/compliance .
  else
    wget  -nv https://github.com/stellar/bridge-server/releases/download/$BRIDGE_VERSION/bridge-$BRIDGE_VERSION-linux-amd64.tar.gz
    wget  -nv https://github.com/stellar/bridge-server/releases/download/$BRIDGE_VERSION/compliance-$BRIDGE_VERSION-linux-amd64.tar.gz
    tar -xvzf bridge-$BRIDGE_VERSION-linux-amd64.tar.gz
    tar -xvzf compliance-$BRIDGE_VERSION-linux-amd64.tar.gz
    # Move binaries to home dir
    mv bridge-$BRIDGE_VERSION-linux-amd64/bridge ./bridge
    mv compliance-$BRIDGE_VERSION-linux-amd64/compliance ./compliance
  fi

  chmod +x ./bridge ./compliance
}

function config_all() {
  export DATABASE_URL=postgres://postgres@db/bridge?sslmode=disable
  sed -i "s#{DATABASE_URL}#${DATABASE_URL}#g" bridge.cfg
  sed -i "s/{BRIDGE_PORT}/${BRIDGE_PORT}/g" bridge.cfg
  sed -i "s/{ISSUING_ACCOUNT}/${ISSUING_ACCOUNT}/g" bridge.cfg
  sed -i "s/{RECEIVING_ACCOUNT}/${RECEIVING_ACCOUNT}/g" bridge.cfg
  sed -i "s/{RECEIVING_SEED}/${RECEIVING_SEED}/g" bridge.cfg
  sed -i "s/{AUTHORIZING_SEED}/${AUTHORIZING_SEED}/g" bridge.cfg
  sed -i "s/{COMPLIANCE_INTERNAL_PORT}/${COMPLIANCE_INTERNAL_PORT}/g" bridge.cfg
  sed -i "s/{FI_PORT}/${FI_PORT}/g" bridge.cfg

  export DATABASE_URL=postgres://postgres@db/compliance?sslmode=disable
  sed -i "s#{DATABASE_URL}#${DATABASE_URL}#g" compliance.cfg
  sed -i "s/{COMPLIANCE_EXTERNAL_PORT}/${COMPLIANCE_EXTERNAL_PORT}/g" compliance.cfg
  sed -i "s/{COMPLIANCE_INTERNAL_PORT}/${COMPLIANCE_INTERNAL_PORT}/g" compliance.cfg
  sed -i "s/{SIGNING_SEED}/${SIGNING_SEED}/g" compliance.cfg
  sed -i "s/{FI_PORT}/${FI_PORT}/g" compliance.cfg
}

# Drop function init_fi_server()
function init_all() {
  # Wait for postgres to start
  until psql -h db -U postgres -c '\l'; do
    echo "Waiting for postgres..."
    sleep 5
  done

  # Drop databases when starting existing machine
  psql -h db -c 'drop database bridge;' -U postgres || true
  psql -h db -c 'drop database compliance;' -U postgres || true

  psql -h db -c 'create database bridge;' -U postgres
  psql -h db -c 'create database compliance;' -U postgres

  ./bridge --migrate-db
  ./compliance --migrate-db

  echo "Starting 'npm install' in $(pwd)"
  npm install
}

function start() {
  ifconfig; 
  echo $PROXY $FI_DOMAIN >> /etc/hosts
  echo $PROXY $OTHER_FI_DOMAIN >> /etc/hosts
  cat /etc/hosts
  ./bridge -c bridge.cfg &
  ./compliance -c compliance.cfg &
  sleep 10
  ps -ef
  node index.js
}

if [ ! -f _created ]
then
  download_all
  config_all
  init_all
  touch _created
else
  # Wait for a DB to start
  sleep 10
fi
start

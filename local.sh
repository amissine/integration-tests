# Run this script when not using travis

sudo node https-proxy.js $1 $2 &

FI1_RECEIVING_ACCOUNT=GBRNDJKH652LO3XD3PAXWDGGY22IHFRKHYMCC7DYXURWDKLVGPSS5CLG
FI2_RECEIVING_ACCOUNT=GBHFE7MVEEZYRTCQWS4CQ7J5WWNJ4NACTGK6ZFOXA6ULDGS2QRYQLW6N

node checkAccount.js $FI1_RECEIVING_ACCOUNT
node checkAccount.js $FI2_RECEIVING_ACCOUNT

export FI1_BRIDGE_VERSION=master # v0.0.31
export FI2_BRIDGE_VERSION=master # v0.0.31
export DOCKER_HOST_IP_ADDRESS='10.0.0.27'
./script.sh

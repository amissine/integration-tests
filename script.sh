# build container image
docker build ./container -t container

# No ngrok {{{1
## download ngrok
#ZIP=ngrok-stable-linux-amd64.zip
#URL=https://bin.equinox.io/c/4VmDzA7iaHb/$ZIP
#[ -x ngrok ] || { wget -nv $URL && unzip $ZIP && rm $ZIP; }
#
## start ngrok
#export FI1_SUBDOMAIN=stellarfi$(openssl rand -hex 5)
#export FI2_SUBDOMAIN=stellarfi$(openssl rand -hex 5)
#export NGROK_AUTH_TOKEN=4yYkPvgmcyEf8JkKLC6m8_7sfHxzF1knmTubyWiNpWa
#
#cp ngrok.tpl.yml ngrok.yml
#sed -i "s/{NGROK_AUTH_TOKEN}/${NGROK_AUTH_TOKEN}/g" ngrok.yml
#sed -i "s/{FI1_SUBDOMAIN}/${FI1_SUBDOMAIN}/g" ngrok.yml
#sed -i "s/{FI2_SUBDOMAIN}/${FI2_SUBDOMAIN}/g" ngrok.yml
#
#./ngrok start --config ./ngrok.yml --all --log=stdout > ngrok.log &
# }}}1

# build cluster
export FI1_DOMAIN=fi1 # ${FI1_SUBDOMAIN}.fist.io
export FI2_DOMAIN=fi2 # ${FI2_SUBDOMAIN}.fist.io

docker-compose up &
node monitor.js

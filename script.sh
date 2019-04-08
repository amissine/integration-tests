# build container image
docker build ./container -t container

# download ngrok
ZIP=ngrok-stable-linux-amd64.zip
URL=https://bin.equinox.io/c/4VmDzA7iaHb/$ZIP
[ -x ngrok ] || { wget -nv $URL && unzip $ZIP && rm $ZIP; }

# start ngrok
export FI1_SUBDOMAIN=stellarfi$(openssl rand -hex 5)
export FI2_SUBDOMAIN=stellarfi$(openssl rand -hex 5)

cp ngrok.tpl.yml ngrok.yml
sed -i "s/{NGROK_AUTH_TOKEN}/${NGROK_AUTH_TOKEN}/g" ngrok.yml
sed -i "s/{FI1_SUBDOMAIN}/${FI1_SUBDOMAIN}/g" ngrok.yml
sed -i "s/{FI2_SUBDOMAIN}/${FI2_SUBDOMAIN}/g" ngrok.yml

./ngrok start --config ./ngrok.yml --all --log=stdout > ngrok.log &

# build cluster
export FI1_DOMAIN=${FI1_SUBDOMAIN}.ngrok.io
export FI2_DOMAIN=${FI2_SUBDOMAIN}.ngrok.io
export FI1_RECEIVING_SEED=GCNP7JE6KR5CKHMVVFTZJUSP7ALAXWP62SK6IMIY4IF3JCHEZKBJKDZF
export FI1_SIGNING_SEED=GD4SMSFNFASBHPMCOJAOVYH47OXQM5BGSHFLKHO5BGRGUK6ZOAVDG54B
export FI2_RECEIVING_SEED=GAAJKG3WQKHWZJ5RGVVZMVV6X3XYU7QUH2YVATQ2KBVR2ZJYLG35Z65A
export FI2_SIGNING_SEED=GBAPTLS2A72RGEQIK6GQ4F74AIYFS2N7WIQ7LZOYKOJT4KD6MUQEHOEU

docker-compose up &

# start monitoring app
node monitor.js

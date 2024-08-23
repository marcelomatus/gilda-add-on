#!/usr/bin/with-contenv bashio

echo "Supervisor Token: ${SUPERVISOR_TOKEN}"
echo "Starting python web server...."

python3 -m gilda_local.web_server

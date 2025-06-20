#!/bin/bash

# Registers the VNC browser container into Guacamole using the REST API

GUAC_HOST="http://localhost:8080/guacamole"
USERNAME="guacadmin"
PASSWORD="guacadmin"

# Get Auth Token
TOKEN=$(curl -s -X POST "$GUAC_HOST/api/tokens" -d "username=$USERNAME&password=$PASSWORD" | jq -r .authToken)

# Get Data Source (usually "mysql")
DATA_SOURCE=$(curl -s "$GUAC_HOST/api/session/data" -H "Authorization: Bearer $TOKEN" | jq -r 'keys[0]')

# Create VNC Connection
curl -s -X POST "$GUAC_HOST/api/session/data/$DATA_SOURCE/connections" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Isolated Firefox",
    "protocol": "vnc",
    "parameters": {
      "hostname": "browser",
      "port": "5901",
      "username": "",
      "password": "",
      "color-depth": "24",
      "cursor": "",
      "read-only": "",
      "swap-red-blue": "",
      "clipboard-encoding": "",
      "disable-copy": "true",
      "disable-paste": "true",
      "dest-port": ""
    },
    "attributes": {
      "max-connections": "1",
      "max-connections-per-user": "1",
      "enable-session-recording": "true",
      "recording-path": "/tmp/recordings"
    }
  }'

echo "✅ Browser connection registered. Login at $GUAC_HOST"
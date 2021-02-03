# https://mydevices.com/cayenne/docs_stage/cayenne-mqtt-api/#cayenne-mqtt-api-manually-publishing-subscribing
# Manually Publishing / Subscribing

import paho.mqtt.client as mqtt

user = ''
password = ''
client_id = ''
server = 'mqtt.mydevices.com'
port = 1883

# Client ID
client = mqtt.Client(client_id)

# MQTT username, MQTT password
client.username_pw_set(user, password)

# MQTT Server, MQTT Port,
client.connect(server, port)

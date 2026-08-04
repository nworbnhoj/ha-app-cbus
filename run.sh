#!/usr/bin/with-contenv bashio

device=""
if bashio::config.has_value "device.serial"; then
  serial=$(bashio::config "device.serial")
  device="--serial ${serial}"
else
  bashio::log.warning "required device missing"
fi



# required
broker_url=""
if bashio::config.has_value "mqtt.host" && bashio::config.has_value "mqtt.port"; then
  mqtt_host=$(bashio::config "mqtt.host")
  mqtt_port=$(bashio::config "mqtt.port")
  if timeout 5 bash -c "</dev/tcp/${mqtt_host}/${mqtt_port}" 2>/dev/null; then
    bashio::log.info "MQTT broker at ${mqtt_host}:${mqtt_port} is responding"
    broker_url="--broker-address ${mqtt_host} --broker-port ${mqtt_port}"
  else
    bashio::log.warning "mosquitto broker at ${mqtt_host}:${mqtt_port} is NOT responding"
  fi
else
  bashio::log.warning "required mosquitto broker ip+port missing"
fi


broker_auth=""
if bashio::config.has_value "mqtt.username" && bashio::config.has_value "mqtt.password"; then
  username=$(bashio::config "mqtt.username")
  password=$(bashio::config "mqtt.password")
  mkdir -p /etc/cmqttd && echo -e "${username}\n${password}" > /etc/cmqttd/auth
  broker_auth="--broker-auth /etc/cmqttd/auth"
else
  bashio::log.warning "mosquitto username and password missing"
fi


broker_tls="--broker-disable-tls"
if bashio::config.has_value "ssl.cert" && bashio::config.has_value "ssl.key"; then
  mkdir -p /etc/cmqttd && echo -e $(bashio::config 'ssl.cert') > /etc/cmqttd/client.pem
  mkdir -p /etc/cmqttd && echo -e $(bashio::config 'ssl.key') > /etc/cmqttd/client.key
  broker_tls="--broker-client-cert /etc/cmqttd/client.pem --broker-client-key /etc/cmqttd/client.key"
else
  bashio::log.warning "tls disabled - mosquitto client cert+key missing"
fi


# future use
mkdir -p /etc/cmqttd && touch /etc/cmqttd/project.cbz
mkdir -p /etc/cmqttd && touch /etc/cmqttd/certificates


cmqttd ${device} ${broker_url} ${broker_auth} ${broker_tls}

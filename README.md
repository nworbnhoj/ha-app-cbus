# C-Bus Bridge

Control your [Clipsal C-Bus][clipsal-cbus] wired building from Home Assistant

## C-Bus™ by Clipsal

> C-Bus, developed by Clipsal (now part of Schneider Electric) in 1994, is a trusted lighting and building automation system renowned for its reliability, scalability, and energy efficiency. Designed in Australia, it has become a market leader in automating lighting, HVAC, security, and blinds for residential, commercial, and industrial applications. 

**This Home Assistant App is not certified or endorsed by Clipsal or Schneider Electric** (and that's why we like it).

**Clipsal claim that use of C-Bus with non-Clipsal hardware or software may void your warranty.** (lighten up guys)

## Legends

### libcbus

This HomeAssistant App is but a thin wrapper around the groundbreaking [libcbus] project.

Please buy [Michael Farrell] a drink.

Talks to Clipsal C-Bus using Python 3.7+.

Copyright 2012-2020 Michael Farrell. Licensed under the GNU LGPL3+. For more
details see `COPYING` and `COPYING.LESSER`.

### cgateweb

You should really checkout [cgateweb] as a fabulous alternative.

Please buy [Doug Rathbone](https://buymeacoffee.com/dougrathbone) a drink as well.

## Requirements

- [ ] 1 x C-Bus wired building
- [ ] 1 x C-Bus Control and Management System Interface [5500PC] [5500PCU] [5500CN] [5500CN2]
- [ ] 1 x [Home Assistant] instance up and running
- [ ] 1 x [Mosquitto Broker App] installed

## Installation

- Pysically connect your C-Bus Interface Device to:
  - your HA instance
  - your C-Bus network
- In `Settings - Apps - Install App`: Install the App.
- in `Settings - Apps - C-Bus`: Configure the App
  - select your C-Bus Integration Device,
  - add mqqt username+password,
  - ssl cert+key (if required)
- in `Settings - Apps - C-Bus`: Start the App and check log for success *"Connected to MQTT broker"* or helpful error messages
- in `Settings - Apps - Mosquitto`: Check the log for success *"New client connected from 172.30.33.3:50875 as auto-DD482314-99D8-942F-09B0-3EF659D4A149 (p4, c1, k60, u'cmqttd')."*" or helpful error messages
- in `Settings - Devices & Services - Mosquitto`: Look for lots of new Devices *"C-Bus Light 000"*
- Start adding your C-Bus Devices to Templates.

## Status

Currently only tested and working with Home Assistant on a RPi with a [5500PCU] plugged at `/dev/tty0`

It is probably easy to extend to other devices ([5500PC] [5500CN] [5500CN2]) if there are punters who are willing and able to test.





[libcbus]: https://github.com/micolous/cbus
[5500PC]: https://www.clipsal.com/Trade/Products/ProductDetail?catno=5500PC
[5500PCU]: https://www.clipsal.com/Trade/Products/ProductDetail?catno=5500PCU
[5500CN]: https://updates.clipsal.com/ClipsalOnline/Files/Brochures/W0000348.pdf
[5500CN2]: https://www.clipsal.com/Trade/Products/ProductDetail?catno=5500CN2
[clipsal-cbus]: https://mysmart.com.au/products/c-bus-protocol/
[Home Assistant]: https://www.home-assistant.io/
[Mosquitto Broker App]: https://github.com/home-assistant/addons/tree/master/mosquitto
[Michael Farrell]: https://github.com/micolous
[cgateweb]: https://github.com/dougrathbone/cgateweb
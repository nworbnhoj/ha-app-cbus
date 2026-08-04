This HomeAssistant App is a thin wrapper around Michael Farrell's groundbreaking [libcbus] project.

Currently only tested and working with Home Assistant on a RPi with a [5500PCU USB PCI][5500PCU] plugged at /dev/tty0

It is likely relatively easy to extend to other devices ([5500PC] [5500CN] [5500CN2]) if there are people who are willing and able to test.


## libcbus

[micolous/cbus][libcbus]

Talks to Clipsal C-Bus using Python 3.7+.

Copyright 2012-2020 Michael Farrell. Licensed under the GNU LGPL3+. For more
details see `COPYING` and `COPYING.LESSER`.

> **Note:** This software is not certified or endorsed by Clipsal or Schneider
> Electric. Clipsal claim that use of C-Bus with non-Clipsal hardware or
> software may void your warranty.

[libcbus]: https://github.com/micolous/cbus
[5500PC]: https://www.clipsal.com/Trade/Products/ProductDetail?catno=5500PC
[5500PCU]: https://www.clipsal.com/Trade/Products/ProductDetail?catno=5500PCU
[5500CN]: https://updates.clipsal.com/ClipsalOnline/Files/Brochures/W0000348.pdf
[5500CN2]: https://www.clipsal.com/Trade/Products/ProductDetail?catno=5500CN2

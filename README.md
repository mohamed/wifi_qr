Encoding your WiFi access point password into a QR code
=======================================================

Up until recently, it was a pain to defend againt WPA2 brute-force attacks by
using a random 63-character password (the maximum in WPA-Personal) mode).
Thanks to Android and now iOS 11 supporting reading WiFi passwords from a QR
code, this is finally a practical defense.


Prerequisites
-------------

On a Debian box, you need to run:

`sudo apt install qrencode pwgen`


Generating the QR code
----------------------

After installing the preequisites, run the `generate.sh` script as follows:

`generate.sh <SSID>`

where `<SSID>` is the name of your WiFi network.
The script internally invokes `qrencode` as follows:

`qrencode -o wifi.png "WIFI:T:WPA2;S:<SSID>;P:<PASSWORD>;;"`

substituting `<SSID>` for the name of your WiFi network and `<PASSWORD>` for the
63-character password generated with `pwgen -s 63`.


Scanning the QR code
--------------------

On iOS/Android, simply open the camera app and scan the QR code to bring up a
notification which allows you to connect to the WiFi network.
On Windows/Linux, use the password displayed by the script.

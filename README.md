# NetworkAdapterSettingsPS3
Change settings of network adapter (windows) to transfer files via FTP > PS3

After run the script in PowerShell and connect PC with PS3 with LAN CABLE.

In your PS3 go to Network Options -> Internet Connection Settings -> Custom -> Wired Connection -> Manual Settings -> '1000BASE-T FULL-DUPLEX' -> Manual ->
And put this:<br>
 IP ADDRESS : 192 . 168 . 0 . 5"<br>
 SUBNET MASK : 255 . 255 . 255 . 0"<br>
 DEFAULT ROUTER : 192 . 168 . 0 . 1"<br>
 PRIMARY DNS : 8 . 8 . 8 . 8"<br>
 SECONDARY DNS : 0 . 0 . 0 . 0"<br>
 CLICK NEXT -> Automatic -> Do Not Use -> And save it"

In your PC go to FILEZILLA and in IP Server put 192.168.0.5 and DONE :)

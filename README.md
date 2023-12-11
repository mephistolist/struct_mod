# struct_mod
Just a simple app that passes struct values to a basic character driver. Tested on kernel 6.6.3.

Run "make" to build the driver and userapp.
You can insert the driver with insmod ./hello.ko. 
From there you should see something like the following in dmesg:

[584105.654051] Device number registered<br>
[584105.654055] Major number received:240

From here you should have a device at /dev/mystruct. It will need these permissions to be added to interact with our userland app:

sudo chmod 666 /dev/mystruct

Then you can run the app and step through it with the enter key:

$ ./userapp                   
Opening File:/dev/mystruct

Write retval:8

Read retval:0	 int:5	char:a

Closing File

You will also see updated messages in dmesg from this:

[585123.468436] Device number registered<br/>
[585123.468440] Major number received:240<br/>
[585149.120864] device_open<br/>
[585150.936433] device_write: Copy from user returned:0<br/>
[585152.113037] device_read: Copy to user returned:0<br/>
[585152.113045] device_read:int :5	 char:a 	 Count:8 	 offset:0<br/>
[585153.168067] device_release

Finally, you can remove the driver with rmmod hello.


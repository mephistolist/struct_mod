# struct_mod
Just a simple app that passes struct values to a driver. Tested on kernel 6.6.3.

Run "make" to build the driver and userapp.
You can insert the driver with insmod ./hello.ko. 
From there you should see something like the following in dmesg:

[584105.654051] Device number registered
[584105.654055] Major number received:240


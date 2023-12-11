obj-m += hello.o
CFLAGS=-march=native -D_POSIX_C_SOURCE -D_GNU_SOURCE -O2 -Wall -Wextra -fPIC --std=c17 -pipe -s
LDFLAGS=-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

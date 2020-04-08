CROSS_COMPILE := arm-linux-gnueabihf-
ARCH := arm
CC:= $(CROSS_COMPILE)gcc
LD:= $(CROSS_COMPILE)ld

KDIR = /home/makeblock/makeblock/wangyilong/work/makeblock_lasercut_firmwall/sources/linux-sun8i
PWD := $(shell pwd)
obj-m := book.o

modules:
	#$(MAKE) -C $(KDIR) M=$(PWD) CFLAGS_MODULE=-fno-pic ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) modules
	$(MAKE) -C $(KDIR) M=$(PWD) CFLAGS_MODULE=-fPIC ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) modules

modules_install:
	$(MAKE) -C $(KDIR) M=$(PWD) modules_install

clean:
#rm -rf *.ko *.o *.mod.o *.mod.c *.symvers *.order *.*.cmd .tmp_versions
	echo clean
	$(MAKE) -C $(KDIR) M=$(PWD) clean 


KVERS = $(shell uname -r)
#KVERS = 4.15.0-91-generic

# Kernel modules
obj-m += globalfifo.o

build: kernel_modules

kernel_modules:
	make -C /lib/modules/$(KVERS)/build M=$(CURDIR) modules

clean:
#echo 111=$(CURDIR)
	make -C /lib/modules/$(KVERS)/build M=$(CURDIR) clean

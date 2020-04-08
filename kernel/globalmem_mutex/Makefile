KVERS = $(shell uname -r)

# Kernel modules
obj-m += globalmem.o

build: kernel_modules

kernel_modules:
	make -C /lib/modules/$(KVERS)/build M=$(CURDIR) modules

clean:
#echo 111=$(CURDIR)
	make -C /lib/modules/$(KVERS)/build M=$(CURDIR) clean

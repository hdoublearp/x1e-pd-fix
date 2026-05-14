KVER ?= $(shell uname -r)
KDIR ?= /usr/src/kernels/$(KVER)

obj-m += qcom_battmgr.o

all:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean

install:
	@echo "To install (backup original first):"
	@echo "  sudo cp /lib/modules/$(KVER)/kernel/drivers/power/supply/qcom_battmgr.ko.xz /lib/modules/$(KVER)/kernel/drivers/power/supply/qcom_battmgr.ko.xz.bak"
	@echo "  sudo xz qcom_battmgr.ko /lib/modules/$(KVER)/kernel/drivers/power/supply/qcom_battmgr.ko.xz --force"
	@echo "  sudo depmod -a"
	@echo "Then reload: sudo modprobe -r qcom_battmgr && sudo modprobe qcom_battmgr"

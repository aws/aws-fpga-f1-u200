
# XDMA Driver Installation

XDMA is a Linux kernel driver for using DMA and/or User-defined interrupts for AWS FPGAs. 

# Installation Instructions

Please follow the steps below to install XDMA driver for use with F1.A.1.4 kit

1.) Clone the XDMA driver from xilinx git repo using

  `$ git clone https://github.com/Xilinx/dma_ip_drivers`

2.) Update the PCIe device IDs in XDMA/linux-kernel/xdma/xdma_mod.c b/XDMA/linux-kernel/xdma/xdma_mod.c.
An example is provided as an xdma_patch file under sdk/xdma_patch/xdma_mod.patch

3.) Compile the XDMA driver using

  `$ make config_bar_num=2`

4.) Insert module into kernel using

  `$ sudo insmod xdma.ko`



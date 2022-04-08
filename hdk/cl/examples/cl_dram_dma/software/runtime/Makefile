# Amazon FPGA Hardware Development Kit
#
# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

INCLUDES = -I$(SDK_DIR)/userspace/include

CC = gcc
CFLAGS = -DCONFIG_LOGLEVEL=4 -std=gnu11 -g -Wall -Werror $(INCLUDES)

LDLIBS = -lfpga_mgmt

SRC = test_dram_dma_common.c test_dram_dma.c test_dram_dma_hwsw_cosim.c
OBJ = $(SRC:.c=.o)


all: test_dram_dma cosim $(BIN)

test_dram_dma: $(OBJ)
	$(CC) $(CFLAGS) -o test_dram_dma test_dram_dma.o test_dram_dma_common.o  $(LDFLAGS) $(LDLIBS)

cosim: $(OBJ)
	$(CC) $(CFLAGS) -o test_dram_dma_hwsw_cosim test_dram_dma_hwsw_cosim.o test_dram_dma_common.o $(LDFLAGS) $(LDLIBS)

clean:
	rm -f *.o test_dram_dma test_dram_dma_hwsw_cosim


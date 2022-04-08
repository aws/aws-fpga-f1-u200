# Amazon FPGA Hardware Development Kit
#
# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0


VPATH = src:include:$(HDK_DIR)/common/software/src:$(HDK_DIR)/common/software/include

C_SRCS := test_hello_world.c pcie_utils.c cl_utils.c main.c
C_OBJS := $(C_SRCS:.c=.o)

CC = gcc
CFLAGS = -I ./include
CFLAGS += -I $(HDK_DIR)/common/software/include
all: test_hello_world

test_hello_world: $(C_SRCS)
	$(CC) $(CFLAGS) -o $@ $^

clean:
	rm test_hello_world

/*
 * Amazon FPGA Hardware Development Kit
 *
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0
 */

#include <stdio.h>
#include <stdint.h>
#include <fcntl.h>
#include <errno.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>

#include <sys/stat.h>
#include <sys/types.h>
#include <utils/sh_dpi_tasks.h>

#if defined(SV_TEST)
   #include <fpga_pci_sv.h>
   #include <utils/macros.h>
#else
   #include <fpga_pci.h>
   #include <utils/lcd.h>
#endif

#include "test_dram_dma_common.h"

int fill_buffer_urandom(uint8_t *buf, size_t size)
{
    int fd, rc;

    fd = open("/dev/urandom", O_RDONLY);
    if (fd < 0) {
        return errno;
    }

    off_t i = 0;
    while ( i < size ) {
        rc = read(fd, buf + i, min(4096, size - i));
        if (rc < 0) {
            close(fd);
            return errno;
        }
        i += rc;
    }
    close(fd);

    return 0;
}

uint64_t buffer_compare(uint8_t *bufa, uint8_t *bufb,
    size_t buffer_size)
{
    size_t i;
    uint64_t differ = 0;
    for (i = 0; i < buffer_size; ++i) {
        
         if (bufa[i] != bufb[i]) {
            differ += 1;
        }
    }

    return differ;
}

#if defined(SV_TEST)
static uint8_t *send_rdbuf_to_c_read_buffer = NULL;
static size_t send_rdbuf_to_c_buffer_size = 0;

void setup_send_rdbuf_to_c(uint8_t *read_buffer, size_t buffer_size)
{
    send_rdbuf_to_c_read_buffer = read_buffer;
    send_rdbuf_to_c_buffer_size = buffer_size;
}

int send_rdbuf_to_c(char* rd_buf)
{
#ifndef VIVADO_SIM
    /* Vivado does not support svGetScopeFromName */
    svScope scope;
    scope = svGetScopeFromName("tb");
    svSetScope(scope);
#endif
    int i;

    /* For Questa simulator the first 8 bytes are not transmitted correctly, so
     * the buffer is transferred with 8 extra bytes and those bytes are removed
     * here. Made this default for all the simulators. */
    for (i = 0; i < send_rdbuf_to_c_buffer_size; ++i) {
        send_rdbuf_to_c_read_buffer[i] = rd_buf[i+8];
    }

    /* end of line character is not transferered correctly. So assign that
     * here. */
    /*send_rdbuf_to_c_read_buffer[send_rdbuf_to_c_buffer_size - 1] = '\0';*/

    return 0;
}

#endif

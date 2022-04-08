// Amazon FPGA Hardware Development Kit
//
// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

#ifndef SH_DPI_TASKS
#define SH_DPI_TASKS

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdarg.h>

#ifdef SV_TEST
   #ifndef VIVADO_SIM
      #include "svdpi.h"
   #endif
#endif
#include <stdarg.h>

extern void sv_printf(char *msg);
extern void sv_map_host_memory(uint8_t *memory);

extern void cl_peek(uint64_t addr, uint32_t *data);
extern void cl_poke(uint64_t addr, uint32_t  data);
extern void cl_peek_pcis(uint64_t addr, uint32_t *data);
extern void cl_poke_pcis(uint64_t addr, uint32_t  data);
extern void cl_peek_sda(uint64_t addr, uint32_t *data);
extern void cl_poke_sda(uint64_t addr, uint32_t  data);
extern void cl_peek_ocl(uint64_t addr, uint32_t *data);
extern void cl_poke_ocl(uint64_t addr, uint32_t  data);
extern void cl_peek_bar1(uint64_t addr, uint32_t *data);
extern void cl_poke_bar1(uint64_t addr, uint32_t  data);
extern void sv_int_ack(uint32_t int_num);
extern void sv_pause(uint32_t x);
extern void sv_fpga_start_buffer_to_cl(uint32_t slot_id, uint32_t chan, uint32_t buf_size, uint64_t wr_buffer_addr, uint64_t cl_addr);
extern void sv_fpga_start_cl_to_buffer(uint32_t slot_id, uint32_t chan, uint32_t buf_size, uint64_t rd_buffer_addr, uint64_t cl_addr);
extern void init_ddr(void);
extern void deselect_atg_hw(void);
extern void hm_put_byte(uint64_t addr, uint8_t data);


#ifdef INT_MAIN
int test_main(uint32_t *exit_code);
#else
void test_main(uint32_t *exit_code);
#endif

#ifdef SV_TEST
int send_rdbuf_to_c(char* rd_buf);
#endif

void host_memory_putc(uint64_t addr, uint8_t data);

uint8_t host_memory_getc(uint64_t addr);


void cosim_printf(const char *format, ...);

void int_handler(uint32_t int_num);

#define LOW_32b(a)  ((uint32_t)((uint64_t)(a) & 0xffffffff))
#define HIGH_32b(a) ((uint32_t)(((uint64_t)(a)) >> 32L))

#endif

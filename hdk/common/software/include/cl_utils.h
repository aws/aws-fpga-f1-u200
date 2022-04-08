// Amazon FPGA Hardware Development Kit
//
// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0


void sv_printf(char *msg);
void sv_map_host_memory(uint8_t *memory);

void cl_peek(uint64_t addr, uint32_t *data);
void cl_poke(uint64_t addr, uint32_t  data);
void sv_pause(uint32_t x);

void test_main(uint32_t *exit_code);

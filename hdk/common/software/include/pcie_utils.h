// Amazon FPGA Hardware Development Kit
//
// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0


#include <stdint.h>
#include <stdbool.h>

void poke(uint32_t addr, uint32_t value);
uint32_t peek(uint32_t addr);
bool pcie_connect(int *argcP, char ***argvP);

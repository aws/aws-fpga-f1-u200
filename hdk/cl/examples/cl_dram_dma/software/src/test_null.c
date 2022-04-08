// Amazon FPGA Hardware Development Kit
//
// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0


#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// Vivado does not support svGetScopeFromName
#ifndef VIVADO_SIM
#include "svdpi.h"
#endif

#include "sh_dpi_tasks.c"

void test_main(uint32_t *exit_code) {

  // NULL Test

  *exit_code = 0;
}

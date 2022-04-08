// Amazon FPGA Hardware Development Kit
//
// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0


#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// Vivado does not support svGetScopeFromName
#ifdef INCLUDE_DPI_CALLS
#ifndef VIVADO_SIM
#include "svdpi.h"
#endif
#endif

#include <utils/sh_dpi_tasks.h>

//For cadence and questa simulators the main has to return some value
#ifdef INT_MAIN
   int test_main(uint32_t *exit_code) {
#else 
   void test_main(uint32_t *exit_code) {
#endif 

  // NULL Test

  *exit_code = 0;
}


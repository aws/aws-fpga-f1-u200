// Amazon FPGA Hardware Development Kit
//
// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

#include <stdio.h>
#include <stdlib.h>

#include "pcie_utils.h"
#include "cl_utils.h"

bool verbose = false;

int
main(int argc, char **argv)
{
  int exit_code;

  if (!pcie_connect(&argc, &argv)) {
    printf("Error: pcie_connect failed, Please specify slot\n");
    return -1;
  }

  test_main(&exit_code);

  return exit_code;
}

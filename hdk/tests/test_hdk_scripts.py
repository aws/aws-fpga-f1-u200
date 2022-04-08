#!/usr/bin/env python2.7

# Amazon FPGA Hardware Development Kit
#
# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

from __future__ import print_function
import logging
import os
from os.path import dirname, realpath
import pytest
import subprocess
import sys
import traceback
try:
    import aws_fpga_utils
    import aws_fpga_test_utils
    from aws_fpga_test_utils.AwsFpgaTestBase import AwsFpgaTestBase
except ImportError as e:
    traceback.print_tb(sys.exc_info()[2])
    print("error: {}\nMake sure to source hdk_setup.sh".format(sys.exc_info()[1]))
    sys.exit(1)

logger = aws_fpga_utils.get_logger(__name__)

class TestHdkScripts(AwsFpgaTestBase):
    '''
    Pytest test class.

    NOTE: Cannot have an __init__ method.
    '''

    @classmethod
    def setup_class(cls):
        '''
        Do any setup required for tests.
        '''
        AwsFpgaTestBase.setup_class(cls, __file__)

        (cls.agfi, cls.afi) = cls.get_agfi_from_readme('cl_hello_world')
        return

    @pytest.mark.skip(reason="Not implemented")
    def test_create_fpga_image(self):
        assert False

    def test_wait_for_afi(self):
        self.run_cmd("{}/shared/bin/scripts/wait_for_afi.py --afi {}".format(self.WORKSPACE, self.afi))

    @pytest.mark.skip(reason="Not implemented")
    def test_notify_via_sns(self):
        assert False

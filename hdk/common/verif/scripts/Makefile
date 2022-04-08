#-------------------------------------------------------------------------------
# Amazon FPGA Hardware Development Kit
#
# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0
#-------------------------------------------------------------------------------

DONE_FILE := $(HDK_COMMON_DIR)/verif/scripts/.done
DEPS_FILE := $(HDK_SHELL_DESIGN_DIR)/ip/ip.srcs/sources_1/ip/ddr4_core/ddr4_core.xci
DEPS_FILE += $(HDK_COMMON_DIR)/verif/scripts/init.tcl
DEPS_FILE += $(HDK_COMMON_DIR)/verif/scripts/init.sh

all: $(DONE_FILE)

$(DONE_FILE): $(DEPS_FILE)
	@ echo "INFO: Building in $(shell dirname $@)"
	@ echo "INFO: This could take 5-10 minutes, please be patient!"
	@ git clean -fXdq $(shell dirname $@)
	@ cd $(shell dirname $@)\
	&& ./init.sh $(MODEL_DIR)\
	&& echo "INFO: DDR4 model build passed."\
	|| (echo "ERROR: DDR4 model build failed." && exit 2)
	@ touch $@

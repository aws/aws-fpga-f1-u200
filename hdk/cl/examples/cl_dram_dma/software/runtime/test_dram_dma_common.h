/*
 * Amazon FPGA Hardware Development Kit
 *
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0
 */

#pragma once

/**
 * Fills the buffer with bytes read from urandom.
 */
int fill_buffer_urandom(uint8_t *buf, size_t size);

/**
 * This function is like memcmp, but it returns the number of bytes that differ.
 *
 * @returns number of bytes which differ, i.e. zero if buffers are the same
 */
uint64_t buffer_compare(uint8_t *bufa, uint8_t *bufb,
    size_t buffer_size);

/**
 * Checks to make sure that the slot has a recognized AFI loaded.
 */
int check_slot_config(int slot_id);


#if defined(SV_TEST)
void setup_send_rdbuf_to_c(uint8_t *read_buffer, size_t buffer_size);
int send_rdbuf_to_c(char* rd_buf);
#endif

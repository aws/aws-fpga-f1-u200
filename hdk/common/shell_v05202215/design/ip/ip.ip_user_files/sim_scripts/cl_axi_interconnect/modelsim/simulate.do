onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -L generic_baseblocks_v2_1_0 -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_22 -L fifo_generator_v13_2_5 -L axi_data_fifo_v2_1_21 -L axi_crossbar_v2_1_23 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.cl_axi_interconnect xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {cl_axi_interconnect.udo}

run -all

quit -force

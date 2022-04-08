onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+cl_axi_interconnect -L generic_baseblocks_v2_1_0 -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_22 -L fifo_generator_v13_2_5 -L axi_data_fifo_v2_1_21 -L axi_crossbar_v2_1_23 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.cl_axi_interconnect xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {cl_axi_interconnect.udo}

run -all

endsim

quit -force

onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+cl_axi_interconnect_m00_regslice_0 -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_22 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.cl_axi_interconnect_m00_regslice_0 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {cl_axi_interconnect_m00_regslice_0.udo}

run -all

endsim

quit -force

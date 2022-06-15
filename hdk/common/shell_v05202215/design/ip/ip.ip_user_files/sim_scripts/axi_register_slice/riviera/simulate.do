onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+axi_register_slice -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_22 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.axi_register_slice xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {axi_register_slice.udo}

run -all

endsim

quit -force

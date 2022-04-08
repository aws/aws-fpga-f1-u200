onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+cl_debug_bridge -L xsdbm_v3_0_0 -L xil_defaultlib -L lut_buffer_v2_0_0 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.cl_debug_bridge xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {cl_debug_bridge.udo}

run -all

endsim

quit -force

onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -L xsdbm_v3_0_0 -L xil_defaultlib -L lut_buffer_v2_0_0 -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.cl_debug_bridge xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {cl_debug_bridge.udo}

run -all

quit -force

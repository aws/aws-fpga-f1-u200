onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib cl_axi_interconnect_m00_regslice_0_opt

do {wave.do}

view wave
view structure
view signals

do {cl_axi_interconnect_m00_regslice_0.udo}

run -all

quit -force

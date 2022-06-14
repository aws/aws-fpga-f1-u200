onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib ddr4_core_d_opt

do {wave.do}

view wave
view structure
view signals

do {ddr4_core_d.udo}

run -all

quit -force

onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib ddr4_core_b_opt

do {wave.do}

view wave
view structure
view signals

do {ddr4_core_b.udo}

run -all

quit -force

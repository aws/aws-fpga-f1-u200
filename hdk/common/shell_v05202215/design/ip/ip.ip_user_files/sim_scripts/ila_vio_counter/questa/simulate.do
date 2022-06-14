onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib ila_vio_counter_opt

do {wave.do}

view wave
view structure
view signals

do {ila_vio_counter.udo}

run -all

quit -force

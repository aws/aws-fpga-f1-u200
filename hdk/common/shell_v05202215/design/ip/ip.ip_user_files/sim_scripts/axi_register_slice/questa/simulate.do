onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib axi_register_slice_opt

do {wave.do}

view wave
view structure
view signals

do {axi_register_slice.udo}

run -all

quit -force

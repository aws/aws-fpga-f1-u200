onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib src_register_slice_opt

do {wave.do}

view wave
view structure
view signals

do {src_register_slice.udo}

run -all

quit -force

onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib dest_register_slice_opt

do {wave.do}

view wave
view structure
view signals

do {dest_register_slice.udo}

run -all

quit -force

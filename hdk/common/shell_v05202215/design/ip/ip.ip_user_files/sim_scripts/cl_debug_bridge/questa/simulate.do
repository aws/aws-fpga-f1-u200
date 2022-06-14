onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib cl_debug_bridge_opt

do {wave.do}

view wave
view structure
view signals

do {cl_debug_bridge.udo}

run -all

quit -force

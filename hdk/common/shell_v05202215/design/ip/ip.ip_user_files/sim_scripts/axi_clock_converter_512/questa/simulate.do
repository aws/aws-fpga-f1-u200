onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib axi_clock_converter_512_opt

do {wave.do}

view wave
view structure
view signals

do {axi_clock_converter_512.udo}

run -all

quit -force

onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_22 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.axi_register_slice_light xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {axi_register_slice_light.udo}

run -all

quit -force

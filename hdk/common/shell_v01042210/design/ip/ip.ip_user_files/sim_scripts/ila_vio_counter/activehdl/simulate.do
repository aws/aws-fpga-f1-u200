onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+ila_vio_counter -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.ila_vio_counter xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {ila_vio_counter.udo}

run -all

endsim

quit -force

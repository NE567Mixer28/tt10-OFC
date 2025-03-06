v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -430 -200 -430 -160 {
lab=GND}
N -530 -180 -530 -150 {
lab=GND}
N -530 -270 -530 -240 {
lab=VDD}
N -530 0 -530 20 {
lab=GND}
N -430 0 -430 20 {
lab=GND}
N -530 -80 -530 -60 {
lab=IN+}
N -430 -80 -430 -60 {
lab=IN-}
N -230 -60 -140 -60 {
lab=IN-}
N -180 -40 -140 -40 {
lab=IN+}
N 160 -60 190 -60 {
lab=VDD}
N 190 -100 190 -60 {
lab=VDD}
N 160 -40 210 -40 {
lab=GND}
N 210 -120 210 -40 {
lab=GND}
N -230 180 -140 180 {
lab=IN-}
N -180 200 -140 200 {
lab=IN+}
N 160 180 190 180 {
lab=VDD}
N 190 140 190 180 {
lab=VDD}
N 160 200 210 200 {
lab=#net1}
N 210 120 210 200 {
lab=#net1}
N 380 -20 400 -20 {
lab=OUT}
N 270 50 270 60 {
lab=GND}
N 160 -20 320 -20 {
lab=#net2}
N 270 -20 270 -10 {
lab=#net2}
N 370 220 390 220 {
lab=OUTp}
N 260 290 260 300 {
lab=GND}
N 260 220 260 230 {
lab=#net3}
N 160 220 310 220 {
lab=#net3}
C {OFC.sym} 10 -40 0 0 {name=x1}
C {OFC.sym} 10 200 0 0 {name=x2
schematic=OFC_parax.sim
spice_sym_def="tcleval(.include [file normalize ../mag/OFC.sim.spice])"
tclcommand="textwindow [file normalize ../mag/OFC.sim.spice]"
}
C {devices/simulator_commands_shown.sym} -960 -280 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
*.param mc_mm_switch=0
*.param mc_pr_switch=0

* ngspice commands
.include "../mag/OFC.sim.spice"
.options savecurrents

.control
save all
   op
   remzerovec 
   write OFCPL.raw
   set appendwrite
   *dc Vbias 0.899 0.901 0.00001 

   dc Vbias 0.8 1 0.001 
   *remzerovec 
   plot v(out),v(in+)
   plot deriv(v(out)) 
   plot v(outp),v(in+)
   plot deriv(v(outp))
   write OFCPL.raw

.endc
.end
"}
C {sky130_fd_pr/corner.sym} -1100 -280 0 0 {name=CORNER only_toplevel=false corner=tt}
C {devices/vsource.sym} -530 -210 0 0 {name=V1 value=1.8 savecurrent=false}
C {devices/gnd.sym} -430 -160 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} -430 -200 0 1 {name=p8 sig_type=std_logic lab=GND}
C {devices/lab_pin.sym} -530 -150 0 1 {name=p9 sig_type=std_logic lab=GND}
C {devices/lab_pin.sym} -530 -270 0 0 {name=p10 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} -530 -30 0 0 {name=Vbias value=0.9 savecurrent=false}
C {devices/vsource.sym} -430 -30 0 0 {name=VbiasR value=0.9 savecurrent=false}
C {devices/lab_pin.sym} -430 -80 0 0 {name=p13 sig_type=std_logic lab=IN-}
C {devices/lab_pin.sym} -530 -80 0 0 {name=p14 sig_type=std_logic lab=IN+}
C {devices/lab_pin.sym} -530 20 0 1 {name=p11 sig_type=std_logic lab=GND}
C {devices/lab_pin.sym} -430 20 0 1 {name=p12 sig_type=std_logic lab=GND}
C {devices/lab_pin.sym} -180 -40 0 0 {name=p1 sig_type=std_logic lab=IN+}
C {devices/lab_pin.sym} -230 -60 0 0 {name=p2 sig_type=std_logic lab=IN-}
C {devices/lab_pin.sym} 190 -100 0 0 {name=p3 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 210 -120 0 1 {name=p4 sig_type=std_logic lab=GND}
C {devices/lab_pin.sym} -180 200 0 0 {name=p6 sig_type=std_logic lab=IN+}
C {devices/lab_pin.sym} -230 180 0 0 {name=p7 sig_type=std_logic lab=IN-}
C {devices/lab_pin.sym} 190 140 0 0 {name=p15 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 270 60 0 1 {name=p16 sig_type=std_logic lab=GND}
C {devices/launcher.sym} -500 200 0 0 {name=h1
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/launcher.sym} -500 170 0 0 {name=h3
descr="Netlist & sim" 
tclcommand="xschem netlist; xschem simulate"}
C {devices/lab_pin.sym} 400 -20 0 1 {name=p5 sig_type=std_logic lab=OUT}
C {devices/lab_pin.sym} 390 220 0 1 {name=p17 sig_type=std_logic lab=OUTp}
C {devices/res.sym} 350 -20 1 0 {name=R1
value=500
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} 270 20 0 0 {name=C1
m=1
value5p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 260 300 0 1 {name=p18 sig_type=std_logic lab=GND}
C {devices/res.sym} 340 220 1 0 {name=R2
value=500
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} 260 260 0 0 {name=C2
m=1
value=5p
footprint=1206
device="ceramic capacitor"}

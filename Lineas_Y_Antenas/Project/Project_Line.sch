<Qucs Schematic 0.0.11>
<Properties>
  <View=-104,10,952,714,1,7,208>
  <Grid=10,10,1>
  <DataSet=Project_Line.dat>
  <DataDisplay=Project_Line.dpl>
  <OpenDisplay=1>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
</Symbol>
<Components>
  <GND * 1 10 170 0 0 0 0>
  <GND * 1 190 170 0 0 0 0>
  <Pac P1 1 10 140 -74 -26 1 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <Eqn Eqn1 1 -20 250 -31 17 0 0 "yes=" 0 "IMAG=imag(S[1,1])" 1 "REAL=real(S[1,1])" 1 "S11=S[1,1]" 1>
  <.SP SPTC1 1 230 40 0 69 0 0 "log" 1 "2 GHz" 1 "3 GHz" 1 "200" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <SUBST SubstTC1 1 410 80 -30 24 0 0 "4.3" 1 "1.66 mm" 1 "50 um" 1 "0" 1 "1.72414e-08" 1 "0" 1>
  <MLIN MSTC1 1 100 90 -26 15 0 0 "SubstTC1" 1 "4 mm" 1 "75 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
</Components>
<Wires>
  <190 90 190 170 "" 0 0 0 "">
  <130 90 190 90 "" 0 0 0 "">
  <10 90 10 110 "" 0 0 0 "">
  <10 90 70 90 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Tab 520 506 274 476 3 #c0c0c0 1 00 1 0 1 1 1 0 1 1 1 0 1 200 315 0 225 "" "" "">
	<"S11" #0000ff 0 3 1 0 0>
  </Tab>
  <Rect 150 390 240 160 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "">
	<"S[1,1]" #0000ff 0 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
</Paintings>

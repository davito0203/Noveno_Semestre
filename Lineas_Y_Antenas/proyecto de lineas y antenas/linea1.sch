<Qucs Schematic 0.0.15>
<Properties>
  <View=-64,120,800,800,1,0,0>
  <Grid=10,10,1>
  <DataSet=linea1.dat>
  <DataDisplay=linea1.dpl>
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
  <Eqn EqnTC1 1 370 560 -23 12 0 0 "A=twoport(S,'S','A')" 1 "ZL=real(sqrt(A[1,2]/A[2,1]))" 1 "yes" 0>
  <TLIN Line1 1 310 400 -26 20 0 0 "324.63 Ohm" 1 "28.48mm" 1 "0 dB" 0 "26.85" 0>
  <GND * 1 50 490 0 0 0 0>
  <Pac P1 1 50 430 -74 -26 1 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <R R2 1 190 470 15 -26 1 3 "649.26 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <GND * 1 190 500 0 0 0 0>
  <GND * 1 400 520 0 0 0 0>
  <Pac P2 1 400 480 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <R R1 1 370 400 -26 -59 0 2 "649.26 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <.SP SPTC1 1 560 340 0 69 0 0 "lin" 1 "2 GHz" 1 "3 GHz" 1 "51" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <TLIN Line2 1 110 400 -26 20 0 0 "1000Ohm" 1 "50.6 mm" 1 "0 dB" 0 "26.85" 0>
</Components>
<Wires>
  <50 460 50 490 "" 0 0 0 "">
  <190 400 190 440 "" 0 0 0 "">
  <190 400 190 400 "" 0 0 0 "">
  <190 400 280 400 "" 0 0 0 "">
  <140 400 190 400 "" 0 0 0 "">
  <50 400 80 400 "" 0 0 0 "">
  <400 510 400 520 "" 0 0 0 "">
  <400 400 400 450 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>

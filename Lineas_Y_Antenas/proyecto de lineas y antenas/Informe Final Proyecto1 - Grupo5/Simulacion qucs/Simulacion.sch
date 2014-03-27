<Qucs Schematic 0.0.16>
<Properties>
  <View=0,0,1278,800,1,0,0>
  <Grid=10,10,1>
  <DataSet=Simulacion.dat>
  <DataDisplay=Simulacion.dpl>
  <OpenDisplay=1>
  <Script=Simulacion.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=T\x00EDtulo>
  <FrameText1=Dibujado por:>
  <FrameText2=Fecha:>
  <FrameText3=Revisi\x00F3n:>
</Properties>
<Symbol>
</Symbol>
<Components>
  <MLIN MSTC1 1 410 80 -26 15 0 0 "SubstTC1" 1 "3 mm" 1 "30.7341 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <.SP SPTC1 1 90 220 0 65 0 0 "log" 1 "2 GHz" 1 "3 GHz" 1 "100" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn EqnTC1 1 350 230 -23 12 0 0 "A=twoport(S,'S','A')" 1 "ZL=real(sqrt(A[1,2]/A[2,1]))" 1 "yes" 0>
  <Pac P1 1 230 120 -74 -26 1 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 230 160 0 0 0 0>
  <SUBST SubstTC1 1 560 240 -30 24 0 0 "4.6" 1 "1.66 mm" 1 "3 um" 1 "0.08" 1 "1.78571e-08" 1 "0.00125" 1>
  <Pac P2 1 580 120 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 580 160 0 0 0 0>
  <Eqn Eqn1 1 730 90 -32 16 0 0 "y=1" 1 "Reflejada=dB(S[1,1])" 1 "Reflejada2=dB(S[2,2])" 1 "Incidente=dB(S[1,2])" 1 "Incidente2=dB(S[2,1])" 1 "yes" 0>
</Components>
<Wires>
  <230 80 380 80 "" 0 0 0 "">
  <230 80 230 90 "" 0 0 0 "">
  <230 150 230 160 "" 0 0 0 "">
  <440 80 580 80 "" 0 0 0 "">
  <580 80 580 90 "" 0 0 0 "">
  <580 150 580 160 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>

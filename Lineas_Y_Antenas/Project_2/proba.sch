<Qucs Schematic 0.0.11>
<Properties>
  <View=-164,6,1332,870,0.620921,0,0>
  <Grid=10,10,1>
  <DataSet=proba.dat>
  <DataDisplay=proba.dpl>
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
  <Pac P2 1 -30 390 -74 -26 1 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 -30 440 0 0 0 0>
  <SUBST SubstTC1 1 640 70 -30 24 0 0 "4.7" 1 "1.66 mm" 1 "35 um" 1 "0.03" 1 "1.72414e-08" 1 "0" 1>
  <SUBST SubstTC2 1 780 70 -30 24 0 0 "4.7" 1 "1.66 mm" 1 "35 um" 1 "0.03" 1 "1.72414e-08" 1 "0" 1>
  <MLIN MSTC1 1 90 240 15 -26 0 1 "SubstTC1" 1 "3.07484 mm" 1 "6.73866 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MSTC2 1 300 240 15 -26 0 1 "SubstTC1" 1 "3.07484 mm" 1 "6.73866 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MSTC4 1 190 130 -26 15 0 0 "SubstTC1" 1 "5.30653 mm" 1 "6.53358 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MSTC3 1 190 330 -26 15 0 0 "SubstTC1" 1 "5.30653 mm" 1 "6.53358 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <SUBST SubstTC3 1 920 70 -30 24 0 0 "4.7" 1 "1.66 mm" 1 "35 um" 1 "0.03" 1 "1.72414e-08" 1 "0" 1>
  <GND * 1 540 420 0 0 0 0>
  <MLIN MSTC7 1 370 120 -26 15 0 0 "SubstTC1" 1 "3.07484 mm" 1 "26.9547 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Pac P1 1 -60 190 -74 -26 1 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 -60 240 0 0 0 0>
  <MLIN MSTC5 1 -10 120 -26 15 0 0 "SubstTC1" 1 "3.07484 mm" 1 "26.9547 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <.SP SP1 1 700 300 0 70 0 0 "lin" 1 "5.8 GHz" 1 "5.9 GHz" 1 "100" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <MLIN MSTC9 1 20 330 -26 15 0 0 "SubstTC1" 1 "3.07484 mm" 1 "20.216 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MSTC10 1 360 330 -26 15 0 0 "SubstTC1" 1 "3.07484 mm" 1 "6.73866 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <SUBST SubstTC4 1 1060 70 -30 24 0 0 "4.7" 1 "1.66 mm" 1 "35 um" 1 "0.03" 1 "1.72414e-08" 1 "0" 1>
  <SUBST SubstTC5 1 1200 70 -30 24 0 0 "4.7" 1 "1.66 mm" 1 "35 um" 1 "0.03" 1 "1.72414e-08" 1 "0" 1>
  <Eqn Eqn1 1 630 510 -31 17 0 0 "MAG1=abs(S[1,1])" 1 "MAG2=abs(S[2,2])" 1 "yes" 0>
  <GND * 1 540 420 0 0 0 0>
  <GND * 1 600 310 0 0 0 0>
  <R R1 1 550 180 15 -26 0 1 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <R R2 1 540 370 15 -26 0 1 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
</Components>
<Wires>
  <-30 420 -30 440 "" 0 0 0 "">
  <-30 330 -30 360 "" 0 0 0 "">
  <-30 330 -10 330 "" 0 0 0 "">
  <90 130 160 130 "" 0 0 0 "">
  <90 130 90 210 "" 0 0 0 "">
  <300 130 300 210 "" 0 0 0 "">
  <220 130 300 130 "" 0 0 0 "">
  <300 270 300 330 "" 0 0 0 "">
  <220 330 300 330 "" 0 0 0 "">
  <90 270 90 330 "" 0 0 0 "">
  <90 330 160 330 "" 0 0 0 "">
  <50 330 90 330 "" 0 0 0 "">
  <300 330 330 330 "" 0 0 0 "">
  <390 330 540 330 "" 0 0 0 "">
  <400 120 550 120 "" 0 0 0 "">
  <340 120 340 130 "" 0 0 0 "">
  <300 130 340 130 "" 0 0 0 "">
  <20 130 90 130 "" 0 0 0 "">
  <20 120 20 130 "" 0 0 0 "">
  <-60 220 -60 240 "" 0 0 0 "">
  <-60 120 -60 160 "" 0 0 0 "">
  <-60 120 -40 120 "" 0 0 0 "">
  <540 330 540 340 "" 0 0 0 "">
  <550 120 550 150 "" 0 0 0 "">
  <540 400 540 420 "" 0 0 0 "">
  <550 210 550 230 "" 0 0 0 "">
  <600 230 600 310 "" 0 0 0 "">
  <550 230 600 230 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Tab -30 833 341 209 3 #c0c0c0 1 00 1 0 1 1 1 0 1 1 1 0 1 100 315 0 225 "" "" "">
	<"S[1,1]" #0000ff 0 3 1 0 0>
	<"S[2,2]" #0000ff 0 3 1 0 0>
  </Tab>
</Diagrams>
<Paintings>
</Paintings>

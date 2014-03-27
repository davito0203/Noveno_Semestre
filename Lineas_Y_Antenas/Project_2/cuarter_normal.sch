<Qucs Schematic 0.0.16>
<Properties>
  <View=-90,-96,2031,1369,0.513158,109,0>
  <Grid=10,10,1>
  <DataSet=cuarter_normal.dat>
  <DataDisplay=cuarter_normal.dpl>
  <OpenDisplay=1>
  <Script=cuarter_normal.m>
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
  <Pac P1 1 70 120 -74 -26 1 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 70 150 0 0 0 0>
  <MLIN MSTC1 1 160 70 -26 15 0 0 "SubstTC1" 1 "3.07484 mm" 1 "6.73866 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Eqn EqnTC1 1 220 230 -23 12 0 0 "A=twoport(S,'S','A')" 1 "ZL=real(sqrt(A[1,2]/A[2,1]))" 1 "yes" 0>
  <GND * 1 280 150 0 0 0 0>
  <SUBST SubstTC1 1 450 100 -30 24 0 0 "4.7" 1 "1.66 mm" 1 "35 um" 1 "0.03" 1 "2.43902e-08" 1 "0" 1>
  <Pac P3 1 60 570 -74 -26 1 1 "3" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <Pac P4 1 240 570 18 -26 0 1 "4" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 60 600 0 0 0 0>
  <GND * 1 240 600 0 0 0 0>
  <MLIN MSTC2 1 150 520 -26 15 0 0 "SubstTC1" 1 "5.30653 mm" 1 "6.53358 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Eqn EqnTC2 1 360 730 -23 12 0 0 "A=twoport(S,'S','A')" 1 "ZL=real(sqrt(A[1,2]/A[2,1]))" 1 "yes" 0>
  <Pac P5 1 40 1030 -74 -26 1 1 "5" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <Pac P6 1 220 1030 18 -26 0 1 "6" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 40 1060 0 0 0 0>
  <GND * 1 220 1060 0 0 0 0>
  <MLIN MSTC8 1 130 980 -26 15 0 0 "SubstTC1" 1 "3.07484 mm" 1 "26.9547 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <SUBST SubstTC3 1 600 1030 -30 24 0 0 "4.7" 1 "1.66 mm" 1 "35 um" 1 "0.03" 1 "2.43902e-08" 1 "0" 1>
  <.SP SPTC3 1 10 1150 0 73 0 0 "log" 1 "0.58 GHz" 1 "58 GHz" 1 "51" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn EqnTC3 1 370 990 -23 12 0 0 "A=twoport(S,'S','A')" 1 "ZL=real(sqrt(A[1,2]/A[2,1]))" 1 "yes" 0>
  <MLIN MSTC4 1 1330 470 15 -26 0 1 "SubstTC1" 1 "3.07484 mm" 1 "6.73866 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MSTC6 1 1440 330 -26 15 0 0 "SubstTC1" 1 "5.30653 mm" 1 "6.53358 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MSTC5 1 1570 450 15 -26 0 1 "SubstTC1" 1 "3.07484 mm" 1 "6.73866 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MSTC7 1 1460 560 -26 15 0 0 "SubstTC1" 1 "5.30653 mm" 1 "6.53358 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MSTC10 1 1230 560 -26 15 0 0 "SubstTC1" 1 "3.07484 mm" 1 "26.9547 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MSTC11 1 1700 330 -26 15 0 0 "SubstTC1" 1 "3.07484 mm" 1 "26.9547 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MSTC12 1 1710 560 -26 15 0 0 "SubstTC1" 1 "3.07484 mm" 1 "26.9547 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MSTC9 1 1200 330 -26 15 0 0 "SubstTC1" 1 "3.07484 mm" 1 "26.9547 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Pac P7 1 1060 360 -74 -26 1 1 "7" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <Pac P2 1 280 100 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <Pac P9 1 1880 590 18 -26 0 1 "9" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <Pac P10 1 1060 590 18 -26 0 1 "10" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 1060 390 0 0 0 0>
  <GND * 1 1060 620 0 0 0 0>
  <GND * 1 1880 380 0 0 0 0>
  <GND * 1 1880 620 0 0 0 0>
  <Pac P8 1 1880 360 18 -26 0 1 "8" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <.SP SPTC1 1 -30 250 0 73 0 0 "log" 1 "0.58 GHz" 1 "58 GHz" 1 "51" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <.SP SPTC2 1 40 740 0 73 0 0 "log" 1 "0.58 GHz" 1 "58 GHz" 1 "51" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <SUBST SubstTC2 1 560 470 -30 24 0 0 "4.7" 1 "1.66 mm" 1 "35 um" 1 "0.03" 1 "2.43902e-08" 1 "0" 1>
</Components>
<Wires>
  <70 70 130 70 "" 0 0 0 "">
  <70 70 70 90 "" 0 0 0 "">
  <60 520 120 520 "" 0 0 0 "">
  <60 520 60 540 "" 0 0 0 "">
  <180 520 240 520 "" 0 0 0 "">
  <240 520 240 540 "" 0 0 0 "">
  <40 980 100 980 "" 0 0 0 "">
  <40 980 40 1000 "" 0 0 0 "">
  <160 980 220 980 "" 0 0 0 "">
  <220 980 220 1000 "" 0 0 0 "">
  <1330 330 1330 440 "" 0 0 0 "">
  <1330 330 1410 330 "" 0 0 0 "">
  <1470 330 1570 330 "" 0 0 0 "">
  <1570 330 1570 420 "" 0 0 0 "">
  <1490 560 1570 560 "" 0 0 0 "">
  <1570 480 1570 560 "" 0 0 0 "">
  <1330 560 1430 560 "" 0 0 0 "">
  <1330 500 1330 560 "" 0 0 0 "">
  <1260 560 1330 560 "" 0 0 0 "">
  <1570 330 1670 330 "" 0 0 0 "">
  <1570 560 1680 560 "" 0 0 0 "">
  <1230 330 1330 330 "" 0 0 0 "">
  <280 130 280 150 "" 0 0 0 "">
  <190 70 280 70 "" 0 0 0 "">
  <1060 330 1170 330 "" 0 0 0 "">
  <1060 560 1200 560 "" 0 0 0 "">
  <1740 560 1880 560 "" 0 0 0 "">
  <1880 380 1880 390 "" 0 0 0 "">
  <1730 330 1880 330 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>

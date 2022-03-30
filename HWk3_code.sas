
DATA mice;
  INFILE 'mice.csv' firstobs=2 dsd;
  INPUT group y1 y2 y3;
  RUN;

ods rtf file='HWk3_Ooutput';
proc glm data=mice;
  class group;
  model y1 y2 y3 = group;
  CONTRAST '1&2 VS. 3'
  group 0.5 0.5 -1 0;
  MANOVA H=group/PRINTE PRINTH MSTAT=EXACT;
run;
ods rtf close;



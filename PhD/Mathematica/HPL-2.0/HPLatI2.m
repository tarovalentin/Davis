HPLI[{plus, plus}]:=-Pi^2/8;
HPLI[{plus, 0}]:=(-2*I)*Catalan - Pi^2/4;
HPLI[{plus, minus}]:=(-I)*(-2*Catalan + Pi*Log[2]);
HPLI[{0, plus}]:=(2*I)*Catalan;
HPLI[{0, 0}]:=-Pi^2/8;
HPLI[{0, minus}]:=-Pi^2/24;
HPLI[{minus, plus}]:=(I/2)*(-4*Catalan + Pi*Log[2]);
HPLI[{minus, 0}]:=(Pi*(Pi - (12*I)*Log[2]))/24;
HPLI[{minus, minus}]:=Log[2]^2/2;
HPLI[{1, 1}]:=-(Pi + (2*I)*Log[2])^2/32;
HPLI[{1, 0}]:=(-I)*Catalan - (Pi*(5*Pi + (12*I)*Log[2]))/48;
HPLI[{1, -1}]:=((-32*I)*Catalan - Pi^2 + (12*I)*Pi*Log[2] - 4*Log[2]^2)/32;
HPLI[{0, 1}]:=I*Catalan - Pi^2/48;
HPLI[{0, 0}]:=-Pi^2/8;
HPLI[{0, -1}]:=I*Catalan + Pi^2/48;
HPLI[{-1, 1}]:=((32*I)*Catalan - Pi^2 - (12*I)*Pi*Log[2] - 4*Log[2]^2)/32;
HPLI[{-1, 0}]:=(-I)*Catalan + (Pi*(-7*Pi + (12*I)*Log[2]))/48;
HPLI[{-1, -1}]:=-(Pi - (2*I)*Log[2])^2/32;

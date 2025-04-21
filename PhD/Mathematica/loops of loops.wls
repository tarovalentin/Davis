#!/usr/bin/env wolframscript
(* ::Package:: *)

Quit[];


(*Defines loop variables and parametric momentum twistors*)
ZA = {1,x,0,-y};
ZB = {0,z,1,w};
ZC = {1,a,0,-b};
ZD = {0,c,1,d};
dZC1 = {0,da,0,0};
dZC2 = {0,0,0,-db};
dZD1 = {0,dc,0,0};
dZD2 = {0,0,0,dd};
Z1 = {1,0,0,0};
Z2 = {0,1,0,0};
Z3 = {0,0,1,0};
Z4 = {0,0,0,1};


<<HPL`


(*Parametric version of two loop integrand*)
(Det[{Z1,Z2,Z3,Z4}]^3/(Det[{ZA,ZB,Z1,Z2}]Det[{ZA,ZB,Z2,Z3}]Det[{ZA,ZB,Z3,Z4}]Det[{ZA,ZB,Z1,Z4}]) (Det[{ZC,ZD,dZC1,dZC2}]Det[{ZC,ZD,dZD1,dZD2}](Det[{ZA,ZB,Z1,Z3}]Det[{ZC,ZD,Z2,Z4}]+Det[{ZA,ZB,Z2,Z4}]Det[{ZC,ZD,Z1,Z3}]))/(Det[{ZA,ZB,ZC,ZD}]Det[{ZC,ZD,Z1,Z2}]Det[{ZC,ZD,Z2,Z3}]Det[{ZC,ZD,Z3,Z4}]Det[{ZC,ZD,Z1,Z4}]))//FullSimplify


(*Defines Fladder and the two first ladder graphs*)
FLadder[g_]:=(z^(I Sqrt[2] g)+z^(-I Sqrt[2] g))/(2 Cosh[Sqrt[2]g \[Pi]])
Tree1L = \[Pi]^2+Log[z]^2; 
Tree2L = (1/6)(\[Pi]^2+Log[z]^2)(5\[Pi]^2+Log[z]^2);
Tripod = 1/15 (\[Pi]^2+Log[z]^2) (11 \[Pi]^4+4 \[Pi]^2 Log[z]^2+Log[z]^4);
(*Asymptotic expandion of Fladder*)
Fladderlist = CoefficientList[Normal[Series[FLadder[g],{g,0,14}]],g]//FullSimplify;
FL[x_]:=Fladderlist[[x+1]]
solA = AsymptoticSolve[A/(2 g Cos[\[Pi]/2 A])==1,{A,0},{g,0,20}];
FTree = A^2/g^2 z^A/(z^A+1)^2//.solA[[1]]//Simplify;
Ftreelist = CoefficientList[Normal[Series[FTree,{g,0,14}]],g]//FullSimplify;
FT[x_]:=Ftreelist[[x+1]];
(*Defines laplace operator*)
La[x_,z_]:=-1/2 z D[z D[x,z],z];


(*Triangle*)
TA = -(1/6)Log[z]^4+Log[z]^2(-(2/3)PolyLog[2,1/(z+1)]-2/3 PolyLog[2,z/(z+1)]+\[Pi]^2/9)+Log[z](4 PolyLog[3,z/(z+1)]-4 PolyLog[3,1/(z+1)])-2/3 (PolyLog[2,z/(z+1)]+PolyLog[2,1/(z+1)]-\[Pi]^2/6)^2-8/3 \[Pi]^2 (PolyLog[2,z/(z+1)]+PolyLog[2,1/(z+1)]-\[Pi]^2/6)-8 PolyLog[4,1/(z+1)]-8 PolyLog[4,z/(z+1)]-\[Pi]^4/18;
TAAnz = (\[Alpha] \[Pi]^6+\[Beta] \[Pi]^4 Log[z]^2+\[Gamma] \[Pi]^2 Log[z]^4 +\[Delta] Log[z]^6 +x)


La[PolyLog[6,1/(z+1)],z]//FullSimplify


GenerateAnsatz[z_] := Module[{args, functions, ansatz},
  args = {z, 1/(z + 1), z/(z + 1)};
  
  functions = Flatten[{
    a \[Pi]^6,
    b \[Pi]^4 Log[#]^2,
    c \[Pi]^2 Log[#]^4,
    d Log[#]^6,
    e \[Pi]^4 PolyLog[2, #],
    f \[Pi]^2 PolyLog[4, #],
    g Log[#]^2 PolyLog[4, #],
    h \[Pi]^2 Log[#]^2 PolyLog[2, #],
    i Log[#]^4 PolyLog[2, #]
  }] &;
  
  ansatz = Flatten[functions /@ args];
  Total[ansatz]
]

(* Usage *)
ansatz = GenerateAnsatz[z]


ansatz=a \[Pi]^6+b \[Pi]^4 Log[z]^2+c \[Pi]^2 Log[z]^4+d Log[z]^6+e \[Pi]^4 Log[1/(1+z)]^2+f \[Pi]^2 Log[1/(1+z)]^4+g Log[1/(1+z)]^6+h \[Pi]^4 Log[z/(1+z)]^2+i \[Pi]^2 Log[z/(1+z)]^4+j Log[z/(1+z)]^6+k \[Pi]^4 PolyLog[2,z]+l \[Pi]^2 Log[z]^2 PolyLog[2,z]+m Log[z]^4 PolyLog[2,z]+n \[Pi]^4 PolyLog[2,1/(1+z)]+o \[Pi]^2 Log[1/(1+z)]^2 PolyLog[2,1/(1+z)]+p Log[1/(1+z)]^4 PolyLog[2,1/(1+z)]+q \[Pi]^4 PolyLog[2,z/(1+z)]+r \[Pi]^2 Log[z/(1+z)]^2 PolyLog[2,z/(1+z)]+s Log[z/(1+z)]^4 PolyLog[2,z/(1+z)]+t \[Pi]^2 PolyLog[4,z]+u Log[z]^2 PolyLog[4,z]+v \[Pi]^2 PolyLog[4,1/(1+z)]+x Log[1/(1+z)]^2 PolyLog[4,1/(1+z)]+y \[Pi]^2 PolyLog[4,z/(1+z)]+w Log[z/(1+z)]^2 PolyLog[4,z/(1+z)]
Length[ansatz]
ansatz = ansatz//.{l->0,m->0,r->0,o->0,p->0,s->0}//.{f->0,g->0,y->0,j->0,h->1/2 n,v->0,w->0,x->0,i->0,e->1/2 q}//Simplify;


(* Apply the Laplace operator to the ansatz *)
laplaceAnsatz = La[ansatz, z]//Expand;

(* Define a function to calculate the transcendental weight of a term *)
transcendentalWeight[term_] := Module[{polyLogWeight, logWeight, piWeight},
  polyLogWeight = Max[0, Max[Cases[term, PolyLog[n_, _] :> n, Infinity]]];
  logWeight = Max[0, Max[Cases[term, Log[_]^n_. :> n, Infinity]]];
  piWeight = Max[0, Max[Cases[term, \[Pi]^n_. :> n, Infinity]]];
  polyLogWeight + logWeight + piWeight
];

(* Get the list of terms from the laplaceAnsatz *)
terms = Level[laplaceAnsatz, {1}];

(* Pick out the terms with transcendental weight 5 *)
termsWithWeight5 = Select[terms, transcendentalWeight[#] == 5 &];
termsWithWeight4 = Select[terms, transcendentalWeight[#] == 4 &];
termsWithWeight3 = Select[terms, transcendentalWeight[#] == 3 &];

(* Combine the terms to get the final expression *)
FE5 = Total[termsWithWeight5]//Simplify
FE4 = Total[termsWithWeight4]//FullSimplify
FE3 = Total[termsWithWeight3]//Simplify


Chop[Solve[{(FE5==0//.z->3//N),(FE5==0//.z->4//N),(FE5==0//.z->6//N),(FE5==0//.z->8//N),(FE5==0//.z->10//N),(FE5==0//.z->12//N),(FE5==0//.z->14//N),(FE5==0//.z->16//N),(FE5==0//.z->18//N),(FE5==0//.z->20//N),(FE5==0//.z->22//N),(FE5==0//.z->25//N),(FE5==0//.z->23//N),(FE5==0//.z->30//N)},{n,q,f,g,y,j,h,v,w,x,i,e}],10^-4]


Chop[Solve[{(FE4==TA//.z->3322)//N,(FE4==TA//.z->3305)//N,(FE4==TA//.z->3335)//N,(FE4==TA//.z->10444)//N,(FE4==TA//.z->1111122125)//N,(FE4==TA//.z->25)//N,(FE4==TA//.z->45)//N},{u,c,k,n,t,d,b}]//Simplify,10^-0]


Solve[{FE4==TA,FE4==TA,(FE4==TA//.z->5)//N,(FE4==TA//.z->10)//N,(FE4==TA//.z->15)//N,(FE4==TA//.z->25)//N,(FE4==TA//.z->45)//N},{u,c,k,n,t,d,b}]//Simplify


(* ::Input:: *)
(*{{e->-(1/(27 \[Pi]^4 (-2+z)))(-1+z) (20 \[Pi]^4+6 \[Pi]^2 Log[z]^2-9 Log[z]^4+(-132 \[Pi]^2-36 Log[z]^2) PolyLog[2,1/(1+z)]-36 PolyLog[2,1/(1+z)]^2-12 (11 \[Pi]^2+3 Log[z]^2) PolyLog[2,z/(1+z)]-72 PolyLog[2,1/(1+z)] PolyLog[2,z/(1+z)]-36 PolyLog[2,z/(1+z)]^2-216 Log[z] PolyLog[3,1/(1+z)]+216 Log[z] PolyLog[3,z/(1+z)]-432 PolyLog[4,1/(1+z)]-432 PolyLog[4,z/(1+z)])}}*)


Needs["Developer`"]


PolyLogSimplify[20/(27 (-2+z))-(20 z)/(27 (-2+z))+(2 Log[z]^2)/(9 \[Pi]^2 (-2+z))-(2 z Log[z]^2)/(9 \[Pi]^2 (-2+z))-Log[z]^4/(3 \[Pi]^4 (-2+z))+(z Log[z]^4)/(3 \[Pi]^4 (-2+z))-(44 PolyLog[2,1/(1+z)])/(9 \[Pi]^2 (-2+z))+(44 z PolyLog[2,1/(1+z)])/(9 \[Pi]^2 (-2+z))-(4 Log[z]^2 PolyLog[2,1/(1+z)])/(3 \[Pi]^4 (-2+z))+(4 z Log[z]^2 PolyLog[2,1/(1+z)])/(3 \[Pi]^4 (-2+z))-(4 PolyLog[2,1/(1+z)]^2)/(3 \[Pi]^4 (-2+z))+(4 z PolyLog[2,1/(1+z)]^2)/(3 \[Pi]^4 (-2+z))-(44 PolyLog[2,z/(1+z)])/(9 \[Pi]^2 (-2+z))+(44 z PolyLog[2,z/(1+z)])/(9 \[Pi]^2 (-2+z))-(4 Log[z]^2 PolyLog[2,z/(1+z)])/(3 \[Pi]^4 (-2+z))+(4 z Log[z]^2 PolyLog[2,z/(1+z)])/(3 \[Pi]^4 (-2+z))-(8 PolyLog[2,1/(1+z)] PolyLog[2,z/(1+z)])/(3 \[Pi]^4 (-2+z))+(8 z PolyLog[2,1/(1+z)] PolyLog[2,z/(1+z)])/(3 \[Pi]^4 (-2+z))-(4 PolyLog[2,z/(1+z)]^2)/(3 \[Pi]^4 (-2+z))+(4 z PolyLog[2,z/(1+z)]^2)/(3 \[Pi]^4 (-2+z))-(8 Log[z] PolyLog[3,1/(1+z)])/(\[Pi]^4 (-2+z))+(8 z Log[z] PolyLog[3,1/(1+z)])/(\[Pi]^4 (-2+z))+(8 Log[z] PolyLog[3,z/(1+z)])/(\[Pi]^4 (-2+z))-(8 z Log[z] PolyLog[3,z/(1+z)])/(\[Pi]^4 (-2+z))-(16 PolyLog[4,1/(1+z)])/(\[Pi]^4 (-2+z))+(16 z PolyLog[4,1/(1+z)])/(\[Pi]^4 (-2+z))-(16 PolyLog[4,z/(1+z)])/(\[Pi]^4 (-2+z))+(16 z PolyLog[4,z/(1+z)])/(\[Pi]^4 (-2+z))]




Solve[{(FE5//.z->4//N)==0,(FE5//.z->5//N)==0,(FE5//.z->10//N)==0,(FE5//.z->20//N)==0,(FE5//.z->30//N)==0},{b,c,f,g,d}]


 ht = h \[Pi]^2 Log[z]^2 PolyLog[2,z]+h \[Pi]^2 Log[1/(1+z)]^2 PolyLog[2,1/(1+z)]+h \[Pi]^2 Log[z/(1+z)]^2 PolyLog[2,z/(1+z)]//.hs//FullSimplify//Expand;


(* ::Input:: *)
(*\[Pi]^2 Log[z]^2 PolyLog[2,z]-(2 i ((1+z)^2 Log[1-z] Log[z]^3+z^2 Log[1/(1+z)]^3 Log[z/(1+z)]+Log[1/(1+z)] Log[z/(1+z)]^3) (Log[1/(1+z)]^2 PolyLog[2,1/(1+z)]+Log[z/(1+z)]^2 PolyLog[2,z/(1+z)]))/((1+z)^2 Log[1-z] Log[z]+(1+z^2) Log[1/(1+z)] Log[z/(1+z)])*)


(* ::Input:: *)
(**)


(* ::Input:: *)
(**)


termsWithWeight5 = Select[ht, transcendentalWeight[#] == 6 &]


(*General anzats*)
eq = (\[Alpha] \[Pi]^6+\[Beta] \[Pi]^4 Log[z]^2+\[Gamma] \[Pi]^2 Log[z]^4 +\[Delta] Log[z]^6);
deq[z_]:=(\[Alpha] \[Pi]^6+\[Beta] \[Pi]^4 Log[z]^2+\[Gamma] \[Pi]^2 Log[z]^4 +\[Delta] Log[z]^6)
eqf1 = La[deq[z],z]-Tree1L Tree1L//FullSimplify;
eqf2[z_]:=-\[Pi]^4 (1+\[Beta])-2 \[Pi]^2 (1+3 \[Gamma]) Log[z]^2-(1+15 \[Delta]) Log[z]^4
Sol1 = Solve[{eqf2[RandomInteger[{2,1000}]]==0,eqf2[RandomInteger[{2,1000}]]==0,eqf2[RandomInteger[{2,1000}]]==0}]//FullSimplify;
Sol2 = Solve[(eq//.Sol1//.z->-1)==0];
GeneralSol =(eq//.Sol1//.Sol2)[[1]][[1]]//FullSimplify
GeneralSol = 1/15 (\[Pi]^2+Log[z]^2) (11 \[Pi]^4+4 \[Pi]^2 Log[z]^2+Log[z]^4);
(*Writing the expansion of trees which we then set equal to zero*)
eqs = (FT[6]-(-\[Alpha] FL[6]+\[Beta] Tree1L*Tree2L+\[Gamma] Tree1L^3+\[Delta] GeneralSol)//FullSimplify)
eqsol[z_] :=-(1/90) (\[Pi]^2+Log[z]^2) (\[Pi]^4 (184+61 \[Alpha]+75 \[Beta]+90 \[Gamma]+330 \[Delta])+2 \[Pi]^2 (73+7 \[Alpha]+45 \[Beta]+90 \[Gamma]+60 \[Delta]) Log[z]^2+(34+\[Alpha]+15 \[Beta]+90 \[Gamma]+30 \[Delta]) Log[z]^4)
Sol3 = Solve[{eqsol[1]==0,eqsol[32]==0,eqsol[3]==0}]//.\[Alpha]->1//FullSimplify//Factor

FullExpression = (-FL[6]//.Sol3[[1]]//FullSimplify)+(-\[Beta] Tree1L*Tree2L//.Sol3[[1]]//FullSimplify)+(1/6 Tree1L^3//.Sol3[[1]]//FullSimplify)+(1/2 GeneralSol//.Sol3[[1]]//FullSimplify)
FullExpression//FullSimplify
FT[6]//FullSimplify


(*g^8*)
deq[z_]:=(\[Alpha] \[Pi]^8+\[Beta] \[Pi]^6 Log[z]^2+\[Gamma] \[Pi]^4 Log[z]^4 +\[Delta] \[Pi]^2 Log[z]^6+\[Sigma] Log[z]^8)
eqf1a = La[deq[z],z]-Tree1L Tree2L//FullSimplify;
eqf1b[z_]:=1/6 (-\[Pi]^6 (5+6 \[Beta])-\[Pi]^4 (11+36 \[Gamma]) Log[z]^2-\[Pi]^2 (7+90 \[Delta]) Log[z]^4-(1+168 \[Sigma]) Log[z]^6)
Sol1a = Solve[{eqf1b[RandomInteger[{2,1000}]]==0,eqf1b[RandomInteger[{2,1000}]]==0,eqf1b[RandomInteger[{2,1000}]]==0,eqf1b[RandomInteger[{2,1000}]]==0}]//FullSimplify;
Sol1b = Solve[(deq[z]//.Sol1a//.z->-1)==0];
GeneralSol1 =-(eq//.Sol1a//.Sol1b)[[1]][[1]]//FullSimplify
(*g^8*)
deq2[z_]:=(\[Alpha] \[Pi]^8+\[Beta] \[Pi]^6 Log[z]^2+\[Gamma] \[Pi]^4 Log[z]^4 +\[Delta] \[Pi]^2 Log[z]^6+\[Sigma] Log[z]^8)
eqf2a = -(1/15) \[Pi]^6 (11+15 \[Beta])-\[Pi]^4 (1+6 \[Gamma]) Log[z]^2-1/3 \[Pi]^2 (1+45 \[Delta]) Log[z]^4+(-(1/15)-28 \[Sigma]) Log[z]^6//FullSimplify;
eqf2b[z_]:=-(1/15) \[Pi]^6 (11+15 \[Beta])-\[Pi]^4 (1+6 \[Gamma]) Log[z]^2-1/3 \[Pi]^2 (1+45 \[Delta]) Log[z]^4+(-(1/15)-28 \[Sigma]) Log[z]^6
Sol2a = Solve[{eqf2b[RandomInteger[{2,1000}]]==0,eqf2b[RandomInteger[{2,1000}]]==0,eqf2b[RandomInteger[{2,1000}]]==0,eqf2b[RandomInteger[{2,1000}]]==0}]//FullSimplify;
Sol2b = Solve[(deq2[z]//.Sol2a//.z->-1)==0];
GeneralSol2 =-(eq//.Sol2a//.Sol2b)[[1]][[1]]//FullSimplify
(*g^8*)
deq3[z_]:=(\[Alpha] \[Pi]^8+\[Beta] \[Pi]^6 Log[z]^2+\[Gamma] \[Pi]^4 Log[z]^4 +\[Delta] \[Pi]^2 Log[z]^6+\[Sigma] Log[z]^8)
eqf1a = La[deq3[z],z]-Tree1L^3//FullSimplify;
eqf2a = -\[Pi]^6 (1+\[Beta])-3 \[Pi]^4 (1+2 \[Gamma]) Log[z]^2-3 \[Pi]^2 (1+5 \[Delta]) Log[z]^4-(1+28 \[Sigma]) Log[z]^6//FullSimplify;
eqf2b[z_]:=-\[Pi]^6 (1+\[Beta])-3 \[Pi]^4 (1+2 \[Gamma]) Log[z]^2-3 \[Pi]^2 (1+5 \[Delta]) Log[z]^4-(1+28 \[Sigma]) Log[z]^6
Sol2a = Solve[{eqf2b[RandomInteger[{2,1000}]]==0,eqf2b[RandomInteger[{2,1000}]]==0,eqf2b[RandomInteger[{2,1000}]]==0,eqf2b[RandomInteger[{2,1000}]]==0}]//FullSimplify;
Sol2b = Solve[(deq2[z]//.Sol2a//.z->-1)==0];
GeneralSol3 =-(eq//.Sol2a//.Sol2b)[[1]][[1]]//FullSimplify


FT[8]-(FL[8]+(1/12 FL[6]FL[2])+1/24 FL[4]FL[4]+ 1/24 Tree1L^2 Tree2L+\[Delta] Tree1L Tree2L+\[Sigma] Tripod Tree1L+1/Factorial[4] Tree1L^4+1/12 GeneralSol1+b GeneralSol3+c GeneralSol3)//FullSimplify
eqsol[z_]:=-

Sols = Solve[{eqsol[RandomInteger[{1,10}]]==0,eqsol[RandomInteger[{1,10}]]==0,eqsol[RandomInteger[{1,10}]]==0,eqsol[RandomInteger[{1,10}]]==0}]//FullSimplify//Factor


Length[Sols[[1]]]


Binomial[3,3]
Binomial[3,2]


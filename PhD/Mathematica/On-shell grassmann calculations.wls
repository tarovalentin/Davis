#!/usr/bin/env wolframscript
(* ::Package:: *)

ClearAll["Global`*"]
SetDirectory["C:\\Users\\tarob\\OneDrive\\Dokumenter\\Taro PC\\Documents\\Davis\\PhD\\Mathematica"];
<<CHY_ToolPackagev1.wl
$CHYfunctions
RR={\[Lambda][i_] . \[Lambda][j_]->Spaa[i,j],t\[Lambda][i_] . t\[Lambda][j_]->Spbb[i,j]}


(*5 pt MHV*)

(*Define C-matrices and lambda*)
GrassC = {{1,a1+a2 a6,a6,a3 a6,0},{0,a5 a6 a2,a5 a6, a4+a3 a5 a6,1}};
Cperp5 = {{-(a1+a2 a6),1,0,0,-a5 a6 a2},{-a6,0,1,0,-a5 a6},{-a3 a6,0,0,1,-(a4+a3 a5 a6)}};
lambda = {{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]}};

GrassC . Transpose[lambda];
(*Solve for \[Alpha]'s by solving one delta function constraint. Here we get the equations from the eq below*)
Cperp5 . Transpose[lambda];

(*We then define them underneath by contracting with lambda's*)
A1=(-a1-a2 a6) \[Lambda][1] . \[Lambda][1]+\[Lambda][2] . \[Lambda][1]-a2 a5 a6 \[Lambda][5] . \[Lambda][1]//.{\[Lambda][i_] . \[Lambda][j_]->Spaa[i,j]};
A2=(-a1-a2 a6) \[Lambda][1] . \[Lambda][5]+\[Lambda][2] . \[Lambda][5]-a2 a5 a6 \[Lambda][5] . \[Lambda][5]//.{\[Lambda][i_] . \[Lambda][j_]->Spaa[i,j]};

A3=-a6 \[Lambda][1] . \[Lambda][1]+\[Lambda][3] . \[Lambda][1]-a5 a6 \[Lambda][5] . \[Lambda][1]//.{\[Lambda][i_] . \[Lambda][j_]->Spaa[i,j]};
A4=-a6 \[Lambda][1] . \[Lambda][3]+\[Lambda][3] . \[Lambda][3]-a5 a6 \[Lambda][5] . \[Lambda][3]//.{\[Lambda][i_] . \[Lambda][j_]->Spaa[i,j]};

A5=-a3 a6 \[Lambda][1] . \[Lambda][1]+\[Lambda][4] . \[Lambda][1]+(-a4-a3 a5 a6) \[Lambda][5] . \[Lambda][1]//.{\[Lambda][i_] . \[Lambda][j_]->Spaa[i,j]};
A6=-a3 a6 \[Lambda][1] . \[Lambda][5]+\[Lambda][4] . \[Lambda][5]+(-a4-a3 a5 a6) \[Lambda][5] . \[Lambda][5]//.{\[Lambda][i_] . \[Lambda][j_]->Spaa[i,j]};

(*We solve for \[Alpha]'s and simplify using schouten*)
Sol = Solve[{A1==0,A2==0,A3==0,A4==0,A5==0,A6==0},{a1,a2,a3,a4,a5,a6}]//Simplify;
Sol//.schoutenA


(*6 pt NMHV 5+3*)

(*Define C-matrices and lambda*)
CC={{a2 a5,a3 a5 +a4,1,0,0,0},{a2,a3,0,1,a6,0},{a8(a1+a2),a3 a8,0,0,a7,1}};
ffs={{0,a,0},{1,a6,0},{0,a7,1}};
Cperp ={{1,0,-a2 a5, -a2,0,-a8 (a1+a2)},{0,1,-a3 a5-a4,-a3,0,-a3 a8},{0,0,0,-a6,1,-a7}};
lambda={{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]}};
tlambda={{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]}};
CC . Transpose[Cperp];
Cperp . Transpose[lambda];
CC . Transpose[tlambda]


B1 = a2 a5 t\[Lambda][1] . t\[Lambda][2]+(a4+a3 a5) t\[Lambda][2] . t\[Lambda][2]+t\[Lambda][3] . t\[Lambda][2]//.RR
B7 = a2 a5 t\[Lambda][1] . t\[Lambda][1]+(a4+a3 a5) t\[Lambda][2] . t\[Lambda][1]+t\[Lambda][3] . t\[Lambda][1]//.RR
B8 = a2 a5 t\[Lambda][1] . t\[Lambda][3]+(a4+a3 a5) t\[Lambda][2] . t\[Lambda][3]+t\[Lambda][3] . t\[Lambda][3]//.RR

B2 = t\[Lambda][1] . t\[Lambda][2]+a3 t\[Lambda][2] . t\[Lambda][2]+t\[Lambda][4] . t\[Lambda][2]+a6 t\[Lambda][5] . t\[Lambda][2]//.RR
B3 = t\[Lambda][1] . t\[Lambda][5]+a3 t\[Lambda][2] . t\[Lambda][5]+t\[Lambda][4] . t\[Lambda][5]+a6 t\[Lambda][5] . t\[Lambda][5]//.RR;

B4 = (a1+a2) a8 t\[Lambda][1] . t\[Lambda][1]+a3 a8 t\[Lambda][2] . t\[Lambda][1]+a7 t\[Lambda][5] . t\[Lambda][1]+t\[Lambda][6] . t\[Lambda][1]//.RR
B5 = (a1+a2) a8 t\[Lambda][1] . t\[Lambda][2]+a3 a8 t\[Lambda][2] . t\[Lambda][2]+a7 t\[Lambda][5] . t\[Lambda][2]+t\[Lambda][6] . t\[Lambda][2]//.RR
B6 = (a1+a2) a8 t\[Lambda][1] . t\[Lambda][5]+a3 a8 t\[Lambda][2] . t\[Lambda][5]+a7 t\[Lambda][5] . t\[Lambda][5]+t\[Lambda][6] . t\[Lambda][5]//.RR

A1 = -a6 \[Lambda][4] . \[Lambda][4]+\[Lambda][5] . \[Lambda][4]-a7 \[Lambda][6] . \[Lambda][4]//.{\[Lambda][i_] . \[Lambda][j_]->Spaa[i,j]};
A2 = -a6 \[Lambda][4] . \[Lambda][6]+\[Lambda][5] . \[Lambda][6]-a7 \[Lambda][6] . \[Lambda][6]//.{\[Lambda][i_] . \[Lambda][j_]->Spaa[i,j]};
A3 = \[Lambda][2] . \[Lambda][3]+(-a4-a3 a5) \[Lambda][3] . \[Lambda][3]-a3 \[Lambda][4] . \[Lambda][3]-a3 a8 \[Lambda][6] . \[Lambda][3]//.{\[Lambda][i_] . \[Lambda][j_]->Spaa[i,j]}
A4 = \[Lambda][2] . \[Lambda][4]+(-a4-a3 a5) \[Lambda][3] . \[Lambda][4]-a3 \[Lambda][4] . \[Lambda][4]-a3 a8 \[Lambda][6] . \[Lambda][4]//.{\[Lambda][i_] . \[Lambda][j_]->Spaa[i,j]}
A5 = \[Lambda][2] . \[Lambda][6]+(-a4-a3 a5) \[Lambda][3] . \[Lambda][6]-a3 \[Lambda][4] . \[Lambda][6]-a3 a8 \[Lambda][6] . \[Lambda][6]//.{\[Lambda][i_] . \[Lambda][j_]->Spaa[i,j]}
A6 = \[Lambda][1] . \[Lambda][3]-a2 a5 \[Lambda][3] . \[Lambda][3]-a2 \[Lambda][4] . \[Lambda][3]-(a1+a2) a8 \[Lambda][6] . \[Lambda][3]//.{\[Lambda][i_] . \[Lambda][j_]->Spaa[i,j]}
A7 = \[Lambda][1] . \[Lambda][4]-a2 a5 \[Lambda][3] . \[Lambda][4]-a2 \[Lambda][4] . \[Lambda][4]-(a1+a2) a8 \[Lambda][6] . \[Lambda][4]//.{\[Lambda][i_] . \[Lambda][j_]->Spaa[i,j]}
A8 = \[Lambda][1] . \[Lambda][6]-a2 a5 \[Lambda][3] . \[Lambda][6]-a2 \[Lambda][4] . \[Lambda][6]-(a1+a2) a8 \[Lambda][6] . \[Lambda][6]//.{\[Lambda][i_] . \[Lambda][j_]->Spaa[i,j]}
a2 = Spba[2,1,3,6]/(Spaa[4,6] Spbb[1,2]);
a5 = (Spaa[4,6] Spbb[2,3])/Spba[2,1,3,6];
a6 = Spaa[5,6]/Spaa[4,6];
a7 = Spaa[4,5]/Spaa[4,6];
(*Sol = Solve[{A1==0,A2==0,A3==0,B3==0,B1==0,A8==0,B7==0,A7==0},{a1,a2,a4,a5,a6,a7,a3,a8}];
Sol//Simplify//Expand;*)
Sol = Solve[{A3==0,B3==0,B7==0,A7==0},{a1,a3,a4,a8}];
Sol//Simplify//Expand


Length[Expand[-Spaa[1,6]/Spaa[4,6]+(Spaa[3,6] (-Spaa[2,3] Spbb[2,3] Spbb[2,5]+Spaa[1,4] Spbb[1,2] (Spbb[1,5]+Spbb[4,5])))/(Spaa[4,6]Spbb[1,2] (-Spaa[2,3] Spbb[2,5]+Spaa[3,4] (Spbb[1,5]+Spbb[4,5])))]]
Length[(-Spaa[1,6]Spaa[4,6]Spbb[1,2] (-Spaa[2,3] Spbb[2,5]+Spaa[3,4] (Spbb[1,5]+Spbb[4,5]))+Spaa[3,6] (-Spaa[2,3] Spbb[2,3] Spbb[2,5]+Spaa[1,4] Spbb[1,2] (Spbb[1,5]+Spbb[4,5])))/(Spaa[4,6]Spbb[1,2] (-Spaa[2,3] Spbb[2,5]+Spaa[3,4] (Spbb[1,5]+Spbb[4,5])))//Expand]

Length[(Spaa[2,3] (Spaa[1,6] Spbb[1,2]-Spaa[3,6] Spbb[2,3]) Spbb[2,5]+Spaa[1,3] Spaa[4,6] Spbb[1,2] (Spbb[1,5]+Spbb[4,5]))/(Spaa[4,6] Spbb[1,2] (-Spaa[2,3] Spbb[2,5]+Spaa[3,4] (Spbb[1,5]+Spbb[4,5])))//Expand]


(*6 pt NMHV 4+4*)

(*Define C-matrices and lambda*)
CC={{1,a1,0,0,0,a2},{0,a6,1,a5,0,a6 a7},{0,a6 a8 ,0,a4,1,a3+a6 a7 a8}};
Cperp ={{-a1,1,-a6,0,-a6 a8,0},{0,0,-a5,1,-a4,0},{-a2,0,-a6 a7,0,-(a3 + a6 a7 a8),1}};
lambda={{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]}};
tlambda={{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]}};
(*Test transpose orthogonality*)
CC . Transpose[Cperp]=={{0,0,0},{0,0,0},{0,0,0}};
Cperp . Transpose[lambda];
CC . Transpose[tlambda]


B1 = t\[Lambda][1] . t\[Lambda][2]+a1 t\[Lambda][2] . t\[Lambda][2]+a2 t\[Lambda][6] . t\[Lambda][2]//.RR;
B2 = t\[Lambda][1] . t\[Lambda][6]+a1 t\[Lambda][2] . t\[Lambda][6]+a2 t\[Lambda][6] . t\[Lambda][6]//.RR;
B3 = a6 t\[Lambda][2] . t\[Lambda][2]+t\[Lambda][3] . t\[Lambda][2]+a5 t\[Lambda][4] . t\[Lambda][2]+a6 a7 t\[Lambda][6] . t\[Lambda][2]//.RR;
B4 = a6 t\[Lambda][2] . t\[Lambda][6]+t\[Lambda][3] . t\[Lambda][6]+a5 t\[Lambda][4] . t\[Lambda][6]+a6 a7 t\[Lambda][6] . t\[Lambda][6]//.RR;
B5 = a6 a8 t\[Lambda][2] . t\[Lambda][2]+a4 t\[Lambda][4] . t\[Lambda][2]+t\[Lambda][5] . t\[Lambda][2]+(a3+a6 a7 a8) t\[Lambda][6] . t\[Lambda][2]//.RR;
B6 = a6 a8 t\[Lambda][2] . t\[Lambda][6]+a4 t\[Lambda][4] . t\[Lambda][6]+t\[Lambda][5] . t\[Lambda][6]+(a3+a6 a7 a8) t\[Lambda][6] . t\[Lambda][6]//.RR;

A1 = -a1 \[Lambda][1] . \[Lambda][1]+\[Lambda][2] . \[Lambda][1]-a6 \[Lambda][3] . \[Lambda][1]-a6 a8 \[Lambda][5] . \[Lambda][1]//.{\[Lambda][i_] . \[Lambda][j_]->Spaa[i,j]};
A2 = -a1 \[Lambda][1] . \[Lambda][3]+\[Lambda][2] . \[Lambda][3]-a6 \[Lambda][3] . \[Lambda][3]-a6 a8 \[Lambda][5] . \[Lambda][3]//.{\[Lambda][i_] . \[Lambda][j_]->Spaa[i,j]};
A3 = -a1 \[Lambda][1] . \[Lambda][5]+\[Lambda][2] . \[Lambda][5]-a6 \[Lambda][3] . \[Lambda][5]-a6 a8 \[Lambda][5] . \[Lambda][5]//.{\[Lambda][i_] . \[Lambda][j_]->Spaa[i,j]};
A4 = -a5 \[Lambda][3] . \[Lambda][3]+\[Lambda][4] . \[Lambda][3]-a4 \[Lambda][5] . \[Lambda][3]//.{\[Lambda][i_] . \[Lambda][j_]->Spaa[i,j]};
A5 = -a5 \[Lambda][3] . \[Lambda][5]+\[Lambda][4] . \[Lambda][5]-a4 \[Lambda][5] . \[Lambda][5]//.{\[Lambda][i_] . \[Lambda][j_]->Spaa[i,j]};
A6 = -a2 \[Lambda][1] . \[Lambda][1]-a6 a7 \[Lambda][3] . \[Lambda][1]+(-a3-a6 a7 a8) \[Lambda][5] . \[Lambda][1]+\[Lambda][6] . \[Lambda][1]//.{\[Lambda][i_] . \[Lambda][j_]->Spaa[i,j]};
A7 = -a2 \[Lambda][1] . \[Lambda][3]-a6 a7 \[Lambda][3] . \[Lambda][3]+(-a3-a6 a7 a8) \[Lambda][5] . \[Lambda][3]+\[Lambda][6] . \[Lambda][3]//.{\[Lambda][i_] . \[Lambda][j_]->Spaa[i,j]};
A8 = -a2 \[Lambda][1] . \[Lambda][5]-a6 a7 \[Lambda][3] . \[Lambda][5]+(-a3-a6 a7 a8) \[Lambda][5] . \[Lambda][5]+\[Lambda][6] . \[Lambda][5]//.{\[Lambda][i_] . \[Lambda][j_]->Spaa[i,j]};
Sol = Solve[{A4==0,A5==0,B1==0,B2==0,B3==0,B4==0,B6==0,B5==0},{a1,a2,a4,a3,a5,a6,a7,a8}]//Simplify;
Simplify[Sol//.schoutenB]


\[Alpha]1 = -(Spbb[1,6]/Spbb[2,6]);
\[Alpha]2 = Spbb[1,2]/Spbb[2,6];
\[Alpha]4 = Spaa[3,4]/Spaa[3,5];
\[Alpha]3 = -((Spaa[3,4] Spbb[3,4]+Spaa[3,5] Spbb[3,5]+Spaa[4,5] Spbb[4,5])/(Spaa[3,5] Spbb[3,6]+Spaa[4,5] Spbb[4,6]));
\[Alpha]5 = Spaa[4,5]/Spaa[3,5];
\[Alpha]6 = -((Spaa[3,5] Spbb[3,6]+Spaa[4,5] Spbb[4,6])/(Spaa[3,5] Spbb[2,6]));
\[Alpha]7 = (Spaa[3,5] Spbb[2,3]+Spaa[4,5] Spbb[2,4])/(Spaa[3,5] Spbb[3,6]+Spaa[4,5] Spbb[4,6]);
\[Alpha]8 = (Spaa[3,4] Spbb[4,6]+Spaa[3,5] Spbb[5,6])/(Spaa[3,5] Spbb[3,6]+Spaa[4,5] Spbb[4,6]);
CC={{1,\[Alpha]1,0,0,0,\[Alpha]2},{0,\[Alpha]6,1,\[Alpha]5,0,\[Alpha]6 \[Alpha]7},{0,\[Alpha]6 \[Alpha]8 ,0,\[Alpha]4,1,\[Alpha]3+\[Alpha]6 \[Alpha]7 \[Alpha]8}};
eta={{\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]},{\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]},{\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]}};
CC . Transpose[eta];

FullSimplify[\[Eta][1]Spbb[2,6]-Spbb[1,6] \[Eta][2]+Spbb[1,2] \[Eta][6]==0]
-(((Spaa[3,5] Spbb[3,6]+Spaa[4,5] Spbb[4,6]) \[Eta][2])/(Spaa[3,5] Spbb[2,6]))+\[Eta][3]+(Spaa[4,5] \[Eta][4])/Spaa[3,5]-((Spaa[3,5] Spbb[2,3]+Spaa[4,5] Spbb[2,4]) \[Eta][6])/(Spaa[3,5] Spbb[2,6])
-(((Spaa[3,4] Spbb[4,6]+Spaa[3,5] Spbb[5,6]) \[Eta][2])/(Spaa[3,5] Spbb[2,6]))+(Spaa[3,4] \[Eta][4])/Spaa[3,5]+\[Eta][5]+(-((Spaa[3,4] Spbb[3,4]+Spaa[3,5] Spbb[3,5]+Spaa[4,5] Spbb[4,5])/(Spaa[3,5] Spbb[3,6]+Spaa[4,5] Spbb[4,6]))-((Spaa[3,5] Spbb[2,3]+Spaa[4,5] Spbb[2,4]) (Spaa[3,4] Spbb[4,6]+Spaa[3,5] Spbb[5,6]))/(Spaa[3,5] Spbb[2,6] (Spaa[3,5] Spbb[3,6]+Spaa[4,5] Spbb[4,6]))) \[Eta][6];


-(Spaa[3,5] Spbb[3,6]+Spaa[4,5] Spbb[4,6]) \[Eta][2]+\[Eta][3]Spaa[3,5]Spbb[2,6]+Spaa[4,5] Spbb[2,6]\[Eta][4]-(Spaa[3,5] Spbb[2,3]+Spaa[4,5] Spbb[2,4]) \[Eta][6];
-((Spaa[3,4] Spbb[4,6]+Spaa[3,5] Spbb[5,6]) \[Eta][2])+Spaa[3,4] Spbb[2,6] \[Eta][4]+Spaa[3,5] Spbb[2,6] \[Eta][5]-((Spaa[4,5] Spbb[2,6] Spbb[4,5]+Spaa[3,4] (Spaa[4,5] Spbb[2,4] Spbb[4,6]+Spaa[3,5] (Spbb[2,6] Spbb[3,4]+Spbb[2,3] Spbb[4,6]))+Spaa[3,5] Spaa[4,5] Spbb[2,4] Spbb[5,6]+Spaa[3,5]^2 (Spbb[3,5]+Spbb[2,3] Spbb[5,6])) \[Eta][6])/(Spaa[3,5] Spbb[3,6]+Spaa[4,5] Spbb[4,6])//Expand;

-(Spaa[3,5] Spbb[3,6]+Spaa[4,5] Spbb[4,6]) \[Eta][2]+\[Eta][3]Spaa[3,5]Spbb[2,6]+Spaa[4,5] Spbb[2,6]\[Eta][4]-(Spaa[3,5] Spbb[2,3]+Spaa[4,5] Spbb[2,4]) \[Eta][6]-((Spaa[3,4] Spbb[4,6]+Spaa[3,5] Spbb[5,6]) \[Eta][2])+Spaa[3,4] Spbb[2,6] \[Eta][4]+Spaa[3,5] Spbb[2,6] \[Eta][5]-((Spaa[4,5] Spbb[2,6] Spbb[4,5]+Spaa[3,4] (Spaa[4,5] Spbb[2,4] Spbb[4,6]+Spaa[3,5] (Spbb[2,6] Spbb[3,4]+Spbb[2,3] Spbb[4,6]))+Spaa[3,5] Spaa[4,5] Spbb[2,4] Spbb[5,6]+Spaa[3,5]^2 (Spbb[3,5]+Spbb[2,3] Spbb[5,6])) \[Eta][6])/(Spaa[3,5] Spbb[3,6]+Spaa[4,5] Spbb[4,6])//FullSimplify


(* ::InheritFromParent:: *)
(**)


(* ::InheritFromParent:: *)
(**)


 (-Spaa[2,3] Spbb[2,5]+Spaa[3,4] (Spbb[1,5]+Spbb[4,5]))//Expand


Spaa[3,4]Spaa[4,6]//.schoutenA


-Spbb[1,3]Spba[2,1,3,6]Spbb[2,5]+Spbb[1,2]Spaa[4,6] Spbb[1,5] Spbb[2,3]+Spbb[1,2]Spaa[4,6] Spbb[2,3] Spbb[4,5]


(*6 pt NMHV 5+3, 2nd attempt*)

(*Define C-matrices and lambda*)
CC={{a2 a5,a3 a5 +a4,1,0,0,0},{a2,a3,0,1,a6,0},{a8(a1+a2),a3 a8,0,0,a7,1}};
ffs={{0,a,0},{1,a6,0},{0,a7,1}};
Cperp ={{1,0,-a2 a5, -a2,0,-a8 (a1+a2)},{0,1,-a3 a5-a4,-a3,0,-a3 a8},{0,0,0,-a6,1,-a7}};
lambda={{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]}};
tlambda={{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]}};
CC . Transpose[Cperp];
Cperp . Transpose[lambda];
CC . Transpose[tlambda]

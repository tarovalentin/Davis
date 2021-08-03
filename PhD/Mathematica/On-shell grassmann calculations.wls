#!/usr/bin/env wolframscript
(* ::Package:: *)

ClearAll["Global`*"]
SetDirectory["C:\\Users\\tarob\\OneDrive\\Dokumenter\\Taro PC\\Documents\\Davis\\PhD\\Mathematica"];
<<CHY_ToolPackagev1.wl
$CHYfunctions
RR={\[Lambda][i_] . \[Lambda][j_]->Spaa[i,j],t\[Lambda][i_] . t\[Lambda][j_]->Spbb[i,j],Spaa[i_,j_] Spbb[j_,k_]+Spaa[i_,l_] Spbb[k_,l_]->Spba[k,j,l,i],-Spaa[j_,i_] Spbb[j_,k_]+Spaa[l_,i_] Spbb[k_,l_]->-Spba[k,j,l,i],-Spaa[i_,j_] Spbb[i_,k_]+Spaa[l_,j_] Spbb[k_,l_]->Spba[k,i,l,j]};
rschoutB = {Spbb[l_,i_]Spbb[j_,k_]->-Spbb[l,j]Spbb[i,k]-Spbb[l,k]Spbb[i,j]};


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


(*6 pt NMHV 4+4*)

(*Define C-matrices and lambda*)
CC={{1,a1,0,0,0,a2},{0,a6,1,a5,0,a6 a7},{0,a6 a8 ,0,a4,1,a3+a6 a7 a8}}//MatrixForm
CC={{1,\[Alpha]1,0,0,0,\[Alpha]2},{0,\[Alpha]6,1,\[Alpha]5,0,\[Alpha]6 \[Alpha]7},{0,\[Alpha]6 \[Alpha]8 ,0,\[Alpha]4,1,\[Alpha]3+\[Alpha]6 \[Alpha]7 \[Alpha]8}}//MatrixForm
Cperp ={{-a1,1,-a6,0,-a6 a8,0},{0,0,-a5,1,-a4,0},{-a2,0,-a6 a7,0,-(a3 + a6 a7 a8),1}}//MatrixForm
lambda={{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]}};
tlambda={{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]}};
(*Test transpose orthogonality*)
CC . Transpose[Cperp]=={{0,0,0},{0,0,0},{0,0,0}};
Cperp . Transpose[lambda];
CC . Transpose[tlambda];


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
\[Alpha]3 = (s[3,4,5])/(Spab[5,3,4,6]);
\[Alpha]4 = Spaa[3,4]/Spaa[3,5];
\[Alpha]5 = Spaa[4,5]/Spaa[3,5];
\[Alpha]6 = (Spab[5,3,4,6])/(Spaa[3,5] Spbb[2,6]);
\[Alpha]7 = -(Spab[5,3,4,2])/Spab[5,3,4,6];
\[Alpha]8 =- Spab[3,4,5,6]/Spab[5,3,4,6];
CC={{1,\[Alpha]1,0,0,0,\[Alpha]2},{0,\[Alpha]6,1,\[Alpha]5,0,\[Alpha]6 \[Alpha]7},{0,\[Alpha]6 \[Alpha]8 ,0,\[Alpha]4,1,\[Alpha]3+\[Alpha]6 \[Alpha]7 \[Alpha]8}};
eta={{\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]},{\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]},{\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]}};
CC . Transpose[eta];

\[Eta][1]-(Spbb[1,6] \[Eta][2])/Spbb[2,6]+(Spbb[1,2] \[Eta][6])/Spbb[2,6];
(Spab[5,3,4,6] \[Eta][2])/(Spaa[3,5] Spbb[2,6])+\[Eta][3]+(Spaa[4,5] \[Eta][4])/Spaa[3,5]-(Spab[5,3,4,2] \[Eta][6])/(Spaa[3,5] Spbb[2,6]);
-((Spab[3,4,5,6] \[Eta][2])/(Spaa[3,5] Spbb[2,6]))+(Spaa[3,4] \[Eta][4])/Spaa[3,5]+\[Eta][5]+(s[3,4,5]/Spab[5,3,4,6]+(Spab[3,4,5,6] Spab[5,3,4,2])/(Spaa[3,5] Spab[5,3,4,6] Spbb[2,6])) \[Eta][6];


latexto := {a1->Subscript[\[Alpha], 1],a2->Subscript[\[Alpha], 2],a3->Subscript[\[Alpha], 3],a4->Subscript[\[Alpha], 4],a5->Subscript[\[Alpha], 5],a6->Subscript[\[Alpha], 6],a7->Subscript[\[Alpha], 7],a8->Subscript[\[Alpha], 8]}
latexto2 := {"Spaa[1, 2]"->"\\langle 1 2 \\rangle","Spaa[1, 3]"->"\\langle 1 3 \\rangle","Spaa[1, 4]"->"\\langle 1 4 \\rangle","Spaa[1, 5]"->"\\langle 1 5 \\rangle","Spaa[1, 6]"->"\\langle 1 6 \\rangle","Spaa[2, 3]"->"\\langle 2 3 \\rangle","Spaa[2, 4]"->"\\langle 2 4 \\rangle","Spaa[2, 5]"->"\\langle 2 5 \\rangle","Spaa[2, 6]"->"\\langle 2 6 \\rangle","Spaa[3, 4]"->"\\langle 3 4 \\rangle","Spaa[3, 5]"->"\\langle 3 5 \\rangle","Spaa[3, 6]"->"\\langle 3 6 \\rangle","Spaa[4, 5]"->"\\langle 4 5 \\rangle","Spaa[4, 6]"->"\\langle 4 6 \\rangle","Spaa[5, 6]"->"\\langle 5 6 \\rangle"}
latexto3 := {"Spbb[1, 2]"->"\\left[ 1 2 \\right]","Spbb[1, 3]"->"\\left[ 1 3 \\right]","Spbb[1, 4]"->"\\left[ 1 4 \\right]","Spbb[1, 5]"->"\\left[ 1 5 \\right]","Spbb[1, 6]"->"\\left[ 1 6 \\right]","Spbb[2, 3]"->"\\left[ 2 3 \\right]","Spbb[2, 4]"->"\\left[ 2 4 \\right]","Spbb[2, 5]"->"\\left[ 2 5 \\right]","Spbb[2, 6]"->"\\left[ 2 6 \\right]","Spbb[3, 4]"->"\\left[ 3 4 \\right]","Spbb[3, 5]"->"\\left[ 3 5 \\right]","Spbb[3, 6]"->"\\left[ 3 6 \\right]","Spbb[4, 5]"->"\\left[ 4 5 \\right]","Spbb[4, 6]"->"\\left[ 4 6 \\right]","Spbb[5, 6]"->"\\left[ 5 6 \\right]"}
latexto4 := {"a1"->"\\alpha_{1}","a2"->"\\alpha_{2}","a3"->"\\alpha_{3}","a4"->"\\alpha_{4}","a5"->"\\alpha_{5}","a6"->"\\alpha_{6}","a7"->"\\alpha_{7}","a8"->"\\alpha_{8}"}


StringReplace[StringReplace[StringReplace[ToString[A4],latexto2],latexto3],latexto4]
"\\\\"
StringReplace[StringReplace[StringReplace[ToString[A5],latexto2],latexto3],latexto4]
"\\\\"
StringReplace[StringReplace[StringReplace[ToString[B1],latexto2],latexto3],latexto4]
"\\\\"
StringReplace[StringReplace[StringReplace[ToString[B2],latexto2],latexto3],latexto4]
"\\\\"
StringReplace[StringReplace[StringReplace[ToString[B3],latexto2],latexto3],latexto4]
"\\\\"
StringReplace[StringReplace[StringReplace[ToString[B4],latexto2],latexto3],latexto4]
"\\\\"
StringReplace[StringReplace[StringReplace[ToString[B5],latexto2],latexto3],latexto4]
"\\\\"
StringReplace[StringReplace[StringReplace[ToString[B6],latexto2],latexto3],latexto4]


(*6 pt NMHV 5+3*)

(*Define C-matrices and lambda*)
CC={{a2, a3 +a4,1,0,0,0},{a2 a5,a3 a5,0,1,a6,0},{a8(a1+a5 a2),a3 a5 a8,0,0,a7,1}};
ffs={{0,a,0},{1,a6,0},{0,a7,1}};
Cperp ={{1,0,-a2, -a2 a5 ,0,-a8 (a1+a2 a5)},{0,1,-a3-a4,-a3 a5,0,-a3 a5 a8},{0,0,0,-a6,1,-a7}};
lambda={{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]}};
tlambda={{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]}};
CC . Transpose[Cperp];
Cperp . Transpose[lambda];
CC . Transpose[tlambda];

A1 = \[Lambda][1] . \[Lambda][3]-a2 \[Lambda][3] . \[Lambda][3]-a2 a5 \[Lambda][4] . \[Lambda][3]-(a1+a2 a5) a8 \[Lambda][6] . \[Lambda][3]//.RR//Simplify
A2 = \[Lambda][1] . \[Lambda][4]-a2 \[Lambda][3] . \[Lambda][4]-a2 a5 \[Lambda][4] . \[Lambda][4]-(a1+a2 a5) a8 \[Lambda][6] . \[Lambda][4]//.RR//Simplify
A3 = \[Lambda][1] . \[Lambda][6]-a2 \[Lambda][3] . \[Lambda][6]-a2 a5 \[Lambda][4] . \[Lambda][6]-(a1+a2 a5) a8 \[Lambda][6] . \[Lambda][6]//.RR//Simplify
A4 = \[Lambda][2] . \[Lambda][3]+(-a3-a4) \[Lambda][3] . \[Lambda][3]-a3 a5 \[Lambda][4] . \[Lambda][3]-a3 a5 a8 \[Lambda][6] . \[Lambda][3]//.RR//Simplify
A5 = \[Lambda][2] . \[Lambda][4]+(-a3-a4) \[Lambda][3] . \[Lambda][4]-a3 a5 \[Lambda][4] . \[Lambda][4]-a3 a5 a8 \[Lambda][6] . \[Lambda][4]//.RR//Simplify
A6 = \[Lambda][2] . \[Lambda][6]+(-a3-a4) \[Lambda][3] . \[Lambda][6]-a3 a5 \[Lambda][4] . \[Lambda][6]-a3 a5 a8 \[Lambda][6] . \[Lambda][6]//.RR//Simplify
A7 = -a6 \[Lambda][4] . \[Lambda][4]+\[Lambda][5] . \[Lambda][4]-a7 \[Lambda][6] . \[Lambda][4]//.RR
A8 = -a6 \[Lambda][4] . \[Lambda][6]+\[Lambda][5] . \[Lambda][6]-a7 \[Lambda][6] . \[Lambda][6]//.RR

B1 = a2 t\[Lambda][1] . t\[Lambda][1]+(a3+a4) t\[Lambda][2] . t\[Lambda][1]+t\[Lambda][3] . t\[Lambda][1]//.RR//Simplify
B2 = a2 t\[Lambda][1] . t\[Lambda][2]+(a3+a4) t\[Lambda][2] . t\[Lambda][2]+t\[Lambda][3] . t\[Lambda][2]//.RR//Simplify

B3 = a2 a5 t\[Lambda][1] . t\[Lambda][1]+a3 a5 t\[Lambda][2] . t\[Lambda][1]+t\[Lambda][4] . t\[Lambda][1]+a6 t\[Lambda][5] . t\[Lambda][1]//.RR//Simplify
B4 = a2 a5 t\[Lambda][1] . t\[Lambda][2]+a3 a5 t\[Lambda][2] . t\[Lambda][2]+t\[Lambda][4] . t\[Lambda][2]+a6 t\[Lambda][5] . t\[Lambda][2]//.RR//Simplify
B5 = a2 a5 t\[Lambda][1] . t\[Lambda][5]+a3 a5 t\[Lambda][2] . t\[Lambda][5]+t\[Lambda][4] . t\[Lambda][5]+a6 t\[Lambda][5] . t\[Lambda][5]//.RR//Simplify

B6 = (a1+a2 a5) a8 t\[Lambda][1] . t\[Lambda][1]+a3 a5 a8 t\[Lambda][2] . t\[Lambda][1]+a7 t\[Lambda][5] . t\[Lambda][1]+t\[Lambda][6] . t\[Lambda][1]//.RR//Simplify
B7 = (a1+a2 a5) a8 t\[Lambda][1] . t\[Lambda][2]+a3 a5 a8 t\[Lambda][2] . t\[Lambda][2]+a7 t\[Lambda][5] . t\[Lambda][2]+t\[Lambda][6] . t\[Lambda][2]//.RR//Simplify
B8 = (a1+a2 a5) a8 t\[Lambda][1] . t\[Lambda][5]+a3 a5 a8 t\[Lambda][2] . t\[Lambda][5]+a7 t\[Lambda][5] . t\[Lambda][5]+t\[Lambda][6] . t\[Lambda][5]//.RR//Simplify


\[Alpha]1 =  s[4,5,6]/Spba[1,5,6,4]; (*B7*)
\[Alpha]6 = Spaa[5,6]/Spaa[4,6]; (*A7*)
\[Alpha]7 = Spaa[4,5]/Spaa[4,6]; (*A8*)
\[Alpha]2 = Spbb[2,3]/Spbb[1,2]; (*B2*)
\[Alpha]5 = - (Spba[2,4,5,6]/(Spaa[4,6] Spbb[2,3])) ; (*B4*)
\[Alpha]3 = (Spba[1,4,5,6] Spbb[2,3])/(Spba[2,4,5,6] Spbb[1,2]); (*A6*)
\[Alpha]4 = Spba[3,4,5,6]/Spba[2,4,5,6] ; (*B1*)
\[Alpha]8 = Spba[1,5,6,4]/Spba[1,4,5,6]; (*B6*)

CC={{\[Alpha]2, \[Alpha]3 +\[Alpha]4,1,0,0,0},{\[Alpha]2 \[Alpha]5,\[Alpha]3 \[Alpha]5,0,1,\[Alpha]6,0},{\[Alpha]8(\[Alpha]1+\[Alpha]5 \[Alpha]2),\[Alpha]3 \[Alpha]5 \[Alpha]8,0,0,\[Alpha]7,1}};
Cperp ={{1,0,-\[Alpha]2, -\[Alpha]2 \[Alpha]5 ,0,-\[Alpha]8 (\[Alpha]1+\[Alpha]2 \[Alpha]5)},{0,1,-\[Alpha]3-\[Alpha]4,-\[Alpha]3 \[Alpha]5,0,-\[Alpha]3 \[Alpha]5 \[Alpha]8},{0,0,0,-\[Alpha]6,1,-\[Alpha]7}};
eta={{\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]},{\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]},{\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]}};
CC . Transpose[eta];
(Spbb[2,3] \[Eta][1])/Spbb[1,2]+(Spba[3,4,5,6]/Spba[2,4,5,6]+(Spba[1,4,5,6] Spbb[2,3])/(Spba[2,4,5,6] Spbb[1,2])) \[Eta][2]+\[Eta][3];
-((Spba[2,4,5,6] \[Eta][1])/(Spaa[4,6] Spbb[1,2]))-(Spba[1,4,5,6] \[Eta][2])/(Spaa[4,6] Spbb[1,2])+\[Eta][4]+(Spaa[5,6] \[Eta][5])/Spaa[4,6]
(Spba[1,5,6,4] (s[4,5,6]/Spba[1,5,6,4]-Spba[2,4,5,6]/(Spaa[4,6] Spbb[1,2])) \[Eta][1])/Spba[1,4,5,6]-(Spba[1,5,6,4] \[Eta][2])/(Spaa[4,6] Spbb[1,2])+(Spaa[4,5] \[Eta][5])/Spaa[4,6]+\[Eta][6]


1/(\[Alpha]1 \[Alpha]2 \[Alpha]3 \[Alpha]4 \[Alpha]5 \[Alpha]6 \[Alpha]7 \[Alpha]8)*1/Spba[2,4,5,6]*1/(Spaa[4,6]^3 Spbb[1,2]^3)//Simplify


StringReplace[StringReplace[StringReplace[ToString[A6],latexto2],latexto3],latexto4]
"\\\\"
StringReplace[StringReplace[StringReplace[ToString[A7],latexto2],latexto3],latexto4]
"\\\\"
StringReplace[StringReplace[StringReplace[ToString[A8],latexto2],latexto3],latexto4]
"\\\\"
StringReplace[StringReplace[StringReplace[ToString[B1],latexto2],latexto3],latexto4]
"\\\\"
StringReplace[StringReplace[StringReplace[ToString[B2],latexto2],latexto3],latexto4]
"\\\\"
StringReplace[StringReplace[StringReplace[ToString[B6],latexto2],latexto3],latexto4]
"\\\\"
StringReplace[StringReplace[StringReplace[ToString[B7],latexto2],latexto3],latexto4]
"\\\\"
StringReplace[StringReplace[StringReplace[ToString[B6],latexto2],latexto3],latexto4]

#!/usr/bin/env wolframscript
(* ::Package:: *)

ClearAll["Global`*"]
SetDirectory["C:\\Users\\tarob\\OneDrive\\Dokumenter\\Taro PC\\Documents\\Davis\\PhD\\Mathematica"];
Off[Part::pkspec1]
Off[SetDelayed::write]
Off[General::compat]
<<CHY_ToolPackagev1.wl
$CHYfunctions
RR={\[Lambda][i_] . \[Lambda][j_]->Spaa[i,j],t\[Lambda][i_] . t\[Lambda][j_]->Spbb[i,j],Spaa[i_,j_] Spbb[j_,k_]+Spaa[i_,l_] Spbb[k_,l_]->Spba[k,j,l,i],-Spaa[j_,i_] Spbb[j_,k_]+Spaa[l_,i_] Spbb[k_,l_]->-Spba[k,j,l,i],-Spaa[i_,j_] Spbb[i_,k_]+Spaa[l_,j_] Spbb[k_,l_]->Spba[k,i,l,j]};
rschoutB = {Spbb[l_,i_]Spbb[j_,k_]->-Spbb[l,j]Spbb[i,k]-Spbb[l,k]Spbb[i,j]};
latexto := {a1->Subscript[\[Alpha], 1],a2->Subscript[\[Alpha], 2],a3->Subscript[\[Alpha], 3],a4->Subscript[\[Alpha], 4],a5->Subscript[\[Alpha], 5],a6->Subscript[\[Alpha], 6],a7->Subscript[\[Alpha], 7],a8->Subscript[\[Alpha], 8]}
latexto6 := {a[i_]->Subscript[\[Alpha], i]}

latexto2 := {"Spaa[1, 2]"->"\\langle 1 2 \\rangle","Spaa[1, 3]"->"\\langle 1 3 \\rangle","Spaa[1, 4]"->"\\langle 1 4 \\rangle","Spaa[1, 5]"->"\\langle 1 5 \\rangle","Spaa[1, 6]"->"\\langle 1 6 \\rangle","Spaa[2, 3]"->"\\langle 2 3 \\rangle","Spaa[2, 4]"->"\\langle 2 4 \\rangle","Spaa[2, 5]"->"\\langle 2 5 \\rangle","Spaa[2, 6]"->"\\langle 2 6 \\rangle","Spaa[3, 4]"->"\\langle 3 4 \\rangle","Spaa[3, 5]"->"\\langle 3 5 \\rangle","Spaa[3, 6]"->"\\langle 3 6 \\rangle","Spaa[4, 5]"->"\\langle 4 5 \\rangle","Spaa[4, 6]"->"\\langle 4 6 \\rangle","Spaa[5, 6]"->"\\langle 5 6 \\rangle"};

latexto3 := {"Spbb[1, 2]"->"\\left[ 1 2 \\right]","Spbb[1, 3]"->"\\left[ 1 3 \\right]","Spbb[1, 4]"->"\\left[ 1 4 \\right]","Spbb[1, 5]"->"\\left[ 1 5 \\right]","Spbb[1, 6]"->"\\left[ 1 6 \\right]","Spbb[2, 3]"->"\\left[ 2 3 \\right]","Spbb[2, 4]"->"\\left[ 2 4 \\right]","Spbb[2, 5]"->"\\left[ 2 5 \\right]","Spbb[2, 6]"->"\\left[ 2 6 \\right]","Spbb[3, 4]"->"\\left[ 3 4 \\right]","Spbb[3, 5]"->"\\left[ 3 5 \\right]","Spbb[3, 6]"->"\\left[ 3 6 \\right]","Spbb[4, 5]"->"\\left[ 4 5 \\right]","Spbb[4, 6]"->"\\left[ 4 6 \\right]","Spbb[5, 6]"->"\\left[ 5 6 \\right]"};
latexto4 := {"a1"->"\\alpha_{1}","a2"->"\\alpha_{2}","a3"->"\\alpha_{3}","a4"->"\\alpha_{4}","a5"->"\\alpha_{5}","a6"->"\\alpha_{6}","a7"->"\\alpha_{7}","a8"->"\\alpha_{8}"};
latexto5 := {b1->Subscript[\[Beta], 1],b2->Subscript[\[Beta], 2],b3->Subscript[\[Beta], 3],b4->Subscript[\[Beta], 4],b5->Subscript[\[Beta], 5],b6->Subscript[\[Beta], 6],b7->Subscript[\[Beta], 7],b8->Subscript[\[Beta], 8]}
schoutenC = {Spaa[i_,j_] Spaa[l_,r_] Spbb[i_,k_]+Spaa[j_,r_] Spaa[l_,t_] Spbb[k_,t_]+Spaa[j_,r_] Spaa[l_,r_] Spbb[k_,r_]->Spaa[j,l]Spab[r,P[l]+P[t]+P[r],k]};
SPAB = {-Spaa[j_,i_] Spbb[j_,r_]-Spaa[i_,k_] Spbb[r_,k_]-Spaa[i_,l_] Spbb[r_,l_]-Spaa[i_,nn_] Spbb[r_,nn_]->Spab[i,P[j]+P[k]+P[l]+P[nn],r],Spaa[j_,i_] Spbb[j_,r_]+Spaa[k_,i_] Spbb[k_,r_]->-Spab[i,P[j]+P[k],r],Spaa[i_,j_] Spbb[r_,j_]+Spaa[i_,k_] Spbb[r_,k_]->-Spab[i,P[j]+P[k],r],Spaa[j_,i_] Spbb[j_,r_]+Spaa[i_,k_] Spbb[r_,k_]->-Spab[i,P[j]+P[k],r],Spaa[j_,i_] Spbb[r_,j_]+Spaa[k_,i_] Spbb[r_,k_]->Spab[i,P[j]+P[k],r]};
SPAB2 = {Spab[i_,P[j_],k_]->Spaa[i,j]Spbb[j,k],Spab[i_,P[j_]+P[l_],k_]->Spaa[i,j]Spbb[j,k]+Spaa[i,l]Spbb[l,k]};
SHtest = {Spab[i_,P[j_]+P[k_]+P[l_],r_]->Spaa[i,j]Spbb[j,r]+Spaa[i,k]Spbb[k,r]+Spaa[i,l]Spbb[l,r],s[i_,j_,k_]->Spaa[i,j]Spbb[j,i]+Spaa[i,k]Spbb[k,i]+Spaa[j,k]Spbb[k,j]};


(* ::Section::Closed:: *)
(*4 Pt MHV*)


(*4 pt MHV*)

(*Define C-matrices and lambda*)
GrassC = {{1, a1,0,a4},{0,a2,1,a3}};
Cperp4 = {{-a1,1,-a2,0},{-a4,0,-a3,1}};
lambda = {{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4]}};
tlambda = {{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4]}};
GrassC . Transpose[tlambda]
(*Solve for \[Alpha]'s by solving one delta function constraint. Here we get the equations from the eq below*)
Cperp4 . Transpose[lambda];


(*We then define them underneath by contracting with lambda's*)
A1=-a1 \[Lambda][1] . \[Lambda][1]+\[Lambda][2] . \[Lambda][1]-a2 \[Lambda][3] . \[Lambda][1]//.RR
A2=-a1 \[Lambda][1] . \[Lambda][3]+\[Lambda][2] . \[Lambda][3]-a2 \[Lambda][3] . \[Lambda][3]//.RR
A3=-a4 \[Lambda][1] . \[Lambda][1]-a3 \[Lambda][3] . \[Lambda][1]+\[Lambda][4] . \[Lambda][1]//.RR
A4=-a4 \[Lambda][1] . \[Lambda][3]-a3 \[Lambda][3] . \[Lambda][3]+\[Lambda][4] . \[Lambda][3]//.RR
B1 = t\[Lambda][1] . t\[Lambda][2]+a1 t\[Lambda][2] . t\[Lambda][2]+a4 t\[Lambda][4] . t\[Lambda][2]//.RR;
B2 = t\[Lambda][1] . t\[Lambda][4]+a1 t\[Lambda][2] . t\[Lambda][4]+a4 t\[Lambda][4] . t\[Lambda][4]//.RR;
B3 = a2 t\[Lambda][2] . t\[Lambda][2]+t\[Lambda][3] . t\[Lambda][2]+a3 t\[Lambda][4] . t\[Lambda][2]//.RR
B4 = a2 t\[Lambda][2] . t\[Lambda][4]+t\[Lambda][3] . t\[Lambda][4]+a3 t\[Lambda][4] . t\[Lambda][4]//.RR;

Sol = Solve[{A1==0,A2==0,A3==0,A4==0},{a1,a2,a3,a4}]//Simplify;
Sol//.schoutenA


DefNumSH[4];
B3//.NSpinHel


a1 = Spaa[2,3]/Spaa[1,3];
a2 = Spaa[1,2]/Spaa[1,3];
a3 = Spaa[1,4]/Spaa[1,3];
a4 = -(Spaa[3,4]/Spaa[1,3]);


(*We solve for \[Alpha]'s and simplify using schouten*)
J1 = Solve[-Spaa[1,2]+\[Alpha]2 Spaa[1,3]==x(a2-\[Alpha]2),x] (*A1*);
J1 = 1/x//.J1[[1]][[1]];
J2 = Solve[-\[Alpha]2 Spaa[1,3]+Spaa[2,3]==x(a1-\[Alpha]2),x] (*A2*);
J2 = 1/x//.J2[[1]][[1]]//.schoutenA;
J3 = Solve[\[Alpha]3 Spaa[1,3]-Spaa[1,4]==x(a3-\[Alpha]3),x] (*A3*);
J3 = 1/x//.J3[[1]][[1]]//.schoutenA;
J4 = Solve[-\[Alpha]4 Spaa[1,3]-Spaa[3,4]==x(a4-\[Alpha]4),x] (*A4*);
J4 = 1/x//.J4[[1]][[1]]//.schoutenA;
J1 J2 J3 J4


1/(a1 a2 a3 a4)//FullSimplify


(* ::Section::Closed:: *)
(*5 Pt MHV*)


(* ::Subsection::Closed:: *)
(*On - shell calculation*)


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


(* ::Subsection::Closed:: *)
(*5 Pt from gluing 3 pt*)


ToLoop = {Spaa[i_,l]->Spaa[i,1]/(Spaa[1,3]),Spaa[l,i_]->-Spaa[i,1]/(Spaa[1,3]),Spbb[l,i_]->Spab[3,P[1]+P[2],i],Spbb[i_,l]->-Spab[3,P[1]+P[2],i],Spaa[i_,lm1]->Spaa[2,3]Spaa[i,1]/(Spaa[1,3]),Spaa[lm1,i_]->-Spaa[2,3]Spaa[i,1]/(Spaa[1,3]),Spbb[lm1,i_]->Spbb[2,i],Spbb[i_,lm1]->Spbb[i,2],Spaa[i_,lm12]->Spaa[1,2]Spaa[i,3]/(Spaa[1,3]),Spaa[lm12,i_]->-Spaa[1,2]Spaa[i,3]/(Spaa[1,3]),Spbb[lm12,i_]->Spbb[2,i],Spbb[i_,lm12]->Spbb[i,2],Spaa[i_,lm123]->Spaa[i,3]/(Spaa[1,3]),Spaa[lm123,i_]->-Spaa[i,3]/(Spaa[1,3]),Spbb[i_,lm123]->-Spab[1,P[2]+P[3],i],Spbb[lm123,i_]->Spab[1,P[2]+P[3],i]};
ToLoop3 = {Spab[i_,j___,lm1]->Spab[i,j,2]};
ToLoop2 = {Spaa[i_,l2]->Spaa[i,5]/(Spaa[3,5]),Spaa[l2,i_]->-Spaa[i,5]/(Spaa[3,5]),Spbb[l2,i_]->Spab[3,P[1]+P[2],i],Spbb[i_,l2]->-Spab[3,P[1]+P[2],i],Spaa[i_,l2m5]->Spaa[3,4]Spaa[i,5]/(Spaa[3,5]),Spaa[l2m5,i_]->-Spaa[3,4]Spaa[i,5]/(Spaa[3,5]),Spbb[l2m5,i_]->Spbb[4,i],Spbb[i_,l2m5]->Spbb[i,4],Spaa[i_,l2m45]->Spaa[4,5]Spaa[i,3]/(Spaa[3,5]),Spaa[l2m45,i_]->-Spaa[4,5]Spaa[i,3]/(Spaa[3,5]),Spbb[l2m45,i_]->Spbb[4,i],Spbb[i_,l2m45]->Spbb[i,4]};
A4 = 1/(Spaa[4,5]Spaa[5,l]Spaa[l,lm123]Spaa[lm123,4])//.ToLoop
A31 = 1/(Spbb[l,1]Spbb[1,lm1]Spbb[lm1,l])//.ToLoop//.ToLoop3//.SPAB2
A32 = 1/(Spaa[lm1,2]Spaa[2,lm12]Spaa[lm12,lm1])//.ToLoop//.ToLoop3//.SPAB2
A33 = 1/(Spbb[lm12,3]Spbb[3,lm123]Spbb[lm123,lm12])//.ToLoop//.ToLoop3//.SPAB2
A4*A31*A32*A33*s[1,2]^3s[2,3]^3/(Spaa[1,3]^4)//.s[i_,j_]->Spaa[i,j]Spbb[j,i]//FullSimplify


(* ::Section::Closed:: *)
(*6 pt NMHV 4+4 & 5+3 sYM*)


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


1/(\[Alpha]1 \[Alpha]2 \[Alpha]3 \[Alpha]4 \[Alpha]5 \[Alpha]6 \[Alpha]7 \[Alpha]8)*1/Spaa[3,5]^3 1/Spab[5,3,4,6]^21/ Spbb[2,6]^3//Simplify


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


form=1/(\[Alpha]1 \[Alpha]2 \[Alpha]3 \[Alpha]4 \[Alpha]5 \[Alpha]6 \[Alpha]7 \[Alpha]8)*1/(Spaa[4,6]^3*Spbb[1,3])*1/(Spba[2,4,5,6]*Spba[1,2,3,4])*1/Spbb[1,2]^3

form2 = form//.{1->a,2->b,3->cc,4->d,5->e,6->f}//.{a->3,b->4,cc->5,d->6,e->1,f->2}/.{Spaa[2,6]^6 Spbb[3,5]^6->Spaa[2,6]^4 Spbb[3,5]^4}

form3 = form2//.{1->a,2->b,3->cc,4->d,5->e,6->f}//.{a->2,b->3,cc->4,d->5,e->6,f->1}//.{Spbb[a_,b_]->X[a,b],Spaa[a_,b_]->Y[a,b]}//.{X[a_,b_]->Spaa[a,b],Y[a_,b_]->Spbb[a,b]}//.Spba[a___]->Spab[a]


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
StringReplace[StringReplace[StringReplace[ToString[B4],latexto2],latexto3],latexto4]
"\\\\"
StringReplace[StringReplace[StringReplace[ToString[B6],latexto2],latexto3],latexto4]
"\\\\"
StringReplace[StringReplace[StringReplace[ToString[B7],latexto2],latexto3],latexto4]


(* ::Section:: *)
(*Loop calculation (extra internal parameter)*)


(* ::Subsection::Closed:: *)
(*4 pt two-loop*)


(*4 pt two loop*)

(*Define C-matrices and lambda*)
CC={{1, 0,a2 a3 a5,a1+a2 a3},{0,1,a4+a3 a5,a3}};
Cperp ={{-a2 a3 a5,-(a4+a3 a5),1,0},{-(a1+a2 a3),-a3,0,1}};
lambda={{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4]}};
tlambda={{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4]}};
CC . Transpose[Cperp];
Cperp . Transpose[lambda];
CC . Transpose[tlambda];


A1 = -a[2] a[3] a[5] \[Lambda][1] . \[Lambda][1]+(-a[4]-a[3] a[5]) \[Lambda][2] . \[Lambda][1]+\[Lambda][3] . \[Lambda][1]//.RR//Simplify
A2 = -a[2] a[3] a[5] \[Lambda][1] . \[Lambda][2]+(-a[4]-a[3] a[5]) \[Lambda][2] . \[Lambda][2]+\[Lambda][3] . \[Lambda][2]//.RR//Simplify
A3 =(-a[1]-a[2] a[3]) \[Lambda][1] . \[Lambda][1]-a[3] \[Lambda][2] . \[Lambda][1]+\[Lambda][4] . \[Lambda][1]//.RR//Simplify
A4 =(-a[1]-a[2] a[3]) \[Lambda][1] . \[Lambda][2]-a[3] \[Lambda][2] . \[Lambda][2]+\[Lambda][4] . \[Lambda][2]//.RR//Simplify
Sol = Solve[{A1==0,A2==0,A3==0,A4==0},{a[1],a[2],a[3],a[5]}]//.schoutenA//Simplify


EE[1] = -a[2] a[3] a[5] \[Lambda][1] . \[Lambda][1]+(-a[4]-a[3] a[5]) \[Lambda][2] . \[Lambda][1]+\[Lambda][3] . \[Lambda][1]//.RR//Simplify
EE[2] = -a[2] a[3] a[5] \[Lambda][1] . \[Lambda][2]+(-a[4]-a[3] a[5]) \[Lambda][2] . \[Lambda][2]+\[Lambda][3] . \[Lambda][2]//.RR//Simplify
EE[3] =(-a[1]-a[2] a[3]) \[Lambda][1] . \[Lambda][1]-a[3] \[Lambda][2] . \[Lambda][1]+\[Lambda][4] . \[Lambda][1]//.RR//Simplify
EE[4] =(-a[1]-a[2] a[3]) \[Lambda][1] . \[Lambda][2]-a[3] \[Lambda][2] . \[Lambda][2]+\[Lambda][4] . \[Lambda][2]//.RR//Simplify


F[i_,j_]:=D[EE[i],a[j]]
Mat = Table[F[i,j],{i,1,4},{j,{1,2,3,4,5}}]//MatrixForm
Mat2 =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"0", "0", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"Spaa", "[", 
RowBox[{"1", ",", "2"}], "]"}]}], 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"Spaa", "[", 
RowBox[{"1", ",", "2"}], "]"}]}]},
{"0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"Spaa", "[", 
RowBox[{"1", ",", "2"}], "]"}]}], 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"Spaa", "[", 
RowBox[{"1", ",", "2"}], "]"}]}], 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"Spaa", "[", 
RowBox[{"1", ",", "2"}], "]"}]}]},
{"0", "0", 
RowBox[{"Spaa", "[", 
RowBox[{"1", ",", "2"}], "]"}], "0"},
{
RowBox[{"-", 
RowBox[{"Spaa", "[", 
RowBox[{"1", ",", "2"}], "]"}]}], 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], " ", 
RowBox[{"Spaa", "[", 
RowBox[{"1", ",", "2"}], "]"}]}], 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], " ", 
RowBox[{"Spaa", "[", 
RowBox[{"1", ",", "2"}], "]"}]}], "0"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\)


J=-(Spaa[1,2]^2/((-a[4] Spaa[1,2]+Spaa[1,3]) Spaa[1,4]))


Product[1/(a[i]),{i,1,5}]*J//.Sol//FullSimplify
Spaa[1,2]^5/Simplify[a[4]^2 Spaa[1,2] Spaa[1,4] Spaa[2,3] Spaa[2,4]-a[4] Spaa[1,2] Spaa[1,4] Spaa[2,3] Spaa[3,4]]


a2 = -((a1 Spaa[1,2]+Spaa[2,4])/Spaa[1,4]);
a3 = Spaa[1,4]/Spaa[1,2];
a4 = (a1 Spaa[1,3]+Spaa[3,4])/(a1 Spaa[1,2]+Spaa[2,4]);
a5 = Spaa[2,3]/(a1 Spaa[1,2]+Spaa[2,4]);


J=1/Spaa[1,2]^4*1/(a3^2 a2)


Simplify[a1 a2 a3 a4 a5*1/J]^(-1)//.Sol


(a4 Spaa[1,2]-Spaa[1,3])^3/(a4 Spaa[1,2] (-a4 Spaa[1,2]+Spaa[1,3]) Spaa[1,4]^2 Spaa[2,3]^2 (-a4 Spaa[2,4]+Spaa[3,4]))//FullSimplify


(* ::Subsection::Closed:: *)
(*5 pt three-loop *)


(*Define C-matrices and lambda*)
CC={{1,a1+a6 a2,a1 a7+a6+a6 a2 a7,a6 a3,0},{0, a5 a6 a2,a5 a6+a5 a6 a2 a7, a4+ a5 a6 a3,1}};
Cperp ={{-a1-a6 a2,1,0,0,-a5 a6 a2},{-a1 a7-a6-a6 a2 a7,0,1,0,-a5 a6-a5 a6 a2 a7},{-a6 a3,0,0,1,-a4- a5 a6 a3}};
lambda={{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]}};
tlambda={{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5]}};
CC . Transpose[Cperp];
Cperp . Transpose[lambda];
CC . Transpose[tlambda];
eta={{\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5]},{\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5]},{\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5]}};
CC . Transpose[eta];


A1 = (-a1-a2 a6) \[Lambda][1] . \[Lambda][1]+\[Lambda][2] . \[Lambda][1]-a2 a5 a6 \[Lambda][5] . \[Lambda][1]//.RR//FullSimplify
A2 = (-a1-a2 a6) \[Lambda][1] . \[Lambda][5]+\[Lambda][2] . \[Lambda][5]-a2 a5 a6 \[Lambda][5] . \[Lambda][5]//.RR//.RR//FullSimplify
A3 = (-a6-a1 a7-a2 a6 a7) \[Lambda][1] . \[Lambda][1]+\[Lambda][3] . \[Lambda][1]+(-a5 a6-a2 a5 a6 a7) \[Lambda][5] . \[Lambda][1]//.RR//FullSimplify
A4 = (-a6-a1 a7-a2 a6 a7) \[Lambda][1] . \[Lambda][5]+\[Lambda][3] . \[Lambda][5]+(-a5 a6-a2 a5 a6 a7) \[Lambda][5] . \[Lambda][5]//.RR//FullSimplify
A5 = -a3 a6 \[Lambda][1] . \[Lambda][1]+\[Lambda][4] . \[Lambda][1]+(-a4-a3 a5 a6) \[Lambda][5] . \[Lambda][1]//.RR//FullSimplify
A6 = -a3 a6 \[Lambda][1] . \[Lambda][5]+\[Lambda][4] . \[Lambda][5]+(-a4-a3 a5 a6) \[Lambda][5] . \[Lambda][5]//.RR//FullSimplify
(*Solve[{A1==0,A2==0,A3==0,A4\[Equal]0,A5==0,A6==0},{a1,a2,a3,a5,a4,a6}]*)
DefNumSH[5];
A1//.NSpinHel//Simplify;


Simplify[A1/(a5 a6 Spaa[1,5])]
Simplify[A2/(Spaa[1,5])]
Simplify[A3/(Spaa[1,5]a6(1+a2 a7) )]//Simplify
Simplify[A4/(Spaa[1,5](1+a2 a7))]
Simplify[A5/(Spaa[1,5])]//FullSimplify
Simplify[A6/(Spaa[1,5] a6)]//FullSimplify


a1 = -(Spaa[2,3]/(a7 Spaa[1,2]-Spaa[1,3]))//FullSimplify;
a2 = -(Spaa[1,2]/(a7 Spaa[1,2]-Spaa[1,3]))//FullSimplify;
a3 = -(Spaa[4,5]/(a7 Spaa[2,5]-Spaa[3,5]))//FullSimplify;
a5 = (a7 Spaa[1,2]-Spaa[1,3])/(a7 Spaa[2,5]-Spaa[3,5])//FullSimplify;
a4 = (-a7 Spaa[2,4]+Spaa[3,4])/(-a7 Spaa[2,5]+Spaa[3,5])//FullSimplify;
a6 = (-a7 Spaa[2,5]+Spaa[3,5])/Spaa[1,5];
Sol = {a[1]-> -(Spaa[2,3]/(a7 Spaa[1,2]-Spaa[1,3])),a[2]->-(Spaa[1,2]/(a7 Spaa[1,2]-Spaa[1,3])),a[3]-> -(Spaa[4,5]/(a7 Spaa[2,5]-Spaa[3,5])),a[5]-> (a7 Spaa[1,2]-Spaa[1,3])/(a7 Spaa[2,5]-Spaa[3,5]),a[4]-> (-a7 Spaa[2,4]+Spaa[3,4])/(-a7 Spaa[2,5]+Spaa[3,5]),a[6]-> (-a7 Spaa[2,5]+Spaa[3,5])/Spaa[1,5]};


DefNumSH[5];
A1//.NSpinHel//Simplify
A2//.NSpinHel//Simplify
A3//.NSpinHel//Simplify
A4//.NSpinHel//Simplify
A5//.NSpinHel//Simplify
A6//.NSpinHel//Simplify


(*Finding tilde-\[Lambda] delfatunctions*)
FullSimplify[t\[Lambda][1]+(a1+a2 a6) t\[Lambda][2]+(a6+a1 a7+a2 a6 a7) t\[Lambda][3]+a3 a6 t\[Lambda][4]]//.schoutenA//FullSimplify
FullSimplify[a2 a5 a6 t\[Lambda][2]+(a5 a6+a2 a5 a6 a7) t\[Lambda][3]+(a4+a3 a5 a6) t\[Lambda][4]+t\[Lambda][5]]//.schoutenA;
(Spaa[1,2] t\[Lambda][2])/Spaa[1,5]+(Spaa[1,3] t\[Lambda][3])/Spaa[1,5]+(Spaa[1,4] t\[Lambda][4])/Spaa[1,5]+t\[Lambda][5]


(*Finding eta delfatunctions*)
Simplify[Collect[Collect[(FullSimplify[\[Eta][1]+(a1+a2 a6) \[Eta][2]+(a6+a1 a7+a2 a6 a7) \[Eta][3]+a3 a6 \[Eta][4]]//.schoutenA//.schoutenB),\[Eta][2]],\[Eta][3]]]

a2 a5 a6 \[Eta][2]+(a5 a6+a2 a5 a6 a7) \[Eta][3]+(a4+a3 a5 a6) \[Eta][4]+\[Eta][5]//FullSimplify; 
(*After schouten this turns into*)
(Spaa[1,2] \[Eta][2])/Spaa[1,5]+(Spaa[1,3] \[Eta][3])/Spaa[1,5]+(Spaa[1,4] \[Eta][4])/Spaa[1,5]+\[Eta][5]



A[1] = (-a[1]-a[2] a[6]) \[Lambda][1] . \[Lambda][1]+\[Lambda][2] . \[Lambda][1]-a[2] a[5] a[6] \[Lambda][5] . \[Lambda][1]//.RR//FullSimplify
A[2] = (-a[1]-a[2] a[6]) \[Lambda][1] . \[Lambda][5]+\[Lambda][2] . \[Lambda][5]-a[2] a[5] a[6] \[Lambda][5] . \[Lambda][5]//.RR//.RR//FullSimplify
A[3] = (-a[6]-a[1] a[7]-a[2] a[6] a[7]) \[Lambda][1] . \[Lambda][1]+\[Lambda][3] . \[Lambda][1]+(-a[5] a[6]-a[2] a[5] a[6] a[7]) \[Lambda][5] . \[Lambda][1]//.RR//FullSimplify
A[4] = (-a[6]-a[1] a[7]-a[2] a[6] a[7]) \[Lambda][1] . \[Lambda][5]+\[Lambda][3] . \[Lambda][5]+(-a[5] a[6]-a[2] a[5] a[6] a[7]) \[Lambda][5] . \[Lambda][5]//.RR//FullSimplify
A[5] = -a[3] a[6] \[Lambda][1] . \[Lambda][1]+\[Lambda][4] . \[Lambda][1]+(-a[4]-a[3] a[5] a[6]) \[Lambda][5] . \[Lambda][1]//.RR//FullSimplify
A[6] = -a[3] a[6] \[Lambda][1] . \[Lambda][5]+\[Lambda][4] . \[Lambda][5]+(-a[4]-a[3] a[5] a[6]) \[Lambda][5] . \[Lambda][5]//.RR//FullSimplify


F[i_,j_]:=D[A[i],a[j]]
Mat = Table[F[i,j],{i,1,6},{j,1,6}]


Simplify[1/(Det[Mat])]Spaa[1,5]^6//.Sol//Simplify
1/(a5 a6^3)//FullSimplify


(* ::InheritFromParent:: *)
(**)


1/(a5 a6^3(1+a2 a7))//FullSimplify


Limit[1/(a5 a6^3(1+a2 a7)^2)1/(Spaa[1,5]^1),a7->0]


d\[CapitalOmega] = 1/(a1 a2 a3 a4 a5 a6 a7)//FullSimplify
d\[CapitalOmega]2 = d\[CapitalOmega] *Spaa[1,5]^3/((a7 Spaa[1,2]-Spaa[1,3]) (-a7 Spaa[2,5]+Spaa[3,5])^2)//Simplify
Residue[d\[CapitalOmega]2,{a7,0}]


(* ::InheritFromParent:: *)
(*Spaa[1,5]^4/Simplify[Collect[a7^2 Spaa[1,2] Spaa[2,3] Spaa[2,4] Spaa[4,5]-a7 Spaa[1,2] Spaa[2,3] Spaa[3,4] Spaa[4,5],a7]]*)


(* ::InheritFromParent:: *)
(**)


a7 Spaa[1,2] Spaa[2,3] (-a7 Spaa[2,4]+Spaa[3,4])^2 Spaa[4,5]//Expand//FullSimplify


(* ::Subsection::Closed:: *)
(*5 pt three-loop with internal loop*)


(*Define C-matrices and lambda*)
\[Delta]1 = 1/(1-a1 a2 a6);
Ca = {{a1 \[Delta]1,1,a7+a1 a6 \[Delta]1, a3 a1 a6 \[Delta]1,0},{a5 a6 a2 a1 \[Delta]1, 0, a5 a6 \[Delta]1, a4+a5 a3 a6 \[Delta]1, 1}};
CaP = {{1, -a1 \[Delta]1,0,0,-a5 a6 a2 a1 \[Delta]1},{0,-a7-a1 a6 \[Delta]1,1,0,-a5 a6 \[Delta]1},{0,-a3 a1 a6 \[Delta]1,0,1,-a4-a5 a3 a6 \[Delta]1}};
lambda = {{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]}};
tlambda={{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5]}};
Ca . Transpose[CaP];
(*Solve for \[Alpha]'s by solving one delta function constraint. Here we get the equations from the eq below*)
CaP . Transpose[lambda];
Ca . Transpose[tlambda];

A1 = \[Lambda][1] . \[Lambda][2]-a1 \[Delta]1 \[Lambda][2] . \[Lambda][2]-a1 a2 a5 a6 \[Delta]1 \[Lambda][5] . \[Lambda][2]//.RR
A2 = \[Lambda][1] . \[Lambda][5]-a1  \[Delta]1 \[Lambda][2] . \[Lambda][5]-a1 a2 a5 a6  \[Delta]1 \[Lambda][5] . \[Lambda][5]//.RR
A3 = (-a7-a1 a6 \[Delta]1) \[Lambda][2] . \[Lambda][2]+\[Lambda][3] . \[Lambda][2]-a5 a6 \[Delta]1 \[Lambda][5] . \[Lambda][2]//.RR
A4 = (-a7-a1 a6 \[Delta]1) \[Lambda][2] . \[Lambda][5]+\[Lambda][3] . \[Lambda][5]-a5 a6 \[Delta]1 \[Lambda][5] . \[Lambda][5]//.RR
A5 = -a1 a6 a3 \[Delta]1 \[Lambda][2] . \[Lambda][2]+\[Lambda][4] . \[Lambda][2]+(-a4-a3 a5 a6 \[Delta]1 ) \[Lambda][5] . \[Lambda][2]//.RR
A6 = -a1 a6 a3 \[Delta]1 \[Lambda][2] . \[Lambda][5]+\[Lambda][4] . \[Lambda][5]+(-a4- a3 a5 a6 \[Delta]1 ) \[Lambda][5] . \[Lambda][5]//.RR
Sola = Solve[{A1==0,A2==0,A3==0,A4==0,A5==0,A6==0},{a1,a2,a3,a4,a5,a6}]//Simplify;
Sola//.schoutenA//FullSimplify


a1 = (-a7 Spaa[1,2]+Spaa[1,3])/Spaa[2,3];
a2 = Spaa[1,2]/(a7 Spaa[1,2]-Spaa[1,3]);
a3 = -(Spaa[4,5]/(a7 Spaa[2,5]-Spaa[3,5]));
a4 = (-a7 Spaa[2,4]+Spaa[3,4])/(-a7 Spaa[2,5]+Spaa[3,5]);
a5 = (-a7 Spaa[1,2]+Spaa[1,3])/(-a7 Spaa[2,5]+Spaa[3,5]);
a6 = (-a7 Spaa[2,5]+Spaa[3,5])/Spaa[1,5];
\[Delta]1 =(Spaa[1,5] Spaa[2,3])/((-a7 Spaa[1,2]+Spaa[1,3]) Spaa[2,5]);


j1 = -1/(\[Delta]1 Spaa[2,5]*a1*a5*a6)//FullSimplify; (*a2*)
j2 = 1/(\[Delta]1 Spaa[2,5])//FullSimplify; (*a1*)
j3 = 1/(\[Delta]1 Spaa[2,5]*a6)//FullSimplify; (*a5*)
j4 = 1/(\[Delta]1 Spaa[2,5]*a1)//FullSimplify; (*a6*)
j5 = 1/(Spaa[2,5])//FullSimplify; (*a4*)
j6 = 1/(\[Delta]1 Spaa[2,5]*a1 a6)//FullSimplify; (*a3*)
J = Spaa[2,5]^5 j1 j2 j3 j4 j5 j6//FullSimplify
J//.a7->0
-((Spaa[1,3] Spaa[2,5]^4)/(Spaa[1,5]^2 Spaa[2,3]^2 Spaa[3,5]^2));


Jac = \[Delta]1^(-1);
d\[CapitalOmega] = 1/(a1 a2 a3 a4 a5 a6 a7)//FullSimplify;
J*d\[CapitalOmega]
J*d\[CapitalOmega]*Jac//Simplify
Residue[J*d\[CapitalOmega],{a7,0}]
Limit[J*d\[CapitalOmega],a7->\[Infinity]]


(-a7 Spaa[2,5]Spaa[1,2]+Spaa[3,5]Spaa[1,2]+Spaa[1,5] Spaa[2,3])/(Spaa[1,5] Spaa[2,3])//.schoutenA//FullSimplify


Jac
(a7 Spaa[1,2] Spaa[2,5]-Spaa[1,3] Spaa[2,5])/(Spaa[1,2] (-a7 Spaa[2,5]+Spaa[3,5]))//Simplify


(* ::InheritFromParent:: *)
(*(-a7 Spaa[1,2] Spaa[2,5]+Spaa[1,3] Spaa[2,5]-Spaa[1,5] Spaa[2,3])/(Spaa[1,5] Spaa[2,3])*)


(*Porting to LaTeX*)
StringReplace[StringReplace[StringReplace[ToString[A1],latexto2],latexto3],latexto4]
"\\\\"
StringReplace[StringReplace[StringReplace[ToString[A2],latexto2],latexto3],latexto4]
"\\\\"
StringReplace[StringReplace[StringReplace[ToString[A3],latexto2],latexto3],latexto4]
"\\\\"
StringReplace[StringReplace[StringReplace[ToString[A4],latexto2],latexto3],latexto4]
"\\\\"
StringReplace[StringReplace[StringReplace[ToString[A5],latexto2],latexto3],latexto4]
"\\\\"
StringReplace[StringReplace[StringReplace[ToString[A6],latexto2],latexto3],latexto4]


(* ::Subsection::Closed:: *)
(*5 pt three-loop reverse cycle*)


Ca = {{a2 a6 \[Delta],1,a7 + a2 \[Delta], a2 a3 \[Delta],0},{a5 \[Delta],0,a1 a2 a5 \[Delta],a4+ a1 a2 a3 a5 \[Delta],1}};
CaP = {{1,-a2 a6 \[Delta],0,0,-a5 \[Delta]},{0, -a7-a2 \[Delta],1,0,-a1 a2 a5 \[Delta]},{0,-a2 a3 \[Delta],0,1,-a4- a3 a5 a2 a1 \[Delta]}};
lambda = {{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]}};
tlambda={{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5]}};
Ca . Transpose[CaP];
(*Solve for \[Alpha]'s by solving one delta function constraint. Here we get the equations from the eq below*)
CaP . Transpose[lambda]
Ca . Transpose[tlambda];


\[Delta] = 1/(1-a1 a2 a6);
A1 = \[Lambda][1] . \[Lambda][2]-a2 a6 \[Delta] \[Lambda][2] . \[Lambda][2]-a5 \[Delta] \[Lambda][5] . \[Lambda][2]//.RR
A2 = \[Lambda][1] . \[Lambda][5]-a2 a6 \[Delta] \[Lambda][2] . \[Lambda][5]-a5 \[Delta] \[Lambda][5] . \[Lambda][5]//.RR
A3 = (-a7-a2 \[Delta]) \[Lambda][2] . \[Lambda][2]+\[Lambda][3] . \[Lambda][2]-a1 a2 a5 \[Delta] \[Lambda][5] . \[Lambda][2]//.RR
A4 = (-a7-a2 \[Delta]) \[Lambda][2] . \[Lambda][5]+\[Lambda][3] . \[Lambda][5]-a1 a2 a5 \[Delta] \[Lambda][5] . \[Lambda][5]//.RR
A5 = -a2 a3 \[Delta] \[Lambda][2] . \[Lambda][2]+\[Lambda][4] . \[Lambda][2]+(-a4-a1 a2 a3 a5 \[Delta]) \[Lambda][5] . \[Lambda][2]//.RR
A6 = -a2 a3 \[Delta] \[Lambda][2] . \[Lambda][5]+\[Lambda][4] . \[Lambda][5]+(-a4-a1 a2 a3 a5 \[Delta]) \[Lambda][5] . \[Lambda][5]//.RR


Sol = Solve[{A1==0,A2==0,A3==0,A4==0,A5==0,A6==0},{a1,a2,a3,a4,a5,a6}]//FullSimplify


a1 = -(Spaa[2,3]/(-a7 Spaa[1,2]+Spaa[1,3]));
a2 = (Spaa[1,3]-Spaa[1,2]a7)/Spaa[1,2];
a3 = -(Spaa[4,5]/(a7 Spaa[2,5]-Spaa[3,5]));
a4 = (Spaa[2,4]+(Spaa[2,3] Spaa[4,5])/(a7 Spaa[2,5]-Spaa[3,5]))/Spaa[2,5];
a5 = (-Spaa[1,2]+(Spaa[1,5] Spaa[2,3])/(a7 Spaa[2,5]-Spaa[3,5]))/Spaa[2,5];
a6 = -(Spaa[1,5]/(a7 Spaa[2,5]-Spaa[3,5]));


(* ::Section::Closed:: *)
(*N=0 Calculations*)


(* ::Subsection::Closed:: *)
(*4 pt*)


(*N=0 4 pt calculation*)
(*Define C-matrices and lambda*)
\[Delta]a = 1/(1-a1 a2 a3 a4);
GrassA = {{a2 a3 a4 \[Delta]a,1,a2 \[Delta]a,0},{a4 \[Delta]a,0,a4 a1 a2 \[Delta]a, 1}};
CperpA = {{1,-a2 a3 a4 \[Delta]a,0,-a4 \[Delta]a},{0,-a2 \[Delta]a,1,-a4 a1 a2 \[Delta]a}};
lambda = {{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4]}};
tlambda={{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4]}};

CperpA . Transpose[lambda];

A1 = \[Lambda][1] . \[Lambda][2]-a2 a3 a4 \[Lambda][2] . \[Lambda][2]\[Delta]a-a4 \[Lambda][4] . \[Lambda][2]\[Delta]a//.RR;
A2 = \[Lambda][1] . \[Lambda][4]-a2 a3 a4 \[Lambda][2] . \[Lambda][4]\[Delta]a-a4 \[Lambda][4] . \[Lambda][4]\[Delta]a//.RR;
A3 = -a2 \[Lambda][2] . \[Lambda][2]\[Delta]a+\[Lambda][3] . \[Lambda][2]-a1 a2 a4 \[Lambda][4] . \[Lambda][2]\[Delta]a//.RR;
A4 = -a2 \[Lambda][2] . \[Lambda][4]\[Delta]a+\[Lambda][3] . \[Lambda][4]-a1 a2 a4 \[Lambda][4] . \[Lambda][4]\[Delta]a//.RR;

Sol = Solve[{A1==0,A2==0,A3==0,A4==0},{a1,a2,a3,a4}]//Simplify;
Sol//.schoutenA


a1=-(Spaa[2,3]/Spaa[1,3]);
a2=Spaa[1,3]/Spaa[1,2];
a3=-(Spaa[1,4]/Spaa[1,3]);
a4=-(Spaa[1,3]/Spaa[3,4]);
GrassA . Transpose[tlambda]//Simplify;
B1 = t\[Lambda][2] . t\[Lambda][1]+(Spaa[1,3] (Spaa[1,4] t\[Lambda][1] . t\[Lambda][1]+Spaa[3,4] t\[Lambda][3] . t\[Lambda][1]))/(Spaa[1,4] Spaa[2,3]+Spaa[1,2] Spaa[3,4])//.RR;
B1//.schoutenA//FullSimplify;

\[Beta]1=Spaa[1,3]/Spaa[2,3];
\[Beta]2=Spaa[2,1]/Spaa[1,3];
\[Beta]3=Spaa[1,3]/Spaa[1,4];
\[Beta]4=Spaa[3,4]/Spaa[1,3];

\[Delta]a = (Spaa[1,2] Spaa[3,4])/(Spaa[1,3] Spaa[2,4]);
\[Delta]b = (Spaa[1,4] Spaa[2,3])/(Spaa[1,3] Spaa[2,4]);
Ja = 1/\[Delta]a;
Jb = 1/\[Delta]b;
Na = a1^2 a3^2*s[1,2]^2;
Nb = \[Beta]2^2 \[Beta]4^2*s[1,4]^2;
aa= Spaa[2,4]^4 /(Spaa[1,2]^2 Spaa[3,4]^2)*1/(a1 a2 a3 a4)*Ja^(-4)//Expand;
bb= Spaa[2,4]^4 /(Spaa[1,4]^2 Spaa[2,3]^2)*1/(\[Beta]1 \[Beta]2 \[Beta]3 \[Beta]4)*Jb^(-4)//Expand;


1/(a1 a2 a3 a4)*Spaa[2,4]^4 /(Spaa[1,2]^2 Spaa[3,4]^2)


(* ::Subsection::Closed:: *)
(*5 pt calculation, no internal loop*)


a1=Spaa[2,3]/Spaa[1,3]
a2=Spaa[1,2]/Spaa[1,3]
a3=Spaa[4,5]/Spaa[3,5]
a4=Spaa[3,4]/Spaa[3,5]
a5=Spaa[1,3]/Spaa[3,5]
a6=Spaa[3,5]/Spaa[1,5]
(a1 a2 a3 a4 a5 a6)
Spaa[1,5]^2/(Spaa[3,5]^2Spaa[1,3])


(* ::Subsection::Closed:: *)
(*5 pt N=0 with one internal loop*)


(*5 point YM MHV*)
(*Define C-matrices and lambda for first diagram*)
(*\[Delta]1 = (Spaa[1,5] Spaa[2,3])/(Spaa[1,3] Spaa[2,5]);*)
Ca = {{a1 \[Delta]1,1,a1 a6 \[Delta]1, a3 a1 a6 \[Delta]1,0},{a5 a6 a2 a1 \[Delta]1, 0, a5 a6 \[Delta]1, a4+a5 a3 a6 \[Delta]1, 1}};
CaP = {{1, -a1 \[Delta]1,0,0,-a5 a6 a2 a1 \[Delta]1},{0,-a1 a6 \[Delta]1,1,0,-a5 a6 \[Delta]1},{0,-a3 a1 a6 \[Delta]1,0,1,-a4-a5 a3 a6 \[Delta]1}};
lambda = {{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]}};
Ca . Transpose[CaP];
(*Solve for \[Alpha]'s by solving one delta function constraint. Here we get the equations from the eq below*)
CaP . Transpose[lambda];

(*Second diagram*)
(*\[Delta]2 = 1/(1-b1 b2 b6);*)
Cb = {{b2 b6 \[Delta]2,1,b2 \[Delta]2,b2 b3 \[Delta]2,0},{b5 \[Delta]2,0,b5 b1 b2 \[Delta]2,b4+b5 b1 b2 b3 \[Delta]2,1}};
CbP = {{1,-b2 b6 \[Delta]2,0,0,-b5 \[Delta]2},{0,-b2 \[Delta]2,1,0,-b5 b1 b2 \[Delta]2},{0,-b2 b3 \[Delta]2,0,1,-b4-b5 b1 b2 b3 \[Delta]2}}//.latexto5//MatrixForm
Cb . Transpose[CbP];
CbP . Transpose[lambda];


A1 = \[Lambda][1] . \[Lambda][2]-a1 \[Delta]1 \[Lambda][2] . \[Lambda][2]-a1 a2 a5 a6 \[Delta]1 \[Lambda][5] . \[Lambda][2]//.RR
A2 = \[Lambda][1] . \[Lambda][5]-a1  \[Delta]1 \[Lambda][2] . \[Lambda][5]-a1 a2 a5 a6  \[Delta]1 \[Lambda][5] . \[Lambda][5]//.RR
A3 = -a1 a6 \[Delta]1 \[Lambda][2] . \[Lambda][2]+\[Lambda][3] . \[Lambda][2]-a5 a6 \[Delta]1 \[Lambda][5] . \[Lambda][2]//.RR
A4 = -a1 a6 \[Delta]1 \[Lambda][2] . \[Lambda][5]+\[Lambda][3] . \[Lambda][5]-a5 a6 \[Delta]1 \[Lambda][5] . \[Lambda][5]//.RR
A5 = -a1 a6 a3 \[Delta]1 \[Lambda][2] . \[Lambda][2]+\[Lambda][4] . \[Lambda][2]+(-a4-a3 a5 a6 \[Delta]1 ) \[Lambda][5] . \[Lambda][2]//.RR
A6 = -a1 a6 a3 \[Delta]1 \[Lambda][2] . \[Lambda][5]+\[Lambda][4] . \[Lambda][5]+(-a4- a3 a5 a6 \[Delta]1 ) \[Lambda][5] . \[Lambda][5]//.RR
Sola = Solve[{A1==0,A2==0,A3==0,A4==0,A5==0,A6==0},{a1,a2,a3,a4,a5,a6}]//Simplify;
Sola//.schoutenA

B1 = \[Lambda][1] . \[Lambda][2]-b2 b6 \[Delta]b \[Lambda][2] . \[Lambda][2]-b5 \[Delta]b \[Lambda][5] . \[Lambda][2]//.RR;
B2 = \[Lambda][1] . \[Lambda][5]-b2 b6 \[Delta]b \[Lambda][2] . \[Lambda][5]-b5 \[Delta]b \[Lambda][5] . \[Lambda][5]//.RR;
B3 = -b2 \[Delta]b \[Lambda][2] . \[Lambda][2]+\[Lambda][3] . \[Lambda][2]-b1 b2 b5 \[Delta]b \[Lambda][5] . \[Lambda][2]//.RR;
B4 = -b2 \[Delta]b \[Lambda][2] . \[Lambda][5]+\[Lambda][3] . \[Lambda][5]-b1 b2 b5 \[Delta]b \[Lambda][5] . \[Lambda][5]//.RR;
B5 = -b2 b3 \[Delta]b \[Lambda][2] . \[Lambda][2]+\[Lambda][4] . \[Lambda][2]+(-b4-b1 b2 b3 b5 \[Delta]b) \[Lambda][5] . \[Lambda][2]//.RR;
B6 = -b2 b3 \[Delta]b \[Lambda][2] . \[Lambda][5]+\[Lambda][4] . \[Lambda][5]+(-b4-b1 b2 b3 b5 \[Delta]b ) \[Lambda][5] . \[Lambda][5]//.RR;
Solb = Solve[{B1==0,B2==0,B3==0,B4==0,B5==0,B6==0},{b1,b2,b3,b4,b5,b6}]//Simplify;
Solb//.schoutenA


\[Alpha]1 = Spaa[1,3]/Spaa[2,3];
\[Alpha]2 = -(Spaa[1,2]/Spaa[1,3]);
\[Alpha]3 = Spaa[4,5]/Spaa[3,5];
\[Alpha]4 = Spaa[3,4]/Spaa[3,5];
\[Alpha]5 = Spaa[1,3]/Spaa[3,5];
\[Alpha]6 = Spaa[3,5]/Spaa[1,5];
\[Beta]1 = -(Spaa[2,3]/Spaa[1,3]);
\[Beta]2 = Spaa[1,3]/Spaa[1,2];
\[Beta]3 = Spaa[4,5]/Spaa[3,5];
\[Beta]4 = Spaa[3,4]/Spaa[3,5];
\[Beta]5 = -(Spaa[1,3]/Spaa[3,5]);
\[Beta]6 = Spaa[1,5]/Spaa[3,5];
\[Delta]1 = (Spaa[1,5] Spaa[2,3])/(Spaa[1,3] Spaa[2,5]); (*Solved using a1 equation*)
\[Delta]b = (Spaa[1,2] Spaa[3,5])/(Spaa[1,3] Spaa[2,5]); (*Solved using b2 equation*)
Ja = \[Delta]1^(-1);
Jb = \[Delta]b^(-1);
(*Getting Jacobian from delta function change*)
AA1 = Spaa[1,2]+(\[Alpha]1 a2 \[Alpha]5 \[Alpha]6 Spaa[1,5] Spaa[2,3])/Spaa[1,3];
AA2 = Spaa[1,5]-(a1 Spaa[1,5] Spaa[2,3])/Spaa[1,3];
AA3 = -Spaa[2,3]+(a5 \[Alpha]6 Spaa[1,5] Spaa[2,3])/Spaa[1,3];
AA4 = -((\[Alpha]1 a6 Spaa[1,5] Spaa[2,3])/Spaa[1,3])+Spaa[3,5];
AA5 = -Spaa[2,4]-(-a4-(\[Alpha]3 \[Alpha]5 \[Alpha]6 Spaa[1,5] Spaa[2,3])/(Spaa[1,3] Spaa[2,5])) Spaa[2,5]//Simplify;
(*AA5 After using schouten*)
AA5 = a4 Spaa[2,5]-(Spaa[2,5] Spaa[3,4])/Spaa[3,5];
AA6 = -((\[Alpha]1 a3 \[Alpha]6 Spaa[1,5] Spaa[2,3])/Spaa[1,3])+Spaa[4,5];
(*This is the Jacobian from this delta function*)
J1 = (CoefficientList[AA1,a2][[2]])^(-1)*(CoefficientList[AA2,a1][[2]])^(-1)*(CoefficientList[AA3,a5][[2]])^(-1)*(CoefficientList[AA5,a4][[2]])^(-1)*(CoefficientList[AA6,a3][[2]])^(-1)


(*Getting momentum conservation delta function from other delta functions*)
tlambda = {{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5]}};
Ca . Transpose[tlambda]//.{a1->\[Alpha]1,a2->\[Alpha]2,a3->\[Alpha]3,a4->\[Alpha]4,a5->\[Alpha]5,a6->\[Alpha]6};
A11 = Spaa[1,5] /Spaa[2,5] t\[Lambda][1] . t\[Lambda][1]+t\[Lambda][2] . t\[Lambda][1]+Spaa[3,5] /Spaa[2,5] t\[Lambda][3] . t\[Lambda][1]+Spaa[4,5] /Spaa[2,5] t\[Lambda][4] . t\[Lambda][1]//.RR;
A12 = Spaa[1,5] /Spaa[2,5] t\[Lambda][1] . t\[Lambda][3]+t\[Lambda][2] . t\[Lambda][3]+Spaa[3,5] /Spaa[2,5] t\[Lambda][3] . t\[Lambda][3]+Spaa[4,5] /Spaa[2,5] t\[Lambda][4] . t\[Lambda][3]//.RR;
A13 = Spaa[1,5] /Spaa[2,5] t\[Lambda][1] . t\[Lambda][4]+t\[Lambda][2] . t\[Lambda][4]+Spaa[3,5] /Spaa[2,5] t\[Lambda][3] . t\[Lambda][4]+Spaa[4,5] /Spaa[2,5] t\[Lambda][4] . t\[Lambda][4]//.RR;
(*The Spaa[2,4]/Spaa[2,5] factor comes after using schouten*)
A14 = -(Spaa[1,2] /Spaa[2,5])t\[Lambda][1] . t\[Lambda][1]+Spaa[2,3] /Spaa[2,5] t\[Lambda][3] . t\[Lambda][1]+(Spaa[2,4]/Spaa[2,5]) t\[Lambda][4] . t\[Lambda][1]+t\[Lambda][5] . t\[Lambda][1]//.RR//Expand;
A15 = -(Spaa[1,2] /Spaa[2,5])t\[Lambda][1] . t\[Lambda][3]+Spaa[2,3] /Spaa[2,5] t\[Lambda][3] . t\[Lambda][3]+(Spaa[2,4]/Spaa[2,5]) t\[Lambda][4] . t\[Lambda][3]+t\[Lambda][5] . t\[Lambda][3]//.RR//Expand;
A16 = -(Spaa[1,2] /Spaa[2,5])t\[Lambda][1] . t\[Lambda][4]+Spaa[2,3] /Spaa[2,5] t\[Lambda][3] . t\[Lambda][4]+(Spaa[2,4]/Spaa[2,5]) t\[Lambda][4] . t\[Lambda][4]+t\[Lambda][5] . t\[Lambda][4]//.RR//Expand;
(*These give a Jacobian of Spaa[2,5]^6, further we have a Jacobian of
(Spbb[1,3]Spbb[1,4]Spbb[3,4])*)
A11 = A11*Spaa[2,5]//Simplify;
A11//.asBracket;
A12 = A12*Spaa[2,5]//Simplify;
A12//.asBracket;
A13 = A13*Spaa[2,5]//Simplify;
A13//.asBracket;
A14 = A14*Spaa[2,5]//Simplify;
A14//.asBracket;
A15 = A15*Spaa[2,5]//Simplify;
A15//.asBracket;
A16 = A16*Spaa[2,5]//Simplify;
A16//.asBracket;
asBracket = {-Spaa[i_,j_] Spbb[k_,i_]-Spaa[l_,j_] Spbb[k_,l_]-Spaa[r_,j_] Spbb[k_,r_]->-Spab[j,P[i]+P[l]+P[r],k],Spaa[i_,j_] Spbb[i_,k_]+Spaa[l_,j_] Spbb[l_,k_]-Spaa[r_,j_] Spbb[k_,r_]->-Spab[j,P[i]+P[l]+P[r],k],Spaa[k_,i_] Spbb[k_,j_]+Spaa[l_,i_] Spbb[l_,j_]+Spaa[r_,i_] Spbb[r_,j_]->-Spab[i,P[k]+P[l]+P[r],j],-Spaa[i_,k_] Spbb[j_,k_]-Spaa[i_,l_] Spbb[j_,l_]-Spaa[i_,r_] Spbb[j_,r_]->Spab[i,P[k]+P[l]+P[r],j],-Spaa[k_,i_] Spbb[k_,j_]-Spaa[i_,l_] Spbb[j_,l_]-Spaa[i_,r_] Spbb[j_,r_]->Spab[i,P[k]+P[l]+P[r],j],-Spaa[k_,i_] Spbb[k_,j_]+Spaa[i_,l_] Spbb[l_,j_]-Spaa[i_,r_] Spbb[j_,r_]->Spab[i,P[k]+P[l]+P[r],j]};
(*From this we get Spaa[2,5]^(2)*Spaa[2,5]^(-3)*Spbb[1,3]^(-1)*Spbb[3,4]^(-1)*Spbb[1,4]^(-1), so combined jacobian is*)
J2 = Spaa[2,5]^(2)Spaa[2,5]^(-3)*Spbb[1,3]^(-1)*Spbb[3,4]^(-1)*Spbb[1,4]^(-1)*Spaa[2,5]^(6)*(Spbb[1,3]Spbb[1,4]Spbb[3,4]);
J = -J1*J2*Spaa[1,5]^(-1)

Ji = (Spaa[1,3] Spaa[2,5]^4)/(Spaa[1,2]^2 Spaa[3,5]^4)


Jb
Ja


1/(\[Alpha]1 \[Alpha]2 \[Alpha]3 \[Alpha]4 \[Alpha]5 \[Alpha]6)*J
fiveYM2 = 1/(\[Beta]1 \[Beta]2 \[Beta]3 \[Beta]4 \[Beta]5 \[Beta]6)*Ji


fiveYM1 = 1/(\[Alpha]1 \[Alpha]2 \[Alpha]3 \[Alpha]4 \[Alpha]5 \[Alpha]6)*Ja^(-4)*J
fiveYM2 = 1/(\[Beta]1 \[Beta]2 \[Beta]3 \[Beta]4 \[Beta]5 \[Beta]6)*Jb^(-4)*Ji
fiveYM1 + fiveYM2 //FullSimplify 


(* ::Subsection::Closed:: *)
(*5 pt N=0 with one internal loop, second config*)


(*5 point YM MHV*)
(*Define C-matrices and lambda for first diagram*)
(*\[Delta] = 1/(1-a[3]a[4]a[5]a[6]);*)
Ca = {{1,a[1]+a[2]a[6]\[Delta],a[6]\[Delta],0,a[3]a[4]a[6] \[Delta]},{0,a[2]a[4]a[5]a[6]\[Delta],a[4]a[5]a[6]\[Delta],1,a[4]\[Delta]}};
CaP = {{-a[1]-a[2]a[6]\[Delta],1,0,-a[2]a[4]a[5]a[6]\[Delta],0},{-a[6]\[Delta],0,1,-a[4]a[5]a[6]\[Delta],0},{-a[3]a[4]a[6]\[Delta],0,0,-a[4]\[Delta],1}}//.latexto6//MatrixForm
lambda = {{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]}};
Ca . Transpose[CaP];
(*Solve for \[Alpha]'s by solving one delta function constraint. Here we get the equations from the eq below*)
CaP . Transpose[lambda]


A1 = (-a[1]-\[Delta] a[2] a[6]) \[Lambda][1] . \[Lambda][1]+\[Lambda][2] . \[Lambda][1]-\[Delta] a[2] a[4] a[5] a[6] \[Lambda][4] . \[Lambda][1]//.RR;
A2 = (-a[1]-\[Delta] a[2] a[6]) \[Lambda][1] . \[Lambda][4]+\[Lambda][2] . \[Lambda][4]-\[Delta] a[2] a[4] a[5] a[6] \[Lambda][4] . \[Lambda][4]//.RR;
A3 = -\[Delta] a[6] \[Lambda][1] . \[Lambda][1]+\[Lambda][3] . \[Lambda][1]-\[Delta] a[4] a[5] a[6] \[Lambda][4] . \[Lambda][1]//.RR;
A4 = -\[Delta] a[6] \[Lambda][1] . \[Lambda][4]+\[Lambda][3] . \[Lambda][4]-\[Delta] a[4] a[5] a[6] \[Lambda][4] . \[Lambda][4]//.RR;
A5 = -\[Delta] a[3] a[4] a[6] \[Lambda][1] . \[Lambda][1]-\[Delta] a[4] \[Lambda][4] . \[Lambda][1]+\[Lambda][5] . \[Lambda][1]//.RR;
A6 = -\[Delta] a[3] a[4] a[6] \[Lambda][1] . \[Lambda][4]-\[Delta] a[4] \[Lambda][4] . \[Lambda][4]+\[Lambda][5] . \[Lambda][4]//.RR;
Sola = Solve[{A1==0,A2==0,A3==0,A4==0,A5==0,A6==0},{a[1],a[2],a[3],a[4],a[5],a[6]}]//Simplify;
Sola//.schoutenA


(* ::InheritFromParent:: *)
(*{{a[1]->Spaa[2,3]/Spaa[1,3],a[2]->Spaa[1,2]/Spaa[1,3],a[3]->-(Spaa[4,5]/Spaa[3,5]),a[4]->Spaa[3,5]/Spaa[3,4],a[5]->Spaa[1,3]/Spaa[3,5],a[6]->Spaa[3,5]/Spaa[1,5]}}//.latexto4*)


EE[1] = (-a[1]-\[Delta] a[2] a[6]) \[Lambda][1] . \[Lambda][1]+\[Lambda][2] . \[Lambda][1]-\[Delta] a[2] a[4] a[5] a[6] \[Lambda][4] . \[Lambda][1]//.RR;
EE[2] = (-a[1]-\[Delta] a[2] a[6]) \[Lambda][1] . \[Lambda][4]+\[Lambda][2] . \[Lambda][4]-\[Delta] a[2] a[4] a[5] a[6] \[Lambda][4] . \[Lambda][4]//.RR;
EE[3] = -\[Delta] a[6] \[Lambda][1] . \[Lambda][1]+\[Lambda][3] . \[Lambda][1]-\[Delta] a[4] a[5] a[6] \[Lambda][4] . \[Lambda][1]//.RR;
EE[4] = -\[Delta] a[6] \[Lambda][1] . \[Lambda][4]+\[Lambda][3] . \[Lambda][4]-\[Delta] a[4] a[5] a[6] \[Lambda][4] . \[Lambda][4]//.RR;
EE[5] = -\[Delta] a[3] a[4] a[6] \[Lambda][1] . \[Lambda][1]-\[Delta] a[4] \[Lambda][4] . \[Lambda][1]+\[Lambda][5] . \[Lambda][1]//.RR;
EE[6] = -\[Delta] a[3] a[4] a[6] \[Lambda][1] . \[Lambda][4]-\[Delta] a[4] \[Lambda][4] . \[Lambda][4]+\[Lambda][5] . \[Lambda][4]//.RR;


JacA=(Spaa[1,4] Spaa[3,5])/(Spaa[1,5] Spaa[3,4]);
JacB=(Spaa[1,4] Spaa[3,5])/(Spaa[1,3] Spaa[4,5]);


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,6},{j,1,6}];
Simplify[1/(Det[Mat])]//.Sola//FullSimplify


(* ::InheritFromParent:: *)
(*{-(1/(Spaa[1,3] Spaa[1,4] Spaa[1,5]^2 Spaa[3,4]^2))}*)


J = Spaa[1,4]^4 /(Spaa[1,3] Spaa[1,5]^2 Spaa[3,4]^2)
d\[CapitalOmega] = Product[1/(a[i]),{i,1,6}]*J//.Sola//.schoutenA;
d\[CapitalOmega][[1]]*(JacA^(-4)+JacB^(-4))


(* ::Subsection::Closed:: *)
(*6 pt 4+4 NMHV calculation,  no internal loop*)


(*4+4 N=0 6 pt*)
\[Alpha]1 = -(Spbb[6,5]/Spbb[1,5]);
\[Alpha]2 = Spbb[6,1]/Spbb[1,5];
\[Alpha]3 = (s[2,3,4])/(Spab[4,2,3,5]);
\[Alpha]4 = Spaa[2,3]/Spaa[2,4];
\[Alpha]5 = Spaa[3,4]/Spaa[2,4];
\[Alpha]6 = (Spab[4,2,3,5])/(Spaa[2,4] Spbb[1,5]);
\[Alpha]7 = -(Spab[4,2,3,1])/Spab[4,2,3,5];
\[Alpha]8 =- Spab[2,3,4,5]/Spab[4,2,3,5];
J=Spbb[1,5]Spaa[2,4]/(Spab[4,2,3,5]^2);
1/(\[Alpha]1 \[Alpha]2 \[Alpha]3 \[Alpha]4 \[Alpha]5 \[Alpha]6 \[Alpha]7 \[Alpha]8)*J


(* ::Subsection::Closed:: *)
(*6 pt 5+3 NMHV calculation,  one internal loop*)


(*5+3 N=0 6 pt*)
\[Delta]a = 1/(1-a3 a4);
CC={{a7, 1,a8(a1+a5 a2 (1+a3 a4 \[Delta]a)),0,a8 a5 a3 a4 \[Delta]a,0},{0,0,a2 a4 \[Delta]a,1,a4 \[Delta]a,0},{a6,0,a5 a2 \[Delta]a,0,a5 a3 a4 \[Delta]a,1}};
Cperp ={{1,-a7,0,0,0,-a6},{0,-(a8(a1+a5 a2 (1+a3 a4 \[Delta]a))),1,-a2 a4 \[Delta]a,0,-a5 a2 \[Delta]a},{0,-a8 a5 a3 a4 \[Delta]a,0,-a4 \[Delta]a,1,-a5 a3 a4 \[Delta]a}};
lambda={{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]}};
tlambda={{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]}};
CC . Transpose[Cperp];
Cperp . Transpose[lambda];
CC . Transpose[tlambda];
CC//MatrixForm;
Cperp//MatrixForm;


A1 = \[Lambda][1] . \[Lambda][2]-a7 \[Lambda][2] . \[Lambda][2]-a6 \[Lambda][6] . \[Lambda][2]//.RR;
A2 = \[Lambda][1] . \[Lambda][6]-a7 \[Lambda][2] . \[Lambda][6]-a6 \[Lambda][6] . \[Lambda][6]//.RR;
A3 = -a8 (a1+a2 a5 (1+a3 a4 \[Delta]a)) \[Lambda][2] . \[Lambda][2]+\[Lambda][3] . \[Lambda][2]-a2 a4 \[Delta]a \[Lambda][4] . \[Lambda][2]-a2 a5 \[Delta]a \[Lambda][6] . \[Lambda][2]//.RR;
A4 = -a8 (a1+a2 a5 (1+a3 a4 \[Delta]a)) \[Lambda][2] . \[Lambda][4]+\[Lambda][3] . \[Lambda][4]-a2 a4 \[Delta]a \[Lambda][4] . \[Lambda][4]-a2 a5 \[Delta]a \[Lambda][6] . \[Lambda][4]//.RR;
A5 = -a8 (a1+a2 a5 (1+a3 a4 \[Delta]a)) \[Lambda][2] . \[Lambda][6]+\[Lambda][3] . \[Lambda][6]-a2 a4 \[Delta]a \[Lambda][4] . \[Lambda][6]-a2 a5 \[Delta]a \[Lambda][6] . \[Lambda][6]//.RR;
A6 = -a3 a4 a5 a8 \[Delta]a \[Lambda][2] . \[Lambda][2]-a4 \[Delta]a \[Lambda][4] . \[Lambda][2]+\[Lambda][5] . \[Lambda][2]-a3 a4 a5 \[Delta]a \[Lambda][6] . \[Lambda][2]//.RR;
A7 = -a3 a4 a5 a8 \[Delta]a \[Lambda][2] . \[Lambda][4]-a4 \[Delta]a \[Lambda][4] . \[Lambda][4]+\[Lambda][5] . \[Lambda][4]-a3 a4 a5 \[Delta]a \[Lambda][6] . \[Lambda][4]//.RR;
A8 = -a3 a4 a5 a8 \[Delta]a \[Lambda][2] . \[Lambda][6]-a4 \[Delta]a \[Lambda][4] . \[Lambda][6]+\[Lambda][5] . \[Lambda][6]-a3 a4 a5 \[Delta]a \[Lambda][6] . \[Lambda][6]//.RR;
B1 = a7 t\[Lambda][1] . t\[Lambda][1]+t\[Lambda][2] . t\[Lambda][1]+a8 (a1+a2 a5 (1+a3 a4 \[Delta]a)) t\[Lambda][3] . t\[Lambda][1]+a3 a4 a5 a8 \[Delta]a t\[Lambda][5] . t\[Lambda][1]//.RR;
B2 = a7 t\[Lambda][1] . t\[Lambda][3]+t\[Lambda][2] . t\[Lambda][3]+a8 (a1+a2 a5 (1+a3 a4 \[Delta]a)) t\[Lambda][3] . t\[Lambda][3]+a3 a4 a5 a8 \[Delta]a t\[Lambda][5] . t\[Lambda][3]//.RR;
B3 = a7 t\[Lambda][1] . t\[Lambda][5]+t\[Lambda][2] . t\[Lambda][5]+a8 (a1+a2 a5 (1+a3 a4 \[Delta]a)) t\[Lambda][3] . t\[Lambda][5]+a3 a4 a5 a8 \[Delta]a t\[Lambda][5] . t\[Lambda][5]//.RR;
B4 = a2 a4 \[Delta]a t\[Lambda][3] . t\[Lambda][3]+t\[Lambda][4] . t\[Lambda][3]+a4 \[Delta]a t\[Lambda][5] . t\[Lambda][3]//.RR;
B5 = a2 a4 \[Delta]a t\[Lambda][3] . t\[Lambda][5]+t\[Lambda][4] . t\[Lambda][5]+a4 \[Delta]a t\[Lambda][5] . t\[Lambda][5]//.RR;
B6 = a6 t\[Lambda][1] . t\[Lambda][1]+a2 a5 \[Delta]a t\[Lambda][3] . t\[Lambda][1]+a5 a3 a4 \[Delta]a t\[Lambda][5] . t\[Lambda][1]+t\[Lambda][6] . t\[Lambda][1]//.RR;
B7 = a6 t\[Lambda][1] . t\[Lambda][3]+a2 a5 \[Delta]a t\[Lambda][3] . t\[Lambda][3]+a5 a3 a4 \[Delta]a t\[Lambda][5] . t\[Lambda][3]+t\[Lambda][6] . t\[Lambda][3]//.RR;
B8 = a6 t\[Lambda][1] . t\[Lambda][5]+a2 a5 \[Delta]a t\[Lambda][3] . t\[Lambda][5]+a5 a3 a4 \[Delta]a t\[Lambda][5] . t\[Lambda][5]+t\[Lambda][6] . t\[Lambda][5]//.RR;

A1//FullSimplify
A2//FullSimplify
A3//FullSimplify
A4//FullSimplify
A5//FullSimplify
A6//FullSimplify
A7//FullSimplify
A8//FullSimplify
B1//FullSimplify
B2//FullSimplify
B3//FullSimplify
B4//FullSimplify
B5//FullSimplify
B6//FullSimplify
B7//FullSimplify
B8//FullSimplify


(*Solve[{A1\[Equal]0,A2\[Equal]0,B4\[Equal]0,B5\[Equal]0,B8\[Equal]0,A8\[Equal]0,A6\[Equal]0},{a2,a3,a6,a7,a4,a5,a8}]//.schoutenA//.schoutenB*)
a1 = s[6,1,2]/Spab[6,P[1]+P[2]+P[6],3];
a2 =Spbb[4,5]/Spbb[3,4];
a4 =- (Spab[2,P[1]+P[2]+P[6],4]/Spab[2,P[1]+P[2]+P[6],5]);
a5 = -(Spab[2,P[1]+P[2]+P[6],4]/(Spaa[2,6] Spbb[4,5]));
a6 = -(Spaa[1,2]/Spaa[2,6]);
a7 = Spaa[1,6]/Spaa[2,6];
a8 =- (Spab[6,P[1]+P[2]+P[6],3]/Spab[2,P[1]+P[2]+P[6],3]);
a3 = Spbb[4,5]/Spbb[3,4] Spab[2,P[1]+P[2]+P[6],3]/Spab[2,P[1]+P[2]+P[6],4];


(*\[Delta]a = 1/(1-a[3] a[4]);*)
EE[1] = \[Lambda][1] . \[Lambda][2]-a[7] \[Lambda][2] . \[Lambda][2]-a[6] \[Lambda][6] . \[Lambda][2]//.RR;
EE[2] = \[Lambda][1] . \[Lambda][6]-a[7] \[Lambda][2] . \[Lambda][6]-a[6] \[Lambda][6] . \[Lambda][6]//.RR;
EE[3] = -a[3] a[4] a[5] a[8] \[Delta]a \[Lambda][2] . \[Lambda][2]-a[4] \[Delta]a \[Lambda][4] . \[Lambda][2]+\[Lambda][5] . \[Lambda][2]-a[3] a[4] a[5] \[Delta]a \[Lambda][6] . \[Lambda][2]//.RR;
EE[4] = -a[3] a[4] a[5] a[8] \[Delta]a \[Lambda][2] . \[Lambda][6]-a[4] \[Delta]a \[Lambda][4] . \[Lambda][6]+\[Lambda][5] . \[Lambda][6]-a[3] a[4] a[5] \[Delta]a \[Lambda][6] . \[Lambda][6]//.RR;
EE[5] = a[2] a[4] \[Delta]a t\[Lambda][3] . t\[Lambda][3]+t\[Lambda][4] . t\[Lambda][3]+a[4] \[Delta]a t\[Lambda][5] . t\[Lambda][3]//.RR;
EE[6] = a[2] a[4] \[Delta]a t\[Lambda][3] . t\[Lambda][5]+t\[Lambda][4] . t\[Lambda][5]+a[4] \[Delta]a t\[Lambda][5] . t\[Lambda][5]//.RR;
EE[7] = a[6] t\[Lambda][1] . t\[Lambda][5]+a[2] a[5] \[Delta]a t\[Lambda][3] . t\[Lambda][5]+a[5] a[3] a[4] \[Delta]a t\[Lambda][5] . t\[Lambda][5]+t\[Lambda][6] . t\[Lambda][5]//.RR;
EE[8] = -a[8](a[1]+a[2] a[5] (1+a[3] a[4] \[Delta]a)) \[Lambda][2] . \[Lambda][4]+\[Lambda][3] . \[Lambda][4]-a[2] a[4] \[Delta]a \[Lambda][4] . \[Lambda][4]-a[2] a[5] \[Delta]a \[Lambda][6] . \[Lambda][4]//.RR;


Sol = {a[1] -> s[6,1,2]/Spab[6,P[1]+P[2]+P[6],3],a[2] -> Spbb[4,5]/Spbb[3,4],a[4] -> - (Spab[2,P[1]+P[2]+P[6],4]/Spab[2,P[1]+P[2]+P[6],5]),a[5] -> -(Spab[2,P[1]+P[2]+P[6],4]/(Spaa[2,6] Spbb[4,5])), a[6] -> -(Spaa[1,2]/Spaa[2,6]), a[7] -> Spaa[1,6]/Spaa[2,6], a[8] ->- (Spab[6,P[1]+P[2]+P[6],3]/Spab[2,P[1]+P[2]+P[6],3]), a[3] -> Spbb[4,5]/Spbb[3,4] Spab[2,P[1]+P[2]+P[6],3]/Spab[2,P[1]+P[2]+P[6],4]};
F[i_,j_]:=D[EE[i],a[j]]
Mat = Table[F[i,j],{i,1,8},{j,1,8}]


Simplify[1/(Det[Mat])]//.Sol//FullSimplify


\[Delta]a=((Spab[2,P[1]+P[2]+P[6],4] Spbb[3,5])/(Spab[2,P[1]+P[2]+P[6],5] Spbb[3,4]))^(-1);


(Spab[2,P[1]+P[2]+P[6],4] Spbb[3,5])^5/(Spaa[2,4] Spaa[2,6]^2 Spab[2,P[1]+P[2]+P[6],4]^4 Spab[2,P[1]+P[2]+P[6],5]^2 Spab[6,P[1]+P[2]+P[6],3] Spbb[3,4]^3 Spbb[3,5]^3)
J1*Jac2*Jac3*Jac4*Jac5*Jac6*Jac7*(Spaa[2,4]/Spab[2,P[1]+P[2]+P[6],4])^(1)//FullSimplify


DefNumSH[6]
TA[1] = A1//.SHtest//.NSpinHel;
TA[2] = A2//.SHtest//.NSpinHel;
TA[3] = A3//.SHtest//.NSpinHel;
TA[4] = A4//.SHtest//.NSpinHel;
TA[5] = A5//.SHtest//.NSpinHel;
TA[6] = A6//.SHtest//.NSpinHel;
TA[7] = A7//.SHtest//.NSpinHel;
TA[8] = A8//.SHtest//.NSpinHel;

TB[1] = B1//.SHtest//.NSpinHel;
TB[2] = B2//.SHtest//.NSpinHel;
TB[3] = B3//.SHtest//.NSpinHel;
TB[4] = B4//.SHtest//.NSpinHel;
TB[5] = B5//.SHtest//.NSpinHel;
TB[6] = B6//.SHtest//.NSpinHel;
TB[7] = B7//.SHtest//.NSpinHel;
TB[8] = B8//.SHtest//.NSpinHel;
If[Sum[TA[i],{i,1,8}]==0,"Correct Solutions","One or more incorrect Solutions"]
If[Sum[TB[i],{i,1,8}]==0,"Correct Solutions","One or more incorrect Solutions"]


d\[CapitalOmega] = 1/(a1 a2 a3 a4 a5 a6 a7 a8)*(Spbb[3,5]^4 Spaa[2,6])/(Spab[2,P[1]+P[2]+P[6],5] Spab[6,P[1]+P[2]+P[6],3] (Spbb[3,4]^3) )//Simplify
J=(Spab[2,P[1]+P[2]+P[6],4] Spbb[3,5])/(Spab[2,P[1]+P[2]+P[6],5] Spbb[3,4]);
d\[CapitalOmega] * J^(-4)


Spaa[2,6]^3 Spaa[2,4] (Spab[2,P[1]+P[2]+P[6],4] Spbb[3,5]^4)/(Spaa[2,4] Spaa[2,6]^2 Spab[2,P[1]+P[2]+P[6],5]^2 Spab[6,P[1]+P[2]+P[6],3] Spbb[3,4]^3)*1/(a1 a2 a3 a4 a5 a6 a7 a8)//Simplify


d\[CapitalOmega]*J^(-4)


Spaa[2,6]^3 Spaa[2,4] (Spab[2,P[1]+P[2]+P[6],4] Spbb[3,5]^4)/(Spaa[2,4] Spaa[2,6]^2 Spab[2,P[1]+P[2]+P[6],5]^2 Spab[6,P[1]+P[2]+P[6],3] Spbb[3,4]^3)


Spaa[4,5]Spaa[2,3]-Spaa[2,4] Spaa[3,5]//.schoutenA


(* ::Subsection::Closed:: *)
(*6 pt 4+4 NMHV calculation,  one internal loop*)


(*4+4 N=0 6 pt*)
\[Delta]a =((Spab[4,P[4]+P[5]+P[6],3] Spab[6,P[4]+P[5]+P[6],1])/(Spab[4,P[4]+P[5]+P[6],1] Spab[6,P[4]+P[5]+P[6],3]))^(-1);
CC={{1,0,a[3]\[Delta]a,0,a[3]a[4]a[5]a[8] \[Delta]a,a[3] a[4] a[5] \[Delta]a},{0,1,a[2]+a[1]a[3] \[Delta]a,0,a[1]a[3]a[4]a[5]a[8] \[Delta]a,a[1]a[3]a[4]a[5] \[Delta]a},{0,0,a[3]a[5]a[6] \[Delta]a,1,a[7]+a[5]a[8] \[Delta]a,a[5] \[Delta]a}};
Cperp ={{-a[3] \[Delta]a,-a[2]-a[1]a[3] \[Delta]a,1,-a[3] a[5] a[6] \[Delta]a,0,0},{-a[3]a[4]a[5]a[8] \[Delta]a,-a[1]a[3]a[4]a[5]a[8] \[Delta]a,0,-a[7]-a[5]a[8] \[Delta]a,1,0},{-a[3] a[4] a[5] \[Delta]a,-a[1]a[3]a[4]a[5] \[Delta]a,0,-a[5] \[Delta]a,0,1}};
lambda={{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]}};
tlambda={{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]}};
CC . Transpose[Cperp];
Cperp . Transpose[lambda];
CC . Transpose[tlambda];
CC//MatrixForm;
Cperp//MatrixForm;


A1 = -\[Delta]a a[3] \[Lambda][1] . \[Lambda][1]+(-a[2]-\[Delta]a a[1] a[3]) \[Lambda][2] . \[Lambda][1]+\[Lambda][3] . \[Lambda][1]-\[Delta]a a[3] a[5] a[6] \[Lambda][4] . \[Lambda][1]//.RR//FullSimplify;
A2 = -\[Delta]a a[3] \[Lambda][1] . \[Lambda][2]+(-a[2]-\[Delta]a a[1] a[3]) \[Lambda][2] . \[Lambda][2]+\[Lambda][3] . \[Lambda][2]-\[Delta]a a[3] a[5] a[6] \[Lambda][4] . \[Lambda][2]//.RR//FullSimplify;
A3 = -\[Delta]a a[3] \[Lambda][1] . \[Lambda][4]+(-a[2]-\[Delta]a a[1] a[3]) \[Lambda][2] . \[Lambda][4]+\[Lambda][3] . \[Lambda][4]-\[Delta]a a[3] a[5] a[6] \[Lambda][4] . \[Lambda][4]//.RR//FullSimplify;
A4 = -\[Delta]a a[3] a[4] a[5] a[8] \[Lambda][1] . \[Lambda][1]-\[Delta]a a[1] a[3] a[4] a[5] a[8] \[Lambda][2] . \[Lambda][1]+(-a[7]-\[Delta]a a[5] a[8]) \[Lambda][4] . \[Lambda][1]+\[Lambda][5] . \[Lambda][1]//.RR//FullSimplify;
A5 = -\[Delta]a a[3] a[4] a[5] a[8] \[Lambda][1] . \[Lambda][2]-\[Delta]a a[1] a[3] a[4] a[5] a[8] \[Lambda][2] . \[Lambda][2]+(-a[7]-\[Delta]a a[5] a[8]) \[Lambda][4] . \[Lambda][2]+\[Lambda][5] . \[Lambda][2]//.RR//FullSimplify;
A6 = -\[Delta]a a[3] a[4] a[5] a[8] \[Lambda][1] . \[Lambda][4]-\[Delta]a a[1] a[3] a[4] a[5] a[8] \[Lambda][2] . \[Lambda][4]+(-a[7]-\[Delta]a a[5] a[8]) \[Lambda][4] . \[Lambda][4]+\[Lambda][5] . \[Lambda][4]//.RR//FullSimplify;
A7 = -\[Delta]a a[3] a[4] a[5] \[Lambda][1] . \[Lambda][1]-\[Delta]a a[1] a[3] a[4] a[5] \[Lambda][2] . \[Lambda][1]-\[Delta]a a[5] \[Lambda][4] . \[Lambda][1]+\[Lambda][6] . \[Lambda][1]//.RR//FullSimplify;
A8 = -\[Delta]a a[3] a[4] a[5] \[Lambda][1] . \[Lambda][2]-\[Delta]a a[1] a[3] a[4] a[5] \[Lambda][2] . \[Lambda][2]-\[Delta]a a[5] \[Lambda][4] . \[Lambda][2]+\[Lambda][6] . \[Lambda][2]//.RR//FullSimplify;
A9 = -\[Delta]a a[3] a[4] a[5] \[Lambda][1] . \[Lambda][4]-\[Delta]a a[1] a[3] a[4] a[5] \[Lambda][2] . \[Lambda][4]-\[Delta]a a[5] \[Lambda][4] . \[Lambda][4]+\[Lambda][6] . \[Lambda][4]//.RR//FullSimplify;

B1 = t\[Lambda][1] . t\[Lambda][3]+\[Delta]a a[3] t\[Lambda][3] . t\[Lambda][3]+\[Delta]a a[3] a[4] a[5] a[8] t\[Lambda][5] . t\[Lambda][3]+\[Delta]a a[3] a[4] a[5] t\[Lambda][6] . t\[Lambda][3]//.RR//FullSimplify;
B2 = t\[Lambda][1] . t\[Lambda][5]+\[Delta]a a[3] t\[Lambda][3] . t\[Lambda][5]+\[Delta]a a[3] a[4] a[5] a[8] t\[Lambda][5] . t\[Lambda][5]+\[Delta]a a[3] a[4] a[5] t\[Lambda][6] . t\[Lambda][5]//.RR//FullSimplify;
B3 = t\[Lambda][1] . t\[Lambda][6]+\[Delta]a a[3] t\[Lambda][3] . t\[Lambda][6]+\[Delta]a a[3] a[4] a[5] a[8] t\[Lambda][5] . t\[Lambda][6]+\[Delta]a a[3] a[4] a[5] t\[Lambda][6] . t\[Lambda][6]//.RR//FullSimplify;
B4 = t\[Lambda][2] . t\[Lambda][3]+(a[2]+\[Delta]a a[1] a[3]) t\[Lambda][3] . t\[Lambda][3]+\[Delta]a a[1] a[3] a[4] a[5] a[8] t\[Lambda][5] . t\[Lambda][3]+\[Delta]a a[1] a[3] a[4] a[5] t\[Lambda][6] . t\[Lambda][3]//.RR//FullSimplify;
B5 = t\[Lambda][2] . t\[Lambda][5]+(a[2]+\[Delta]a a[1] a[3]) t\[Lambda][3] . t\[Lambda][5]+\[Delta]a a[1] a[3] a[4] a[5] a[8] t\[Lambda][5] . t\[Lambda][5]+\[Delta]a a[1] a[3] a[4] a[5] t\[Lambda][6] . t\[Lambda][5]//.RR//FullSimplify;
B6 = t\[Lambda][2] . t\[Lambda][6]+(a[2]+\[Delta]a a[1] a[3]) t\[Lambda][3] . t\[Lambda][6]+\[Delta]a a[1] a[3] a[4] a[5] a[8] t\[Lambda][5] . t\[Lambda][6]+\[Delta]a a[1] a[3] a[4] a[5] t\[Lambda][6] . t\[Lambda][6]//.RR//FullSimplify;
B7 = \[Delta]a a[3] a[5] a[6] t\[Lambda][3] . t\[Lambda][3]+t\[Lambda][4] . t\[Lambda][3]+(a[7]+\[Delta]a a[5] a[8]) t\[Lambda][5] . t\[Lambda][3]+\[Delta]a a[5] t\[Lambda][6] . t\[Lambda][3]//.RR//FullSimplify;
B8 = \[Delta]a a[3] a[5] a[6] t\[Lambda][3] . t\[Lambda][5]+t\[Lambda][4] . t\[Lambda][5]+(a[7]+\[Delta]a a[5] a[8]) t\[Lambda][5] . t\[Lambda][5]+\[Delta]a a[5] t\[Lambda][6] . t\[Lambda][5]//.RR//FullSimplify;
B9 = \[Delta]a a[3] a[5] a[6] t\[Lambda][3] . t\[Lambda][6]+t\[Lambda][4] . t\[Lambda][6]+(a[7]+\[Delta]a a[5] a[8]) t\[Lambda][5] . t\[Lambda][6]+\[Delta]a a[5] t\[Lambda][6] . t\[Lambda][6]//.RR//FullSimplify;


a[1]=Spbb[2,3]/Spbb[1,3];
a[2]=-(Spbb[1,2]/Spbb[1,3]);
a[3]=-(Spab[6,P[4]+P[5]+P[6],1]/Spab[6,P[4]+P[5]+P[6],3]);
a[4]=(Spaa[4,6] Spbb[1,3])/Spab[6,P[4]+P[5]+P[6],1];
a[5]=Spab[6,P[4]+P[5]+P[6],1]/Spab[4,P[4]+P[5]+P[6],1];
a[6]=s[4,5,6]/Spab[6,P[4]+P[5]+P[6],1];
a[7]=Spaa[5,6]/Spaa[4,6];
a[8]=Spaa[4,5]/Spaa[4,6];


JA =((Spab[4,P[4]+P[5]+P[6],3] Spab[6,P[4]+P[5]+P[6],1])/(Spab[4,P[4]+P[5]+P[6],1] Spab[6,P[4]+P[5]+P[6],3]))


DefNumSH[6]



Product[1/a[i],{i,1,8}]*((Spaa[4,6]^3 Spbb[1,3]^3)/(Spab[4,P[4]+P[5]+P[6],1]^2Spab[6,P[4]+P[5]+P[6],3]^2))//Simplify


(*\[Delta]a = 1/(1-a[3] a[4]);*)
EE[1] = A4;
EE[2] = A5;
EE[3] = B1;
EE[4] = A8;
EE[5] = B3;
EE[6] = B4;
EE[7] = B5;
EE[8] = B8;


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,8},{j,1,8}];


Simplify[1/(Det[Mat])]


DefNumSH[6]
TA[1] = A1//.SHtest//.NSpinHel;
TA[2] = A2//.SHtest//.NSpinHel;
TA[3] = A3//.SHtest//.NSpinHel;
TA[4] = A4//.SHtest//.NSpinHel;
TA[5] = A5//.SHtest//.NSpinHel;
TA[6] = A6//.SHtest//.NSpinHel;
TA[7] = A7//.SHtest//.NSpinHel;
TA[8] = A8//.SHtest//.NSpinHel;

TB[1] = B1//.SHtest//.NSpinHel;
TB[2] = B2//.SHtest//.NSpinHel;
TB[3] = B3//.SHtest//.NSpinHel;
TB[4] = B4//.SHtest//.NSpinHel;
TB[5] = B5//.SHtest//.NSpinHel;
TB[6] = B6//.SHtest//.NSpinHel;
TB[7] = B7//.SHtest//.NSpinHel;
TB[8] = B8//.SHtest//.NSpinHel;
If[Sum[TA[i],{i,1,8}]==0,"Correct Solutions","One or more incorrect Solutions"]
If[Sum[TB[i],{i,1,8}]==0,"Correct Solutions","One or more incorrect Solutions"]




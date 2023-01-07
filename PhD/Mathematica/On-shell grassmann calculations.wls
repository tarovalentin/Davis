#!/usr/bin/env wolframscript
(* ::Package:: *)

ClearAll["Global`*"]
SetDirectory["C:\\Users\\tarob\\OneDrive\\Dokumenter\\Taro PC\\Documents\\Davis\\PhD\\Mathematica"];
Off[Part::pkspec1]
Off[SetDelayed::write]
Off[General::compat]
<<CHY_ToolPackagev1.wl
$CHYfunctions
RB = {(x___ \[Lambda][i_]) . \[Lambda][j_]-> x \[Lambda][i] . \[Lambda][j],(x___ t\[Lambda][i_]) . t\[Lambda][j_]-> x t\[Lambda][i] . t\[Lambda][j]};
RR={\[Lambda][i_] . \[Lambda][j_]->Spaa[i,j],t\[Lambda][i_] . t\[Lambda][j_]->Spbb[i,j],Spaa[i_,j_] Spbb[j_,k_]+Spaa[i_,l_] Spbb[k_,l_]->Spba[k,j,l,i],-Spaa[j_,i_] Spbb[j_,k_]+Spaa[l_,i_] Spbb[k_,l_]->-Spba[k,j,l,i],-Spaa[i_,j_] Spbb[i_,k_]+Spaa[l_,j_] Spbb[k_,l_]->Spba[k,i,l,j]};
rschoutB = {Spbb[l_,i_]Spbb[j_,k_]->-Spbb[l,j]Spbb[i,k]-Spbb[l,k]Spbb[i,j]};
rschoutA = {Spaa[l_,i_]Spaa[j_,k_]->-Spaa[l,j]Spaa[i,k]-Spaa[l,k]Spaa[i,j]};
latexto := {a1->Subscript[\[Alpha], 1],a2->Subscript[\[Alpha], 2],a3->Subscript[\[Alpha], 3],a4->Subscript[\[Alpha], 4],a5->Subscript[\[Alpha], 5],a6->Subscript[\[Alpha], 6],a7->Subscript[\[Alpha], 7],a8->Subscript[\[Alpha], 8]}
latexto6 := {a[i_]->Subscript[\[Alpha], i]}

latexto2 := {"Spaa[1, 2]"->"\\langle 1 2 \\rangle","Spaa[1, 3]"->"\\langle 1 3 \\rangle","Spaa[1, 4]"->"\\langle 1 4 \\rangle","Spaa[1, 5]"->"\\langle 1 5 \\rangle","Spaa[1, 6]"->"\\langle 1 6 \\rangle","Spaa[2, 3]"->"\\langle 2 3 \\rangle","Spaa[2, 4]"->"\\langle 2 4 \\rangle","Spaa[2, 5]"->"\\langle 2 5 \\rangle","Spaa[2, 6]"->"\\langle 2 6 \\rangle","Spaa[3, 4]"->"\\langle 3 4 \\rangle","Spaa[3, 5]"->"\\langle 3 5 \\rangle","Spaa[3, 6]"->"\\langle 3 6 \\rangle","Spaa[4, 5]"->"\\langle 4 5 \\rangle","Spaa[4, 6]"->"\\langle 4 6 \\rangle","Spaa[5, 6]"->"\\langle 5 6 \\rangle"};

latexto3 := {"Spbb[1, 2]"->"\\left[ 1 2 \\right]","Spbb[1, 3]"->"\\left[ 1 3 \\right]","Spbb[1, 4]"->"\\left[ 1 4 \\right]","Spbb[1, 5]"->"\\left[ 1 5 \\right]","Spbb[1, 6]"->"\\left[ 1 6 \\right]","Spbb[2, 3]"->"\\left[ 2 3 \\right]","Spbb[2, 4]"->"\\left[ 2 4 \\right]","Spbb[2, 5]"->"\\left[ 2 5 \\right]","Spbb[2, 6]"->"\\left[ 2 6 \\right]","Spbb[3, 4]"->"\\left[ 3 4 \\right]","Spbb[3, 5]"->"\\left[ 3 5 \\right]","Spbb[3, 6]"->"\\left[ 3 6 \\right]","Spbb[4, 5]"->"\\left[ 4 5 \\right]","Spbb[4, 6]"->"\\left[ 4 6 \\right]","Spbb[5, 6]"->"\\left[ 5 6 \\right]"};
latexto4 := {"a1"->"\\alpha_{1}","a2"->"\\alpha_{2}","a3"->"\\alpha_{3}","a4"->"\\alpha_{4}","a5"->"\\alpha_{5}","a6"->"\\alpha_{6}","a7"->"\\alpha_{7}","a8"->"\\alpha_{8}"};
latexto7 := {"a[1]"->"\\alpha_{1}","a[2]"->"\\alpha_{2}","a[3]"->"\\alpha_{3}","a[4]"->"\\alpha_{4}","a[5]"->"\\alpha_{5}","a[6]"->"\\alpha_{6}","a[7]"->"\\alpha_{7}","a[8]"->"\\alpha_{8}"};
latexto8 := {"\[Delta]"->"\\delta"};

latexto5 := {b1->Subscript[\[Beta], 1],b2->Subscript[\[Beta], 2],b3->Subscript[\[Beta], 3],b4->Subscript[\[Beta], 4],b5->Subscript[\[Beta], 5],b6->Subscript[\[Beta], 6],b7->Subscript[\[Beta], 7],b8->Subscript[\[Beta], 8]}
schoutenC = {Spaa[i_,j_] Spaa[l_,r_] Spbb[i_,k_]+Spaa[j_,r_] Spaa[l_,t_] Spbb[k_,t_]+Spaa[j_,r_] Spaa[l_,r_] Spbb[k_,r_]->Spaa[j,l]Spab[r,P[l]+P[t]+P[r],k]};
{"chyexp","chyGraph","chyGraphTex","chygravexp","chyint","chytolatex","id","momentumcon","Pf","Psi","pt","red","redPsi","rempol"}
SPAB = {-Spaa[j_,i_] Spbb[j_,r_]-Spaa[i_,k_] Spbb[r_,k_]-Spaa[i_,l_] Spbb[r_,l_]-Spaa[i_,nn_] Spbb[r_,nn_]->Spab[i,P[j]+P[k]+P[l]+P[nn],r],Spaa[j_,i_] Spbb[j_,r_]+Spaa[k_,i_] Spbb[k_,r_]->-Spab[i,P[j]+P[k],r],Spaa[i_,j_] Spbb[r_,j_]+Spaa[i_,k_] Spbb[r_,k_]->-Spab[i,P[j]+P[k],r],Spaa[j_,i_] Spbb[j_,r_]+Spaa[i_,k_] Spbb[r_,k_]->-Spab[i,P[j]+P[k],r],Spaa[j_,i_] Spbb[r_,j_]+Spaa[k_,i_] Spbb[r_,k_]->Spab[i,P[j]+P[k],r],-Spaa[i_,j_] Spbb[k_,j_]-Spaa[i_,l_] Spbb[k_,l_]->-Spab[i,P[j]+P[l],k],Spaa[i_,j_] Spbb[j_,l_]+Spaa[i_,k_] Spbb[k_,l_]->Spab[i,P[j]+P[k],l],Spaa[j_,i_] Spbb[j_,l_]+Spaa[k_,i_] Spbb[k_,l_]->Spab[i,P[j]+P[k],l],Spaa[j_,i_] Spbb[l_,j_]-Spaa[i_,k_] Spbb[l_,k_]->Spab[i,P[j]+P[k],l],-Spaa[k_,i_] Spbb[k_,j_]+Spaa[i_,l_] Spbb[l_,j_]->Spab[i,P[k]+P[l],j],-Spaa[k_,i_] Spbb[k_,j_]-Spaa[i_,l_] Spbb[j_,l_]->Spab[i,P[k]+P[l],j],Spaa[k_,i_] Spbb[k_,j_]-Spaa[i_,l_] Spbb[l_,j_]->-Spab[i,P[k]+P[l],j],-Spaa[k_,i_] Spbb[j_,k_]+Spaa[i_,l_] Spbb[j_,l_]->-Spab[i,P[k]+P[l],j]};

SPAB2 = {Spab[i_,P[j_],k_]->Spaa[i,j]Spbb[j,k],Spab[i_,P[j_]+P[l_],k_]->Spaa[i,j]Spbb[j,k]+Spaa[i,l]Spbb[l,k]};
SHtest = {Spab[i_,P[j_]+P[k_]+P[l_],r_]->Spaa[i,j]Spbb[j,r]+Spaa[i,k]Spbb[k,r]+Spaa[i,l]Spbb[l,r],s[i_,j_,k_]->Spaa[i,j]Spbb[j,i]+Spaa[i,k]Spbb[k,i]+Spaa[j,k]Spbb[k,j],Spbbb[i_,(P[j_]+P[k_]) . (P[l_]+P[r_]),m_]->Spbb[i,j]Spaa[j,l]Spbb[l,m]+Spbb[i,j]Spaa[j,r]Spbb[r,m]+Spbb[i,k]Spaa[k,l]Spbb[l,m]+Spbb[i,k]Spaa[k,r]Spbb[r,m],Spaaa[i_,(P[j_]+P[k_]) . (P[l_]+P[r_]),m_]->Spaa[i,j]Spbb[j,l]Spaa[l,m]+Spaa[i,j]Spbb[j,r]Spaa[r,m]+Spaa[i,k]Spbb[k,l]Spaa[l,m]+Spaa[i,k]Spbb[k,r]Spaa[r,m]};
simSchotenA = {Spaa[j_,k_] \[Lambda][i_]+Spaa[i_,j_] \[Lambda][k_]->Spaa[i,k] \[Lambda][j]};
schoutenLong={Spab[i_,x___,j_] Spbb[k_,l_]+Spab[i_,x___,k_] Spbb[l_,j_]->Spab[i,x,l] Spbb[k,j],Spaa[k_,l_]Spab[i_,x___,j_]+Spaa[l_,j_]Spab[i_,x___,k_]->Spaa[k,j]Spab[i,x,l],Spab[i_,P[x_]+P[y_]+P[w_],j_] Spab[k_,P[x_]+P[y_]+P[w_],l_]-Spab[k_,P[x_]+P[y_]+P[w_],j_] Spab[i_,P[x_]+P[y_]+P[w_],l_]->Spaa[j,l] Spbb[i,k]s[x,y,w]};

ab[i_,j_] := Total [ Total [ LeviCivitaTensor [ 2 ] *Outer [Times , \[Lambda][i] ,\[Lambda][j] ] ] ]
FullSPAB = {Spab[i_,P[j_]+P[k_],r_]-Spaa[l_,i_] Spbb[l_,r_]->Spab[i,P[l]+P[j]+P[k],r],Spab[i_,P[j_]+P[k_],r_]+Spaa[i_,l_] Spbb[l_,r_]->Spab[i,P[l]+P[j]+P[k],r]};

Submatrix[M_,i_,j_,k_]:=M[[All, {i,j,k}  ]]
minor[M_,i_,j_,k_] := Det[Submatrix[M,i,j,k]]

littleGroup = {Spaa[i_,j_]->t[i]t[j]Spaa[i,j],Spbb[i_,j_]->(t[i]t[j])^(-1)Spbb[i,j],Spab[i_,j___,k_]->t[i]t[k]^(-1)Spab[i,j,k]};


SPaaaa[b,(P[i]+P[p]) . (P[j]+P[k]) . (P[l]+P[r]),m]->Spaa[b,i]Spbbb[i,(P[j]+P[k]) . (P[l]+P[r]),m]+Spaa[b,p]Spbbb[p,(P[j]+P[k]) . (P[l]+P[r]),m]


(gp[x] h[x] \[Delta][x]-g[x] hp[x] \[Delta][x]-g[x] h[x] \[Delta]p[x])/(h[x]^2 \[Delta][x]^2)
Collect[(-Spaa[2,4] Spaa[3,l3] (Spaa[3,4]-Spaa[4,l3])-Spaa[2,4] Spaa[3,l3] Spaa[4,l3]+Spaa[2,3] (Spaa[3,4]-Spaa[4,l3]) Spaa[4,l3])//Expand,Spaa[3,4]]//.schoutenA
h[x]=Spaa[3,l3];
g[x] =Spaa[4,l3];
\[Delta][x] = (Spaa[3,4]-Spaa[4,l3]);
hp[x]= Spaa[3,2];
gp[x]= Spaa[4,2];
\[Delta]p[x]= -Spaa[4,2];


(* ::Section::Closed:: *)
(*3 Pt MHV*)


(*3 pt MHV*)

(*Define C-matrices and lambda*)
CC = {{1,0,a[2]},{0,1,a[1]}};
Cperp = {-a[2],-a[1],1};
lambda = {\[Lambda][1],\[Lambda][2],\[Lambda][3]};
tlambda = {t\[Lambda][1],t\[Lambda][2],t\[Lambda][3]};
CC . Transpose[Cperp];
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda]


A[1] = TensorExpand[(perpEQ) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A[2] = TensorExpand[(perpEQ) . \[Lambda][2]]//.RB//.RR//FullSimplify;

Sol = Solve[{A[1]==0,A[2]==0},{a[1],a[2]}]


F[i_,j_]:=D[A[i],a[j]];
Mat = Table[F[i,j],{i,1,2},{j,1,2}];
J = Simplify[1/(Det[Mat])]//.Sol//FullSimplify


CEQ[[1]]//.Sol
CEQ[[2]]//.Sol


J*Product[1/a[i],{i,1,2}]*1/Spaa[2,1]//.Sol


(* ::Section::Closed:: *)
(*4 Pt MHV*)


CC = {{1, a[1],0,a[4]},{0,a[2],1,a[3]}};
Cperp = {{-a[1],1,-a[2],0},{-a[4],0,-a[3],1}};
lambda = {\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4]};
tlambda = {t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4]};

perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4]};
SEQ = CC . Transpose[eta];
(*Solve for \[Alpha]'s by solving one delta function constraint. Here we get the equations from the eq below*)

CC . Transpose[Cperp];


(*We then define them underneath by contracting with lambda's*)
A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
Sol = Solve[{A1==0,A2==0,A3==0,A4==0},{a[1],a[2],a[3],a[4]}]//Simplify;
Sol = Sol[[1]]//.schoutenA


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A4;
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,4},{j,1,4}];
Simplify[1/(Det[Mat])]
J = Simplify[1/(Det[Mat])]//.Sol//.schoutenA


1/(a[1] a[2] a[3] a[4])*J*Spaa[1,3]^(-4)*Spaa[1,3]^2*Spaa[1,3]^2//.Sol//FullSimplify


J*Spaa[1,3]^(-4)*Spaa[1,3]^2*Spaa[1,3]^2


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


1/(a1 a2 a3 a4 a5 a6)//.Sol//.schoutenA


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


(* ::Section::Closed:: *)
(*Loop calculation (extra internal parameter)*)


(* ::Subsection::Closed:: *)
(*3 pt one-loop*)


(*3 pt MHV*)

(*Define C-matrices and lambda*)
CC = {{1,0,a[2]},{0,1,a[1]+a[3]}};
Cperp = {-a[2],-(a[1]+a[3]),1};
lambda = {\[Lambda][1],\[Lambda][2],\[Lambda][3]};
tlambda = {t\[Lambda][1],t\[Lambda][2],t\[Lambda][3]};
CC . Transpose[Cperp];
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda]


A[1] = TensorExpand[(perpEQ) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A[2] = TensorExpand[(perpEQ) . \[Lambda][2]]//.RB//.RR//FullSimplify;

Sol = Solve[{A[1]==0,A[2]==0},{a[1],a[2]}]


F[i_,j_]:=D[A[i],a[j]];
Mat = Table[F[i,j],{i,1,2},{j,1,2}];
J = Simplify[1/(Det[Mat])]//.Sol//FullSimplify


CEQ[[1]]//.Sol
CEQ[[2]]//.Sol


J*Product[1/a[i],{i,1,3}]*1/Spaa[2,1]//.Sol//Simplify;
\[CapitalOmega]=1/(a[3] Spaa[1,2] (a[3] Spaa[1,2]-Spaa[1,3]) Spaa[2,3])
Residue[\[CapitalOmega],{a[3],0}]


(* ::InheritFromParent:: *)
(**)


(* ::InheritFromParent:: *)
(**)


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
CaP = {{-a[1]-a[2]a[6]\[Delta],1,0,-a[2]a[4]a[5]a[6]\[Delta],0},{-a[6]\[Delta],0,1,-a[4]a[5]a[6]\[Delta],0},{-a[3]a[4]a[6]\[Delta],0,0,-a[4]\[Delta],1}};
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
(*5 pt two internal loops*)


(*5 point YM MHV*)
(*Define C-matrices and lambda for first diagram*)
\[Delta]1 = 1/(1-a[3]a[4]a[5]a[6]);
\[Delta]2 = 1/(1-a[1]a[2]a[6]);

CC = {{a[1]+a[1]^2a[2]a[6]\[Delta]1 \[Delta]2,1,a[1] a[6] \[Delta]1 \[Delta]2, 0,a[3] a[1] a[6]a[4] \[Delta]1 \[Delta]2},{a5 a6 a2 a1 \[Delta]1, 0, a5 a6 \[Delta]1, a4+a5 a3 a6 \[Delta]1, 1}};
Cperp = {{1, -a[1]-a[1]^2a[2]a[6] \[Delta]1 \[Delta]2,0,-a[2]a[4]a[5]a[6] \[Delta]1 \[Delta]2,0},{0,-a[1] a[6] \[Delta]1 \[Delta]2,1,-a[4]a[5] a[6] \[Delta]1 \[Delta]2,0},{0,-a[3] a[1] a[6] a[4] \[Delta]1 \[Delta]2,0,-a[4]-a[3]a[4]^2a[5]a[6] \[Delta]1 \[Delta]2,1}};
lambda = {\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]};
Ca . Transpose[CaP];
(*Solve for \[Alpha]'s by solving one delta function constraint. Here we get the equations from the eq below*)
perpEQ = Cperp . Transpose[lambda]


a1(1+Sum[(a1 a2 a6)^i,{i,1,\[Infinity]}]Sum[(a3 a4 a5 a6)^i,{i,0,\[Infinity]}])//FullSimplify


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][4]]//.RB//.RR//FullSimplify


Sol = Solve[{A1==0,A2==0,A3==0,A4==0,A5==0,A6==0},{a[1],a[2],a[3],a[4],a[5],a[6]}]//Simplify;
Sol = Sol[[1]]//.schoutenA//Simplify


Product[1/(a[i]),{i,1,6}]//.Sol//FullSimplify


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
CC={{a7, 1,a8(a1+a5 a2 (1+a3 a4 \[Delta]a)),0,a8 a5 a3 a4 \[Delta]a,0},{0,0,a2 a4 \[Delta]a,1,a4 \[Delta]a,0},{a6,0,a5 a2 \[Delta]a,0,a5 a3 a4 \[Delta]a,1}}//MatrixForm
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
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,8},{j,1,8}];


Simplify[1/(Det[Mat])]//.Sol//FullSimplify


\[Delta]a=((Spab[2,P[1]+P[2]+P[6],4] Spbb[3,5])/(Spab[2,P[1]+P[2]+P[6],5] Spbb[3,4]))^(-1);


(Spab[2,P[1]+P[2]+P[6],4] Spbb[3,5])^5/(Spaa[2,4] Spaa[2,6]^2 Spab[2,P[1]+P[2]+P[6],4]^4 Spab[2,P[1]+P[2]+P[6],5]^2 Spab[6,P[1]+P[2]+P[6],3] Spbb[3,4]^3 Spbb[3,5]^3)


(Spbb[3,5]^4 Spaa[2,6])/(Spab[2,P[1]+P[2]+P[6],5] Spab[6,P[1]+P[2]+P[6],3] (Spbb[3,4]^3) )


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
d\[CapitalOmega] * J^(-4);


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





(* ::Section::Closed:: *)
(*Higher pt MHV N=0 *)


(* ::Subsection::Closed:: *)
(*6 pt MHV no cycle*)


(*Define C-matrices and lambda*)
CC={{1,a1,0,0,0,a2},{0,a6,1,a5,0,a6 a7},{0,a6 a8 ,0,a4,1,a3+a6 a7 a8}};
Cperp ={{-a[1]-a[2] a[6],1,0,0,0,-a[2] a[5] a[6]},{-a[6],0,1,0,0,-a[5] a[6]},{-a[3] a[6],0,0,1,0,-a[4]-a[3] a[5] a[6]},{-a[3] a[6] a[7], 0,0,0,1,-a[8] -a[7](a[4]+a[3] a[5] a[6])}};
lambda={{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]}};
tlambda={{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]}};
(*Test transpose orthogonality*)
CC . Transpose[Cperp]=={{0,0,0},{0,0,0},{0,0,0}};
Cperp . Transpose[lambda]
CC . Transpose[tlambda]


A[1] = (-a[1]-a[2] a[6]) \[Lambda][1] . \[Lambda][1]+\[Lambda][2] . \[Lambda][1]-a[2] a[5] a[6] \[Lambda][6] . \[Lambda][1]//.RR;
A[2] = (-a[1]-a[2] a[6]) \[Lambda][1] . \[Lambda][6]+\[Lambda][2] . \[Lambda][6]-a[2] a[5] a[6] \[Lambda][6] . \[Lambda][6]//.RR;
A[3] = -a[6] \[Lambda][1] . \[Lambda][1]+\[Lambda][3] . \[Lambda][1]-a[5] a[6] \[Lambda][6] . \[Lambda][1]//.RR;
A[4] = -a[6] \[Lambda][1] . \[Lambda][6]+\[Lambda][3] . \[Lambda][6]-a[5] a[6] \[Lambda][6] . \[Lambda][6]//.RR;
A[5] = -a[3] a[6] \[Lambda][1] . \[Lambda][1]+\[Lambda][4] . \[Lambda][1]+(-a[4]-a[3] a[5] a[6]) \[Lambda][6] . \[Lambda][1]//.RR;
A[6] = -a[3] a[6] \[Lambda][1] . \[Lambda][6]+\[Lambda][4] . \[Lambda][6]+(-a[4]-a[3] a[5] a[6]) \[Lambda][6] . \[Lambda][6]//.RR;
A[7] = -a[3] a[6] a[7] \[Lambda][1] . \[Lambda][1]+\[Lambda][5] . \[Lambda][1]+(-((a[4]+a[3] a[5] a[6]) a[7])-a[8]) \[Lambda][6] . \[Lambda][1]//.RR;
A[8] = -a[3] a[6] a[7] \[Lambda][1] . \[Lambda][6]+\[Lambda][5] . \[Lambda][6]+(-((a[4]+a[3] a[5] a[6]) a[7])-a[8]) \[Lambda][6] . \[Lambda][6]//.RR;


Sol = Solve[{A[1]==0,A[2]==0,A[3]==0,A[4]==0,A[5]==0,A[6]==0,A[7]==0,A[8]==0},{a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8]}]//.schoutenA


F[i_,j_]:=D[A[i],a[j]];
Mat = Table[F[i,j],{i,1,8},{j,1,8}];
J = Simplify[1/(Det[Mat])]//.Sol//FullSimplify


Product[1/(a[i]),{i,1,8}]*J*Spaa[1,6]^2//.Sol


(* ::Subsection::Closed:: *)
(*6 pt MHV with cycle*)


(*Define C-matrices and lambda*)
CC={{a[1]\[Delta],1,a[1]a[6]\[Delta],a[1]a[3]a[6]\[Delta],a[1]a[3]a[6]a[7]\[Delta],0},{a[1]a[2]a[5]a[6]\[Delta],0,a[5]a[6]\[Delta],a[4]+a[3]a[5]a[6]\[Delta],a[8]+a[4]a[7]+a[3]a[5]a[6]a[7]\[Delta],1}};
Cperp ={{1,-\[Delta] a[1],0,0,0,-\[Delta] a[1] a[2] a[5] a[6]},{0,-\[Delta] a[1] a[6],1,0,0,-\[Delta] a[5] a[6]},{0,-\[Delta] a[1] a[3] a[6],0,1,0,-a[4]-\[Delta] a[3] a[5] a[6]},{0,-\[Delta] a[1] a[3] a[6] a[7],0,0,1,-a[4] a[7]-\[Delta] a[3] a[5] a[6] a[7]-a[8]}};
lambda={{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]}};
tlambda={{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]}};
(*Test transpose orthogonality*)
CC . Transpose[Cperp]=={{0,0,0,0},{0,0,0,0}};
CC . Transpose[tlambda];
Eq = Cperp . Transpose[lambda];
Eq[[1]][[1]];
Eq[[2]][[1]];
Eq[[3]][[1]];
Eq[[4]][[1]];


\[Delta] = 1/(1-a[1]a[2]a[6]);
A[1] = \[Lambda][1] . \[Lambda][2]-\[Delta] a[1] \[Lambda][2] . \[Lambda][2]-\[Delta] a[1] a[2] a[5] a[6] \[Lambda][6] . \[Lambda][2]/.RR;
A[2] = \[Lambda][1] . \[Lambda][6]-\[Delta] a[1] \[Lambda][2] . \[Lambda][6]-\[Delta] a[1] a[2] a[5] a[6] \[Lambda][6] . \[Lambda][6]/.RR;
A[3] = -\[Delta] a[1] a[6] \[Lambda][2] . \[Lambda][2]+\[Lambda][3] . \[Lambda][2]-\[Delta] a[5] a[6] \[Lambda][6] . \[Lambda][2]//.RR;
A[4] = -\[Delta] a[1] a[6] \[Lambda][2] . \[Lambda][6]+\[Lambda][3] . \[Lambda][6]-\[Delta] a[5] a[6] \[Lambda][6] . \[Lambda][6]//.RR;
A[5] = -\[Delta] a[1] a[3] a[6] \[Lambda][2] . \[Lambda][2]+\[Lambda][4] . \[Lambda][2]+(-a[4]-\[Delta] a[3] a[5] a[6]) \[Lambda][6] . \[Lambda][2]//.RR;
A[6] = -\[Delta] a[1] a[3] a[6] \[Lambda][2] . \[Lambda][6]+\[Lambda][4] . \[Lambda][6]+(-a[4]-\[Delta] a[3] a[5] a[6]) \[Lambda][6] . \[Lambda][6]//.RR;
A[7] = -\[Delta] a[1] a[3] a[6] a[7] \[Lambda][2] . \[Lambda][2]+\[Lambda][5] . \[Lambda][2]+(-a[4] a[7]-\[Delta] a[3] a[5] a[6] a[7]-a[8]) \[Lambda][6] . \[Lambda][2]//.RR;
A[8] = -\[Delta] a[1] a[3] a[6] a[7] \[Lambda][2] . \[Lambda][6]+\[Lambda][5] . \[Lambda][6]+(-a[4] a[7]-\[Delta] a[3] a[5] a[6] a[7]-a[8]) \[Lambda][6] . \[Lambda][6]//.RR;


Sol = Solve[{A[1]==0,A[2]==0,A[3]==0,A[4]==0,A[5]==0,A[6]==0,A[7]==0,A[8]==0},{a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8]}]//.schoutenA


F[i_,j_]:=D[A[i],a[j]];
Mat = Table[F[i,j],{i,1,8},{j,1,8}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol]Spaa[2,6]^2//.schoutenA


JacA = ((Spaa[1,6] Spaa[2,3])/(Spaa[1,3] Spaa[2,6]))^(-1);
JacB = ((Spaa[1,2] Spaa[3,6])/(Spaa[1,3] Spaa[2,6]))^(-1);


Together[1/(1-a[1]a[2]a[6])//.Sol[[1]]]//.schoutenA


Product[1/(a[i]),{i,1,8}]*J//.Sol


(* ::Subsection::Closed:: *)
(*6 pt, 4-l MHV with cycle*)


(*Define C-matrices and lambda*)
CC={{a[1]\[Delta],1,a[1]a[6]\[Delta],\[Delta] a[1] a[3] a[6](1+a[7]a[9]),a[1]a[3]a[6]a[7]\[Delta],0},{a[1]a[2]a[5]a[6]\[Delta],0,a[5]a[6]\[Delta],(a[4]+\[Delta] a[3] a[5] a[6])(1+a[7]a[9])+a[8]a[9],a[8]+a[4]a[7]+a[3]a[5]a[6]a[7]\[Delta],1}};
Cperp ={{1,-\[Delta] a[1],0,0,0,-\[Delta] a[1] a[2] a[5] a[6]},{0,-\[Delta] a[1] a[6],1,0,0,-\[Delta] a[5] a[6]},{0,-\[Delta] a[1] a[3] a[6](1+a[7]a[9]),0,1,0,-((a[4]+\[Delta] a[3] a[5] a[6])(1+a[7]a[9])+a[8]a[9])},{0,-\[Delta] a[1] a[3] a[6] a[7],0,0,1,-a[4] a[7]-\[Delta] a[3] a[5] a[6] a[7]-a[8]}};
lambda={{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]}};
tlambda={{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]}};
(*Test transpose orthogonality*)
CC . Transpose[Cperp]=={{0,0,0,0},{0,0,0,0}};
CC . Transpose[tlambda];
Eq = Cperp . Transpose[lambda];
Eq[[1]][[1]];
Eq[[2]][[1]];
Eq[[3]][[1]]
Eq[[4]][[1]];


\[Delta] = 1/(1-a[1]a[2]a[6]);
A[1] = \[Lambda][1] . \[Lambda][2]-\[Delta] a[1] \[Lambda][2] . \[Lambda][2]-\[Delta] a[1] a[2] a[5] a[6] \[Lambda][6] . \[Lambda][2]/.RR;
A[2] = \[Lambda][1] . \[Lambda][6]-\[Delta] a[1] \[Lambda][2] . \[Lambda][6]-\[Delta] a[1] a[2] a[5] a[6] \[Lambda][6] . \[Lambda][6]/.RR;
A[3] = -\[Delta] a[1] a[6] \[Lambda][2] . \[Lambda][2]+\[Lambda][3] . \[Lambda][2]-\[Delta] a[5] a[6] \[Lambda][6] . \[Lambda][2]//.RR;
A[4] = -\[Delta] a[1] a[6] \[Lambda][2] . \[Lambda][6]+\[Lambda][3] . \[Lambda][6]-\[Delta] a[5] a[6] \[Lambda][6] . \[Lambda][6]//.RR;
A[5] = \[Lambda][4] . \[Lambda][2]-(a[4]+(a[4] a[7]+a[8]) a[9]) \[Lambda][6] . \[Lambda][2]-\[Delta] a[3] a[6] (1+a[7] a[9]) (a[1] \[Lambda][2] . \[Lambda][2]+a[5] \[Lambda][6] . \[Lambda][2])//.RR;
A[6] = \[Lambda][4] . \[Lambda][6]-(a[4]+(a[4] a[7]+a[8]) a[9]) \[Lambda][6] . \[Lambda][6]-\[Delta] a[3] a[6] (1+a[7] a[9]) (a[1] \[Lambda][2] . \[Lambda][6]+a[5] \[Lambda][6] . \[Lambda][6])//.RR;
A[7] = -\[Delta] a[1] a[3] a[6] a[7] \[Lambda][2] . \[Lambda][2]+\[Lambda][5] . \[Lambda][2]+(-a[4] a[7]-\[Delta] a[3] a[5] a[6] a[7]-a[8]) \[Lambda][6] . \[Lambda][2]//.RR;
A[8] = -\[Delta] a[1] a[3] a[6] a[7] \[Lambda][2] . \[Lambda][6]+\[Lambda][5] . \[Lambda][6]+(-a[4] a[7]-\[Delta] a[3] a[5] a[6] a[7]-a[8]) \[Lambda][6] . \[Lambda][6]//.RR;


Sol = Solve[{A[1]==0,A[2]==0,A[3]==0,A[4]==0,A[5]==0,A[6]==0,A[7]==0,A[8]==0},{a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8]}]//.schoutenA;


(*Applying schouten to solutions*)
Sol2 = {{a[1]->Spaa[1,3]/Spaa[2,3],a[2]->-(Spaa[1,2]/Spaa[1,3]),a[3]->(Spaa[4,6]-a[9] Spaa[5,6])/Spaa[3,6],a[4]->(Spaa[3,4]-a[9] Spaa[3,5])/Spaa[3,6],a[5]->Spaa[1,3]/Spaa[3,6],a[6]->Spaa[3,6]/Spaa[1,6],a[7]->-(Spaa[5,6]/(-Spaa[4,6]+a[9] Spaa[5,6])),a[8]->Spaa[4,5]/(Spaa[4,6]-a[9] Spaa[5,6])}}


F[i_,j_]:=D[A[i],a[j]];
Mat = Table[F[i,j],{i,1,8},{j,1,8}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol]Spaa[2,6]^6//.schoutenA


JacA = ((Spaa[1,6] Spaa[2,3])/(Spaa[1,3] Spaa[2,6]))^(-1)
JacB = ((Spaa[1,2] Spaa[3,6])/(Spaa[1,3] Spaa[2,6]))^(-1)


Together[1/(1-a[1]a[2]a[6])//.Sol[[1]]]//.schoutenA


Product[1/(a[i]),{i,1,8}]*J//.Sol


Spaa[2,6]^5/Simplify[(Simplify[(Spaa[1,2] Spaa[1,6] Spaa[2,3] Spaa[4,5] Spaa[5,6] (Spaa[2,6] Spaa[3,4]-a[9] Spaa[2,5] Spaa[3,6]+a[9] Spaa[2,3] Spaa[5,6]))]//.schoutenA)]


(* ::Subsection::Closed:: *)
(*6 pt, 4-l MHV with cycle, 2nd config*)


(*Define C-matrices and lambda*)
CC={{a[1]\[Delta],1,a[1]a[6]\[Delta]+a[9],a[1]a[3]a[6]\[Delta],a[1]a[3]a[6]a[7]\[Delta],0},{a[1]a[2]a[5]a[6]\[Delta],0,a[5]a[6]\[Delta],a[4]+a[3]a[5]a[6]\[Delta],a[8]+a[4]a[7]+a[3]a[5]a[6]a[7]\[Delta],1}}//MatrixForm
Cperp ={{1,-\[Delta] a[1],0,0,0,-\[Delta] a[1] a[2] a[5] a[6]},{0,-\[Delta] a[1] a[6]-a[9],1,0,0,-\[Delta] a[5] a[6]},{0,-\[Delta] a[1] a[3] a[6],0,1,0,-a[4]-\[Delta] a[3] a[5] a[6]},{0,-\[Delta] a[1] a[3] a[6] a[7],0,0,1,-a[4] a[7]-\[Delta] a[3] a[5] a[6] a[7]-a[8]}};
lambda={{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]}};
tlambda={{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]}};
(*Test transpose orthogonality*)
CC . Transpose[Cperp]=={{0,0,0,0},{0,0,0,0}};
CC . Transpose[tlambda];
Eq = Cperp . Transpose[lambda];
Eq[[1]][[1]]
Eq[[2]][[1]]
Eq[[3]][[1]]
Eq[[4]][[1]]


(*\[Delta] = 1/(1-a[1]a[2]a[6]);*)
\[Delta]=-((Spaa[1,6] Spaa[2,3])/((a[9] Spaa[1,2]-Spaa[1,3]) Spaa[2,6]))
A[1] = \[Lambda][1] . \[Lambda][2]-\[Delta] a[1] \[Lambda][2] . \[Lambda][2]-\[Delta] a[1] a[2] a[5] a[6] \[Lambda][6] . \[Lambda][2]/.RR;
A[2] = \[Lambda][1] . \[Lambda][6]-\[Delta] a[1] \[Lambda][2] . \[Lambda][6]-\[Delta] a[1] a[2] a[5] a[6] \[Lambda][6] . \[Lambda][6]/.RR;
A[3] = (-\[Delta] a[1] a[6]-a[9])\[Lambda][2] . \[Lambda][2]+\[Lambda][3] . \[Lambda][2]-\[Delta] a[5] a[6] \[Lambda][6] . \[Lambda][2]//.RR;
A[4] = (-\[Delta] a[1] a[6]-a[9])\[Lambda][2] . \[Lambda][6]+\[Lambda][3] . \[Lambda][6]-\[Delta] a[5] a[6] \[Lambda][6] . \[Lambda][6]//.RR;
A[5] = -\[Delta] a[1] a[3] a[6] \[Lambda][2] . \[Lambda][2]+\[Lambda][4] . \[Lambda][2]+(-a[4]-\[Delta] a[3] a[5] a[6]) \[Lambda][6] . \[Lambda][2]//.RR;
A[6] = -\[Delta] a[1] a[3] a[6] \[Lambda][2] . \[Lambda][6]+\[Lambda][4] . \[Lambda][6]+(-a[4]-\[Delta] a[3] a[5] a[6]) \[Lambda][6] . \[Lambda][6]//.RR;
A[7] = -\[Delta] a[1] a[3] a[6] a[7] \[Lambda][2] . \[Lambda][2]+\[Lambda][5] . \[Lambda][2]+(-a[4] a[7]-\[Delta] a[3] a[5] a[6] a[7]-a[8]) \[Lambda][6] . \[Lambda][2]//.RR;
A[8] = -\[Delta] a[1] a[3] a[6] a[7] \[Lambda][2] . \[Lambda][6]+\[Lambda][5] . \[Lambda][6]+(-a[4] a[7]-\[Delta] a[3] a[5] a[6] a[7]-a[8]) \[Lambda][6] . \[Lambda][6]//.RR;


Sol = Solve[{A[1]==0,A[2]==0,A[3]==0,A[4]==0,A[5]==0,A[6]==0,A[7]==0,A[8]==0},{a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8]}]//.schoutenA//FullSimplify


F[i_,j_]:=D[A[i],a[j]];
Mat = Table[F[i,j],{i,1,8},{j,1,8}];
J = FullSimplify[Simplify[1/(Det[Mat])]]Spaa[2,6]^6//.Sol//FullSimplify


JacA = (-((Spaa[1,6] Spaa[2,3])/((a[9] Spaa[1,2]-Spaa[1,3]) Spaa[2,6])))^(-1)
JacB = ((Spaa[1,2] (a[9] Spaa[2,6]-Spaa[3,6]))/Simplify[a[9] Spaa[1,2] Spaa[2,6]-Spaa[1,3] Spaa[2,6]])^(-1)


Together[1/(1-1/(a[1]a[2]a[6]))//.Sol[[1]]]//.schoutenA


Product[1/(a[i]),{i,1,9}]*J//.Sol[[1]]//FullSimplify
-(Spaa[2,6]^4/Simplify[(a[9]^2 Spaa[1,2] Spaa[1,6] Spaa[2,3] Spaa[2,4] Spaa[4,5] Spaa[5,6]-a[9] Spaa[1,2] Spaa[1,6] Spaa[2,3] Spaa[3,4] Spaa[4,5] Spaa[5,6])])


(* ::Subsection::Closed:: *)
(*7 pt MHV no cycle*)


(*Define C-matrices and lambda*)
CC={{1,a[1]+a[2]a[6],a[6],a[3]a[6],a[3]a[6](a[7]a[10]+a[9]),a[3]a[6]a[7],0},{0,a[2]a[5]a[6],a[5]a[6],a[4]+a[3]a[5]a[6],a[8]a[10]+a[4](a[9]+a[7]a[10])+a[3]a[5]a[6](a[9]+a[7]a[10]),a[8]+a[7](a[4]+a[3]a[5]a[6]),1}};
Cperp ={{-a[1]-a[2]a[6],1,0,0,0,0,-a[2]a[5]a[6]},{-a[6],0,1,0,0,0,-a[5]a[6]},{-a[3]a[6],0,0,1,0,0,-a[4]-a[3]a[5]a[6]},{-a[3]a[6](a[9]+a[7]a[10]),0,0,0,1,0,-a[8]a[10]-a[4](a[9]+a[7]a[10])-a[3]a[5]a[6](a[9]+a[7]a[10])},{-a[3]a[6]a[7],0,0,0,0,1,-a[8]-a[7](a[4]+a[3]a[5]a[6])}};
lambda={{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7]}};
tlambda={{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]}};
(*Test transpose orthogonality*)
CC . Transpose[Cperp];
Eq = Cperp . Transpose[lambda];
Eq[[1]][[1]]
Eq[[2]][[1]]
Eq[[3]][[1]]
Eq[[4]][[1]]
Eq[[5]][[1]]


-a[3] a[6] (1+a[7] a[9] a[10]) \[Lambda][1]+\[Lambda][4]+(-a[8] a[9] a[10]-a[4] (1+a[7] a[9] a[10])-a[3] a[5] a[6] (1+a[7] a[9] a[10])) \[Lambda][7]//FullSimplify


A[1] = (-a[1]-a[2]a[6]) \[Lambda][1] . \[Lambda][1]+\[Lambda][2] . \[Lambda][1]-a[2] a[5] a[6] \[Lambda][7] . \[Lambda][1]//.RR//FullSimplify;
A[2] = (-a[1]-a[2]a[6]) \[Lambda][1] . \[Lambda][7]+\[Lambda][2] . \[Lambda][7]-a[2] a[5] a[6] \[Lambda][7] . \[Lambda][7]//.RR//FullSimplify;
A[3] = -a[6] \[Lambda][1] . \[Lambda][1]+\[Lambda][3] . \[Lambda][1]-a[5] a[6] \[Lambda][7] . \[Lambda][1]//.RR//FullSimplify;
A[4] = -a[6] \[Lambda][1] . \[Lambda][7]+\[Lambda][3] . \[Lambda][7]-a[5] a[6] \[Lambda][7] . \[Lambda][7]//.RR//FullSimplify;
A[5] = -a[3] a[6] \[Lambda][1] . \[Lambda][1]+\[Lambda][4] . \[Lambda][1]+(-a[4]-a[3] a[5] a[6]) \[Lambda][7] . \[Lambda][1]//.RR//FullSimplify;
A[6] = -a[3] a[6] \[Lambda][1] . \[Lambda][7]+\[Lambda][4] . \[Lambda][7]+(-a[4]-a[3] a[5] a[6]) \[Lambda][7] . \[Lambda][7]//.RR//FullSimplify;
A[7] = -a[3] a[6] (a[9]+a[7] a[10]) \[Lambda][1] . \[Lambda][1]+\[Lambda][5] . \[Lambda][1]+(-a[8] a[10]-a[4] (a[9]+a[7] a[10])-a[3] a[5] a[6] (a[9]+a[7] a[10])) \[Lambda][7] . \[Lambda][1]//.RR//FullSimplify;
A[8] = -a[3] a[6] (a[9]+a[7] a[10]) \[Lambda][1] . \[Lambda][7]+\[Lambda][5] . \[Lambda][7]+(-a[8] a[10]-a[4] (a[9]+a[7] a[10])-a[3] a[5] a[6] (a[9]+a[7] a[10])) \[Lambda][7] . \[Lambda][7]//.RR//FullSimplify;
A[9] = -a[3] a[6] a[7] \[Lambda][1] . \[Lambda][1]+\[Lambda][6] . \[Lambda][1]+(-((a[4]+a[3] a[5] a[6]) a[7])-a[8]) \[Lambda][7] . \[Lambda][1]//.RR//FullSimplify;
A[10]= -a[3] a[6] a[7] \[Lambda][1] . \[Lambda][7]+\[Lambda][6] . \[Lambda][7]+(-((a[4]+a[3] a[5] a[6]) a[7])-a[8]) \[Lambda][7] . \[Lambda][7]//.RR//FullSimplify;


Sol = Solve[{A[1]==0,A[2]==0,A[3]==0,A[4]==0,A[5]==0,A[6]==0,A[7]==0,A[8]==0,A[9]==0,A[10]==0},{a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10]}]//.schoutenA


F[i_,j_]:=D[A[i],a[j]];
Mat = Table[F[i,j],{i,1,10},{j,1,10}];
J = Simplify[1/(Det[Mat])]*Spaa[1,7]^4//.Sol//FullSimplify
Product[1/(a[i]),{i,1,10}]*J//.Sol


(* ::Subsection::Closed:: *)
(*7 pt MHV with cycle*)


(*Define C-matrices and lambda*)
CC={{\[Delta] a[1],1,\[Delta] a[1] a[6],\[Delta] a[1] a[3] a[6],\[Delta] a[1] a[3] a[6] (a[9]+a[7] a[10]),\[Delta] a[1] a[3] a[6] a[7],0},{\[Delta] a[1] a[2] a[5] a[6],0,\[Delta] a[5] a[6],a[4]+\[Delta] a[3] a[5] a[6],a[8] a[10]+a[4] (a[9]+a[7] a[10])+\[Delta] a[3] a[5] a[6] (a[9]+a[7] a[10]),a[4] a[7]+\[Delta] a[3] a[5] a[6] a[7]+a[8],1}};
Cperp ={{1,-\[Delta] a[1],0,0,0,0,-\[Delta] a[1] a[2] a[5] a[6]},{0,-\[Delta] a[1] a[6],1,0,0,0,-\[Delta] a[5] a[6]},{0,-\[Delta] a[1] a[3] a[6],0,1,0,0,-a[4]-\[Delta] a[3] a[5] a[6]},{0,-\[Delta] a[1] a[3] a[6] (a[9]+a[7] a[10]),0,0,1,0,-a[8] a[10]-a[4] (a[9]+a[7] a[10])-\[Delta] a[3] a[5] a[6] (a[9]+a[7] a[10])},{0,-\[Delta] a[1] a[3] a[6] a[7],0,0,0,1,-a[4] a[7]-\[Delta] a[3] a[5] a[6] a[7]-a[8]}};
lambda={{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7]}};
tlambda={{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]}};
(*Test transpose orthogonality*)
CC . Transpose[Cperp]=={{0,0,0,0,0},{0,0,0,0,0}};
Eq = Cperp . Transpose[lambda];
Eq[[1]][[1]];
Eq[[2]][[1]];
Eq[[3]][[1]];
Eq[[4]][[1]];
Eq[[5]][[1]];


\[Delta] = 1/(1-a[1]a[2]a[6]);
A[1] = \[Lambda][1] . \[Lambda][2]-\[Delta] a[1] \[Lambda][2] . \[Lambda][2]-\[Delta] a[1] a[2] a[5] a[6] \[Lambda][7] . \[Lambda][2]//.RR//FullSimplify;
A[2] = \[Lambda][1] . \[Lambda][7]-\[Delta] a[1] \[Lambda][2] . \[Lambda][7]-\[Delta] a[1] a[2] a[5] a[6] \[Lambda][7] . \[Lambda][7]//.RR//FullSimplify;
A[3] = -\[Delta] a[1] a[6] \[Lambda][2] . \[Lambda][2]+\[Lambda][3] . \[Lambda][2]-\[Delta] a[5] a[6] \[Lambda][7] . \[Lambda][2]//.RR//FullSimplify;
A[4] = -\[Delta] a[1] a[6] \[Lambda][2] . \[Lambda][7]+\[Lambda][3] . \[Lambda][7]-\[Delta] a[5] a[6] \[Lambda][7] . \[Lambda][7]//.RR//FullSimplify;
A[5] = -\[Delta] a[1] a[3] a[6] \[Lambda][2] . \[Lambda][2]+\[Lambda][4] . \[Lambda][2]+(-a[4]-\[Delta] a[3] a[5] a[6]) \[Lambda][7] . \[Lambda][2]//.RR//FullSimplify;
A[6] = -\[Delta] a[1] a[3] a[6] \[Lambda][2] . \[Lambda][7]+\[Lambda][4] . \[Lambda][7]+(-a[4]-\[Delta] a[3] a[5] a[6]) \[Lambda][7] . \[Lambda][7]//.RR//FullSimplify;
A[7] = -\[Delta] a[1] a[3] a[6] (a[9]+a[7] a[10]) \[Lambda][2] . \[Lambda][2]+\[Lambda][5] . \[Lambda][2]+(-a[8] a[10]-a[4] (a[9]+a[7] a[10])-\[Delta] a[3] a[5] a[6] (a[9]+a[7] a[10])) \[Lambda][7] . \[Lambda][2]//.RR//FullSimplify;
A[8] = -\[Delta] a[1] a[3] a[6] (a[9]+a[7] a[10]) \[Lambda][2] . \[Lambda][7]+\[Lambda][5] . \[Lambda][7]+(-a[8] a[10]-a[4] (a[9]+a[7] a[10])-\[Delta] a[3] a[5] a[6] (a[9]+a[7] a[10])) \[Lambda][7] . \[Lambda][7]//.RR//FullSimplify;
A[9] = -\[Delta] a[1] a[3] a[6] a[7] \[Lambda][2] . \[Lambda][2]+\[Lambda][6] . \[Lambda][2]+(-a[4] a[7]-\[Delta] a[3] a[5] a[6] a[7]-a[8]) \[Lambda][7] . \[Lambda][2]//.RR//FullSimplify;
A[10]= -\[Delta] a[1] a[3] a[6] a[7] \[Lambda][2] . \[Lambda][7]+\[Lambda][6] . \[Lambda][7]+(-a[4] a[7]-\[Delta] a[3] a[5] a[6] a[7]-a[8]) \[Lambda][7] . \[Lambda][7]//.RR//FullSimplify;


Sol = Solve[{A[1]==0,A[2]==0,A[3]==0,A[4]==0,A[5]==0,A[6]==0,A[7]==0,A[8]==0,A[9]==0,A[10]==0},{a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10]}]//.schoutenA


F[i_,j_]:=D[A[i],a[j]];
Mat = Table[F[i,j],{i,1,10},{j,1,10}];
J = FullSimplify[Simplify[1/(Det[Mat])]*Spaa[2,7]^3//.Sol]//.schoutenA
Product[1/(a[i]),{i,1,10}]*J//.Sol


JacA = ((Spaa[1,7] Spaa[2,3])/(Spaa[1,3] Spaa[2,7]))^(-1);
JacB = ((Spaa[1,2] Spaa[3,7])/(Spaa[1,3] Spaa[2,7]))^(-1);


(* ::InheritFromParent:: *)
(**)


(* ::Subsection::Closed:: *)
(*8 pt MHV with cycle*)


(*Define C-matrices and lambda*)
CC={{\[Delta] a[1],1,\[Delta] a[1] a[6],\[Delta] a[1] a[3] a[6],\[Delta] a[1] a[3] a[6] (a[9]+a[7] a[10]),\[Delta] a[1] a[3] a[6] a[7],0},{\[Delta] a[1] a[2] a[5] a[6],0,\[Delta] a[5] a[6],a[4]+\[Delta] a[3] a[5] a[6],a[8] a[10]+a[4] (a[9]+a[7] a[10])+\[Delta] a[3] a[5] a[6] (a[9]+a[7] a[10]),a[4] a[7]+\[Delta] a[3] a[5] a[6] a[7]+a[8],1}};
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}]}], "0", "0", "0", "0", "0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "11", "]"}]}], "-", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "12", "]"}], "\[Delta]"}]}], "1", "0", "0", "0", "0", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "12", "]"}], "\[Delta]"}]},
{"0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}], "0", "1", "0", "0", "0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}], "0", "0", "1", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], "-", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}]}]},
{"0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}], " ", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "9", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "10", "]"}]}]}], ")"}]}], "0", "0", "0", "1", "0", 
RowBox[{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "8", "]"}]}], " ", 
RowBox[{"a", "[", "10", "]"}]}], "-", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "9", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "10", "]"}]}]}], ")"}]}], "-", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}], " ", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "9", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "10", "]"}]}]}], ")"}]}]}]},
{"0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}]}], "0", "0", "0", "0", "1", 
RowBox[{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], " ", 
RowBox[{"a", "[", "7", "]"}]}], "-", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}]}], "-", 
RowBox[{"a", "[", "8", "]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7],\[Lambda][8]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7],\[Lambda][8]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7],\[Lambda][8]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7],\[Lambda][8]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7],\[Lambda][8]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7],\[Lambda][8]}};
tlambda={{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]}};
(*Test transpose orthogonality*)
(*CC . Transpose[Cperp]=={{0,0,0,0,0},{0,0,0,0,0}};*)
Eq = Cperp . Transpose[lambda];
Eq[[1]][[1]]
Eq[[2]][[1]]
Eq[[3]][[1]]
Eq[[4]][[1]]
Eq[[5]][[1]]
Eq[[6]][[1]]


\[Delta] = 1/(1-a[1]a[2]a[6]);
A[1] = \[Lambda][1] . \[Lambda][2]-\[Delta] a[1] \[Lambda][2] . \[Lambda][2]-\[Delta] a[1] a[2] a[5] a[6] \[Lambda][8] . \[Lambda][2]//.RR//FullSimplify;
A[2] = \[Lambda][1] . \[Lambda][8]-\[Delta] a[1] \[Lambda][2] . \[Lambda][8]-\[Delta] a[1] a[2] a[5] a[6] \[Lambda][8] . \[Lambda][8]//.RR//FullSimplify;
A[3] = -(-a[11]-\[Delta] a[1] a[6] a[12]) \[Lambda][2] . \[Lambda][2]+\[Lambda][3] . \[Lambda][2]+\[Delta] a[5] a[6] a[12] \[Lambda][8] . \[Lambda][2]//.RR//FullSimplify;
A[4] = -(-a[11]-\[Delta] a[1] a[6] a[12]) \[Lambda][2] . \[Lambda][8]+\[Lambda][3] . \[Lambda][8]+\[Delta] a[5] a[6] a[12] \[Lambda][8] . \[Lambda][8]//.RR//FullSimplify;
A[5] = -\[Delta] a[1] a[6] \[Lambda][2] . \[Lambda][2]+\[Lambda][4] . \[Lambda][2]-\[Delta] a[5] a[6] \[Lambda][8] . \[Lambda][2]//.RR//FullSimplify;
A[6] = -\[Delta] a[1] a[6] \[Lambda][2] . \[Lambda][8]+\[Lambda][4] . \[Lambda][8]-\[Delta] a[5] a[6] \[Lambda][8] . \[Lambda][8]//.RR//FullSimplify;
A[7] = -\[Delta] a[1] a[3] a[6] \[Lambda][2] . \[Lambda][2]+\[Lambda][5] . \[Lambda][2]+(-a[4]-\[Delta] a[3] a[5] a[6]) \[Lambda][8] . \[Lambda][2]//.RR//FullSimplify;
A[8] = -\[Delta] a[1] a[3] a[6] \[Lambda][2] . \[Lambda][8]+\[Lambda][5] . \[Lambda][8]+(-a[4]-\[Delta] a[3] a[5] a[6]) \[Lambda][8] . \[Lambda][8]//.RR//FullSimplify;
A[9] = -\[Delta] a[1] a[3] a[6] (a[9]+a[7] a[10]) \[Lambda][2] . \[Lambda][2]+\[Lambda][6] . \[Lambda][2]+(-a[8] a[10]-a[4] (a[9]+a[7] a[10])-\[Delta] a[3] a[5] a[6] (a[9]+a[7] a[10])) \[Lambda][8] . \[Lambda][2]//.RR//FullSimplify;
A[10]= -\[Delta] a[1] a[3] a[6] (a[9]+a[7] a[10]) \[Lambda][2] . \[Lambda][8]+\[Lambda][6] . \[Lambda][8]+(-a[8] a[10]-a[4] (a[9]+a[7] a[10])-\[Delta] a[3] a[5] a[6] (a[9]+a[7] a[10])) \[Lambda][8] . \[Lambda][8]//.RR//FullSimplify;
A[11]= -\[Delta] a[1] a[3] a[6] a[7] \[Lambda][2] . \[Lambda][2]+\[Lambda][7] . \[Lambda][2]+(-a[4] a[7]-\[Delta] a[3] a[5] a[6] a[7]-a[8]) \[Lambda][8] . \[Lambda][2]//.RR//FullSimplify;
A[12]= -\[Delta] a[1] a[3] a[6] a[7] \[Lambda][2] . \[Lambda][8]+\[Lambda][7] . \[Lambda][8]+(-a[4] a[7]-\[Delta] a[3] a[5] a[6] a[7]-a[8]) \[Lambda][8] . \[Lambda][8]//.RR//FullSimplify;


Sol = Solve[{A[1]==0,A[2]==0,A[3]==0,A[4]==0,A[5]==0,A[6]==0,A[7]==0,A[8]==0,A[9]==0,A[10]==0,A[11]==0,A[12]==0},{a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10],a[11],a[12]}]//.schoutenA


F[i_,j_]:=D[A[i],a[j]];
Mat = Table[F[i,j],{i,1,12},{j,1,12}];
J = FullSimplify[Simplify[1/(Det[Mat])]*Spaa[2,8]^4//.Sol]//.schoutenA
Product[1/(a[i]),{i,1,12}]*J//.Sol


JacA = (Together[\[Delta]//.Sol[[1]]]//.schoutenA)^(-1)
JacB = (Together[1/(1-1/(a[1] a[2] a[6]))//.Sol[[1]]]//.schoutenA)^(-1)


(* ::InheritFromParent:: *)
(**)


(* ::Subsection::Closed:: *)
(*9 pt MHV with cycle*)


(*Define C-matrices and lambda*)
CC={{\[Delta] a[1],1,\[Delta] a[1] a[6],\[Delta] a[1] a[3] a[6],\[Delta] a[1] a[3] a[6] (a[9]+a[7] a[10]),\[Delta] a[1] a[3] a[6] a[7],0},{\[Delta] a[1] a[2] a[5] a[6],0,\[Delta] a[5] a[6],a[4]+\[Delta] a[3] a[5] a[6],a[8] a[10]+a[4] (a[9]+a[7] a[10])+\[Delta] a[3] a[5] a[6] (a[9]+a[7] a[10]),a[4] a[7]+\[Delta] a[3] a[5] a[6] a[7]+a[8],1}};
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}]}], "0", "0", "0", "0", "0", "0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "11", "]"}]}], "-", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "12", "]"}], "\[Delta]"}]}], "1", "0", "0", "0", "0", "0", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "12", "]"}], "\[Delta]"}]},
{"0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}], "0", "1", "0", "0", "0", "0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}], "0", "0", "1", "0", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], "-", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}]}]},
{"0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"(", 
RowBox[{
RowBox[{
RowBox[{"a", "[", "14", "]"}], 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "9", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "10", "]"}]}]}], ")"}]}], "+", 
RowBox[{"a", "[", "13", "]"}]}], ")"}]}], "0", "0", "0", "1", "0", "0", 
RowBox[{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "8", "]"}]}], " ", 
RowBox[{"a", "[", "10", "]"}], 
RowBox[{"a", "[", "14", "]"}]}], "-", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"(", 
RowBox[{
RowBox[{
RowBox[{"a", "[", "14", "]"}], 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "9", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "10", "]"}]}]}], ")"}]}], "+", 
RowBox[{"a", "[", "13", "]"}]}], ")"}]}], "-", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}], " ", 
RowBox[{"(", 
RowBox[{
RowBox[{
RowBox[{"a", "[", "14", "]"}], 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "9", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "10", "]"}]}]}], ")"}]}], "+", 
RowBox[{"a", "[", "13", "]"}]}], ")"}]}]}]},
{"0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}], " ", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "9", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "10", "]"}]}]}], ")"}]}], "0", "0", "0", "0", "1", "0", 
RowBox[{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "8", "]"}]}], " ", 
RowBox[{"a", "[", "10", "]"}]}], "-", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "9", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "10", "]"}]}]}], ")"}]}], "-", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}], " ", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "9", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "10", "]"}]}]}], ")"}]}]}]},
{"0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}]}], "0", "0", "0", "0", "0", "1", 
RowBox[{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], " ", 
RowBox[{"a", "[", "7", "]"}]}], "-", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}]}], "-", 
RowBox[{"a", "[", "8", "]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7],\[Lambda][8],\[Lambda][9]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7],\[Lambda][8],\[Lambda][9]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7],\[Lambda][8],\[Lambda][9]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7],\[Lambda][8],\[Lambda][9]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7],\[Lambda][8],\[Lambda][9]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7],\[Lambda][8],\[Lambda][9]},{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7],\[Lambda][8],\[Lambda][9]}};
tlambda={{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]}};
(*Test transpose orthogonality*)
(*CC . Transpose[Cperp]=={{0,0,0,0,0},{0,0,0,0,0}};*)
Eq = Cperp . Transpose[lambda];
Eq[[1]][[1]]
Eq[[2]][[1]]
Eq[[3]][[1]]
Eq[[4]][[1]]
Eq[[5]][[1]]
Eq[[6]][[1]]
Eq[[7]][[1]]


\[Delta] = 1/(1-a[1]a[2]a[6]);
A[1] = \[Lambda][1] . \[Lambda][2]-\[Delta] a[1] \[Lambda][2] . \[Lambda][2]-\[Delta] a[1] a[2] a[5] a[6] \[Lambda][9] . \[Lambda][2]//.RR//FullSimplify;
A[2] = \[Lambda][1] . \[Lambda][9]-\[Delta] a[1] \[Lambda][2] . \[Lambda][9]-\[Delta] a[1] a[2] a[5] a[6] \[Lambda][9] . \[Lambda][9]//.RR//FullSimplify;
A[3] = -(-a[11]-\[Delta] a[1] a[6] a[12]) \[Lambda][2] . \[Lambda][2]+\[Lambda][3] . \[Lambda][2]+\[Delta] a[5] a[6] a[12] \[Lambda][9] . \[Lambda][2]//.RR//FullSimplify;
A[4] = -(-a[11]-\[Delta] a[1] a[6] a[12]) \[Lambda][2] . \[Lambda][9]+\[Lambda][3] . \[Lambda][9]+\[Delta] a[5] a[6] a[12] \[Lambda][9] . \[Lambda][9]//.RR//FullSimplify;
A[5] = -\[Delta] a[1] a[6] \[Lambda][2] . \[Lambda][2]+\[Lambda][4] . \[Lambda][2]-\[Delta] a[5] a[6] \[Lambda][9] . \[Lambda][2]//.RR//FullSimplify;
A[6] = -\[Delta] a[1] a[6] \[Lambda][2] . \[Lambda][9]+\[Lambda][4] . \[Lambda][9]-\[Delta] a[5] a[6] \[Lambda][9] . \[Lambda][9]//.RR//FullSimplify;
A[7] = -\[Delta] a[1] a[3] a[6] \[Lambda][2] . \[Lambda][2]+\[Lambda][5] . \[Lambda][2]+(-a[4]-\[Delta] a[3] a[5] a[6]) \[Lambda][9] . \[Lambda][2]//.RR//FullSimplify;
A[8] = -\[Delta] a[1] a[3] a[6] \[Lambda][2] . \[Lambda][9]+\[Lambda][5] . \[Lambda][9]+(-a[4]-\[Delta] a[3] a[5] a[6]) \[Lambda][9] . \[Lambda][9]//.RR//FullSimplify;
A[9] = -\[Delta] a[1] a[3] a[6] (a[9]+a[7] a[10]) \[Lambda][2] . \[Lambda][2]+\[Lambda][7] . \[Lambda][2]+(-a[8] a[10]-a[4] (a[9]+a[7] a[10])-\[Delta] a[3] a[5] a[6] (a[9]+a[7] a[10])) \[Lambda][9] . \[Lambda][2]//.RR//FullSimplify;
A[10]= -\[Delta] a[1] a[3] a[6] (a[9]+a[7] a[10]) \[Lambda][2] . \[Lambda][9]+\[Lambda][7] . \[Lambda][9]+(-a[8] a[10]-a[4] (a[9]+a[7] a[10])-\[Delta] a[3] a[5] a[6] (a[9]+a[7] a[10])) \[Lambda][9] . \[Lambda][9]//.RR//FullSimplify;
A[11]= -\[Delta] a[1] a[3] a[6] a[7] \[Lambda][2] . \[Lambda][2]+\[Lambda][8] . \[Lambda][2]+(-a[4] a[7]-\[Delta] a[3] a[5] a[6] a[7]-a[8]) \[Lambda][9] . \[Lambda][2]//.RR//FullSimplify;
A[12]= -\[Delta] a[1] a[3] a[6] a[7] \[Lambda][2] . \[Lambda][9]+\[Lambda][8] . \[Lambda][9]+(-a[4] a[7]-\[Delta] a[3] a[5] a[6] a[7]-a[8]) \[Lambda][9] . \[Lambda][9]//.RR//FullSimplify;
A[13]= -\[Delta] a[1] a[3] a[6] (a[13]+(a[9]+a[7] a[10]) a[14]) \[Lambda][2] . \[Lambda][2]+\[Lambda][6] . \[Lambda][2]+(-a[8] a[10] a[14]-a[4] (a[13]+(a[9]+a[7] a[10]) a[14])-\[Delta] a[3] a[5] a[6] (a[13]+(a[9]+a[7] a[10]) a[14])) \[Lambda][9] . \[Lambda][2]//.RR//FullSimplify;
A[14]= -\[Delta] a[1] a[3] a[6] (a[13]+(a[9]+a[7] a[10]) a[14]) \[Lambda][2] . \[Lambda][9]+\[Lambda][6] . \[Lambda][9]+(-a[8] a[10] a[14]-a[4] (a[13]+(a[9]+a[7] a[10]) a[14])-\[Delta] a[3] a[5] a[6] (a[13]+(a[9]+a[7] a[10]) a[14])) \[Lambda][9] . \[Lambda][9]//.RR//FullSimplify;


Sol = Solve[{A[1]==0,A[2]==0,A[3]==0,A[4]==0,A[5]==0,A[6]==0,A[7]==0,A[8]==0,A[9]==0,A[10]==0,A[11]==0,A[12]==0,A[13]==0,A[14]==0},{a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10],a[11],a[12],a[13],a[14]}]//.schoutenA


F[i_,j_]:=D[A[i],a[j]];
Mat = Table[F[i,j],{i,1,14},{j,1,14}];
J = FullSimplify[Simplify[1/(Det[Mat])]*Spaa[2,9]^5//.Sol]//.schoutenA
Product[1/(a[i]),{i,1,14}]*J//.Sol


JacA = (Together[\[Delta]//.Sol[[1]]]//.schoutenA)^(-1)
JacB = (Together[1/(1-1/(a[1] a[2] a[6]))//.Sol[[1]]]//.schoutenA)^(-1)


(* ::InheritFromParent:: *)
(**)


(* ::Subsection::Closed:: *)
(*9 pt MHV with cycle, other config*)


(*Define C-matrices and lambda*)
CC={{\[Delta] a[1],1,\[Delta] a[1] a[6],\[Delta] a[1] a[3] a[6],\[Delta] a[1] a[3] a[6] (a[9]+a[7] a[10]),\[Delta] a[1] a[3] a[6] a[7],0},{\[Delta] a[1] a[2] a[5] a[6],0,\[Delta] a[5] a[6],a[4]+\[Delta] a[3] a[5] a[6],a[8] a[10]+a[4] (a[9]+a[7] a[10])+\[Delta] a[3] a[5] a[6] (a[9]+a[7] a[10]),a[4] a[7]+\[Delta] a[3] a[5] a[6] a[7]+a[8],1}};
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}]}], "0", "0", "0", "0", "0", "0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "13", "]"}]}], "-", 
RowBox[{
RowBox[{"a", "[", "11", "]"}], 
RowBox[{"a", "[", "14", "]"}]}], "-", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "12", "]"}], 
RowBox[{"a", "[", "14", "]"}]}]}], "1", "0", "0", "0", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "12", "]"}], 
RowBox[{"a", "[", "14", "]"}], "\[Delta]"}]},
{"0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "11", "]"}]}], "-", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "12", "]"}]}]}], "0", "1", "0", "0", "0", "0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "12", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}], "0", "0", "1", "0", "0", "0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "3", "]"}]}], "0", "0", "0", "1", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], "-", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}]}]},
{"0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}], " ", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "9", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "10", "]"}]}]}], ")"}]}], "0", "0", "0", "0", "1", "0", 
RowBox[{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "8", "]"}]}], " ", 
RowBox[{"a", "[", "10", "]"}]}], "-", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "9", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "10", "]"}]}]}], ")"}]}], "-", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}], " ", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "9", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "10", "]"}]}]}], ")"}]}]}]},
{"0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}]}], "0", "0", "0", "0", "0", "1", 
RowBox[{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], " ", 
RowBox[{"a", "[", "7", "]"}]}], "-", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}]}], "-", 
RowBox[{"a", "[", "8", "]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7],\[Lambda][8],\[Lambda][9]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
(*Test transpose orthogonality*)
(*CC . Transpose[Cperp]=={{0,0,0,0,0},{0,0,0,0,0}};*)
perpEQ = Cperp . Transpose[lambda]


\[Delta] = 1/(1-a[1]a[2]a[6]);
A[1] = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A[2] = TensorExpand[(perpEQ[[1]]) . \[Lambda][9]]//.RB//.RR//FullSimplify
A[3] = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A[4] = TensorExpand[(perpEQ[[2]]) . \[Lambda][9]]//.RB//.RR//FullSimplify
A[5] = TensorExpand[(perpEQ[[3]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A[6] = TensorExpand[(perpEQ[[3]]) . \[Lambda][9]]//.RB//.RR//FullSimplify
A[7] = TensorExpand[(perpEQ[[4]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A[8] = TensorExpand[(perpEQ[[4]]) . \[Lambda][9]]//.RB//.RR//FullSimplify
A[9] = TensorExpand[(perpEQ[[5]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A[10]= TensorExpand[(perpEQ[[5]]) . \[Lambda][9]]//.RB//.RR//FullSimplify
A[11]= TensorExpand[(perpEQ[[6]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A[12]= TensorExpand[(perpEQ[[6]]) . \[Lambda][9]]//.RB//.RR//FullSimplify
A[13]= TensorExpand[(perpEQ[[7]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A[14]= TensorExpand[(perpEQ[[7]]) . \[Lambda][9]]//.RB//.RR//FullSimplify


Sol = Solve[{A[1]==0,A[2]==0,A[3]==0,A[4]==0,A[5]==0,A[6]==0,A[7]==0,A[8]==0,A[9]==0,A[10]==0,A[11]==0,A[12]==0,A[13]==0,A[14]==0},{a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10],a[11],a[12],a[13],a[14]}]//.schoutenA


F[i_,j_]:=D[A[i],a[j]];
Mat = Table[F[i,j],{i,1,14},{j,1,14}];
J = FullSimplify[Simplify[1/(Det[Mat])]*Spaa[2,9]^6//.Sol]//.schoutenA
\[CapitalOmega] = Product[1/(a[i]),{i,1,14}]*J//.Sol[[1]]


JacA = (Together[\[Delta]//.Sol[[1]]]//.schoutenA)^(-1)
JacB = (Together[1/(1-1/(a[1] a[2] a[6]))//.Sol[[1]]]//.schoutenA)^(-1)


\[CapitalOmega]9 = Spaa[2,5]/(Spaa[1,2] Spaa[1,5] Spaa[2,3] Spaa[3,4] Spaa[4,5] Spaa[5,6] Spaa[6,7] Spaa[7,8] Spaa[8,9])(*\[CapitalOmega][[1]]*JacA^(-1)*)
sing = {Spaa[i_,5]->\[Alpha] Spaa[i,1]+\[Beta] Spaa[i,j],Spaa[5,i_]->\[Alpha] Spaa[1,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]9//.sing;
Residue[(\[CapitalOmega]9//.sing),{\[Beta],0}]//.Spaa[1,j]->1

sing2 = {Spaa[i_,1]->\[Alpha] Spaa[i,5]+\[Beta] Spaa[i,j],Spaa[1,i_]->\[Alpha] Spaa[5,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]6//.sing2;
Residue[(\[CapitalOmega]9//.sing2),{\[Beta],0}]//.Spaa[5,j]->1


(* ::Section::Closed:: *)
(*7-point NMHV N=0 *)


(* ::Subsection::Closed:: *)
(*7 pt 5+3 NMHV calculation,  one internal loop*)


CC={{a[7],1,(a[1]+a[2] a[5]\[Delta]) a[8],0,\[Delta] a[3] a[4] a[5] a[8],0,a[7] a[10]},{0,0,\[Delta] a[2] a[4],1,\[Delta] a[4],0,0},{a[6],0,\[Delta] a[2] a[5],0,\[Delta] a[3] a[4] a[5],1,a[9]+a[6] a[10]}};
Cperp ={{1,-a[7],0,0,0,-a[6],0},{0,-(a[1]+a[2] a[5]\[Delta])a[8],1,-\[Delta] a[2] a[4],0,-\[Delta] a[2] a[5],0},{0,-\[Delta] a[3] a[4] a[5] a[8],0,-\[Delta] a[4],1,-\[Delta] a[3] a[4] a[5],0},{0,-a[7] a[10],0,0,0,-a[9]-a[6] a[10],1}};
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6],t\[Lambda][7]};
CC . Transpose[Cperp]=={{0,0,0,0},{0,0,0,0},{0,0,0,0}}//Simplify;
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
\[Delta] = 1/(1-a[3] a[4]);


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[2]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[3]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[3]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A9 = TensorExpand[(perpEQ[[4]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A10= TensorExpand[(perpEQ[[4]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[1]]) . t\[Lambda][7]]//.RB//.RR//FullSimplify;
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;
B7 = TensorExpand[(CEQ[[3]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B8 = TensorExpand[(CEQ[[3]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B9 = TensorExpand[(CEQ[[3]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;
B10= TensorExpand[(CEQ[[3]]) . t\[Lambda][7]]//.RB//.RR//FullSimplify;


Solve[{A1==0,A2==0,A10==0,B5==0,B6==0,A6==0,A8==0,A9==0,A3==0,A5==0},{a[6],a[7],a[10],a[4],a[2],a[5],a[8],a[9],a[3],a[1]}]//.schoutenA//.schoutenB//.SPAB//FullSimplify


(*Solve[{A1\[Equal]0,A2\[Equal]0,A10\[Equal]0,B5\[Equal]0,B6\[Equal]0,A6\[Equal]0,A8\[Equal]0,A9\[Equal]0},{a[6],a[7],a[10],a[4],a[2],a[5],a[8],a[9]}]//.schoutenA//.schoutenB//.SPAB*)
a[6] = -(Spaa[1,2]/Spaa[2,6]);
a[7] = Spaa[1,6]/Spaa[2,6];
a[10]= -(Spaa[6,7]/Spaa[1,6]);
a[4] = -(Spab[2,P[3]+P[4]+P[5],4]/Spab[2,P[3]+P[4]+P[5],5]);
a[2] = Spbb[4,5]/Spbb[3,4];
a[5] = Spab[2,P[3]+P[4]+P[5],4]/(Spaa[2,6] Spbb[4,5]);
a[8] = -(Spab[6,P[3]+P[4]+P[5],3]/Spab[2,P[3]+P[4]+P[5],3]);
a[9] = Spaa[1,7]/Spaa[1,6];
a[3] = Spbb[4,5]/Spbb[3,4] Spab[2,P[3]+P[4]+P[5],3]/Spab[2,P[3]+P[4]+P[5],4];
a[1] = -s[3,4,5]/Spab[6,P[3]+P[4]+P[5],3];


(*\[Delta]a = 1/(1-a[3] a[4]);*)
EE[1] = A1;
EE[2] = A2;
EE[3] = A10;
EE[4] = B5;
EE[5] = B6;
EE[6] = A6;
EE[7] = A8;
EE[8] = A9;
EE[9] = A3;
EE[10]= A5;

BB[1] = A4;
BB[2] = A7;
BB[3] = B1;
BB[4] = B2;
BB[5] = B3;
BB[6] = B4;
BB[7] = B7;
BB[8] = B8;
BB[9] = B9;
BB[10]= B10;


Sol = {a[6] ->-(Spaa[1,2]/Spaa[2,6]),a[7] -> Spaa[1,6]/Spaa[2,6],a[10]-> -(Spaa[6,7]/Spaa[1,6]),a[4] -> -(Spab[2,P[3]+P[4]+P[5],4]/Spab[2,P[3]+P[4]+P[5],5]),a[2] -> Spbb[4,5]/Spbb[3,4],a[5] -> Spab[2,P[3]+P[4]+P[5],4]/(Spaa[2,6] Spbb[4,5]),a[8] -> -(Spab[6,P[3]+P[4]+P[5],3]/Spab[2,P[3]+P[4]+P[5],3]),a[9] -> Spaa[1,7]/Spaa[1,6],a[3] -> Spbb[4,5]/Spbb[3,4] Spab[2,P[3]+P[4]+P[5],3]/Spab[2,P[3]+P[4]+P[5],4],a[1] -> -s[3,4,5]/Spab[6,P[3]+P[4]+P[5],3]};


FF[i_,j_]:=D[BB[i],a[j]];
Mat2 = Table[FF[i,j],{i,1,10},{j,1,10}];
Det[Mat2]//FullSimplify


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,10},{j,1,10}];
J = Simplify[1/(Det[Mat])]//.Sol//FullSimplify


J = (Spab[2,P[3]+P[4]+P[5],4] Spbb[3,5])^5/(Spaa[1,6] Spaa[2,6]^5 Spab[2,P[3]+P[4]+P[5],4]^4 Spab[2,P[3]+P[4]+P[5],5]^2 Spab[6,P[3]+P[4]+P[5],3] Spbb[3,4]^3 Spbb[3,5]^2)


d\[CapitalOmega] = (Product[1/a[i],{i,1,10}])*J*Spbb[3,5]Spaa[2,6]^6*1/(Spbb[3,5]^4Spaa[2,6]^4)//.Sol//FullSimplify


-(Spbb[3,5]^3/(s[3,4,5] Spaa[1,2] Spaa[1,7] Spaa[2,6]^2 Spaa[6,7] Spab[2,P[3]+P[4]+P[5],5] Spab[6,P[3]+P[4]+P[5],3] Spbb[3,4] Spbb[4,5]))*Spaa[2,6]^2/Spbb[3,5]^3*Spbb[1,3]Spbb[3,5]^2Spaa[2,6]^3


DefNumSH[7]
TA[1] = A1//.SHtest//.NSpinHel;
TA[2] = A2//.SHtest//.NSpinHel;
TA[3] = A3//.SHtest//.NSpinHel;
TA[4] = A4//.SHtest//.NSpinHel;
TA[5] = A5//.SHtest//.NSpinHel;
TA[6] = A6//.SHtest//.NSpinHel;
TA[7] = A7//.SHtest//.NSpinHel;
TA[8] = A8//.SHtest//.NSpinHel;
TA[9] = A9//.SHtest//.NSpinHel;


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


perpEQ[[1]][[1]]//FullSimplify
perpEQ[[1]][[2]]//FullSimplify
perpEQ[[1]][[3]]//FullSimplify
perpEQ[[1]][[4]]//FullSimplify
CEQ //FullSimplify


(* ::Subsection::Closed:: *)
(*6 pt 5+3 NMHV calculation,  one internal loop*)


(*5+3 N=0 6 pt*)
(*\[Delta]a = 1/(1-a[3] a[4]);*)
\[Delta]a=((Spab[2,P[1]+P[2]+P[6],4] Spbb[3,5])/(Spab[2,P[1]+P[2]+P[6],5] Spbb[3,4]))^(-1);
CC={{a[7], 1,a[8](a[1]+a[5] a[2] (1+a[3] a[4] \[Delta]a)),0,a[8] a[5] a[3] a[4] \[Delta]a,0},{0,0,a[2] a[4] \[Delta]a,1,a[4] \[Delta]a,0},{a[6],0,a[5] a[2] \[Delta]a,0,a[5] a[3] a[4] \[Delta]a,1}};
Cperp ={{1,-a[7],0,0,0,-a[6]},{0,-(a[8](a[1]+a[5] a[2] (1+a[3] a[4] \[Delta]a))),1,-a[2] a[4] \[Delta]a,0,-a[5] a[2] \[Delta]a},{0,-a[8] a[5] a[3] a[4] \[Delta]a,0,-a[4] \[Delta]a,1,-a[5] a[3] a[4] \[Delta]a}};
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
CC . Transpose[Cperp];
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[2]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[3]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[3]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;
B6 = TensorExpand[(CEQ[[3]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B7 = TensorExpand[(CEQ[[3]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B8 = TensorExpand[(CEQ[[3]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;


(*Solve[{A1\[Equal]0,A2\[Equal]0,B4\[Equal]0,B5\[Equal]0,B8\[Equal]0,A8\[Equal]0,A6\[Equal]0},{a2,a3,a6,a7,a4,a5,a8}]//.schoutenA//.schoutenB
a[1] = s[6,1,2]/Spab[6,P[1]+P[2]+P[6],3];*)
a[2] = Spbb[4,5]/Spbb[3,4];
a[4] =- (Spab[2,P[1]+P[2]+P[6],4]/Spab[2,P[1]+P[2]+P[6],5]);
a[5] = -(Spab[2,P[1]+P[2]+P[6],4]/(Spaa[2,6] Spbb[4,5]));
a[6] = -(Spaa[1,2]/Spaa[2,6]);
a[7] = Spaa[1,6]/Spaa[2,6];
a[8] =- (Spab[6,P[1]+P[2]+P[6],3]/Spab[2,P[1]+P[2]+P[6],3]);
a[3] = Spbb[4,5]/Spbb[3,4] Spab[2,P[1]+P[2]+P[6],3]/Spab[2,P[1]+P[2]+P[6],4];


(*\[Delta]a = 1/(1-a[3] a[4]);*)
EE[1] = A1;
EE[2] = A2;
EE[3] = B4;
EE[4] = B5;
EE[5] = B8;
EE[6] = A6;
EE[7] = A8;
EE[8] = B1;


Sol = {a[1] -> s[6,1,2]/Spab[6,P[1]+P[2]+P[6],3],a[2] -> Spbb[4,5]/Spbb[3,4],a[4] -> - (Spab[2,P[1]+P[2]+P[6],4]/Spab[2,P[1]+P[2]+P[6],5]),a[5] -> -(Spab[2,P[1]+P[2]+P[6],4]/(Spaa[2,6] Spbb[4,5])), a[6] -> -(Spaa[1,2]/Spaa[2,6]), a[7] -> Spaa[1,6]/Spaa[2,6], a[8] ->- (Spab[6,P[1]+P[2]+P[6],3]/Spab[2,P[1]+P[2]+P[6],3]), a[3] -> Spbb[4,5]/Spbb[3,4] Spab[2,P[1]+P[2]+P[6],3]/Spab[2,P[1]+P[2]+P[6],4]};
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,8},{j,1,8}];
Simplify[1/(Det[Mat])]//.Sol//FullSimplify;
J = (Spab[2,P[1]+P[2]+P[6],4] Spbb[3,5])^5/(Spaa[2,6]^2 Spab[2,P[1]+P[2]+P[6],4]^4 Spab[2,P[1]+P[2]+P[6],5]^2 Spab[6,P[1]+P[2]+P[6],3] Spbb[1,3] Spbb[3,4]^3 Spbb[3,5]^3)


(* ::InheritFromParent:: *)
(**)


FF[i_,j_]:=D[BB[i],\[Eta][j]];
Mat2 = Table[FF[i,j],{i,1,8},{j,1,8}];
Det[Mat2]//FullSimplify


SEQ//.Sol//FullSimplify


(*Spbb[3,5]^8 from -(Spbb[4,5] \[Eta][3]-Spbb[3,5] \[Eta][4]+Spbb[3,4] \[Eta][5])/Spbb[3,5]
-Spaa[1,2] Spbb[3,5] \[Eta][1]+Spab[2,P[1]+P[2]+P[6],5] \[Eta][3]-Spab[2,P[1]+P[2]+P[6],3] \[Eta][5]+Spaa[2,6] Spbb[3,5]\[Eta][6] turns into
\[Lambda][1]\[Eta][1]+(P[1]+P[2]+P[6])\[Lambda][3] \[Eta][3]+Spab[2,P[1]+P[2]+P[6],3]\[Lambda][5] \[Eta][5]+\[Lambda][6]\[Eta][6]
*)


\[Delta]a=((Spab[2,P[1]+P[2]+P[6],4] Spbb[3,5])/(Spab[2,P[1]+P[2]+P[6],5] Spbb[3,4]))^(-1);


d\[CapitalOmega] = Product[1/a[i],{i,1,8}]*Spbb[1,3]Spbb[3,5]^2Spaa[2,6]^3*1/(Spbb[3,5]^4Spaa[2,6]^4)*J//.Sol
(*J=(Spab[2,P[1]+P[2]+P[6],4] Spbb[3,5])/(Spab[2,P[1]+P[2]+P[6],5] Spbb[3,4]);
d\[CapitalOmega] * J^(-4);*)


1/(Spaa[2,6] Spbb[3,4]) (Spbb[3,4] (Spaa[1,6] \[Eta][1]+Spaa[2,6] \[Eta][2])+Spab[6,P[1]+P[2]+P[6],4] \[Eta][3]-(Spab[6,P[1]+P[2]+P[6],3] (Spbb[4,5] \[Eta][3]+Spbb[3,4] \[Eta][5]))/Spbb[3,5])


(* ::InheritFromParent:: *)
(*(1/(Spaa[2,6] Spbb[3,4]))(Spbb[3,4] (Spaa[1,6] \[Eta][1]+Spaa[2,6] \[Eta][2])+Spab[6,P[3]+P[5],4] \[Eta][3]-1/Spbb[3,5]Spab[6,P[4]+P[5],3] (Spbb[4,5] \[Eta][3]+Spbb[3,4] \[Eta][5]))*)


Spab[6,P[3]+P[5],4] \[Eta][3]+Spab[6,P[4]+P[5],3] (Spbb[3,5] \[Eta][4])


(* ::InheritFromParent:: *)
(*Spaa[6,3]Spbb[3,4]\[Eta][3] +Spaa[6,5]Spbb[3,5]\[Eta][3]+*)
(*Spaa[6,4]Spbb[3,4]\[Eta][4] +Spaa[6,5]Spbb[3,5]\[Eta][4]*)


Spaa[6,3]Spbb[3,4]\[Eta][3]+Spaa[6,5]Spbb[3,4]\[Eta][5]+Spaa[6,4]Spbb[3,4]\[Eta][4] 


(* ::Subsection::Closed:: *)
(*6 pt  MHV calculation,  one internal loop (double pentagon)*)


CC={{(a[4] a[8])/(1-a[3] a[4]),a[2]+(a[1] a[4] a[8])/(1-a[3] a[4]),1,a[4]/(1-a[3] a[4]),(a[4] a[5])/(1-a[3] a[4]),0},{(a[3] a[4] a[7] a[8])/(1-a[3] a[4]),(a[1] a[3] a[4] a[7] a[8])/(1-a[3] a[4]),0,a[7]/(1-a[3] a[4]),a[6]+(a[5] a[7])/(1-a[3] a[4]),1}};
Cperp ={{1,0,-\[Delta] a[4] a[8],0,0,-\[Delta] a[3] a[4] a[7] a[8]},{0,1,-a[2]-\[Delta] a[1] a[4] a[8],0,0,-\[Delta] a[1] a[3] a[4] a[7] a[8]},{0,0,-\[Delta] a[4],1,0,-\[Delta] a[7]},{0,0,-\[Delta] a[4] a[5],0,1,-a[6]-\[Delta] a[5] a[7]}};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda]
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]};
SEQ = CC . Transpose[eta];
\[Delta] = 1/(1-a[3] a[4]);


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[4]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[4]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;


Sol = FullSimplify[Solve[{A1==0,A2==0,A3==0,A4==0,A5==0,A6==0,A7==0,A8==0},{a[6],a[4],a[2],a[5],a[8],a[3],a[1],a[7]}]//.schoutenA]//.schoutenA


FullSimplify[FullSimplify[CEQ[[2]]//.Sol]//.schoutenA]//.schoutenA//Simplify


(* ::InheritFromParent:: *)
(**)


(* ::InheritFromParent:: *)
(**)


(* ::InheritFromParent:: *)
(**)


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A4;
EE[5] = A5;
EE[6] = A6;
EE[7] = A7;
EE[8] = A8;


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,8},{j,1,8}];
J = Simplify[1/(Det[Mat])]//.Sol//FullSimplify;
J = J[[1]]//.schoutenA;
Jac = (Together[FullSimplify[\[Delta]//.Sol]]//.schoutenA//Simplify)^(-1)


\[CapitalOmega] = Product[1/a[i],{i,1,8}]*J*Spaa[3,6]^3//.Sol
\[CapitalOmega]*Jac^(-1)


(* ::Section:: *)
(*5/6-point NMHV N=3*)


(* ::Subsection::Closed:: *)
(*5 pt NMHV calculation,  one internal loop*)


\[Delta] = 1/(1-a[3] a[5]a[6]);
CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"a", "[", "1", "]"}], "+", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "2", "]"}]}]}], "1", "0", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " "}], "0"},
{
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}]}], "0", "1", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "5", "]"}]}], "0"},
{
RowBox[{
RowBox[{"a", "[", "4", "]"}], "\[Delta]"}], "0", "0", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], "+", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "2", "]"}]}]}], ")"}]}], 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}]}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], "\[Delta]"}]},
{"0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}], ")"}]}], 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}], "1", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda]
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[1]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[2]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[2]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify
B3 = TensorExpand[(CEQ[[2]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify
B5 = TensorExpand[(CEQ[[3]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify
B6 = TensorExpand[(CEQ[[3]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify


Sol = Solve[{B5==0,B6==0,B3==0,B1==0,B4==0,B2==0},{a[4],a[5],a[3],a[6],a[2],a[1]}]//.schoutenA//.schoutenB//.SPAB//.{Spab[5,P[2]+P[4],1]->-Spaa[5,3]Spbb[3,1],Spab[2,P[1]+P[5],4]->-Spaa[2,3]Spbb[3,4]}//FullSimplify


(*\[Delta]a = 1/(1-a[3] a[4]);*)
EE[1] = B1;
EE[2] = B2;
EE[3] = B3;
EE[4] = B4;
EE[5] = B5;
EE[6] = B6;


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,6},{j,1,6}];
J = (FullSimplify[Simplify[1/(Det[Mat])]//.Sol[[1]]]//.schoutenB//Simplify)*Spbb[1,4]^2
Jac = Together[(1/\[Delta])//.Sol[[1]]]//.schoutenB


\[CapitalOmega] = Product[1/a[i],{i,1,6}]*J//.Sol//Simplify
\[CapitalOmega]6 = \[CapitalOmega]*Jac^(-1)


(* ::InheritFromParent:: *)
(*{-(Spbb[1,3]/(Spbb[1,2] Spbb[1,5] Spbb[2,3] Spbb[3,4] Spbb[3,5]))}*)


(* ::Subsection::Closed:: *)
(*6 pt NMHV calculation,  one internal loop (inside pentagon)*)


(* ::Subsubsection::Closed:: *)
(*Full diagram*)


\[Delta] = 1/(1-a[1]a[2]a[3]);
CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], "0"},
{"0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], "\[Delta]"}], "1", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], "0"},
{"0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}]}], 
RowBox[{
RowBox[{"a", "[", "8", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}]}], ")"}]}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], "\[Delta]"}], "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], "\[Delta]"}], "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}]},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"a", "[", "4", "]"}], "\[Delta]"}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], "\[Delta]"}], "1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], "-", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}]}]},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], "0", "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "8", "]"}]}], "-", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}]}], ")"}]}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
CC . Transpose[Cperp];
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]};
SEQ = CC . Transpose[eta];


A1 = FullSimplify[TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR];
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[1]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[2]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[2]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[3]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[3]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A9 = TensorExpand[(perpEQ[[3]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;
B7 = TensorExpand[(CEQ[[3]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B8 = TensorExpand[(CEQ[[3]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B9 = TensorExpand[(CEQ[[3]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;


StringReplace[StringReplace[StringReplace[StringReplace[StringReplace[ToString[B1],latexto2],latexto3],latexto4],latexto7],latexto8]
"\\\\"
StringReplace[StringReplace[StringReplace[StringReplace[StringReplace[ToString[B2],latexto2],latexto3],latexto4],latexto7],latexto8]
"\\\\"
StringReplace[StringReplace[StringReplace[StringReplace[StringReplace[ToString[B3],latexto2],latexto3],latexto4],latexto7],latexto8]
"\\\\"
StringReplace[StringReplace[StringReplace[StringReplace[StringReplace[ToString[B4],latexto2],latexto3],latexto4],latexto7],latexto8]
"\\\\"
StringReplace[StringReplace[StringReplace[StringReplace[StringReplace[ToString[B5],latexto2],latexto3],latexto4],latexto7],latexto8]
"\\\\"
StringReplace[StringReplace[StringReplace[StringReplace[StringReplace[ToString[B6],latexto2],latexto3],latexto4],latexto7],latexto8]
"\\\\"
StringReplace[StringReplace[StringReplace[StringReplace[StringReplace[ToString[B7],latexto2],latexto3],latexto4],latexto7],latexto8]
"\\\\"
StringReplace[StringReplace[StringReplace[StringReplace[StringReplace[ToString[B8],latexto2],latexto3],latexto4],latexto7],latexto8]


a[1]=Spbb[2,3]/Spbb[1,3];
a[2]=-((Spbb[1,2]/Spbb[1,3]))^(-1);
a[3]=(Spab[6,P[4]+P[5]+P[6],1]/Spab[6,P[4]+P[5]+P[6],3]);
a[4]=(Spaa[4,6] Spbb[1,3])/Spab[6,P[4]+P[5]+P[6],1];
a[5]=(Spab[6,P[4]+P[5]+P[6],1]/Spab[4,P[4]+P[5]+P[6],1])^(-1);
a[6]=s[4,5,6]/Spab[6,P[4]+P[5]+P[6],1];
a[7]=Spaa[5,6]/Spaa[4,6];
a[8]=Spaa[4,5]/Spaa[4,6];


DefNumSH[6]


Simplify[Together[Collect[FullSimplify[Together[FullSimplify[perpEQ[[2]]]]//.schoutenLong],\[Lambda][6]]//.schoutenLong]]


Together[Collect[Simplify[Together[FullSimplify[SEQ[[1]]]]//.schoutenLong],\[Eta][1]]//.schoutenLong]
Together[Collect[Simplify[Together[FullSimplify[SEQ[[2]]]]//.schoutenLong],\[Eta][3]]//.schoutenLong]
A = Collect[Simplify[Together[FullSimplify[SEQ[[3]]]]//.schoutenLong],\[Eta][4]];
FullSimplify[Coefficient[A,\[Eta][4]]]//.schoutenLong;
B = Collect[Simplify[Spab[4,P[4]+P[5]+P[6],2]/Spab[6,P[4]+P[5]+P[6],2] \[Eta][4]+(-s[4,5,6] Spaa[4,6] Spab[6,P[4]+P[5]+P[6],1] Spbb[1,3] \[Eta][2]+Spaa[5,6] Spbb[1,2] (Spab[4,P[4]+P[5]+P[6],1] Spab[6,P[4]+P[5]+P[6],3]+s[4,5,6] Spaa[4,6] Spbb[1,3]) \[Eta][5]+Spaa[5,6] Spab[4,P[4]+P[5]+P[6],1] Spab[6,P[4]+P[5]+P[6],1] Spbb[2,3] \[Eta][5]+Spab[6,P[4]+P[5]+P[6],1] Spab[6,P[4]+P[5]+P[6],3] Spbb[1,2] (Spaa[4,5] \[Eta][5]+Spaa[4,6] \[Eta][6])+Spab[6,P[4]+P[5]+P[6],1]^2 Spbb[2,3] (Spaa[4,5] \[Eta][5]+Spaa[4,6] \[Eta][6]))/(Spaa[4,6] Spab[6,P[4]+P[5]+P[6],1] Spab[6,P[4]+P[5]+P[6],2] Spbb[1,3])],\[Eta][5]];
FullSimplify[Coefficient[A,\[Eta][5]]]//.schoutenLong;
CC = FullSimplify[(Collect[Simplify[Spab[5,P[4]+P[5]+P[6],2]/Spab[6,P[4]+P[5]+P[6],2] \[Eta][5]+(-s[4,5,6] Spaa[4,6] Spab[6,P[4]+P[5]+P[6],1] Spbb[1,3] \[Eta][2]+Spaa[4,6] Spab[4,P[4]+P[5]+P[6],2] Spab[6,P[4]+P[5]+P[6],1] Spbb[1,3] \[Eta][4]+Spaa[4,6] Spab[6,P[4]+P[5]+P[6],1] Spab[6,P[4]+P[5]+P[6],3] Spbb[1,2] \[Eta][6]+Spaa[4,6] Spab[6,P[4]+P[5]+P[6],1]^2 Spbb[2,3] \[Eta][6])/(Spaa[4,6] Spab[6,P[4]+P[5]+P[6],1] Spab[6,P[4]+P[5]+P[6],2] Spbb[1,3])],\[Eta][6]]//.schoutenLong)*Spab[6,P[4]+P[5]+P[6],2]];
DD = s[1,2,3] \[Eta][2]+Spab[4,P[5]+P[6],2] \[Eta][4]+Spab[5,P[4]+P[6],2] \[Eta][5]+Spab[6,P[4]+P[5],2] \[Eta][6]


(Spab[6,P[4]+P[5]+P[6],3] Spbb[1,2]+Spab[6,P[4]+P[5]+P[6],1] Spbb[2,3])/(Spab[6,P[4]+P[5]+P[6],2] Spbb[1,3])//.schoutenLong


(* ::InheritFromParent:: *)
(*(s[4,5,6] Spaa[5,6] Spbb[1,2] Spbb[1,3]+Spab[5,P[4]+P[5]+P[6],1] (Spab[6,P[4]+P[5]+P[6],2] Spbb[1,3]))/(Spab[6,P[4]+P[5]+P[6],1] Spab[6,P[4]+P[5]+P[6],2] Spbb[1,3])*)


(* ::InheritFromParent:: *)
(**)


(* ::InheritFromParent:: *)
(*(Spaa[4,6] Spbb[1,2] (Spab[5,P[4]+P[5]+P[6],1] Spab[6,P[4]+P[5]+P[6],3]+s[4,5,6] Spaa[5,6] Spbb[1,3])+Spab[6,P[4]+P[5]+P[6],1] (Spaa[4,6] Spab[5,P[4]+P[5]+P[6],1]) Spbb[2,3])/(Spaa[4,6] Spab[6,P[4]+P[5]+P[6],1] Spab[6,P[4]+P[5]+P[6],2] Spbb[1,3])*)


(* ::InheritFromParent:: *)
(**)


TA[1] = A1//.SHtest//.NSpinHel;
TA[2] = A2//.SHtest//.NSpinHel;
TA[3] = A3//.SHtest//.NSpinHel;
TA[4] = A4//.SHtest//.NSpinHel;
TA[5] = A5//.SHtest//.NSpinHel;
TA[6] = A6//.SHtest//.NSpinHel;
TA[7] = A7//.SHtest//.NSpinHel;
TA[8] = A8//.SHtest//.NSpinHel;
TA[9] = A9//.SHtest//.NSpinHel;

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


EE[1] = A3;
EE[2] = A5;
EE[3] = B2;
EE[4] = A8;
EE[5] = B3;
EE[6] = B6;
EE[7] = B5;
EE[8] = B8;
(*A2,A6,B3,A9,*)


\[Delta] = (Spab[6,P[4]+P[5]+P[6],3] Spbb[1,2])/(Spab[6,P[4]+P[5]+P[6],2] Spbb[1,3]);
Jac = ((Spab[6,P[4]+P[5]+P[6],3] Spbb[1,2])/(Spab[6,P[4]+P[5]+P[6],2] Spbb[1,3]))^(-1);


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,8},{j,1,8}];
J = 1/Det[Mat]//FullSimplify


(-1+a[1] a[2] a[3])^6/(a[2]^3 a[3]^4 a[4]^2 Spaa[1,3] Spaa[3,6] (Spaa[1,6]+a[1] a[2] Spaa[3,6]) Spbb[2,4]^2 Spbb[2,5]^2 (Spbb[2,4]+a[7] Spbb[2,5]))


J=(Spab[6,P[4]+P[5]+P[6],2]^4 Spbb[1,3])/(Spaa[1,3] Spaa[3,6] Spaa[4,6] Spab[6,P[4]+P[5]+P[6],1]^2 Spab[6,P[4]+P[5]+P[6],3]^2 Spbb[1,2]^2 Spbb[2,4]^2 Spbb[2,5]^2);


(* ::InheritFromParent:: *)
(**)


(* ::InheritFromParent:: *)
(**)


(* ::InheritFromParent:: *)
(**)


Jac


\[CapitalOmega] = Product[1/a[i],{i,1,8}]*J*Spaa[1,3] Spaa[3,6]Spbb[2,4]^2 Spbb[2,5]^2/Spab[6,P[4]+P[5]+P[6],2]^3
\[CapitalOmega]6 =\[CapitalOmega]*Jac^(-1)
\[Omega] = \[CapitalOmega]6//.{s[4,5,6]->s[1,2,3],Spab[4,P[4]+P[5]+P[6],1]->Spab[4,P[1]+P[2]+P[3],1]}//.SHtest//FullSimplify
sing = {Spbb[i_,3]->\[Alpha] Spbb[i,1]+\[Beta] Spbb[i,j],Spbb[3,i_]->\[Alpha] Spbb[1,i]+\[Beta] Spbb[j,i]};
\[Omega]//.sing//FullSimplify
Residue[(\[Omega]//.sing),{\[Beta],0}]//.Spbb[1,j]->1//FullSimplify


Residue[(Spbb[2,3]\[Eta][1]//.sing),{\[Beta],0}]
Spbb[2,3]\[Eta][1]//.sing


-(Spab[6,P[4]+P[5]+P[6],2]/(s[4,5,6] Spaa[4,5] Spaa[5,6] Spab[4,P[4]+P[5]+P[6],1] Spab[6,P[4]+P[5]+P[6],3] Spbb[1,2] Spbb[2,3]))*Jac^(-1)


(* ::Subsubsection::Closed:: *)
(*Residue diagram*)


(*Now to check the residue graph*)
CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{"a", "[", "1", "]"}], "0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], "0"},
{"0", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "1", "]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "7", "]"}]}], "0"},
{"0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]}], 
RowBox[{
RowBox[{"a", "[", "6", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]}], ")"}]}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "7", "]"}]}], 
RowBox[{"a", "[", "1", "]"}]}], "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "4", "]"}]}]},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}]}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "7", "]"}]}], 
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}]}], "1", "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]}], ")"}]}]},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "7", "]"}]}], 
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], "0", "1", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "6", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]}], ")"}]}]}], ")"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
CC . Transpose[Cperp];
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[1]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[2]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[2]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[3]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[3]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A9 = TensorExpand[(perpEQ[[3]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;
B7 = TensorExpand[(CEQ[[3]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B8 = TensorExpand[(CEQ[[3]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B9 = TensorExpand[(CEQ[[3]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;


StringReplace[StringReplace[StringReplace[StringReplace[StringReplace[ToString[A1],latexto2],latexto3],latexto4],latexto7],latexto8]
"\\\\"
StringReplace[StringReplace[StringReplace[StringReplace[StringReplace[ToString[A2],latexto2],latexto3],latexto4],latexto7],latexto8]
"\\\\"
StringReplace[StringReplace[StringReplace[StringReplace[StringReplace[ToString[A3],latexto2],latexto3],latexto4],latexto7],latexto8]
"\\\\"
StringReplace[StringReplace[StringReplace[StringReplace[StringReplace[ToString[A4],latexto2],latexto3],latexto4],latexto7],latexto8]
"\\\\"
StringReplace[StringReplace[StringReplace[StringReplace[StringReplace[ToString[A5],latexto2],latexto3],latexto4],latexto7],latexto8]
"\\\\"
StringReplace[StringReplace[StringReplace[StringReplace[StringReplace[ToString[A6],latexto2],latexto3],latexto4],latexto7],latexto8]
"\\\\"
StringReplace[StringReplace[StringReplace[StringReplace[StringReplace[ToString[A7],latexto2],latexto3],latexto4],latexto7],latexto8]
"\\\\"
StringReplace[StringReplace[StringReplace[StringReplace[StringReplace[ToString[A8],latexto2],latexto3],latexto4],latexto7],latexto8]
"\\\\"
StringReplace[StringReplace[StringReplace[StringReplace[StringReplace[ToString[A9],latexto2],latexto3],latexto4],latexto7],latexto8]


Sol = Together[Simplify[Simplify[Solve[{A1==0,A2==0,A4==0,A5==0,A7==0,A8==0},{a[1],a[4],a[3],a[5],a[6],a[2]}]//.schoutenA]//.schoutenA]]


FullSimplify[SEQ[[1]]//.Sol[[1]]]*(Spaa[1,6]+a[7] Spaa[3,6])
FullSimplify[SEQ[[2]]//.Sol[[1]]]*1/a[7]*(Spaa[1,6]+a[7] Spaa[3,6])//Simplify
(FullSimplify[SEQ[[1]]//.Sol[[1]]]*(Spaa[1,6]+a[7] Spaa[3,6])//.Spaa[i_,j_]->\[Lambda][i]\[Lambda][j])*1/\[Lambda][6]//FullSimplify
(FullSimplify[SEQ[[2]]//.Sol[[1]]]*1/a[7]*(Spaa[1,6]+a[7] Spaa[3,6])//.Spaa[i_,j_]->\[Lambda][i]\[Lambda][j])*1/\[Lambda][6]//FullSimplify
Collect[FullSimplify[SEQ[[3]]//.Sol[[1]]],\[Eta][4]];
FullSimplify[Expand[TensorExpand[(FullSimplify[(((Spaa[1,2]-a[7] Spaa[2,3]) \[Eta][2])/(Spaa[1,6]+a[7] Spaa[3,6])+((Spaa[1,4]+a[7] Spaa[3,4]) \[Eta][4])/(Spaa[1,6]+a[7] Spaa[3,6])+(Spaa[1,5]+a[7] Spaa[3,5])/(Spaa[1,6]+a[7] Spaa[3,6]) \[Eta][5]+\[Eta][6])*(Spaa[1,6]+a[7] Spaa[3,6])]//.Spaa[i_,j_]->\[Lambda][i]\[Lambda][j]) . \[Lambda][3]]]]//.RB//.RR


(* ::InheritFromParent:: *)
(*\[Eta][2] \[Lambda][2]+\[Eta][3] (\[Lambda][1]/a[7]+\[Lambda][3])+\[Eta][4] \[Lambda][4]+\[Eta][5] \[Lambda][5]*)


(* ::InheritFromParent:: *)
(*((Spaa[1,2]-a[7] Spaa[2,3]) \[Eta][2])/(Spaa[1,6]+a[7] Spaa[3,6])+((Spaa[1,4]+a[7] Spaa[3,4]) \[Eta][4])/(Spaa[1,6]+a[7] Spaa[3,6])+((Spaa[1,5]+a[7] Spaa[3,5])/(Spaa[1,6]+a[7] Spaa[3,6])) \[Eta][5]+\[Eta][6]*)


(Collect[Spaa[1,5] Spaa[2,6]+a[7] Spaa[2,5] Spaa[3,6]-a[7] Spaa[2,3] Spaa[5,6],a[7]]//.schoutenA)/(Spaa[2,6] (Spaa[1,6]+a[7] Spaa[3,6]))//Simplify


(* ::InheritFromParent:: *)
(**)


(* ::InheritFromParent:: *)
(**)


FullSimplify[CEQ[[1]]//.Sol[[1]]]*(Spaa[1,6]+a[7] Spaa[3,6])
Collect[FullSimplify[CEQ[[2]]//.Sol[[1]]]*(Spaa[1,6]+a[7] Spaa[3,6]),t\[Lambda][3]]
Together[FullSimplify[CEQ[[3]]]//.Sol]


EE[1] = A1;
EE[2] = A2;
EE[3] = A4;
EE[4] = A5;
EE[5] = A7;
EE[6] = A8;
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,6},{j,1,6}];
J = 1/Det[Mat]//FullSimplify


(* ::InheritFromParent:: *)
(**)


Product[1/(a[i]),{i,1,7}]*J*Spaa[1,3]^3/(Spaa[1,6]+a[7]Spaa[3,6])//.Sol[[1]]
1/(\[Alpha] (Spaa[1,2]-\[Alpha] Spaa[2,3]) Spaa[2,4] Spaa[4,5] Spaa[5,6] Spbb[1,2]^3)


(* ::Subsection::Closed:: *)
(*6 pt NMHV calculation,  hexagon*)


(*\[Delta] = 1/(1-a[7] a[8])*)
CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "8", "]"}], 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], "+", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}], " "}]}], "1", "0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}], "0"},
{
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "8", "]"}]}], 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "6", "]"}]}], "0", "1", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}], "0"},
{
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}], 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "6", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "7", "]"}]}], "0", "0", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "5", "]"}], " ", "\[Delta]"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", "0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "8", "]"}], 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "8", "]"}]}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}]},
{"0", "1", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], "+", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}]}], ")"}]}], 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}], "0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "6", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "7", "]"}]}]},
{"0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "8", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}], "1", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "5", "]"}], " ", "\[Delta]"}]}], ")"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda]
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][3]]//.RB//.RR//FullSimplify
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify
A3 = TensorExpand[(perpEQ[[1]]) . \[Lambda][6]]//.RB//.RR//FullSimplify
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][3]]//.RB//.RR//FullSimplify
A5 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify
A6 = TensorExpand[(perpEQ[[2]]) . \[Lambda][6]]//.RB//.RR//FullSimplify
A7 = TensorExpand[(perpEQ[[3]]) . \[Lambda][3]]//.RB//.RR//FullSimplify
A8 = TensorExpand[(perpEQ[[3]]) . \[Lambda][4]]//.RB//.RR//FullSimplify
A9 = TensorExpand[(perpEQ[[3]]) . \[Lambda][6]]//.RB//.RR//FullSimplify

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify
B7 = TensorExpand[(CEQ[[3]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify
B8 = TensorExpand[(CEQ[[3]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify
B9 = TensorExpand[(CEQ[[3]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify


Sol = Together[FullSimplify[Simplify[Solve[{A5==0,B7==0},{a[1],a[5]}]]//.schoutenA//.schoutenB]]


(*Sol = Together[FullSimplify[Simplify[Solve[{B6\[Equal]0,B5\[Equal]0,B9\[Equal]0,A1\[Equal]0,A3\[Equal]0},{a[8],a[3],a[7],a[6],a[2]}]]//.schoutenA//.schoutenB]]*)
a[8] = (Spaa[1,3] Spbb[4,5])/(\[Delta] Spab[3,P[1]+P[2]+P[3],5])
a[3] = -(Spab[3,P[1]+P[2]+P[3],4]/(Spaa[1,3] Spbb[4,5]))
a[2] =Spab[1,P[1]+P[2]+P[3],5]/(Spaa[1,3] Spbb[4,5])
a[6] = -((Spaa[2,3] Spbb[4,5])/(\[Delta] Spab[3,P[1]+P[2]+P[3],5]))
a[7] = -(Spbb[5,6]/(a[5] Spbb[4,5]))
a[1] = -(Spaa[1,2]/Spaa[1,3]); (*maybe a sign error*)


-((Spaa[1,2] Spab[3,P[1]+P[2]+P[3],5])/(Spaa[1,3] Spab[3,P[1]+P[2]+P[3],5]))


Spaa[2,3] Spaa[1,7]-Spaa[1,3] Spaa[2,7]//.schoutenA


(*\[Delta]a = 1/(1-a[3] a[4]);*)
EE[1] = B1;
EE[2] = B2;
EE[3] = B3;
EE[4] = B4;
EE[5] = B5;
EE[6] = B6;


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,6},{j,1,6}];
J = (FullSimplify[Simplify[1/(Det[Mat])]//.Sol[[1]]]//.schoutenB//Simplify)*Spbb[1,4]^2
Jac = Together[(1/\[Delta])//.Sol[[1]]]//.schoutenB


\[CapitalOmega] = Product[1/a[i],{i,1,6}]*J//.Sol//Simplify
\[CapitalOmega]6 = \[CapitalOmega]*Jac^(-1)


(* ::InheritFromParent:: *)
(*{-(Spbb[1,3]/(Spbb[1,2] Spbb[1,5] Spbb[2,3] Spbb[3,4] Spbb[3,5]))}*)


(* ::Subsection::Closed:: *)
(*6 pt NMHV calculation,  hexagon (3 black/white)*)


(* ::Subsubsection::Closed:: *)
(*Before residue*)


(*\[Delta] = 1/(1-a[7] a[8])*)
CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", "\[Delta]"}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"a", "[", "6", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], " ", "\[Delta]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], " ", "\[Delta]"}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}], "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"a", "[", "7", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "6", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], " ", "\[Delta]"}]}], ")"}]}], "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], " ", "\[Delta]"}], "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}]}], ")"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
CC . Transpose[Cperp];
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]};
SEQ = CC . Transpose[eta];


SEQ[[2]]


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[1]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[2]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[2]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[3]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[3]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A9 = TensorExpand[(perpEQ[[3]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;
B7 = TensorExpand[(CEQ[[3]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B8 = TensorExpand[(CEQ[[3]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B9 = TensorExpand[(CEQ[[3]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;


\[Delta] = 1/(1-(a[2]a[4]a[7]a[8]))//Together



Simplify[\[Delta]//.SHtest//.NSpinHel]
Simplify[ (Spab[2,P[1]+P[5]+P[6],6] Spab[3,P[1]+P[5]+P[6],1])/(Spab[2,P[1]+P[5]+P[6],1] Spab[3,P[1]+P[5]+P[6],6])//.SHtest//.NSpinHel]


\[Delta] = (Spab[2,P[1]+P[5]+P[6],6] Spab[3,P[1]+P[5]+P[6],1])/(Spab[2,P[1]+P[5]+P[6],1] Spab[3,P[1]+P[5]+P[6],6])


\[Delta]1 =(s[1,5,6] Spaa[2,3] Spbb[1,6])/(-Spab[2,P[1]+P[5]+P[6],1] Spab[3,P[1]+P[5]+P[6],6])


a[7] = (Spbb[5,6]/Spbb[1,6])^(-1);
a[8] = -(Spaa[3,4]/Spaa[2,3])^(-1);
a[1] = -(Spab[2,P[1]+P[5]+P[6],1]/Spab[2,P[1]+P[5]+P[6],6]);
a[2] = -(s[1,5,6]/Spab[2,P[1]+P[5]+P[6],1])^(1);
a[5] = -(Spab[2,P[1]+P[5]+P[6],5]/Spab[2,P[1]+P[5]+P[6],6]);
a[3] = Spab[2,P[1]+P[5]+P[6],1]/Spab[3,P[1]+P[5]+P[6],1];
a[4] =((Spab[2,P[1]+P[5]+P[6],6] Spab[3,P[1]+P[5]+P[6],1])/(Spaa[3,4] Spab[2,P[1]+P[5]+P[6],1] Spbb[5,6]))^(-1);
a[6] = Spab[4,P[1]+P[5]+P[6],1]/Spab[3,P[1]+P[5]+P[6],1];


DefNumSH[6]
TA[1] = Simplify[A1//.SHtest//.NSpinHel]
TA[2] = A2//.SHtest//.NSpinHel//FullSimplify
TA[3] = A3//.SHtest//.NSpinHel//FullSimplify
TA[4] = A4//.SHtest//.NSpinHel//FullSimplify
TA[5] = A5//.SHtest//.NSpinHel//FullSimplify
TA[6] = A6//.SHtest//.NSpinHel//FullSimplify
TA[7] = A7//.SHtest//.NSpinHel//FullSimplify
TA[8] = A8//.SHtest//.NSpinHel//FullSimplify
TA[9] = A9//.SHtest//.NSpinHel//FullSimplify

TB[1] = B1//.SHtest//.NSpinHel//FullSimplify
TB[2] = B2//.SHtest//.NSpinHel//FullSimplify
TB[3] = B3//.SHtest//.NSpinHel//FullSimplify
TB[4] = B4//.SHtest//.NSpinHel//FullSimplify
TB[5] = B5//.SHtest//.NSpinHel//FullSimplify
TB[6] = B6//.SHtest//.NSpinHel//FullSimplify
TB[7] = B7//.SHtest//.NSpinHel//FullSimplify
TB[8] = B8//.SHtest//.NSpinHel//FullSimplify
TB[9] = B9//.SHtest//.NSpinHel//FullSimplify


FullSimplify[Together[Collect[Simplify[Together[FullSimplify[SEQ[[1]]]]//.schoutenLong],\[Eta][1]]//.schoutenLong]]
FullSimplify[(FullSimplify[Together[Collect[Simplify[Together[FullSimplify[SEQ[[2]]]]//.schoutenLong],\[Eta][4]]//.schoutenLong]]//.B)]
FullSimplify[FullSimplify[Together[Collect[Simplify[Together[FullSimplify[SEQ[[3]]]]//.schoutenLong],\[Eta][3]]//.schoutenLong]]//.A]
A = Spab[2,P[1]+P[5]+P[6],5] Spab[3,P[1]+P[5]+P[6],6]+s[1,5,6] Spaa[2,3] Spbb[5,6]->-Spab[2,P[1]+P[5]+P[6],6] Spab[3,P[1]+P[5]+P[6],5];
B = Spab[4,P[1]+P[5]+P[6],1]-(s[1,5,6] Spaa[3,4] Spbb[1,6])/Spab[3,P[1]+P[5]+P[6],6]->(Spab[3,P[1]+P[5]+P[6],1]Spab[4,P[1]+P[5]+P[6],6])/Spab[3,P[1]+P[5]+P[6],6];


AA = Solve[(Spab[2,P[1]+P[5]+P[6],6] \[Eta][2]+Spab[3,P[1]+P[5]+P[6],6] \[Eta][3]+Spab[4,P[1]+P[5]+P[6],6] \[Eta][4]+s[1,5,6] \[Eta][6])/Spab[3,P[1]+P[5]+P[6],6]==0,\[Eta][6]]


 (-Spaa[2,3] \[Eta][2]+Spaa[3,4] \[Eta][4])==(Spab[3,P[1]+P[5]+P[6],1] \[Eta][6]-Spab[3,P[1]+P[5]+P[6],6] \[Eta][1])/Spbb[1,6]//.AA//Simplify
 (-Spaa[2,3] \[Eta][2]+Spaa[3,4] \[Eta][4])==(-Spab[3,P[1]+P[5]+P[6],6] \[Eta][5]-Spab[3,P[1]+P[5]+P[6],5] \[Eta][6])/Spbb[5,6]//.AA//Simplify
 


(-Spab[3,P[1]+P[5]+P[6],6] (Spbb[5,6] \[Eta][1]+Spbb[1,6] \[Eta][5])-Spab[3,P[1]+P[5]+P[6],6] Spbb[1,5] \[Eta][6])/(Spbb[1,6] Spbb[5,6]) 1/Spab[3,P[1]+P[5]+P[6],6]//FullSimplify


(* ::InheritFromParent:: *)
(**)


Together[-((Spbb[5,6] \[Eta][1]+Spbb[1,6] \[Eta][5]+Spbb[1,5] \[Eta][6])/(Spbb[1,6] Spbb[5,6]))//.AA//FullSimplify]


Spab[3,P[1]+P[5]+P[6],6] \[Eta][1]+Spbb[1,6] (-Spaa[2,3] \[Eta][2]+Spaa[3,4] \[Eta][4])-Spab[3,P[1]+P[5]+P[6],1] \[Eta][6]-(-Spbb[5,6] (Spaa[2,3] \[Eta][2]+Spaa[3,4] \[Eta][4])+Spab[3,P[1]+P[5]+P[6],6] \[Eta][5]+Spab[3,P[1]+P[5]+P[6],5] \[Eta][6])


(* ::Code::Initialization::Bold:: *)
(Spab[3,P[1]+P[5]+P[6],6] \[Eta][1]-Spaa[2,3] Spbb[1,6] \[Eta][2]+Spaa[3,4] Spbb[1,6] \[Eta][4]-Spab[3,P[1]+P[5]+P[6],1] \[Eta][6])/Spab[3,P[1]+P[5]+P[6],6]//.SHtest//FullSimplify


EE[1] = B1;
EE[2] = B2;
EE[3] = B4;
EE[4] = B7;
EE[5] = B8;
EE[6] = A1;
EE[7] = A5;
EE[8] = A6;


\[Delta] = 1/(1-a[2]a[4]a[7]a[8]);
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,8},{j,1,8}];
Simplify[1/(Det[Mat])]


J = -((Spab[2,P[1]+P[5]+P[6],1]^2 Spab[3,P[1]+P[5]+P[6],6]^4)/(Spaa[1,3] Spaa[3,4] Spaa[3,5] Spab[2,P[1]+P[5]+P[6],6]^3 Spab[3,P[1]+P[5]+P[6],1]^3 Spbb[2,4]^2 Spbb[2,6]^2 Spbb[5,6]))*(Spaa[3,4]Spbb[5,6]*Spbb[2,4]^2 Spbb[2,6]^2/Spbb[1,6]*Spaa[1,3] Spaa[3,5]/Spaa[3,2]*1/Spab[3,P[1]+P[5]+P[6],6]^3)
Jac = 1/\[Delta];
J2 = -((Spab[2,P[1]+P[5]+P[6],1]^2 Spab[3,P[1]+P[5]+P[6],6]^4)/(Spaa[1,3] Spaa[3,4] Spaa[3,5] Spab[2,P[1]+P[5]+P[6],6]^3 Spab[3,P[1]+P[5]+P[6],1]^3 Spbb[2,4]^2 Spbb[2,6]^2 Spbb[5,6]))*(Spaa[3,4]Spbb[5,6]*Spbb[2,4]^2 Spbb[2,6]^2/Spbb[1,6]*Spaa[1,3] Spaa[3,5]/Spaa[3,2]*1/Spab[3,P[1]+P[5]+P[6],6]^3);
\[Delta]


(* ::InheritFromParent:: *)
(**)


\[Delta]1


Product[1/a[i],{i,1,6}]//Simplify;
\[CapitalOmega] = Product[1/a[i],{i,1,6}]*J//Simplify
\[CapitalOmega]6 = \[CapitalOmega]*\[Delta]1//Simplify
sht = s[i_,j_,k_]->Spaa[i,j]Spbb[j,i]+Spaa[i,k]Spbb[k,i]+Spaa[j,k]Spbb[k,j];
\[Omega] = \[CapitalOmega]6;


(*sing = {Spbb[i_,1]->\[Alpha] Spab[i,P[1]+P[5]+P[6],2]+\[Beta] Spbb[i,j],Spbb[1,i_]->\[Alpha] Spab[2,P[1]+P[5]+P[6],i]+\[Beta] Spbb[j,i]};*)
sing = {Spab[2,P[1]+P[5]+P[6],i_]->\[Alpha] Spbb[1,i]+\[Beta] Spbb[i,j]};
A = \[Omega]//.sing//FullSimplify
ResA = Residue[(A),{\[Beta],0}]//.Spbb[1,j]->1//FullSimplify




(* ::Subsubsection::Closed:: *)
(*Residue calc*)


ResA = 1/(\[Alpha] Spaa[3,4] Spab[4,P[1]+P[5]+P[6],1] Spbb[1,5] Spbb[5,6])


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{"a", "[", "6", "]"}], "1", 
RowBox[{"a", "[", "2", "]"}], "0", 
RowBox[{"a", "[", "1", "]"}], "0"},
{
RowBox[{
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "6", "]"}]}]}], "1", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "6", "]"}]}], "0"},
{
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{"-", 
RowBox[{"a", "[", "7", "]"}]}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "6", "]"}]}], 
RowBox[{"a", "[", "7", "]"}]}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"a", "[", "7", "]"}]}]},
{"0", 
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], "1", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "6", "]"}]}]}], ")"}]}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "4", "]"}]}]},
{"0", 
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "6", "]"}]}], "1", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]}], ")"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
CC . Transpose[Cperp];
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][3]]//.RB//.RR//FullSimplify
A3 = TensorExpand[(perpEQ[[1]]) . \[Lambda][5]]//.RB//.RR//FullSimplify
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A5 = TensorExpand[(perpEQ[[2]]) . \[Lambda][3]]//.RB//.RR//FullSimplify
A6 = TensorExpand[(perpEQ[[2]]) . \[Lambda][5]]//.RB//.RR//FullSimplify
A7 = TensorExpand[(perpEQ[[3]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A8 = TensorExpand[(perpEQ[[3]]) . \[Lambda][3]]//.RB//.RR//FullSimplify
A9 = TensorExpand[(perpEQ[[3]]) . \[Lambda][5]]//.RB//.RR//FullSimplify

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify
B7 = TensorExpand[(CEQ[[3]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify
B8 = TensorExpand[(CEQ[[3]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify
B9 = TensorExpand[(CEQ[[3]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify


Simplify[Collect[FullSimplify[Solve[{A3==0,A2==0,B1==0,B2==0,B5==0,B8==0},{a[6],a[5],a[4],a[2],a[1],a[3]}]//.schoutenA]//.schoutenA,a[7]]//.schoutenB]//.SPAB


a[6] = (Spaa[1,6]-a[7] Spaa[2,6])/(a[7] Spaa[4,6]);
a[4] = (-Spaa[1,4]+a[7] Spaa[2,4])/(a[7] Spaa[4,6]);
a[2] = -((a[7] Spbb[1,5]+Spbb[2,5])/Spbb[3,5])
a[1] = -((a[7] Spbb[1,3]+Spbb[2,3])/Spbb[3,5])
a[3] = ((Spaa[1,6]-a[7] Spaa[2,6]) Spbb[2,4])/(a[7] Spaa[4,6] Spbb[3,4])
a[5] = ((-Spaa[1,4]+a[7] Spaa[2,4]) Spbb[2,6])/(a[7] Spaa[4,6] Spbb[5,6]);


DefNumSH[6]
TA[1] = Simplify[A1//.SHtest//.NSpinHel]
TA[2] = A2//.SHtest//.NSpinHel//FullSimplify
TA[3] = A3//.SHtest//.NSpinHel//FullSimplify
TA[4] = A4//.SHtest//.NSpinHel//FullSimplify
TA[5] = A5//.SHtest//.NSpinHel//FullSimplify
TA[6] = A6//.SHtest//.NSpinHel//FullSimplify
TA[7] = A7//.SHtest//.NSpinHel//FullSimplify
TA[8] = A8//.SHtest//.NSpinHel//FullSimplify
TA[9] = A9//.SHtest//.NSpinHel//FullSimplify

TB[1] = B1//.SHtest//.NSpinHel//FullSimplify
TB[2] = B2//.SHtest//.NSpinHel//FullSimplify
TB[3] = B3//.SHtest//.NSpinHel//FullSimplify
TB[4] = B4//.SHtest//.NSpinHel//FullSimplify
TB[5] = B5//.SHtest//.NSpinHel//FullSimplify
TB[6] = B6//.SHtest//.NSpinHel//FullSimplify
TB[7] = B7//.SHtest//.NSpinHel//FullSimplify
TB[8] = B8//.SHtest//.NSpinHel//FullSimplify
TB[9] = B9//.SHtest//.NSpinHel//FullSimplify


B9
Solve[B9==0,a[5]]//FullSimplify//.schoutenB
(-Spbb[1,6] Spbb[3,5]+Spbb[1,5] Spbb[3,6]+Spbb[1,3] Spbb[5,6])//.schoutenB
Spbb[2,5] Spbb[3,6]+Spbb[2,3] Spbb[5,6]//.schoutenB


 -(Collect[a[7] Spbb[1,4] Spbb[2,3]+Spbb[2,3] Spbb[2,4]+a[7] Spbb[1,2] Spbb[3,4],a[7]]/(Spbb[2,5] Spbb[3,4]+Spbb[2,3] Spbb[4,5]//.schoutenB))//.schoutenB//Simplify


(*
Simplify[Collect[FullSimplify[Solve[{A2\[Equal]0,B1\[Equal]0,B4\[Equal]0,A3\[Equal]0,A8\[Equal]0,A9\[Equal]0},{a[6],a[1],a[2],a[3],a[4],a[5]}]//.schoutenA]//.schoutenA,a[7]]//.schoutenA]//.SPAB
*)
a[6] = (-Spaa[1,4]+a[7] Spaa[2,4])/(a[7] Spaa[4,6]);
a[1] =  Spab[6,P[1]+P[5]+P[6],2]/(Spaa[1,6] Spbb[2,3]); (*maybe a sign here*)
a[2] = -(Spbb[2,4]/Spbb[2,3]);
a[3] = (Spaa[1,6]-a[7] Spaa[2,6])/(a[7] Spaa[4,6]);
a[4] = Spaa[1,5]/Spaa[1,6];
a[5] = Spaa[5,6]/Spaa[1,6];


EE[1] = A2;
EE[2] = B1;
EE[3] = B4;
EE[4] = B3;
EE[5] = A8;
EE[6] = A9;
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,6},{j,1,6}];
Simplify[1/(Det[Mat])]//.schoutenA//.schoutenB//FullSimplify


(* ::InheritFromParent:: *)
(**)


J =1/(a[5] a[7]^4 Spaa[3,5] Spaa[3,6] Spaa[4,6] Spbb[2,3] Spbb[2,6] Spbb[3,5])


(* ::InheritFromParent:: *)
(*(a[7] (Spaa[3,5] Spaa[4,6]) (-Spaa[3,6] ((Spaa[1,6]-a[7] Spaa[2,6]) Spaa[4,5]+a[7] Spaa[2,5] Spaa[4,6])+(-Spaa[1,6] Spaa[3,4]+a[7] (Spaa[2,4] Spaa[3,6])) Spaa[5,6]) Spbb[2,3]^2)//FullSimplify//FullSimplify*)


(* ::InheritFromParent:: *)
(*a[7] Spaa[3,5] Spaa[4,6] (a[7] Spaa[3,6] Spaa[1,6] (Spaa[3,6] Spaa[4,5]+Spaa[3,4] Spaa[5,6])) Spbb[2,3]^2*)


(* ::InheritFromParent:: *)
(*a[7]^2 Spaa[1,6] Spaa[3,5] Spaa[3,6] Spaa[4,6] (Spaa[3,5] Spaa[4,6]) Spbb[2,3]^2*)


J = Spaa[4,6]/(a[7]^2 Spaa[1,6] Spaa[3,5]^2 Spaa[3,6] Spaa[4,6]^2 Spbb[2,3]^2)


(* ::InheritFromParent:: *)
(**)


(* ::InheritFromParent:: *)
(**)


Product[1/a[i],{i,1,6}]


Product[1/a[i],{i,1,6}]*J*(-Spaa[1,4]+a[7] Spaa[2,4])^2*(Spaa[1,6]-a[7] Spaa[2,6])^2//FullSimplify


Spaa[1,5] (Spaa[1,4]-a[7] Spaa[2,4]) (Spaa[1,6]-a[7] Spaa[2,6]) Spaa[5,6] Spab[6,P[1]+P[5]+P[6],2] Spbb[2,4]//Expand


(* ::InheritFromParent:: *)
(*Spaa[1,4] Spaa[1,5] Spaa[1,6] Spaa[5,6] Spab[6,P[1]+P[5]+P[6],2] Spbb[2,4]-a[7] Spaa[1,5] Spaa[1,2] Spaa[4,6] Spaa[5,6] Spab[6,P[1]+P[5]+P[6],2] Spbb[2,4]+a[7]^2 Spaa[1,5] Spaa[2,4] Spaa[2,6] Spaa[5,6] Spab[6,P[1]+P[5]+P[6],2] Spbb[2,4]//FullSimplify*)


Spaa[1,6] Spaa[2,4]-Spaa[1,4] Spaa[2,6]//.schoutenA


(* ::Subsection::Closed:: *)
(*6 pt NMHV calculation,  hexagon (3 black/white) with moved \[Alpha]4*)


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", "\[Delta]"}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"a", "[", "6", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "7", "]"}], " ", "\[Delta]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], " ", "\[Delta]"}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "7", "]"}]}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}], "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "7", "]"}]}], " ", "\[Delta]"}], "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "6", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "7", "]"}], " ", "\[Delta]"}]}], ")"}]}], "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], " ", "\[Delta]"}], "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}]}], ")"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
CC . Transpose[Cperp];
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][3]]//.RB//.RR//FullSimplify
A3 = TensorExpand[(perpEQ[[1]]) . \[Lambda][5]]//.RB//.RR//FullSimplify
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A5 = TensorExpand[(perpEQ[[2]]) . \[Lambda][3]]//.RB//.RR//FullSimplify
A6 = TensorExpand[(perpEQ[[2]]) . \[Lambda][5]]//.RB//.RR//FullSimplify
A7 = TensorExpand[(perpEQ[[3]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A8 = TensorExpand[(perpEQ[[3]]) . \[Lambda][3]]//.RB//.RR//FullSimplify
A9 = TensorExpand[(perpEQ[[3]]) . \[Lambda][5]]//.RB//.RR//FullSimplify

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify
B7 = TensorExpand[(CEQ[[3]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify
B8 = TensorExpand[(CEQ[[3]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify
B9 = TensorExpand[(CEQ[[3]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify


\[Delta] = 1/(1-(a[2]a[7]a[8]))//Together



a[7] = -((Spab[2,P[1]+P[5]+P[6],1] Spab[3,P[1]+P[2]+P[5],6] Spbb[1,6])/(Spab[2,P[1]+P[5]+P[6],6] Spab[3,P[1]+P[5]+P[6],1] Spbb[4,6]));
a[8] = -((Spaa[2,3] Spbb[4,6])/-Spab[3,P[1]+P[2]+P[5],6]);
a[4] = -((Spab[2,P[1]+P[5]+P[6],1] Spab[3,P[1]+P[2]+P[5],6] Spbb[5,6])/(Spab[2,P[1]+P[5]+P[6],6] Spab[3,P[1]+P[5]+P[6],1] Spbb[4,6])); (*FullSimplify[Solve[{B9\[Equal]0,B3\[Equal]0,A2\[Equal]0},{a[7],a[8],a[4]}]]//.SPAB*)
a[3] = Spab[2,P[1]+P[5]+P[6],1]/Spab[3,P[1]+P[5]+P[6],1]; (*FullSimplify[Solve[{A1\[Equal]0},{a[3]}]]//.SPAB//Together*)
a[2] = -(s[1,5,6]/Spab[2,P[1]+P[5]+P[6],1])^(1);
a[5] = -(Spab[2,P[1]+P[5]+P[6],5]/Spab[2,P[1]+P[5]+P[6],6]);
a[6] = Spab[4,P[1]+P[5]+P[6],1]/Spab[3,P[1]+P[5]+P[6],1];
a[1] = -(Spab[2,P[1]+P[5]+P[6],1]/Spab[2,P[1]+P[5]+P[6],6]); (*FullSimplify[Solve[{A9\[Equal]0},{a[1]}]]//.SPAB//FullSimplify*)


(*From previous diagram*)
a[7] = (Spbb[5,6]/Spbb[1,6])^(1);
a[8] = -(Spaa[3,4]/Spaa[2,3])^(1);
a[1] = -(Spab[2,P[1]+P[5]+P[6],1]/Spab[2,P[1]+P[5]+P[6],6]);
a[2] = -(s[1,5,6]/Spab[2,P[1]+P[5]+P[6],1])^(1);
a[5] = -(Spab[2,P[1]+P[5]+P[6],5]/Spab[2,P[1]+P[5]+P[6],6]);
a[3] = Spab[2,P[1]+P[5]+P[6],1]/Spab[3,P[1]+P[5]+P[6],1];
(*a[4] =((Spab[2,P[1]+P[5]+P[6],6] Spab[3,P[1]+P[5]+P[6],1])/(Spaa[3,4] Spab[2,P[1]+P[5]+P[6],1] Spbb[5,6]))^(-1);*)
a[6] = Spab[4,P[1]+P[5]+P[6],1]/Spab[3,P[1]+P[5]+P[6],1];


DefNumSH[6]
TA[1] = Simplify[A1//.SHtest//.NSpinHel]
TA[2] = A2//.SHtest//.NSpinHel//FullSimplify
TA[3] = A3//.SHtest//.NSpinHel//FullSimplify
TA[4] = A4//.SHtest//.NSpinHel//FullSimplify
TA[5] = A5//.SHtest//.NSpinHel//FullSimplify
TA[6] = A6//.SHtest//.NSpinHel//FullSimplify
TA[7] = A7//.SHtest//.NSpinHel//FullSimplify
TA[8] = A8//.SHtest//.NSpinHel//FullSimplify
TA[9] = A9//.SHtest//.NSpinHel//FullSimplify

TB[1] = B1//.SHtest//.NSpinHel//FullSimplify
TB[2] = B2//.SHtest//.NSpinHel//FullSimplify
TB[3] = B3//.SHtest//.NSpinHel//FullSimplify
TB[4] = B4//.SHtest//.NSpinHel//FullSimplify
TB[5] = B5//.SHtest//.NSpinHel//FullSimplify
TB[6] = B6//.SHtest//.NSpinHel//FullSimplify
TB[7] = B7//.SHtest//.NSpinHel//FullSimplify
TB[8] = B8//.SHtest//.NSpinHel//FullSimplify
TB[9] = B9//.SHtest//.NSpinHel//FullSimplify


FullSimplify[Together[Collect[Simplify[Together[FullSimplify[SEQ[[1]]]]//.schoutenLong],\[Eta][1]]//.schoutenLong]]
FullSimplify[(FullSimplify[Together[Collect[Simplify[Together[FullSimplify[SEQ[[2]]]]//.schoutenLong],\[Eta][4]]//.schoutenLong]]//.B)]
FullSimplify[FullSimplify[Together[Collect[Simplify[Together[FullSimplify[SEQ[[3]]]]//.schoutenLong],\[Eta][3]]//.schoutenLong]]//.A]
A = Spab[2,P[1]+P[5]+P[6],5] Spab[3,P[1]+P[5]+P[6],6]+s[1,5,6] Spaa[2,3] Spbb[5,6]->-Spab[2,P[1]+P[5]+P[6],6] Spab[3,P[1]+P[5]+P[6],5];
B = Spab[4,P[1]+P[5]+P[6],1]-(s[1,5,6] Spaa[3,4] Spbb[1,6])/Spab[3,P[1]+P[5]+P[6],6]->(Spab[3,P[1]+P[5]+P[6],1]Spab[4,P[1]+P[5]+P[6],6])/Spab[3,P[1]+P[5]+P[6],6];


AA = Solve[(Spab[2,P[1]+P[5]+P[6],6] \[Eta][2]+Spab[3,P[1]+P[5]+P[6],6] \[Eta][3]+Spab[4,P[1]+P[5]+P[6],6] \[Eta][4]+s[1,5,6] \[Eta][6])/Spab[3,P[1]+P[5]+P[6],6]==0,\[Eta][6]]


 (-Spaa[2,3] \[Eta][2]+Spaa[3,4] \[Eta][4])==(Spab[3,P[1]+P[5]+P[6],1] \[Eta][6]-Spab[3,P[1]+P[5]+P[6],6] \[Eta][1])/Spbb[1,6]//.AA//Simplify
 (-Spaa[2,3] \[Eta][2]+Spaa[3,4] \[Eta][4])==(-Spab[3,P[1]+P[5]+P[6],6] \[Eta][5]-Spab[3,P[1]+P[5]+P[6],5] \[Eta][6])/Spbb[5,6]//.AA//Simplify
 


(-Spab[3,P[1]+P[5]+P[6],6] (Spbb[5,6] \[Eta][1]+Spbb[1,6] \[Eta][5])-Spab[3,P[1]+P[5]+P[6],6] Spbb[1,5] \[Eta][6])/(Spbb[1,6] Spbb[5,6]) 1/Spab[3,P[1]+P[5]+P[6],6]//FullSimplify


(* ::InheritFromParent:: *)
(**)


Together[-((Spbb[5,6] \[Eta][1]+Spbb[1,6] \[Eta][5]+Spbb[1,5] \[Eta][6])/(Spbb[1,6] Spbb[5,6]))//.AA//FullSimplify]


Spab[3,P[1]+P[5]+P[6],6] \[Eta][1]+Spbb[1,6] (-Spaa[2,3] \[Eta][2]+Spaa[3,4] \[Eta][4])-Spab[3,P[1]+P[5]+P[6],1] \[Eta][6]-(-Spbb[5,6] (Spaa[2,3] \[Eta][2]+Spaa[3,4] \[Eta][4])+Spab[3,P[1]+P[5]+P[6],6] \[Eta][5]+Spab[3,P[1]+P[5]+P[6],5] \[Eta][6])


(* ::Code::Initialization::Bold:: *)
(Spab[3,P[1]+P[5]+P[6],6] \[Eta][1]-Spaa[2,3] Spbb[1,6] \[Eta][2]+Spaa[3,4] Spbb[1,6] \[Eta][4]-Spab[3,P[1]+P[5]+P[6],1] \[Eta][6])/Spab[3,P[1]+P[5]+P[6],6]//.SHtest//FullSimplify


EE[1] = B1;
EE[2] = B2;
EE[3] = B4;
EE[4] = B7;
EE[5] = B8;
EE[6] = A1;
EE[7] = A5;
EE[8] = A6;


\[Delta] = 1/(1-a[2]a[7]a[8]);
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,8},{j,1,8}];
Simplify[1/(Det[Mat])]


(* ::InheritFromParent:: *)
(*-((-1+a[2] a[7] a[8])^6/(a[1] a[3] Spaa[1,3] Spaa[3,5] (a[7] Spaa[1,3]-a[4] Spaa[3,5]) Spbb[2,4]^2 Spbb[2,6]^2 (a[8] Spbb[2,6]+Spbb[4,6])))*)


J = -((-1+a[2] a[7] a[8])^6/(a[1] a[3] Spaa[1,3] Spaa[3,5] (a[7] Spaa[1,3]-a[4] Spaa[3,5]) Spbb[2,4]^2 Spbb[2,6]^2 (a[8] Spbb[2,6]+Spbb[4,6])))//FullSimplify


J = -((Spab[2,P[1]+P[5]+P[6],1]^2 Spab[3,P[1]+P[5]+P[6],6]^4)/(Spaa[1,3] Spaa[3,4] Spaa[3,5] Spab[2,P[1]+P[5]+P[6],6]^3 Spab[3,P[1]+P[5]+P[6],1]^3 Spbb[2,4]^2 Spbb[2,6]^2 Spbb[5,6]))*(Spaa[3,4]Spbb[5,6]*Spbb[2,4]^2 Spbb[2,6]^2/Spbb[1,6]*Spaa[1,3] Spaa[3,5]/Spaa[3,2]*1/Spab[3,P[1]+P[5]+P[6],6]^3)
Jac = 1/\[Delta];
J2 = -((Spab[2,P[1]+P[5]+P[6],1]^2 Spab[3,P[1]+P[5]+P[6],6]^4)/(Spaa[1,3] Spaa[3,4] Spaa[3,5] Spab[2,P[1]+P[5]+P[6],6]^3 Spab[3,P[1]+P[5]+P[6],1]^3 Spbb[2,4]^2 Spbb[2,6]^2 Spbb[5,6]))*(Spaa[3,4]Spbb[5,6]*Spbb[2,4]^2 Spbb[2,6]^2/Spbb[1,6]*Spaa[1,3] Spaa[3,5]/Spaa[3,2]*1/Spab[3,P[1]+P[5]+P[6],6]^3);
\[Delta]


(* ::InheritFromParent:: *)
(**)


\[Delta]1


Product[1/a[i],{i,1,6}]//Simplify;
\[CapitalOmega] = Product[1/a[i],{i,1,6}]*J//Simplify
\[CapitalOmega]6 = \[CapitalOmega]*\[Delta]1//Simplify
sht = s[i_,j_,k_]->Spaa[i,j]Spbb[j,i]+Spaa[i,k]Spbb[k,i]+Spaa[j,k]Spbb[k,j];
\[Omega] = \[CapitalOmega]6;


(*sing = {Spbb[i_,1]->\[Alpha] Spab[i,P[1]+P[5]+P[6],2]+\[Beta] Spbb[i,j],Spbb[1,i_]->\[Alpha] Spab[2,P[1]+P[5]+P[6],i]+\[Beta] Spbb[j,i]};*)
sing = {Spab[2,P[1]+P[5]+P[6],i_]->\[Alpha] Spbb[1,i]+\[Beta] Spbb[i,j]};
A = \[Omega]//.sing//FullSimplify
ResA = Residue[(A),{\[Beta],0}]//.Spbb[1,j]->1//FullSimplify





(* ::Subsection::Closed:: *)
(*6 pt NMHV calculation,  hexagon (3 black/white) clockwise*)


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"a", "[", "6", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "7", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"(", 
RowBox[{"a", "[", "8", "]"}], ")"}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "7", "]"}], " ", "\[Delta]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "7", "]"}], " ", "\[Delta]"}], "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "6", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}]}], ")"}]}], "1", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"(", 
RowBox[{"a", "[", "8", "]"}], ")"}], " ", "\[Delta]"}], ")"}]}], "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}], ")"}]}], "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "7", "]"}], " ", "\[Delta]"}]}], ")"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
CC . Transpose[Cperp];
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[1]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[2]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[2]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[3]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[3]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A9 = TensorExpand[(perpEQ[[3]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;
B7 = TensorExpand[(CEQ[[3]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B8 = TensorExpand[(CEQ[[3]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B9 = TensorExpand[(CEQ[[3]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;


\[Delta] = 1/(1-a[2]a[4]a[7]a[8])//FullSimplify//Together


Solve[{A2==0,B3==0},{a[7],a[8]}]


((Spaa[2,3] Spbb[1,6])/Spab[3,P[1]+P[5]+P[6],6] Spaa[1,3]-Spaa[2,3])/((Spaa[2,3] Spbb[1,6])/Spab[3,P[1]+P[5]+P[6],6] Spaa[3,5])//FullSimplify


(* ::InheritFromParent:: *)
(*-Spab[3,P[5],6]/(Spaa[3,5] Spbb[1,6])*)


(s[1,5,6] Spaa[2,3] Spbb[1,6])/(-Spab[2,P[1]+P[5]+P[6],1] Spab[3,P[1]+P[5]+P[6],6])*(s[1,5,6]/Spab[2,P[1]+P[5]+P[6],1])^(-1)


a[7] = (Spbb[5,6]/Spbb[1,6])^(1);
a[8] = -(Spaa[3,4]/Spaa[2,3])^(1);
a[1] = -(Spab[2,P[1]+P[5]+P[6],1]/Spab[2,P[1]+P[5]+P[6],6]);
a[2] = -(s[1,5,6]/Spab[2,P[1]+P[5]+P[6],1])^(1);
a[5] = -(Spab[2,P[1]+P[5]+P[6],5]/Spab[2,P[1]+P[5]+P[6],6]);
a[3] = Spab[2,P[1]+P[5]+P[6],1]/Spab[3,P[1]+P[5]+P[6],1];
a[4] =-((Spab[2,P[1]+P[5]+P[6],6] Spab[3,P[1]+P[5]+P[6],1])/(Spaa[3,4] Spab[2,P[1]+P[5]+P[6],1] Spbb[5,6]))^(1);
a[6] = Spab[4,P[1]+P[5]+P[6],1]/Spab[3,P[1]+P[5]+P[6],1];


a[1] = (Spbb[5,6]/Spbb[1,6])^(1);
a[3] = -(Spaa[3,4]/Spaa[2,3])^(1);
a[7] = -(Spab[2,P[1]+P[5]+P[6],1]/Spab[2,P[1]+P[5]+P[6],6]);
a[2] = -(s[1,5,6]/Spab[2,P[1]+P[5]+P[6],1])^(-1);
a[5] = -(Spab[2,P[1]+P[5]+P[6],5]/Spab[2,P[1]+P[5]+P[6],6]);
a[8] = Spab[2,P[1]+P[5]+P[6],1]/Spab[3,P[1]+P[5]+P[6],1];
a[4] =((Spab[2,P[1]+P[5]+P[6],6] Spab[3,P[1]+P[5]+P[6],1])/(Spaa[3,4] Spab[2,P[1]+P[5]+P[6],1] Spbb[5,6]))^(1);
a[6] = Spab[4,P[1]+P[5]+P[6],1]/Spab[3,P[1]+P[5]+P[6],1];


DefNumSH[6]
TA[1] = Simplify[A1//.SHtest//.NSpinHel]
TA[2] = A2//.SHtest//.NSpinHel//FullSimplify
TA[3] = A3//.SHtest//.NSpinHel//FullSimplify
TA[4] = A4//.SHtest//.NSpinHel//FullSimplify
TA[5] = A5//.SHtest//.NSpinHel//FullSimplify
TA[6] = A6//.SHtest//.NSpinHel//FullSimplify
TA[7] = A7//.SHtest//.NSpinHel//FullSimplify
TA[8] = A8//.SHtest//.NSpinHel//FullSimplify
TA[9] = A9//.SHtest//.NSpinHel//FullSimplify

TB[1] = B1//.SHtest//.NSpinHel//FullSimplify
TB[2] = B2//.SHtest//.NSpinHel//FullSimplify
TB[3] = B3//.SHtest//.NSpinHel//FullSimplify
TB[4] = B4//.SHtest//.NSpinHel//FullSimplify
TB[5] = B5//.SHtest//.NSpinHel//FullSimplify
TB[6] = B6//.SHtest//.NSpinHel//FullSimplify
TB[7] = B7//.SHtest//.NSpinHel//FullSimplify
TB[8] = B8//.SHtest//.NSpinHel//FullSimplify
TB[9] = B9//.SHtest//.NSpinHel//FullSimplify


FullSimplify[Together[Collect[Simplify[Together[FullSimplify[SEQ[[1]]]]//.schoutenLong],\[Eta][1]]//.schoutenLong]]
FullSimplify[(FullSimplify[Together[Collect[Simplify[Together[FullSimplify[SEQ[[2]]]]//.schoutenLong],\[Eta][4]]//.schoutenLong]]//.B)]
FullSimplify[FullSimplify[Together[Collect[Simplify[Together[FullSimplify[SEQ[[3]]]]//.schoutenLong],\[Eta][3]]//.schoutenLong]]//.A]
A = Spab[2,P[1]+P[5]+P[6],5] Spab[3,P[1]+P[5]+P[6],6]+s[1,5,6] Spaa[2,3] Spbb[5,6]->-Spab[2,P[1]+P[5]+P[6],6] Spab[3,P[1]+P[5]+P[6],5];
B = Spab[4,P[1]+P[5]+P[6],1]-(s[1,5,6] Spaa[3,4] Spbb[1,6])/Spab[3,P[1]+P[5]+P[6],6]->(Spab[3,P[1]+P[5]+P[6],1]Spab[4,P[1]+P[5]+P[6],6])/Spab[3,P[1]+P[5]+P[6],6];


AA = Solve[(Spab[2,P[1]+P[5]+P[6],6] \[Eta][2]+Spab[3,P[1]+P[5]+P[6],6] \[Eta][3]+Spab[4,P[1]+P[5]+P[6],6] \[Eta][4]+s[1,5,6] \[Eta][6])/Spab[3,P[1]+P[5]+P[6],6]==0,\[Eta][6]]


 (-Spaa[2,3] \[Eta][2]+Spaa[3,4] \[Eta][4])==(Spab[3,P[1]+P[5]+P[6],1] \[Eta][6]-Spab[3,P[1]+P[5]+P[6],6] \[Eta][1])/Spbb[1,6]//.AA//Simplify
 (-Spaa[2,3] \[Eta][2]+Spaa[3,4] \[Eta][4])==(-Spab[3,P[1]+P[5]+P[6],6] \[Eta][5]-Spab[3,P[1]+P[5]+P[6],5] \[Eta][6])/Spbb[5,6]//.AA//Simplify
 


(-Spab[3,P[1]+P[5]+P[6],6] (Spbb[5,6] \[Eta][1]+Spbb[1,6] \[Eta][5])-Spab[3,P[1]+P[5]+P[6],6] Spbb[1,5] \[Eta][6])/(Spbb[1,6] Spbb[5,6]) 1/Spab[3,P[1]+P[5]+P[6],6]//FullSimplify


(* ::InheritFromParent:: *)
(**)


Together[-((Spbb[5,6] \[Eta][1]+Spbb[1,6] \[Eta][5]+Spbb[1,5] \[Eta][6])/(Spbb[1,6] Spbb[5,6]))//.AA//FullSimplify]


Spab[3,P[1]+P[5]+P[6],6] \[Eta][1]+Spbb[1,6] (-Spaa[2,3] \[Eta][2]+Spaa[3,4] \[Eta][4])-Spab[3,P[1]+P[5]+P[6],1] \[Eta][6]-(-Spbb[5,6] (Spaa[2,3] \[Eta][2]+Spaa[3,4] \[Eta][4])+Spab[3,P[1]+P[5]+P[6],6] \[Eta][5]+Spab[3,P[1]+P[5]+P[6],5] \[Eta][6])


(* ::Code::Initialization::Bold:: *)
(Spab[3,P[1]+P[5]+P[6],6] \[Eta][1]-Spaa[2,3] Spbb[1,6] \[Eta][2]+Spaa[3,4] Spbb[1,6] \[Eta][4]-Spab[3,P[1]+P[5]+P[6],1] \[Eta][6])/Spab[3,P[1]+P[5]+P[6],6]//.SHtest//FullSimplify


EE[1] = B1;
EE[2] = B2;
EE[3] = B4;
EE[4] = B7;
EE[5] = B8;
EE[6] = A1;
EE[7] = A5;
EE[8] = A6;


\[Delta] = 1/(1-a[2]a[4]a[7]a[8]);
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,8},{j,1,8}];
Simplify[1/(Det[Mat])]


J = -((Spab[2,P[1]+P[5]+P[6],1]^2 Spab[3,P[1]+P[5]+P[6],6]^4)/(Spaa[1,3] Spaa[3,4] Spaa[3,5] Spab[2,P[1]+P[5]+P[6],6]^3 Spab[3,P[1]+P[5]+P[6],1]^3 Spbb[2,4]^2 Spbb[2,6]^2 Spbb[5,6]))*(Spaa[3,4]Spbb[5,6]*Spbb[2,4]^2 Spbb[2,6]^2/Spbb[1,6]*Spaa[1,3] Spaa[3,5]/Spaa[3,2]*1/Spab[3,P[1]+P[5]+P[6],6]^3)
Jac = 1/\[Delta];
J2 = -((Spab[2,P[1]+P[5]+P[6],1]^2 Spab[3,P[1]+P[5]+P[6],6]^4)/(Spaa[1,3] Spaa[3,4] Spaa[3,5] Spab[2,P[1]+P[5]+P[6],6]^3 Spab[3,P[1]+P[5]+P[6],1]^3 Spbb[2,4]^2 Spbb[2,6]^2 Spbb[5,6]))*(Spaa[3,4]Spbb[5,6]*Spbb[2,4]^2 Spbb[2,6]^2/Spbb[1,6]*Spaa[1,3] Spaa[3,5]/Spaa[3,2]*1/Spab[3,P[1]+P[5]+P[6],6]^3);
\[Delta]


(* ::InheritFromParent:: *)
(**)


\[Delta]1


Product[1/a[i],{i,1,6}]//Simplify;
\[CapitalOmega] = Product[1/a[i],{i,1,6}]*J//Simplify
\[CapitalOmega]6 = \[CapitalOmega]*\[Delta]1//Simplify
sht = s[i_,j_,k_]->Spaa[i,j]Spbb[j,i]+Spaa[i,k]Spbb[k,i]+Spaa[j,k]Spbb[k,j];
\[Omega] = \[CapitalOmega]6;


sing = {Spbb[i_,1]->\[Alpha] Spab[i,P[1]+P[5]+P[6],2]+\[Beta] Spbb[i,j],Spbb[1,i_]->\[Alpha] Spab[2,P[1]+P[5]+P[6],i]+\[Beta] Spbb[j,i]};
sing = {Spab[2,P[1]+P[5]+P[6],i_]->\[Alpha] Spbb[1,i]+\[Beta] Spbb[i,j]};
A = \[Omega]//.sing//FullSimplify
ResA = Residue[(A),{\[Beta],0}]//.Spbb[1,j]->1//FullSimplify





(* ::Subsection::Closed:: *)
(*6 pt NMHV calculation,  hexagon (3 black/white), non internal loop*)


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"a", "[", "2", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}]}]}], "1", "0", 
RowBox[{"a", "[", "8", "]"}], "0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "8", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]},
{
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}]}], "0", "1", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "6", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "8", "]"}]}]}], ")"}], "0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "8", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]},
{
RowBox[{"a", "[", "7", "]"}], "0", "0", "0", "1", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "7", "]"}]}]}], ")"}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}]}]}], ")"}]}], 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}]}], "0", 
RowBox[{"-", 
RowBox[{"a", "[", "7", "]"}]}], "0"},
{"0", 
RowBox[{"-", 
RowBox[{"a", "[", "8", "]"}]}], 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "6", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "8", "]"}]}]}], ")"}]}], "1", "0", "0"},
{"0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "8", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], ")"}]}], 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "8", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], ")"}]}], "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "7", "]"}]}]}], ")"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
CC . Transpose[Cperp];
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[1]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[2]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[3]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[3]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;
B7 = TensorExpand[(CEQ[[3]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B8 = TensorExpand[(CEQ[[3]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;


Sol = Together[FullSimplify[Simplify[Solve[{B8==0,A5==0,B7==0,B2==0,A6==0,B1==0,A1==0,B4==0},{a[7],a[8],a[1],a[2],a[5],a[3],a[4],a[6]}]]//.schoutenA//.schoutenB]]


a[7] = -(Spbb[5,6]/Spbb[1,6]);
a[8] = -(Spaa[3,4]/Spaa[2,3]);
a[1] = -(Spab[2,P[1]+P[5]+P[6],1]/Spab[2,P[1]+P[5]+P[6],6]);
a[2] = (s[1,5,6]/Spab[2,P[1]+P[5]+P[6],1])^(1);
a[5] = -(Spab[2,P[1]+P[5]+P[6],5]/Spab[2,P[1]+P[5]+P[6],6]);
a[3] = -(Spab[2,P[1]+P[5]+P[6],1]/Spab[3,P[1]+P[5]+P[6],1]);
a[4] = -((Spab[2,P[1]+P[5]+P[6],6] Spab[3,P[1]+P[5]+P[6],1])/(Spaa[3,4] Spab[2,P[1]+P[5]+P[6],1] Spbb[5,6]));
a[6] = Spab[4,P[1]+P[5]+P[6],1]/Spab[3,P[1]+P[5]+P[6],1];


DefNumSH[6]
TA[1] = Simplify[A1//.SHtest//.NSpinHel]
TA[2] = A2//.SHtest//.NSpinHel//FullSimplify
TA[3] = A3//.SHtest//.NSpinHel//FullSimplify
TA[4] = A4//.SHtest//.NSpinHel//FullSimplify
TA[5] = A5//.SHtest//.NSpinHel//FullSimplify
TA[6] = A6//.SHtest//.NSpinHel//FullSimplify
TA[7] = A7//.SHtest//.NSpinHel//FullSimplify
TA[8] = A8//.SHtest//.NSpinHel//FullSimplify

TB[1] = B1//.SHtest//.NSpinHel//FullSimplify
TB[2] = B2//.SHtest//.NSpinHel//FullSimplify
TB[3] = B3//.SHtest//.NSpinHel//FullSimplify
TB[4] = B4//.SHtest//.NSpinHel//FullSimplify
TB[5] = B5//.SHtest//.NSpinHel//FullSimplify
TB[6] = B6//.SHtest//.NSpinHel//FullSimplify
TB[7] = B7//.SHtest//.NSpinHel//FullSimplify
TB[8] = B8//.SHtest//.NSpinHel//FullSimplify


EE[1] = B1;
EE[2] = B2;
EE[3] = B4;
EE[4] = B7;
EE[5] = B8;
EE[6] = A1;
EE[7] = A5;
EE[8] = A6;


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,8},{j,1,8}];
Simplify[1/(Det[Mat])]


(*SEQ[[3]]*Spbb[1,6]---->Spbb[6,5] \[Eta][1]+Spbb[1,6]\[Eta][5]+Spbb[5,1] \[Eta][6]*)
(*SEQ[[2]]*Spaa[2,3]----> -Spaa[1,2] \[Eta][1]+Spaa[2,3] \[Eta][3]+Spaa[2,4] \[Eta][4]+Spaa[2,5] \[Eta][5]+Spaa[2,6] \[Eta][6] using the above*)
(*SEQ[[1]]*Spaa[2,3]----> -Spaa[1,3] \[Eta][1]+Spaa[2,3] \[Eta][2]-Spaa[3,4] \[Eta][4]+Spaa[3,5] \[Eta][5]-Spaa[3,6] \[Eta][6]*)



J = -(1/(a[1] a[3] a[4]^2 a[7]^3 a[8]^3 Spaa[2,3]^3 Spbb[1,4]^2 Spbb[1,6]^3))//FullSimplify


\[CapitalOmega] = Product[1/a[i],{i,1,8}]*J*Spbb[1,4]^2/Spaa[2,3]^2*1/Spbb[1,6]^2*(Spaa[2,4]Spbb[5,1])//Simplify


(* ::Subsection:: *)
(*6 pt NMHV calculation,  hexagon (3 black/white) with extra parameter*)


(* ::Subsubsection::Closed:: *)
(*Before residue*)


(*\[Delta] = 1/(1-a[7] a[8])*)
CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}], "+", "\[Alpha]"}], "0", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", "\[Delta]"}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"a", "[", "6", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], " ", "\[Delta]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], " ", "\[Delta]"}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}], "-", "\[Alpha]"}], "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}], "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"a", "[", "7", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "6", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], " ", "\[Delta]"}]}], ")"}]}], "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], " ", "\[Delta]"}], "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "8", "]"}], " ", "\[Delta]"}]}], ")"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
CC . Transpose[Cperp];
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[1]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[2]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[2]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[3]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[3]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A9 = TensorExpand[(perpEQ[[3]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;
B7 = TensorExpand[(CEQ[[3]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B8 = TensorExpand[(CEQ[[3]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B9 = TensorExpand[(CEQ[[3]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;


\[Delta] = 1/(1-(a[2]a[4]a[7]a[8]))//Together


(FullSimplify[Solve[{A9==0},{a[1]}]]//.schoutenA//.schoutenB//FullSimplify//Expand)[[1]][[1]];
(FullSimplify[Solve[{A7==0},{a[2]}]]//.schoutenA//.schoutenB//FullSimplify//Expand)[[1]][[1]]//FullSimplify;
(FullSimplify[Solve[{A5==0},{a[3]}]]//.schoutenA//.schoutenB//FullSimplify//Expand)[[1]][[1]]//FullSimplify;
(FullSimplify[Solve[{B1==0},{a[4]}]]//.schoutenA//.schoutenB//FullSimplify//Expand)[[1]][[1]]//FullSimplify;
(FullSimplify[Solve[{A1==0},{a[5]}]]//.schoutenA//.schoutenB//FullSimplify//Expand)[[1]][[1]]//FullSimplify;
(FullSimplify[Solve[{A6==0},{a[6]}]]//.schoutenA//.schoutenB//FullSimplify//Expand)[[1]][[1]]//FullSimplify;
(FullSimplify[Solve[{B3==0},{a[7]}]]//.schoutenA//.schoutenB//FullSimplify//Expand)[[1]][[1]]//FullSimplify;
(FullSimplify[Solve[{A2==0},{a[8]}]]//.schoutenA//.schoutenB//FullSimplify//Expand)[[1]][[1]]//FullSimplify;


a[5] =-((-\[Alpha] Spab[1,P[2]+P[5]+P[6],5]+Spab[2,P[1]+P[5]+P[6],5])/(-\[Alpha] Spab[1,P[2]+P[5]+P[6],6]+Spab[2,P[1]+P[5]+P[6],6]));
a[6]=(Spab[4,P[1]+P[5]+P[6],1]+\[Alpha] Spab[4,P[2]+P[5]+P[6],2])/(Spab[3,P[1]+P[5]+P[6],1]+\[Alpha] Spab[3,P[2]+P[5]+P[6],2]);
a[7] = (Spbb[1,6]+\[Alpha] Spbb[2,6])/Spbb[5,6];
a[8] =-((Spaa[2,3]-\[Alpha] Spaa[1,3])/Spaa[3,4]);
a[1] = -((Spab[2,P[1]+P[5]+P[6],1]-\[Alpha] (Spab[1,P[1]+P[5]+P[6],1]+\[Alpha] Spab[1,P[1]+P[5]+P[6],2]-Spab[2,P[2]+P[5]+P[6],2]))/(-\[Alpha] Spab[1,P[2]+P[5]+P[6],6]+Spab[2,P[1]+P[5]+P[6],6]));
a[3] = (Spab[2,P[1]+P[5]+P[6],1]-\[Alpha] (Spab[1,P[1]+P[5]+P[6],1]+\[Alpha] Spab[1,P[1]+P[5]+P[6],2]-Spab[2,P[2]+P[5]+P[6],2]))/(Spab[3,P[1]+P[5]+P[6],1]+\[Alpha] Spab[3,P[2]+P[5]+P[6],2]);
a[4] =(Spaa[3,4] (Spab[2,P[1]+P[5]+P[6],1]-\[Alpha] (Spab[1,P[1]+P[5]+P[6],1]+\[Alpha] Spab[1,P[1]+P[5]+P[6],2]-Spab[2,P[2]+P[5]+P[6],2])) Spbb[5,6])/((Spab[2,P[1]+P[5]+P[6],6]-\[Alpha] Spab[1,P[2]+P[5]+P[6],6]) (Spab[3,P[1]+P[5]+P[6],1]+\[Alpha] Spab[3,P[2]+P[5]+P[6],2]));
a[2] =-((s[1,5,6]+\[Alpha] Spab[1,P[1]+P[5]+P[6],2])/(Spab[2,P[1]+P[5]+P[6],1]-\[Alpha] (Spab[1,P[1]+P[5]+P[6],1]+\[Alpha] Spab[1,P[1]+P[5]+P[6],2]-Spab[2,P[2]+P[5]+P[6],2])));
(*t\[Lambda]1 \[Rule] t\[Lambda]1 + \[Alpha] t\[Lambda]2*)
(*\[Lambda]2  \[Rule]  \[Lambda]2 - \[Alpha]  \[Lambda]1*)


DefNumSH[6]
TA[1] = Simplify[A1//.SHtest//.NSpinHel]
TA[2] = A2//.SHtest//.NSpinHel//FullSimplify
TA[3] = A3//.SHtest//.NSpinHel//FullSimplify
TA[4] = A4//.SHtest//.NSpinHel//FullSimplify
TA[5] = A5//.SHtest//.NSpinHel//FullSimplify
TA[6] = A6//.SHtest//.NSpinHel//FullSimplify
TA[7] = A7//.SHtest//.NSpinHel//FullSimplify
TA[8] = A8//.SHtest//.NSpinHel//FullSimplify
TA[9] = A9//.SHtest//.NSpinHel//FullSimplify

TB[1] = B1//.SHtest//.NSpinHel//FullSimplify
TB[2] = B2//.SHtest//.NSpinHel//FullSimplify
TB[3] = B3//.SHtest//.NSpinHel//FullSimplify
TB[4] = B4//.SHtest//.NSpinHel//FullSimplify
TB[5] = B5//.SHtest//.NSpinHel//FullSimplify
TB[6] = B6//.SHtest//.NSpinHel//FullSimplify
TB[7] = B7//.SHtest//.NSpinHel//FullSimplify
TB[8] = B8//.SHtest//.NSpinHel//FullSimplify
TB[9] = B9//.SHtest//.NSpinHel//FullSimplify


Sol1  = (FullSimplify[Solve[{A1==0},{a[8]}]]//.schoutenA//.schoutenB//FullSimplify//Expand)[[1]][[1]];
Length[a[8]//.Sol1]
Sol2  = (FullSimplify[Solve[{A2==0},{a[8]}]]//.schoutenA//.schoutenB//FullSimplify//Expand)[[1]][[1]];
Length[a[8]//.Sol2]
Sol3  = (FullSimplify[Solve[{A3==0},{a[8]}]]//.schoutenA//.schoutenB//FullSimplify//Expand)[[1]][[1]];
Length[a[8]//.Sol3]
Sol4  = (FullSimplify[Solve[{A4==0},{a[8]}]]//.schoutenA//.schoutenB//FullSimplify//Expand)[[1]][[1]];
Length[a[8]//.Sol4]
Sol5  = (FullSimplify[Solve[{A5==0},{a[8]}]]//.schoutenA//.schoutenB//FullSimplify//Expand)[[1]][[1]];
Length[a[8]//.Sol5]
Sol6  = (FullSimplify[Solve[{A6==0},{a[8]}]]//.schoutenA//.schoutenB//FullSimplify//Expand)[[1]][[1]];
Length[a[8]//.Sol6]
Sol7  = (FullSimplify[Solve[{A7==0},{a[8]}]]//.schoutenA//.schoutenB//FullSimplify//Expand)[[1]][[1]];
Length[a[8]//.Sol7]
Sol8  = (FullSimplify[Solve[{A8==0},{a[8]}]]//.schoutenA//.schoutenB//FullSimplify//Expand)[[1]][[1]];
Length[a[8]//.Sol8]
Sol9  = (FullSimplify[Solve[{A9==0},{a[8]}]]//.schoutenA//.schoutenB//FullSimplify//Expand)[[1]][[1]];
Length[a[8]//.Sol9]

Sol10  = (FullSimplify[Solve[{B1==0},{a[8]}]]//.schoutenA//.schoutenB//FullSimplify//Expand)[[1]][[1]];
Length[a[8]//.Sol10]
Sol11  = (FullSimplify[Solve[{B2==0},{a[8]}]]//.schoutenA//.schoutenB//FullSimplify//Expand)[[1]][[1]];
Length[a[8]//.Sol11]
Sol12  = (FullSimplify[Solve[{B3==0},{a[8]}]]//.schoutenA//.schoutenB//FullSimplify//Expand)[[1]][[1]];
Length[a[8]//.Sol12]
Sol13  = (FullSimplify[Solve[{B4==0},{a[8]}]]//.schoutenA//.schoutenB//FullSimplify//Expand)[[1]][[1]];
Length[a[8]//.Sol13]
Sol14  = (FullSimplify[Solve[{B5==0},{a[8]}]]//.schoutenA//.schoutenB//FullSimplify//Expand)[[1]][[1]];
Length[a[8]//.Sol14]
Sol15  = (FullSimplify[Solve[{B6==0},{a[8]}]]//.schoutenA//.schoutenB//FullSimplify//Expand)[[1]][[1]];
Length[a[8]//.Sol15]
Sol16  = (FullSimplify[Solve[{B7==0},{a[8]}]]//.schoutenA//.schoutenB//FullSimplify//Expand)[[1]][[1]];
Length[a[8]//.Sol16]
Sol17  = (FullSimplify[Solve[{B8==0},{a[8]}]]//.schoutenA//.schoutenB//FullSimplify//Expand)[[1]][[1]];
Length[a[8]//.Sol17]
Sol18  = (FullSimplify[Solve[{B9==0},{a[8]}]]//.schoutenA//.schoutenB//FullSimplify//Expand)[[1]][[1]];
Length[a[8]//.Sol18]


EE[1] = B1;
EE[2] = B2;
EE[3] = B4;
EE[4] = B7;
EE[5] = B8;
EE[6] = A1;
EE[7] = A5;
EE[8] = A6;


\[Delta] = Collect[Together[1-a[2]a[4]a[7]a[8]]//FullSimplify,\[Alpha]]//FullSimplify


\[Delta] = 1/(1-a[2]a[4]a[7]a[8]);
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,8},{j,1,8}];
J = Simplify[1/(Det[Mat])]


Product[1/a[i],{i,1,6}]//Simplify;
\[CapitalOmega] = Product[1/a[i],{i,1,6}]*J//Simplify
\[CapitalOmega]6 = \[CapitalOmega]*\[Delta]1//Simplify
sht = s[i_,j_,k_]->Spaa[i,j]Spbb[j,i]+Spaa[i,k]Spbb[k,i]+Spaa[j,k]Spbb[k,j];
\[Omega] = \[CapitalOmega]6;


(*sing = {Spbb[i_,1]->\[Alpha] Spab[i,P[1]+P[5]+P[6],2]+\[Beta] Spbb[i,j],Spbb[1,i_]->\[Alpha] Spab[2,P[1]+P[5]+P[6],i]+\[Beta] Spbb[j,i]};*)
sing = {Spab[2,P[1]+P[5]+P[6],i_]->\[Alpha] Spbb[1,i]+\[Beta] Spbb[i,j]};
A = \[Omega]//.sing//FullSimplify
ResA = Residue[(A),{\[Beta],0}]//.Spbb[1,j]->1//FullSimplify




depress[poly_] := depress[poly, First@Variables[poly]]

depress[poly_, x_] /; PolynomialQ[poly, x] := Module[{n = Exponent[poly, x], x0},
        x0 = -Coefficient[poly, x, n - 1]/(n Coefficient[poly, x, n]);
        Normal[Series[poly, {x, x0, n}]]]


depress[(-3834787678755414-1060826391522695 \[Alpha]+6481434802774750 \[Alpha]^2)/1969399144112400//N]


(-3834787678755414-1060826391522695 \[Alpha]+6481434802774750 \[Alpha]^2)/1969399144112400//N//Simplify


Simplify[Spab[2,P[1]+P[5]+P[6],1]-\[Alpha] (Spab[1,P[1]+P[5]+P[6],1]+\[Alpha] Spab[1,P[1]+P[5]+P[6],2]-Spab[2,P[2]+P[5]+P[6],2])//.SHtest//.NSpinHel]//N//Simplify
Simplify[(-Spab[1,P[1]+P[5]+P[6],2]) (-Spab[2,P[1]+P[5]+P[6],1]+\[Alpha] (Spab[1,P[1]+P[5]+P[6],1]+\[Alpha] Spab[1,P[1]+P[5]+P[6],2]-Spab[2,P[2]+P[5]+P[6],2]))/Spab[1,P[1]+P[5]+P[6],2]//.SHtest//.NSpinHel]//N//Simplify


(* ::InheritFromParent:: *)
(**)


N[Simplify[Sol[[1]][[1]]//.SHtest//.NSpinHel]//FullSimplify,20]
N[Simplify[Sol[[2]][[1]]//.SHtest//.NSpinHel]//FullSimplify,20]


DefNumSH[6]


N[-Simplify[(Spab[1,P[1]+P[5]+P[6],1]-Spab[2,P[2]+P[5]+P[6],1])/Spab[1,P[1]+P[5]+P[6],2]//.SHtest//.NSpinHel]//FullSimplify,20]
N[Simplify[Spab[2,P[2]+P[5]+P[6],1]/Spab[1,P[1]+P[5]+P[6],2]//.SHtest//.NSpinHel]//FullSimplify,20]





Factor[7.567455887330985` +21.418262146492516` \[Alpha]+1.9943329624554869` \[Alpha]^2]


(Spab[2,P[1]+P[5]+P[6],1]-\[Alpha] (Spab[1,P[1]+P[5]+P[6],1]+\[Alpha] Spab[1,P[1]+P[5]+P[6],2]-Spab[2,P[2]+P[5]+P[6],2]))//FullSimplify


Sol = Solve[Spab[2,P[1]+P[5]+P[6],1]-\[Alpha] (Spab[1,P[1]+P[5]+P[6],1]+\[Alpha] Spab[1,P[1]+P[5]+P[6],2]-Spab[2,P[2]+P[5]+P[6],2])==0,\[Alpha]]//FullSimplify


(-((Spab[1,P[1]+P[5]+P[6],1]+Sqrt[4 Spab[1,P[1]+P[5]+P[6],2] Spab[2,P[1]+P[5]+P[6],1]+(Spab[1,P[1]+P[5]+P[6],1]-Spab[2,P[2]+P[5]+P[6],2])^2]-Spab[2,P[2]+P[5]+P[6],2])/(2 Spab[1,P[1]+P[5]+P[6],2]))


(\[Alpha]-(-((Spab[1,P[1]+P[5]+P[6],1]+Sqrt[4 Spab[1,P[1]+P[5]+P[6],2] Spab[2,P[1]+P[5]+P[6],1]+(Spab[1,P[1]+P[5]+P[6],1]-Spab[2,P[2]+P[5]+P[6],2])^2]-Spab[2,P[2]+P[5]+P[6],2])/(2 Spab[1,P[1]+P[5]+P[6],2]))))(\[Alpha]-((-Spab[1,P[1]+P[5]+P[6],1]+Sqrt[4 Spab[1,P[1]+P[5]+P[6],2] Spab[2,P[1]+P[5]+P[6],1]+(Spab[1,P[1]+P[5]+P[6],1]-Spab[2,P[2]+P[5]+P[6],2])^2]+Spab[2,P[2]+P[5]+P[6],2])/(2 Spab[1,P[1]+P[5]+P[6],2])))//FullSimplify


Spab[2,P[1]+P[5]+P[6],1]-\[Alpha] (Spab[1,P[1]+P[5]+P[6],1]+\[Alpha] Spab[1,P[1]+P[5]+P[6],2]-Spab[2,P[2]+P[5]+P[6],2])


Sol//.Spab[1,P[1]+P[5]+P[6],2] Spab[2,P[1]+P[5]+P[6],1]->Spab[1,P[1]+P[5]+P[6],2]^2//FullSimplify








































































(* ::Subsubsection::Closed:: *)
(*Sum of residues numerically*)


DefNumSH[6]
UV1 = Spab[2,P[1]+P[5]+P[6],1]-z Spab[1,P[1]+P[5]+P[6],1]+z Spab[2,P[1]+P[5]+P[6],2]-z^2 Spab[1,P[1]+P[5]+P[6],2]//.SHtest//.NSpinHel
UV2 = Spab[3,P[1]+P[5]+P[6],1]+z Spab[3,P[2]+P[5]+P[6],2]//.SHtest//.NSpinHel
IR = Spab[2,P[2]+P[3]+P[4],5]-z Spab[1,P[1]+P[3]+P[4],5]//.SHtest//.NSpinHel
\[CapitalOmega] = 1/(z Spaa[3,4] UV1 UV2 IR Spbb[5,6])//.SHtest//.NSpinHel
Solve[UV1==0]
Solve[UV2==0]
Solve[IR==0]
Res1 = FullSimplify[Residue[\[CapitalOmega],{z,(-65116202650292270473+Sqrt[4847638098331863084399979833527022211729])/26476455875998605750}]]//FullSimplify;
Res2 = FullSimplify[Residue[\[CapitalOmega],{z,(-65116202650292270473-Sqrt[4847638098331863084399979833527022211729])/26476455875998605750}]]//FullSimplify;
Res3 = FullSimplify[Residue[\[CapitalOmega],{z,18240826599980777/21120500707625655}]]//FullSimplify;
Res4 = FullSimplify[Residue[\[CapitalOmega],{z,90814382967667052626361/506140049978193024627525}]]//FullSimplify;
Res5 = FullSimplify[Residue[\[CapitalOmega],{z,0}]]//FullSimplify;
Res1+Res2+Res3+Res4+Res5//FullSimplify//N


(* ::Subsubsection::Closed:: *)
(*Residue on box uv pole*)


DefNumSH[6]
UV1 = Spab[2,P[1]+P[5]+P[6],1]-z Spab[1,P[1]+P[5]+P[6],1]+z Spab[2,P[2]+P[5]+P[6],2]-z^2 Spab[1,P[1]+P[5]+P[6],2];
UV2 = Spab[3,P[1]+P[5]+P[6],1]+z Spab[3,P[2]+P[5]+P[6],2];
IR = Spab[2,P[2]+P[3]+P[4],5]-z Spab[1,P[1]+P[3]+P[4],5];
\[CapitalOmega] = 1/(z Spaa[3,4] UV1 UV2 IR Spbb[5,6]);
\[CapitalOmega]C = 1/(Spbb[1,2]Spab[3,P[1]+P[2]+P[4],1]Spab[6,P[1]+P[2]+P[4],4]Spab[3,P[1]+P[2]+P[4],4] Spaa[5,6]);
\[Omega] = FullSimplify[Residue[\[CapitalOmega],{z,-Spab[3,P[1]+P[5]+P[6],1]/Spab[3,P[2]+P[5]+P[6],2]}]]//.{Spab[1,P[1]+P[3]+P[4],5] Spab[3,P[1]+P[5]+P[6],1]+Spab[2,P[2]+P[3]+P[4],5] Spab[3,P[2]+P[5]+P[6],2]->-Spab[6,P[1]+P[2]+P[4],4]Spaa[3,4]Spbb[5,6]}
AA = \[Omega]*((Spaa[3,4]Spbb[5,6])/Spab[3,P[2]+P[5]+P[6],2])^(3)//.SHtest//.NSpinHel//N;
BB = \[CapitalOmega]C//.SHtest//.NSpinHel;
AA/BB//FullSimplify//N


(*Residue on hexagon*)
DefNumSH[6]
zp = 1/(2 Spab[1,P[1]+P[5]+P[6],2]) (-Spab[1,P[1]+P[5]+P[6],1]+Spab[2,P[2]+P[5]+P[6],2]+Sqrt[-4 s[1,2] s[5,6]+(s[1,5]+s[1,6]+s[2,5]+s[2,6])^2]);
zm = 1/(2 Spab[1,P[1]+P[5]+P[6],2]) (-Spab[1,P[1]+P[5]+P[6],1]+Spab[2,P[2]+P[5]+P[6],2]-Sqrt[-4 s[1,2] s[5,6]+(s[1,5]+s[1,6]+s[2,5]+s[2,6])^2]);
UV1 = -Spab[1,P[1]+P[5]+P[6],2]*(z-zp)(z-zm)
UV2 = Spab[3,P[1]+P[5]+P[6],1]+z Spab[3,P[2]+P[5]+P[6],2];
IR = Spab[2,P[2]+P[3]+P[4],5]-z Spab[1,P[1]+P[3]+P[4],5];
\[CapitalOmega] = 1/(z Spaa[3,4] UV1 UV2 IR Spbb[5,6]);
\[Omega] = Together[FullSimplify[Residue[\[CapitalOmega],{z,zp}]]+FullSimplify[Residue[\[CapitalOmega],{z,zm}]]//FullSimplify]


(* ::InheritFromParent:: *)
(*(16 Spab[1,P[1]+P[5]+P[6],2]^3 (-4 Spab[1,P[1]+P[3]+P[4],5] Spab[1,P[1]+P[5]+P[6],1] Spab[1,P[1]+P[5]+P[6],2] Spab[3,P[1]+P[5]+P[6],1]-4 Spab[1,P[1]+P[5]+P[6],2]^2 Spab[2,P[2]+P[3]+P[4],5] Spab[3,P[1]+P[5]+P[6],1]+4 Spab[1,P[1]+P[3]+P[4],5] Spab[1,P[1]+P[5]+P[6],2] Spab[2,P[2]+P[5]+P[6],2] Spab[3,P[1]+P[5]+P[6],1]+s[1,5]^2 Spab[1,P[1]+P[3]+P[4],5] Spab[3,P[2]+P[5]+P[6],2]+2 s[1,5] s[1,6] Spab[1,P[1]+P[3]+P[4],5] Spab[3,P[2]+P[5]+P[6],2]+s[1,6]^2 Spab[1,P[1]+P[3]+P[4],5] Spab[3,P[2]+P[5]+P[6],2]+2 s[1,5] s[2,5] Spab[1,P[1]+P[3]+P[4],5] Spab[3,P[2]+P[5]+P[6],2]+2 s[1,6] s[2,5] Spab[1,P[1]+P[3]+P[4],5] Spab[3,P[2]+P[5]+P[6],2]+s[2,5]^2 Spab[1,P[1]+P[3]+P[4],5] Spab[3,P[2]+P[5]+P[6],2]+2 s[1,5] s[2,6] Spab[1,P[1]+P[3]+P[4],5] Spab[3,P[2]+P[5]+P[6],2]+2 s[1,6] s[2,6] Spab[1,P[1]+P[3]+P[4],5] Spab[3,P[2]+P[5]+P[6],2]+2 s[2,5] s[2,6] Spab[1,P[1]+P[3]+P[4],5] Spab[3,P[2]+P[5]+P[6],2]+s[2,6]^2 Spab[1,P[1]+P[3]+P[4],5] Spab[3,P[2]+P[5]+P[6],2]-4 s[1,2] s[5,6] Spab[1,P[1]+P[3]+P[4],5] Spab[3,P[2]+P[5]+P[6],2]+3 Spab[1,P[1]+P[3]+P[4],5] Spab[1,P[1]+P[5]+P[6],1]^2 Spab[3,P[2]+P[5]+P[6],2]+4 Spab[1,P[1]+P[5]+P[6],1] Spab[1,P[1]+P[5]+P[6],2] Spab[2,P[2]+P[3]+P[4],5] Spab[3,P[2]+P[5]+P[6],2]-6 Spab[1,P[1]+P[3]+P[4],5] Spab[1,P[1]+P[5]+P[6],1] Spab[2,P[2]+P[5]+P[6],2] Spab[3,P[2]+P[5]+P[6],2]-4 Spab[1,P[1]+P[5]+P[6],2] Spab[2,P[2]+P[3]+P[4],5] Spab[2,P[2]+P[5]+P[6],2] Spab[3,P[2]+P[5]+P[6],2]+3 Spab[1,P[1]+P[3]+P[4],5] Spab[2,P[2]+P[5]+P[6],2]^2 Spab[3,P[2]+P[5]+P[6],2]))/(Spaa[3,4] (Sqrt[(s[1,5]+s[1,6]+s[2,5]+s[2,6])^2-4 s[1,2] s[5,6]]+Spab[1,P[1]+P[5]+P[6],1]-Spab[2,P[2]+P[5]+P[6],2]) (Sqrt[(s[1,5]+s[1,6]+s[2,5]+s[2,6])^2-4 s[1,2] s[5,6]]-Spab[1,P[1]+P[5]+P[6],1]+Spab[2,P[2]+P[5]+P[6],2]) (Sqrt[(s[1,5]+s[1,6]+s[2,5]+s[2,6])^2-4 s[1,2] s[5,6]] Spab[1,P[1]+P[3]+P[4],5]+Spab[1,P[1]+P[3]+P[4],5] Spab[1,P[1]+P[5]+P[6],1]+2 Spab[1,P[1]+P[5]+P[6],2] Spab[2,P[2]+P[3]+P[4],5]-Spab[1,P[1]+P[3]+P[4],5] Spab[2,P[2]+P[5]+P[6],2]) (Sqrt[(s[1,5]+s[1,6]+s[2,5]+s[2,6])^2-4 s[1,2] s[5,6]] Spab[1,P[1]+P[3]+P[4],5]-Spab[1,P[1]+P[3]+P[4],5] Spab[1,P[1]+P[5]+P[6],1]-2 Spab[1,P[1]+P[5]+P[6],2] Spab[2,P[2]+P[3]+P[4],5]+Spab[1,P[1]+P[3]+P[4],5] Spab[2,P[2]+P[5]+P[6],2]) (-2 Spab[1,P[1]+P[5]+P[6],2] Spab[3,P[1]+P[5]+P[6],1]+Sqrt[(s[1,5]+s[1,6]+s[2,5]+s[2,6])^2-4 s[1,2] s[5,6]] Spab[3,P[2]+P[5]+P[6],2]+Spab[1,P[1]+P[5]+P[6],1] Spab[3,P[2]+P[5]+P[6],2]-Spab[2,P[2]+P[5]+P[6],2] Spab[3,P[2]+P[5]+P[6],2]) (2 Spab[1,P[1]+P[5]+P[6],2] Spab[3,P[1]+P[5]+P[6],1]+Sqrt[(s[1,5]+s[1,6]+s[2,5]+s[2,6])^2-4 s[1,2] s[5,6]] Spab[3,P[2]+P[5]+P[6],2]-Spab[1,P[1]+P[5]+P[6],1] Spab[3,P[2]+P[5]+P[6],2]+Spab[2,P[2]+P[5]+P[6],2] Spab[3,P[2]+P[5]+P[6],2]) Spbb[5,6])*)


FullSimplify[1/4*(-4 Spab[1,P[1]+P[3]+P[4],5] Spab[1,P[1]+P[5]+P[6],1] Spab[1,P[1]+P[5]+P[6],2] Spab[3,P[1]+P[5]+P[6],1]-4 Spab[1,P[1]+P[5]+P[6],2]^2 Spab[2,P[2]+P[3]+P[4],5] Spab[3,P[1]+P[5]+P[6],1]+4 Spab[1,P[1]+P[3]+P[4],5] Spab[1,P[1]+P[5]+P[6],2] Spab[2,P[2]+P[5]+P[6],2] Spab[3,P[1]+P[5]+P[6],1]+s[1,5]^2 Spab[1,P[1]+P[3]+P[4],5] Spab[3,P[2]+P[5]+P[6],2]+2 s[1,5] s[1,6] Spab[1,P[1]+P[3]+P[4],5] Spab[3,P[2]+P[5]+P[6],2]+s[1,6]^2 Spab[1,P[1]+P[3]+P[4],5] Spab[3,P[2]+P[5]+P[6],2]+2 s[1,5] s[2,5] Spab[1,P[1]+P[3]+P[4],5] Spab[3,P[2]+P[5]+P[6],2]+2 s[1,6] s[2,5] Spab[1,P[1]+P[3]+P[4],5] Spab[3,P[2]+P[5]+P[6],2]+s[2,5]^2 Spab[1,P[1]+P[3]+P[4],5] Spab[3,P[2]+P[5]+P[6],2]+2 s[1,5] s[2,6] Spab[1,P[1]+P[3]+P[4],5] Spab[3,P[2]+P[5]+P[6],2]+2 s[1,6] s[2,6] Spab[1,P[1]+P[3]+P[4],5] Spab[3,P[2]+P[5]+P[6],2]+2 s[2,5] s[2,6] Spab[1,P[1]+P[3]+P[4],5] Spab[3,P[2]+P[5]+P[6],2]+s[2,6]^2 Spab[1,P[1]+P[3]+P[4],5] Spab[3,P[2]+P[5]+P[6],2]-4 s[1,2] s[5,6] Spab[1,P[1]+P[3]+P[4],5] Spab[3,P[2]+P[5]+P[6],2]+3 Spab[1,P[1]+P[3]+P[4],5] Spab[1,P[1]+P[5]+P[6],1]^2 Spab[3,P[2]+P[5]+P[6],2]+4 Spab[1,P[1]+P[5]+P[6],1] Spab[1,P[1]+P[5]+P[6],2] Spab[2,P[2]+P[3]+P[4],5] Spab[3,P[2]+P[5]+P[6],2]-6 Spab[1,P[1]+P[3]+P[4],5] Spab[1,P[1]+P[5]+P[6],1] Spab[2,P[2]+P[5]+P[6],2] Spab[3,P[2]+P[5]+P[6],2]-4 Spab[1,P[1]+P[5]+P[6],2] Spab[2,P[2]+P[3]+P[4],5] Spab[2,P[2]+P[5]+P[6],2] Spab[3,P[2]+P[5]+P[6],2]+3 Spab[1,P[1]+P[3]+P[4],5] Spab[2,P[2]+P[5]+P[6],2]^2 Spab[3,P[2]+P[5]+P[6],2]//.s[i_,j_]->Spaa[i,j]Spbb[j,i]//.SHtest//Expand//FullSimplify)//.schoutenA//.schoutenB]//.SHtest//.NSpinHel//N
6*Spaa[1,3]Spbb[2,5]//.SHtest//.NSpinHel//N


Spaa[3,4] (Sqrt[(s[1,5]+s[1,6]+s[2,5]+s[2,6])^2-4 s[1,2] s[5,6]]+Spab[1,P[1]+P[5]+P[6],1]-Spab[2,P[2]+P[5]+P[6],2]) (Sqrt[(s[1,5]+s[1,6]+s[2,5]+s[2,6])^2-4 s[1,2] s[5,6]]-Spab[1,P[1]+P[5]+P[6],1]+Spab[2,P[2]+P[5]+P[6],2]) (Sqrt[(s[1,5]+s[1,6]+s[2,5]+s[2,6])^2-4 s[1,2] s[5,6]] Spab[1,P[1]+P[3]+P[4],5]+Spab[1,P[1]+P[3]+P[4],5] Spab[1,P[1]+P[5]+P[6],1]+2 Spab[1,P[1]+P[5]+P[6],2] Spab[2,P[2]+P[3]+P[4],5]-Spab[1,P[1]+P[3]+P[4],5] Spab[2,P[2]+P[5]+P[6],2]) (Sqrt[(s[1,5]+s[1,6]+s[2,5]+s[2,6])^2-4 s[1,2] s[5,6]] Spab[1,P[1]+P[3]+P[4],5]-Spab[1,P[1]+P[3]+P[4],5] Spab[1,P[1]+P[5]+P[6],1]-2 Spab[1,P[1]+P[5]+P[6],2] Spab[2,P[2]+P[3]+P[4],5]+Spab[1,P[1]+P[3]+P[4],5] Spab[2,P[2]+P[5]+P[6],2]) (-2 Spab[1,P[1]+P[5]+P[6],2] Spab[3,P[1]+P[5]+P[6],1]+Sqrt[(s[1,5]+s[1,6]+s[2,5]+s[2,6])^2-4 s[1,2] s[5,6]] Spab[3,P[2]+P[5]+P[6],2]+Spab[1,P[1]+P[5]+P[6],1] Spab[3,P[2]+P[5]+P[6],2]-Spab[2,P[2]+P[5]+P[6],2] Spab[3,P[2]+P[5]+P[6],2]) (2 Spab[1,P[1]+P[5]+P[6],2] Spab[3,P[1]+P[5]+P[6],1]+Sqrt[(s[1,5]+s[1,6]+s[2,5]+s[2,6])^2-4 s[1,2] s[5,6]] Spab[3,P[2]+P[5]+P[6],2]-Spab[1,P[1]+P[5]+P[6],1] Spab[3,P[2]+P[5]+P[6],2]+Spab[2,P[2]+P[5]+P[6],2] Spab[3,P[2]+P[5]+P[6],2]) Spbb[5,6]//Expand


-Spab[1,P[1]+P[5]+P[6],2]*(z-zp)(z-zm)//.SHtest//.NSpinHel//FullSimplify
 Spab[2,P[1]+P[5]+P[6],1]-z Spab[1,P[1]+P[5]+P[6],1]+z Spab[2,P[2]+P[5]+P[6],2]-z^2 Spab[1,P[1]+P[5]+P[6],2]//.SHtest//.NSpinHel//FullSimplify


Sqrt[(s[1,5]+s[1,6]+s[2,5]+s[2,6])^2-4 s[1,2] s[5,6]] (-s[1,5]-s[1,6]+s[2,5]+s[2,6]+Sqrt[(s[1,5]+s[1,6]+s[2,5]+s[2,6])^2-4 s[1,2] s[5,6]]) //Expand//FullSimplify


DefNumSH[6]
Spab[1,P[1]+P[5]+P[6],2] Spab[3,P[1]+P[5]+P[6],1]+Spab[1,P[1]+P[5]+P[6],1] Spab[3,P[2]+P[5]+P[6],2]//.SHtest//.NSpinHel//N
Spbb[1,2]Spaa[1,3]s[5,6]//.SHtest//.NSpinHel//N


UV1//.z->1/(2 Spab[1,P[1]+P[5]+P[6],2]) (-s[1,5]-s[1,6]+s[2,5]+s[2,6]+Sqrt[-4 s[1,2] s[5,6]+(s[1,5]+s[1,6]+s[2,5]+s[2,6])^2])//.SHtest//.NSpinHel//FullSimplify


Solve[Spab[2,P[1]+P[5]+P[6],1]-z Spab[1,P[1]+P[5]+P[6],1]+z Spab[2,P[2]+P[5]+P[6],2]-z^2 Spab[1,P[1]+P[5]+P[6],2]==0,z]


DefNumSH[6]
UV1//.z->(-Spab[1,P[1]+P[5]+P[6],1]+Spab[2,P[2]+P[5]+P[6],2])/Spab[1,P[1]+P[5]+P[6],2]//.SHtest//.NSpinHel//N


S1 = Solve[UV1==0,z]
DefNumSH[6]
A1 = z//.S1[[2]]//.SHtest//.NSpinHel//N;
B1 = Spab[2,P[2]+P[5]+P[6],2]/Spab[1,P[1]+P[5]+P[6],2]//.SHtest//.NSpinHel//N;
4 Spab[1,P[1]+P[5]+P[6],2] Spab[2,P[1]+P[5]+P[6],1]+(-Spab[1,P[1]+P[5]+P[6],1]+Spab[2,P[2]+P[5]+P[6],2])^2//.SHtest//.NSpinHel//N
(Spab[1,P[1]+P[5]+P[6],1]+Spab[2,P[2]+P[5]+P[6],2])^2-4 s[1,2]s[5,6]//.SHtest//.NSpinHel//N
(Spab[1,P[1]+P[5]+P[6],1]+Spab[2,P[2]+P[5]+P[6],2])^2-4 s[1,2]s[5,6]//.SHtest//Expand//FullSimplify
-4 s[1,2] s[5,6]+(s[1,5]+s[1,6]+s[2,5]+s[2,6])^2//Expand//FullSimplify


1/(2 Spab[1,P[1]+P[5]+P[6],2]) (-s[1,5]-s[1,6]+s[2,5]+s[2,6]-Sqrt[-4 s[1,2] s[5,6]+(s[1,5]+s[1,6]+s[2,5]+s[2,6])^2])


(* ::InheritFromParent:: *)
(*(-Spab[1,P[1]+P[5]+P[6],1]+Spab[2,P[2]+P[5]+P[6],2])/Spab[1,P[1]+P[5]+P[6],2]*)


(* ::InheritFromParent:: *)
(*{{z->(1/(2 Spab[1,P[1]+P[5]+P[6],2]))(-Spab[1,P[1]+P[5]+P[6],1]+Spab[2,P[2]+P[5]+P[6],2]-\[Sqrt](4 Spab[1,P[1]+P[5]+P[6],2] Spab[2,P[1]+P[5]+P[6],1]+(-Spab[1,P[1]+P[5]+P[6],1]+Spab[2,P[2]+P[5]+P[6],2])^2))},{z->c)}}*)


1/(2 Spab[1,P[1]+P[5]+P[6],2]) (-Spab[1,P[1]+P[5]+P[6],1]+Spab[2,P[2]+P[5]+P[6],2]-\[Sqrt](4 Spab[1,P[1]+P[5]+P[6],2] Spab[2,P[1]+P[5]+P[6],1]+(-Spab[1,P[1]+P[5]+P[6],1]+Spab[2,P[2]+P[5]+P[6],2])^2))//.SHtest//.NSpinHel//N
1/(2 Spab[1,P[1]+P[5]+P[6],2]) (-Spab[1,P[1]+P[5]+P[6],1]+Spab[2,P[2]+P[5]+P[6],2]-\[Sqrt]((Spab[1,P[1]+P[5]+P[6],1]+Spab[2,P[2]+P[5]+P[6],2])^2-4 s[1,2]s[5,6]))//FullSimplify


zp = (Spab[1,P[1]+P[5]+P[6],1]-Spab[2,P[2]+P[5]+P[6],2]+Sqrt[Spaa[1,2]Spbb[1,2]Spaa[5,6]Spbb[5,6]-Spab[1,P[2]+P[5]+P[6],2]Spab[2,P[2]+P[5]+P[6],1]])/Spab[1,P[1]+P[5]+P[6],2];
zm = (Spab[1,P[1]+P[5]+P[6],1]-Spab[2,P[2]+P[5]+P[6],2]-Sqrt[Spaa[1,2]Spbb[1,2]Spaa[5,6]Spbb[5,6]-Spab[1,P[2]+P[5]+P[6],2]Spab[2,P[2]+P[5]+P[6],1]])/Spab[1,P[1]+P[5]+P[6],2];
UV3 = (z-zp)(z-zm);


aa-x*bb+x*cc+x^2*dd//Factor


DefNumSH[6]
UV1 = Spab[2,P[1]+P[5]+P[6],1]-z Spab[1,P[1]+P[5]+P[6],1]+z Spab[2,P[2]+P[5]+P[6],2]-z^2 Spab[1,P[1]+P[5]+P[6],2];
UV2 = Spab[3,P[1]+P[5]+P[6],1]+z Spab[3,P[2]+P[5]+P[6],2];
IR = Spab[2,P[2]+P[3]+P[4],5]-z Spab[1,P[1]+P[3]+P[4],5];
\[CapitalOmega] = 1/(z Spaa[3,4] UV1 UV2 IR Spbb[5,6]);
DefNumSH[6]
Res1 = 1/(Spaa[5,6]Spbb[1,2]Spab[3,P[1]+P[5]+P[6],1]Spab[6,P[1]+P[2]+P[4],4]Spab[3,P[1]+P[2]+P[4],4])
Res2 = FullSimplify[Residue[\[CapitalOmega],{z,0}]]
Res3 = 1/(Spaa[1,2]Spbb[3,4]Spab[2,P[3]+P[4]+P[5],5]Spab[6,P[3]+P[4]+P[5],4]Spab[6,P[3]+P[4]+P[5],5])
Res4 = FullSimplify[Residue[\[CapitalOmega],{z,-(1/(2 Spab[1,P[1]+P[5]+P[6],2]))(Spab[1,P[1]+P[5]+P[6],1]+\[Sqrt](4 Spab[1,P[1]+P[5]+P[6],2] Spab[2,P[1]+P[5]+P[6],1]+(Spab[1,P[1]+P[5]+P[6],1]-Spab[2,P[1]+P[5]+P[6],2])^2)-Spab[2,P[1]+P[5]+P[6],2])}]];
Res5 = FullSimplify[Residue[\[CapitalOmega],{z,-(1/(2 Spab[1,P[1]+P[5]+P[6],2]))(Spab[1,P[1]+P[5]+P[6],1]-\[Sqrt](4 Spab[1,P[1]+P[5]+P[6],2] Spab[2,P[1]+P[5]+P[6],1]+(Spab[1,P[1]+P[5]+P[6],1]-Spab[2,P[1]+P[5]+P[6],2])^2)-Spab[2,P[1]+P[5]+P[6],2])}]];
Res1-Res2+Res3+Res4+Res5//.SHtest//.NSpinHel//N


2(4 Spab[1,P[1]+P[5]+P[6],2] Spab[2,P[1]+P[5]+P[6],1]+(-Spab[1,P[1]+P[5]+P[6],1]+Spab[2,P[1]+P[5]+P[6],2])^2)//.SHtest//.NSpinHel
s[1,2]s[5,6]-s[1,5]s[2,5]-s[1,6]s[2,6]-Spaa[1,5]Spaa[2,6]Spbb[1,6]Spbb[2,5]-Spaa[1,6]Spaa[2,5]Spbb[1,5]Spbb[2,6]//.SHtest//.NSpinHel
Solve[UV1==0,z]


DefNumSH[6]
UV1//.z->Spab[1,P[1]+P[5]+P[6],1]/Spab[1,P[1]+P[5]+P[6],2]//.SHtest//.NSpinHel//N


(* ::Subsubsection::Closed:: *)
(*Before residue, with different orientation for the only box pole (also not adding the shift)*)


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "8", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}]}], 
RowBox[{
RowBox[{"a", "[", "3", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "8", "]"}]}]}], "1", "0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}], " ", "\[Delta]"}], "0"},
{
RowBox[{
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "8", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}]}], 
RowBox[{"a", "[", "8", "]"}], "0", "1", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "7", "]"}], " ", "\[Delta]"}], "0"},
{
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "7", "]"}], " ", "\[Delta]"}], "0", "0", "0", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], " ", "\[Delta]"}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "8", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}]}], ")"}]}], 
RowBox[{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "8", "]"}]}], "-", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}]}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{"a", "[", "7", "]"}], " ", "\[Delta]"}]},
{"0", "1", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "8", "]"}]}]}], ")"}]}], 
RowBox[{"-", 
RowBox[{"a", "[", "8", "]"}]}], "0", "0"},
{"0", "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}], " ", "\[Delta]"}], ")"}]}], 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "7", "]"}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], " ", "\[Delta]"}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
CC . Transpose[Cperp]//FullSimplify
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[1]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[2]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[3]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[3]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A9 = TensorExpand[(perpEQ[[3]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;
B7 = TensorExpand[(CEQ[[3]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B8 = TensorExpand[(CEQ[[3]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B9 = TensorExpand[(CEQ[[3]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;


\[Delta] = 1/(1-(a[1]a[5]a[7]))//Together





a[1] = -(Spab[2,P[1]+P[5]+P[6],6]/Spab[2,P[1]+P[5]+P[6],1])^(1);
a[2] = (Spab[2,P[1]+P[5]+P[6],1]/s[1,5,6])^(-1);
a[3] = (Spab[2,P[1]+P[5]+P[6],1]/Spab[3,P[1]+P[5]+P[6],1])^(1);
a[4] =((Spab[2,P[1]+P[5]+P[6],6] Spab[3,P[1]+P[5]+P[6],1])/(Spaa[3,4] Spab[2,P[1]+P[5]+P[6],1] Spbb[5,6]))^(1);
a[5] = (Spab[2,P[1]+P[5]+P[6],6]/Spab[2,P[1]+P[5]+P[6],5])^(-1);
a[6] = -(Spab[3,P[1]+P[5]+P[6],1]/Spab[4,P[1]+P[5]+P[6],1])^(-1);
a[7] = (Spbb[5,6]/Spbb[1,6])^(1);
a[8] = -(Spaa[3,4]/Spaa[2,3])^(-1);


DefNumSH[6]
TA[1] = Simplify[A1//.SHtest//.NSpinHel]
TA[2] = A2//.SHtest//.NSpinHel//FullSimplify
TA[3] = A3//.SHtest//.NSpinHel//FullSimplify
TA[4] = A4//.SHtest//.NSpinHel//FullSimplify
TA[5] = A5//.SHtest//.NSpinHel//FullSimplify
TA[6] = A6//.SHtest//.NSpinHel//FullSimplify
TA[7] = A7//.SHtest//.NSpinHel//FullSimplify
TA[8] = A8//.SHtest//.NSpinHel//FullSimplify
TA[9] = A9//.SHtest//.NSpinHel//FullSimplify

TB[1] = B1//.SHtest//.NSpinHel//FullSimplify
TB[2] = B2//.SHtest//.NSpinHel//FullSimplify
TB[3] = B3//.SHtest//.NSpinHel//FullSimplify
TB[4] = B4//.SHtest//.NSpinHel//FullSimplify
TB[5] = B5//.SHtest//.NSpinHel//FullSimplify
TB[6] = B6//.SHtest//.NSpinHel//FullSimplify
TB[7] = B7//.SHtest//.NSpinHel//FullSimplify
TB[8] = B8//.SHtest//.NSpinHel//FullSimplify
TB[9] = B9//.SHtest//.NSpinHel//FullSimplify


Z


EE[1] = B1;
EE[2] = B2;
EE[3] = B4;
EE[4] = B7;
EE[5] = B8;
EE[6] = A1;
EE[7] = A5;
EE[8] = A6;


\[Delta] = Collect[Together[1-a[2]a[4]a[7]a[8]]//FullSimplify,\[Alpha]]//FullSimplify


\[Delta] = 1/(1-a[2]a[4]a[7]a[8]);
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,8},{j,1,8}];
J = Simplify[1/(Det[Mat])]


(* ::Subsubsection::Closed:: *)
(*Residue on box uv pole (only box, no hexagon pole)*)


UV1 = Spab[2,P[2]+P[3]+P[4],6]-z Spab[1,P[1]+P[3]+P[4],6];
IR1 = Spaa[2,3]-z Spaa[1,3]
IR2 = Spab[4,P[1]+P[5]+P[6],1]+z Spab[4,P[2]+P[5]+P[6],2];
IR3 = -Spaa[1,5] (Spbb[1,5]+z Spbb[2,5])-Spaa[1,6] (Spbb[1,6]+z Spbb[2,6])-Spaa[5,6] Spbb[5,6];
\[CapitalOmega] = (Spaa[2,4]-z Spaa[1,4])/(z Spaa[3,4] UV1 IR1 IR2 IR3 Spbb[5,6]);
\[CapitalOmega]C = (Spaa[2,5]Spbb[3,6])/(Spaa[1,5]Spaa[1,2]Spab[2,P[3]+P[4]+P[6],6] Spab[5,P[3]+P[4]+P[6],3] Spbb[3,4] Spbb[4,6]);
\[Omega] = (FullSimplify[Residue[\[CapitalOmega],{z,Spab[2,P[2]+P[3]+P[4],6]/Spab[1,P[1]+P[3]+P[4],6]}]]//.{Spaa[2,4] Spab[1,P[1]+P[3]+P[4],6]-Spaa[1,4] Spab[2,P[2]+P[3]+P[4],6]->Spaa[1,2]Spaa[3,4] Spbb[3,6],-Spaa[2,4] Spab[1,P[1]+P[3]+P[4],6]+Spaa[1,4] Spab[2,P[2]+P[3]+P[4],6]->-Spaa[1,2]Spaa[3,4] Spbb[3,6],-Spaa[2,3] Spab[1,P[1]+P[3]+P[4],6]+Spaa[1,3] Spab[2,P[2]+P[3]+P[4],6]->Spaa[1,2]Spaa[3,4] Spbb[4,6]}//.{Spab[1,P[1]+P[3]+P[4],6] Spab[4,P[1]+P[5]+P[6],1]+Spab[2,P[2]+P[3]+P[4],6] Spab[4,P[2]+P[5]+P[6],2]->Spaa[3,4] Spab[5,P[3]+P[4]+P[6],3] Spbb[5,6],Spab[2,P[2]+P[3]+P[4],6]->Spab[2,P[3]+P[4]+P[6],6],Spab[5,P[4]+P[6],3]->Spab[5,P[3]+P[4]+P[6],3],Spaa[1,5] Spbb[1,5]+Spaa[1,6] Spbb[1,6]+Spaa[5,6] Spbb[5,6]->-s[1,5,6]}//.SPAB//.Spab[1,P[5]+P[6],2]->Spab[1,P[2]+P[5]+P[6],2]//FullSimplify)//.(s[1,5,6] Spab[1,P[1]+P[3]+P[4],6]+Spab[1,P[2]+P[5]+P[6],2] Spab[2,P[3]+P[4]+P[6],6])->Spaa[1,5] Spaa[3,4]Spbb[3,4] Spbb[5,6]


DefNumSH[6]
\[Omega] = (FullSimplify[Residue[\[CapitalOmega],{z,Spab[2,P[2]+P[3]+P[4],6]/Spab[1,P[1]+P[3]+P[4],6]}]]//.{Spaa[2,4] Spab[1,P[1]+P[3]+P[4],6]-Spaa[1,4] Spab[2,P[2]+P[3]+P[4],6]->Spaa[1,2]Spaa[3,4] Spbb[3,6],-Spaa[2,4] Spab[1,P[1]+P[3]+P[4],6]+Spaa[1,4] Spab[2,P[2]+P[3]+P[4],6]->-Spaa[1,2]Spaa[3,4] Spbb[3,6],-Spaa[2,3] Spab[1,P[1]+P[3]+P[4],6]+Spaa[1,3] Spab[2,P[2]+P[3]+P[4],6]->Spaa[1,2]Spaa[3,4] Spbb[4,6]}//.{Spab[1,P[1]+P[3]+P[4],6] Spab[4,P[1]+P[5]+P[6],1]+Spab[2,P[2]+P[3]+P[4],6] Spab[4,P[2]+P[5]+P[6],2]->Spaa[3,4] Spab[5,P[3]+P[4]+P[6],3] Spbb[5,6],Spab[2,P[2]+P[3]+P[4],6]->Spab[2,P[3]+P[4]+P[6],6],Spab[5,P[4]+P[6],3]->Spab[5,P[3]+P[4]+P[6],3],Spaa[1,5] Spbb[1,5]+Spaa[1,6] Spbb[1,6]+Spaa[5,6] Spbb[5,6]->-s[1,5,6]}//.SPAB//.Spab[1,P[5]+P[6],2]->Spab[1,P[2]+P[5]+P[6],2]//FullSimplify)//.(s[1,5,6] Spab[1,P[1]+P[3]+P[4],6]+Spab[1,P[2]+P[5]+P[6],2] Spab[2,P[3]+P[4]+P[6],6])->Spaa[1,5] Spaa[3,4]Spbb[3,4] Spbb[5,6];
\[CapitalOmega] = (Spaa[2,4]-z Spaa[1,4])/(z Spaa[3,4] UV1 IR1 IR2 IR3 Spbb[5,6]);
\[CapitalOmega]C = (Spaa[2,6]Spbb[3,5])/(s[1,2,5]Spaa[1,5]Spaa[1,2]Spab[2,P[3]+P[4]+P[6],6] Spab[5,P[3]+P[4]+P[6],3] Spbb[3,4] Spbb[4,6]);
\[Omega]//.SHtest//.NSpinHel//N
\[CapitalOmega]C//.SHtest//.NSpinHel//N
(Spab[1,P[1]+P[3]+P[4],6]^2 Spaa[1,2])/( Spbb[5,6]^3 Spaa[3,4]^3 Spaa[2,6])//.SHtest//.NSpinHel//N


DefNumSH[6]
Res1 = Residue[\[CapitalOmega],{z,Spab[2,P[2]+P[3]+P[4],6]/Spab[1,P[1]+P[3]+P[4],6]}]//.SHtest//.NSpinHel;
Res2 = Residue[\[CapitalOmega],{z,Spaa[2,3]/Spaa[1,3]}]//.SHtest//.NSpinHel;
Res3 = Residue[\[CapitalOmega],{z,-Spab[4,P[1]+P[5]+P[6],1]/Spab[4,P[2]+P[5]+P[6],2]}]//.SHtest//.NSpinHel;
Res4 = Residue[\[CapitalOmega],{z,(-Spaa[1,5] Spbb[1,5]-Spaa[1,6] Spbb[1,6]-Spaa[5,6] Spbb[5,6])/(Spaa[1,5] Spbb[2,5]+Spaa[1,6] Spbb[2,6])}]//.SHtest//.NSpinHel;
Res5 = Residue[\[CapitalOmega],{z,0}]//.SHtest//.NSpinHel;
Res1+Res2+Res3+Res4+Res5//FullSimplify


UV1 = Spab[2,P[2]+P[3]+P[4],6]-z Spab[1,P[1]+P[3]+P[4],6];
IR1 = Spaa[2,3]-z Spaa[1,3]
IR2 = Spab[4,P[1]+P[5]+P[6],1]+z Spab[4,P[2]+P[5]+P[6],2];
IR3 = -Spaa[1,5] (Spbb[1,5]+z Spbb[2,5])-Spaa[1,6] (Spbb[1,6]+z Spbb[2,6])-Spaa[5,6] Spbb[5,6];
\[CapitalOmega] = (Spaa[2,4]-z Spaa[1,4])/(z Spaa[3,4] UV1 IR1 IR2 IR3 Spbb[5,6]);
\[CapitalOmega]C = (Spaa[2,5]Spbb[3,6])/(Spaa[1,5]Spaa[1,2]Spab[2,P[3]+P[4]+P[6],6] Spab[5,P[3]+P[4]+P[6],3] Spbb[3,4] Spbb[4,6]);
\[Omega] = (FullSimplify[Residue[\[CapitalOmega],{z,Spab[2,P[2]+P[3]+P[4],6]/Spab[1,P[1]+P[3]+P[4],6]}]]//.{Spaa[2,4] Spab[1,P[1]+P[3]+P[4],6]-Spaa[1,4] Spab[2,P[2]+P[3]+P[4],6]->Spaa[1,2]Spaa[3,4] Spbb[3,6],-Spaa[2,4] Spab[1,P[1]+P[3]+P[4],6]+Spaa[1,4] Spab[2,P[2]+P[3]+P[4],6]->-Spaa[1,2]Spaa[3,4] Spbb[3,6],-Spaa[2,3] Spab[1,P[1]+P[3]+P[4],6]+Spaa[1,3] Spab[2,P[2]+P[3]+P[4],6]->Spaa[1,2]Spaa[3,4] Spbb[4,6]}//.{Spab[1,P[1]+P[3]+P[4],6] Spab[4,P[1]+P[5]+P[6],1]+Spab[2,P[2]+P[3]+P[4],6] Spab[4,P[2]+P[5]+P[6],2]->Spaa[3,4] Spab[5,P[3]+P[4]+P[6],3] Spbb[5,6],Spab[2,P[2]+P[3]+P[4],6]->Spab[2,P[3]+P[4]+P[6],6],Spab[5,P[4]+P[6],3]->Spab[5,P[3]+P[4]+P[6],3],Spaa[1,5] Spbb[1,5]+Spaa[1,6] Spbb[1,6]+Spaa[5,6] Spbb[5,6]->-s[1,5,6]}//.SPAB//.Spab[1,P[5]+P[6],2]->Spab[1,P[2]+P[5]+P[6],2]//FullSimplify)//.(s[1,5,6] Spab[1,P[1]+P[3]+P[4],6]+Spab[1,P[2]+P[5]+P[6],2] Spab[2,P[3]+P[4]+P[6],6])->Spaa[1,5] Spaa[3,4]Spbb[3,4] Spbb[5,6]


(* ::Subsubsection:: *)
(*Residue on hexagon check umuts calculation*)


(*Residue on hexagon, calculation from paper*)
DefNumSH[6]
zp = 1/(2 Spab[1,P[1]+P[5]+P[6],2]) (-Spab[1,P[1]+P[5]+P[6],1]+Spab[2,P[2]+P[5]+P[6],2]+Sqrt[-4 s[1,2] s[5,6]+(s[1,5]+s[1,6]+s[2,5]+s[2,6])^2]);
zm = 1/(2 Spab[1,P[1]+P[5]+P[6],2]) (-Spab[1,P[1]+P[5]+P[6],1]+Spab[2,P[2]+P[5]+P[6],2]-Sqrt[-4 s[1,2] s[5,6]+(s[1,5]+s[1,6]+s[2,5]+s[2,6])^2]);
UV1 = -Spab[1,P[1]+P[5]+P[6],2]*(z-zp)(z-zm);
UV2 = Spab[3,P[1]+P[5]+P[6],1]+z Spab[3,P[2]+P[5]+P[6],2];
IR = Spab[2,P[2]+P[3]+P[4],5]-z Spab[1,P[1]+P[3]+P[4],5];
\[CapitalOmega] = 1/(z Spaa[3,4] UV1 UV2 IR Spbb[5,6]);
\[Omega]1 = FullSimplify[Residue[\[CapitalOmega],{z,zm}]]//.SHtest//.NSpinHel;
\[Omega]2 = FullSimplify[Residue[\[CapitalOmega],{z,zp}]]//.SHtest//.NSpinHel;


(*Numerically checking the form for the twisted non planar residue diagram against the UV pole*)
some = -1/(Spab[1,P[1]+P[5]+P[6],2](zp-zm)Spbb[5,6]Spaa[3,4](-Spaa[1,5] (Spbb[1,5]+zm Spbb[2,5])-Spaa[1,6] (Spbb[1,6]+zm Spbb[2,6])-Spaa[5,6] Spbb[5,6])(Spaa[2,3]-zm Spaa[1,3])(Spbb[1,5]+zm Spbb[2,5])zm)//.SHtest//.NSpinHel;
some2 = 1/(Spab[1,P[1]+P[5]+P[6],2](zp-zm)Spbb[5,6]Spaa[3,4](-Spaa[1,5] (Spbb[1,5]+zp Spbb[2,5])-Spaa[1,6] (Spbb[1,6]+zp Spbb[2,6])-Spaa[5,6] Spbb[5,6])(Spaa[2,3]-zp Spaa[1,3])(Spbb[1,5]+zp Spbb[2,5])zp)//.SHtest//.NSpinHel;
Test  = \[Omega]1/some//FullSimplify
\[Omega]2/some2//FullSimplify


(* ::Subsection::Closed:: *)
(*6 pt NMHV calculation, on residue --> double pentabox*)


(* ::Subsubsection::Closed:: *)
(*No cycle *)


(*\[Delta] = 1/(1-a[7] a[8])*)
CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{"a", "[", "7", "]"}], "0", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "7", "]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "7", "]"}]}]}], "0", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "7", "]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "7", "]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}]}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{"-", 
RowBox[{"a", "[", "7", "]"}]}], "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{"a", "[", "7", "]"}]}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "7", "]"}]}], "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"a", "[", "7", "]"}]}], "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "7", "]"}]}]}], ")"}]}], "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "7", "]"}]}], "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "6", "]"}]}], 
RowBox[{"a", "[", "7", "]"}]}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}]}], "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}]}]}], ")"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[1]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[2]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[2]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[3]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[3]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A9 = TensorExpand[(perpEQ[[3]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;
B7 = TensorExpand[(CEQ[[3]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B8 = TensorExpand[(CEQ[[3]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B9 = TensorExpand[(CEQ[[3]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;


(*One set of solutions*)

Simplify[Simplify[Simplify[FullSimplify[Solve[{A1==0,A7==0,A4==0,A6==0,A2==0,A8==0,B8==0},{a[1],a[2],a[3],a[4],a[5],a[6],a[7]}]]//.schoutenA]//.schoutenA//.schoutenB]//.SPAB];

Sol = {a[1]->(Spaa[1,3] Spab[2,P[2]+P[5]+P[6],4])/(Spaa[2,5] Spab[3,P[2]+P[5]+P[6],4]),a[2]->Spaa[2,6]/Spaa[2,5],a[3]->Spaa[2,4]/Spaa[2,3],a[4]->-(Spaa[3,4]/Spaa[2,3]),a[5]->-(Spab[1,P[2]+P[5]+P[6],4]/Spab[3,P[2]+P[5]+P[6],4]),a[6]->-(Spaa[5,6]/Spaa[2,5]),a[7]->(Spaa[2,5] Spab[3,P[2]+P[5]+P[6],4])/(Spaa[1,3] Spab[5,P[2]+P[5]+P[6],4])}//.{Spab[1,P[2]+P[5]+P[6],4]->-Spab[1,P[1]+P[3]+P[4],4],Spab[3,P[2]+P[5]+P[6],4]->-Spab[3,P[1]+P[3]+P[4],4]}//.SHtest//.SPAB


(*Different solutions. Used: A1==0,A8==0,B3==0,A2==0,B8==0,B6==0,A5==0*)
DefNumSH[6]
FullSPAB = {Spab[i_,P[j_]+P[k_],r_]-Spaa[l_,i_] Spbb[l_,r_]->Spab[i,P[l]+P[j]+P[k],r],Spab[i_,P[j_]+P[k_],r_]+Spaa[i_,l_] Spbb[l_,r_]->Spab[i,P[l]+P[j]+P[k],r]};
Simplify[Simplify[Simplify[FullSimplify[Solve[{A1==0,A8==0,B3==0,A2==0,B8==0,B6==0,A5==0},{a[1],a[2],a[3],a[4],a[5],a[6],a[7]}]]//.schoutenA]//.schoutenA//.schoutenB]]//.NSpinHel


Sol = {a[1]->Spbb[5,6]/Spbb[1,6],a[2]->-Spbb[1,5]/Spbb[1,6],a[3]->Spaa[2,4]/Spaa[2,3],a[4]->-(Spaa[3,4]/Spaa[2,3]),a[5]->-(Spab[2,P[1]+P[5]+P[6],6]/(Spaa[2,3] Spbb[1,6])),a[6]->Spab[3,P[1]+P[5]+P[6],1]/(Spaa[2,3] Spbb[1,6]),a[7]->-((Spaa[2,3] Spbb[1,6])/Spab[3,P[1]+P[5]+P[6],6])}


(*\[Delta] in left loop*)
Together[1-a[1](-a[2])^(-1)a[6]a[7]//.Sol]
Together[1-1/(a[1](-a[2])^(-1)a[6]a[7])//.Sol]


(* ::InheritFromParent:: *)
(*(Spab[3,P[1]+P[5]+P[6],5] Spbb[1,6])/(Spab[3,P[1]+P[5]+P[6],1] Spbb[5,6])*)


(* ::InheritFromParent:: *)
(*(Spab[3,P[1]+P[5]+P[6],5] Spbb[1,6])/(Spab[3,P[1]+P[5]+P[6],6] Spbb[1,5])*)


(Spab[3,P[1]+P[5]+P[6],5] Spbb[1,6])/(Spab[3,P[1]+P[5]+P[6],1] Spbb[5,6])
(Spab[3,P[1]+P[5]+P[6],5] Spbb[1,6])/(Spab[3,P[1]+P[5]+P[6],6] Spbb[1,5])


(Spaa[2,3] Spab[4,P[1]+P[5]+P[6],6])/(Spaa[2,4] Spab[3,P[1]+P[5]+P[6],6])
(Spaa[2,3] Spab[4,P[1]+P[5]+P[6],6])/(Spaa[3,4] Spab[2,P[1]+P[5]+P[6],6])


DefNumSH[6]



TA[1] = Simplify[A1//.Sol//.SHtest//.NSpinHel]
TA[2] = A2//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[3] = A3//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[4] = A4//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[5] = A5//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[6] = A6//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[7] = A7//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[8] = A8//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[9] = A9//.Sol//.SHtest//.NSpinHel//FullSimplify

TB[1] = B1//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[2] = B2//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[3] = B3//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[4] = B4//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[5] = B5//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[6] = B6//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[7] = B7//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[8] = B8//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[9] = B9//.Sol//.SHtest//.NSpinHel//FullSimplify


(* ::InheritFromParent:: *)
(*0*)


A7//.Sol//FullSimplify; (*(Spab[2,P[1]+P[5]+P[6],1] Spaa[1,3])/(Spaa[2,3] Spbb[1,6])*)
B4//.Sol//FullSimplify; (*-((Spbb[2,6] Spab[2,P[1]+P[5]+P[6],1])/(Spaa[2,3] Spbb[1,6]))*)
Simplify[Together[FullSimplify[B5//.Sol]]//.{Spaa[2,3] Spab[2,P[1]+P[5]+P[6],6] Spbb[1,6] Spbb[2,4]+Spaa[2,3] Spab[3,P[1]+P[5]+P[6],6] Spbb[1,6] Spbb[3,4]->Spaa[2,3]Spbb[1,6]Spbb[4,6]s[2,3,4]}]//.{-Spab[2,P[1]+P[5]+P[6],6] Spab[3,P[1]+P[5]+P[6],1]+s[2,3,4] Spaa[2,3] Spbb[1,6]->-Spab[2,P[1]+P[5]+P[6],1] Spab[3,P[1]+P[5]+P[6],6]}
Together[Simplify[Together[FullSimplify[A9//.Sol]]]//.{-Spaa[3,5] Spab[2,P[1]+P[5]+P[6],6]+Spaa[1,5] Spaa[2,3] Spbb[1,6]-> Spaa[2,5]Spab[3,P[1]+P[5]+P[6],6]}]//.{Spaa[2,5] Spab[3,P[1]+P[5]+P[6],1]-Spaa[2,3] Spaa[5,6] Spbb[1,6]->Spaa[3,5] Spab[2,P[1]+P[5]+P[6],1]}


Together[FullSimplify[B4//.Sol]//.Spaa[3,4] Spbb[1,6] Spbb[2,4]-Spab[3,P[1]+P[5]+P[6],1] Spbb[2,6]->Spab[3,P[1]+P[5]+P[6],6] Spbb[1,2]]//Simplify





-Spab[2,P[2]+P[3]+P[4],6] Spbb[1,2]-Spaa[2,3] Spbb[1,6] Spbb[2,3]-Spaa[2,4] Spbb[1,6] Spbb[2,4]//.SHtest//Simplify;
-((Spaa[2,3] Spbb[1,3]+Spaa[2,4] Spbb[1,4]) Spbb[2,6])//.SPAB


(* ::InheritFromParent:: *)
(*Spab[2,P[1]+P[4],1] Spbb[2,6]*)


(* ::InheritFromParent:: *)
(**)


(* ::InheritFromParent:: *)
(**)


(*Different solutions. Used: A1==0,A8==0,B3==0,A2==0,B8==0,B6==0,A5==0*)
EE[1] = A1;
EE[2] = A2;
EE[3] = A5;
EE[4] = A8;
EE[5] = B3;
EE[6] = B6;
EE[7] = B8;


\[Delta] = Together[1-(-a[3])^(-1)a[4]a[5]a[7]//.Sol]//.{-Spaa[3,4] Spab[2,P[1]+P[5]+P[6],6]+Spaa[2,4] Spab[3,P[1]+P[5]+P[6],6]->Spaa[2,3] Spab[4,P[1]+P[5]+P[6],6]}

Together[1-1/((-a[3])^(-1)a[4]a[5]a[7])//.Sol]//.{-Spaa[3,4] Spab[2,P[1]+P[5]+P[6],6]+Spaa[2,4] Spab[3,P[1]+P[5]+P[6],6]->Spaa[2,3] Spab[4,P[1]+P[5]+P[6],6]}


(* ::InheritFromParent:: *)
(*(Spaa[2,3] Spab[4,P[1]+P[5]+P[6],6])/(Spaa[3,4] Spab[2,P[1]+P[5]+P[6],6])*)


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,7},{j,1,7}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol]//.SHtest//.SPAB//FullSimplify
J=-(Spab[3,P[1]+P[5]+P[6],6]^4/(Spaa[1,3]^2 Spaa[2,3]^3 Spaa[3,5] Spab[3,P[1]+P[5]+P[6],6] Spab[3,P[1]+P[5]+P[6],6] Spbb[1,6]^3 Spbb[4,6]^2))


Product[1/a[i],{i,1,7}]//Simplify;
\[CapitalOmega] = Product[1/a[i],{i,1,7}]*J (Spbb[4,6]^2Spaa[1,3]^2Spaa[3,5])/Spab[3,P[1]+P[5]+P[6],6]^4//.Sol//Simplify


Collect[FullSimplify[FullSimplify[SEQ[[1]]//.Sol]*Spab[3,P[1]+P[5]+P[6],6]//.SHtest],Spbb[1,6]]//. (Spbb[5,6] \[Eta][1]+Spbb[1,5] \[Eta][6])-> (Spbb[1,6] \[Eta][5])//Simplify

Collect[Collect[Together[FullSimplify[FullSimplify[SEQ[[2]]//.Sol]]]*(Spaa[2,3] Spab[3,P[1]+P[5]+P[6],6] Spbb[1,6]),\[Eta][4]Spbb[1,6]]//.{-Spaa[3,4] Spab[2,P[1]+P[5]+P[6],6]+Spaa[2,4] Spab[3,P[1]+P[5]+P[6],6]->Spaa[2,3] Spab[4,P[1]+P[5]+P[6],6]},Spaa[2,3] Spbb[1,6]]
(FullSimplify[Collect[Together[FullSimplify[SEQ[[3]]//.Sol]]*(Spab[3,P[1]+P[5]+P[6],6] Spbb[1,6]),\[Eta][6]]//.{-Spab[3,P[1]+P[5]+P[6],6] Spbb[1,5]-Spab[3,P[1]+P[5]+P[6],1] Spbb[5,6]->Spab[3,P[1]+P[5]+P[6],5] Spbb[1,6]}//.SHtest]//. (Spbb[1,6] \[Eta][5]+Spbb[1,5] \[Eta][6])-> (Spbb[5,6] \[Eta][1])//FullSimplify)/Spbb[1,6]


(Spab[2,P[1]+P[5]+P[6],6] \[Eta][2]+Spab[3,P[1]+P[5]+P[6],6] \[Eta][3]+Spab[4,P[1]+P[5]+P[6],6] \[Eta][4])//.SHtest//Expand//FullSimplify



(* ::InheritFromParent:: *)
(*-Spaa[1,2] Spbb[1,6] \[Eta][2]-Spbb[1,6] (Spaa[1,3] \[Eta][3]+Spaa[1,4] \[Eta][4])+Spbb[5,6] (Spaa[1,5] \[Eta][2]+Spaa[5,5] \[Eta][3]+Spaa[6,5] \[Eta][4])*)


(* ::InheritFromParent:: *)
(*-Spaa[1,2] Spbb[1,6] \[Eta][2]-Spbb[1,6] (Spaa[1,3] \[Eta][3]+Spaa[1,4] \[Eta][4])+Spbb[5,6] (Spaa[1,5] \[Eta][1]-Spaa[5,6] \[Eta][6])//FullSimplify*)


(* ::InheritFromParent:: *)
(*-Spbb[1,6] (Spaa[1,1] \[Eta][1]+Spaa[1,5] \[Eta][5]+Spaa[1,6] \[Eta][6])+Spbb[5,6] (Spaa[1,5] \[Eta][1]-Spaa[5,6] \[Eta][6])//FullSimplify*)


(* ::InheritFromParent:: *)
(*(-Spbb[1,6] (Spaa[1,5] \[Eta][5]+Spaa[1,6] \[Eta][6])+Spbb[5,6] (Spaa[1,5] \[Eta][1]-Spaa[5,6] \[Eta][6])//Expand*)


(* ::InheritFromParent:: *)
(*Spaa[1,5] Spbb[5,6] \[Eta][1]-Spaa[1,5] Spbb[1,6] \[Eta][5]-Spaa[1,6] Spbb[1,6] \[Eta][6]-Spaa[5,6] Spbb[5,6] \[Eta][6]//.SPAB*)


(* ::InheritFromParent:: *)
(*Spaa[1,5] Spbb[5,6] \[Eta][1]-Spaa[1,5] Spbb[1,6] \[Eta][5]-Spab[6,P[1]+P[5]+P[6],6]\[Eta][6]*)


(* ::InheritFromParent:: *)
(*Collect[(Spaa[1,5] Spbb[5,6] \[Eta][1]-Spaa[1,5] Spbb[1,6] \[Eta][5]-Spab[6,P[1]+P[5]+P[6],6]\[Eta][6])Spaa[2,3] Spbb[1,6] +Spab[2,P[1]+P[5]+P[6],6] Spab[3,P[1]+P[5]+P[6],1] \[Eta][6]//FullSimplify,\[Eta][6]]*)


DefNumSH[6]
(Spab[2,P[1]+P[5]+P[6],6] Spab[3,P[1]+P[5]+P[6],1]-Spaa[2,3] Spab[6,P[1]+P[5]+P[6],6] Spbb[1,6])//.SHtest//.NSpinHel
-Spaa[1,5] Spaa[2,3] Spbb[1,6]Spbb[5,6]//.SHtest//.NSpinHel


(* ::Subsubsection::Closed:: *)
(*With cycle*)


(*\[Delta] = 1/(1-a[7] a[8])*)
CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], "0", "0", 
RowBox[{
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "3", "]"}], "\[Delta]"}], "1", "0", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], "0", "1", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "7", "]"}]}], "\[Delta]"}], "1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], "0", "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], "\[Delta]"}], 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "6", "]"}]}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}]}], ")"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[1]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[2]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[3]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[3]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A9 = TensorExpand[(perpEQ[[3]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;
B7 = TensorExpand[(CEQ[[3]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B8 = TensorExpand[(CEQ[[3]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B9 = TensorExpand[(CEQ[[3]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;


Sol = {a[1]->Spbb[5,6]/Spbb[1,6],a[2]->-Spbb[1,5]/Spbb[1,6],a[3]->(Spaa[2,4]/Spaa[2,3])^(-1),a[4]->(Spaa[3,4]/Spaa[2,3]),a[5]->-Spab[2,P[1]+P[5]+P[6],6]/(Spaa[2,3] Spbb[1,6]),a[6]->Spab[3,P[1]+P[5]+P[6],1]/(Spaa[2,3] Spbb[1,6]),a[7]->-((Spaa[2,3] Spbb[1,6])/Spab[3,P[1]+P[5]+P[6],6])}


\[Delta] = Together[1/(1-a[3]a[4]a[5]a[7])//.Sol]


DefNumSH[6]


TA[1] = Simplify[A1//.Sol//.SHtest//.NSpinHel]
TA[2] = A2//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[3] = A3//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[4] = A4//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[5] = A5//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[6] = A6//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[7] = A7//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[8] = A8//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[9] = A9//.Sol//.SHtest//.NSpinHel//FullSimplify

TB[1] = B1//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[2] = B2//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[3] = B3//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[4] = B4//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[5] = B5//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[6] = B6//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[7] = B7//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[8] = B8//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[9] = B9//.Sol//.SHtest//.NSpinHel//FullSimplify


Together[FullSimplify[A8//.Sol]//.Spaa[3,4] Spab[2,P[1]+P[5]+P[6],6]-Spaa[2,4] Spab[3,P[1]+P[5]+P[6],6]->Spaa[2,3] Spab[4,P[1]+P[5]+P[6],6]//.SPAB//.Spab[4,P[1]+P[5],6]->Spab[4,P[1]+P[5]+P[6],6]]//.-Spaa[2,3] Spaa[4,5] Spbb[1,5]-Spaa[2,3] Spaa[4,6] Spbb[1,6]->Spaa[2,3] Spab[4,P[1]+P[5]+P[6],1]


(* ::InheritFromParent:: *)
(*(Spaa[3,4] Spab[2,P[1]+P[5]+P[6],1])/(Spaa[2,3] Spbb[1,6])*)


1+a[1]a[7]a[6]a[2]^(-1)//.Sol//Together


Residue[1/(Spaa[3,4]\[Beta] \[Alpha] Spaa[2,3]/Spaa[3,4] Spaa[2,4](\[Alpha] Spaa[2,3]+\[Beta] \[Alpha] Spaa[2,3])Spab[2,P[1]+P[5]+P[6],5]Spbb[5,6]),{\[Beta],0}]


SEQ//.Sol//FullSimplify


(* ::Subsection::Closed:: *)
(*6 pt NMHV calculation, on residue --> non planar*)


(* ::Subsubsection::Closed:: *)
(*No cycle *)


(*\[Delta] = 1/(1-a[7] a[8])*)
CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "8", "]"}]}]}], "0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "8", "]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "8", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "8", "]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "8", "]"}]}]}], "0", 
RowBox[{"a", "[", "8", "]"}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "8", "]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "8", "]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "8", "]"}]}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "8", "]"}]}]}], ")"}]}], "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"a", "[", "8", "]"}]}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "8", "]"}]}], "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "8", "]"}]}], "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "8", "]"}]}]}], ")"}]}], "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "8", "]"}]}], "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "8", "]"}]}], "0", 
RowBox[{"-", 
RowBox[{"a", "[", "8", "]"}]}], "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "8", "]"}]}]}], ")"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]};
SEQ = CC . Transpose[eta];



minor[CC,1,2,3]
minor[CC,4,5,6]


Minors[CC]


Delete[CC,{1,2,3}]


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[1]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[2]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[2]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[3]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[3]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A9 = TensorExpand[(perpEQ[[3]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;
B7 = TensorExpand[(CEQ[[3]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B8 = TensorExpand[(CEQ[[3]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B9 = TensorExpand[(CEQ[[3]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;


a[3] = (a[1] Spaa[1,4]-Spaa[2,4])/(a[1] Spaa[1,3]-Spaa[2,3]);
a[7] = (a[1] Spaa[1,6]-Spaa[2,6])/(a[1] Spaa[1,5]-Spaa[2,5]);


(*One set of solutions*)
Sol = FullSimplify[Simplify[Simplify[FullSimplify[Solve[{A1==0,A7==0,A4==0,A6==0,A2==0,B8==0,A8==0},{a[2],a[3],a[4],a[5],a[6],a[7],a[8]}]]//.schoutenA]//.schoutenA//.schoutenB]//.SPAB]//.FullSPAB;


Sol = {{a[2]->(Spbb[1,4]+a[1] Spbb[2,4])/(Spaa[1,3] Spbb[3,4]),a[3]->(a[1] Spaa[1,4]-Spaa[2,4])/(a[1] Spaa[1,3]-Spaa[2,3]),a[4]->(a[1] Spaa[1,5]-Spaa[2,5])/Spaa[5,6],a[5]->((a[1] Spaa[1,5]-Spaa[2,5]) Spaa[3,4])/((a[1] Spaa[1,3]-Spaa[2,3]) Spaa[5,6]),a[6]->-((a[1] Spab[1,P[1]+P[5]+P[6],4]+Spab[2,P[2]+P[5]+P[6],4])/((a[1] Spaa[1,5]-Spaa[2,5]) Spbb[3,4])),a[7]->(a[1] Spaa[1,6]-Spaa[2,6])/(a[1] Spaa[1,5]-Spaa[2,5]),a[8]->(Spaa[5,6] Spab[1,P[2]+P[5]+P[6],4])/(Spaa[1,3] (Spaa[1,5] (Spbb[1,4]+a[1] Spbb[2,4])+Spaa[3,5] Spbb[3,4]))}}


Together[FullSimplify[1+a[3]^(-1)a[5]a[8]//.Sol ]]


TA[1] = Simplify[A1//.Sol//.SHtest//.NSpinHel]
TA[2] = A2//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[3] = A3//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[4] = A4//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[5] = A5//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[6] = A6//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[7] = A7//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[8] = A8//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[9] = A9//.Sol//.SHtest//.NSpinHel//FullSimplify

TB[1] = B1//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[2] = B2//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[3] = B3//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[4] = B4//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[5] = B5//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[6] = B6//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[7] = B7//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[8] = B8//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[9] = B9//.Sol//.SHtest//.NSpinHel//FullSimplify


(* ::InheritFromParent:: *)
(*0*)


(*Different solutions. Used: A1==0,A7==0,A4==0,A6==0,A2==0,B8==0,A8\[Equal]0*)
EE[1] = A1;
EE[2] = A2;
EE[3] = A4;
EE[4] = A6;
EE[5] = A7;
EE[6] = A8;
EE[7] = B8;


\[Delta] = Together[1-(-a[3])^(-1)a[4]a[5]a[7]//.Sol]//.{-Spaa[3,4] Spab[2,P[1]+P[5]+P[6],6]+Spaa[2,4] Spab[3,P[1]+P[5]+P[6],6]->Spaa[2,3] Spab[4,P[1]+P[5]+P[6],6]}

Together[1-1/((-a[3])^(-1)a[4]a[5]a[7])//.Sol]//.{-Spaa[3,4] Spab[2,P[1]+P[5]+P[6],6]+Spaa[2,4] Spab[3,P[1]+P[5]+P[6],6]->Spaa[2,3] Spab[4,P[1]+P[5]+P[6],6]}


(* ::InheritFromParent:: *)
(*(Spaa[2,3] Spab[4,P[1]+P[5]+P[6],6])/(Spaa[3,4] Spab[2,P[1]+P[5]+P[6],6])*)


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,7},{j,1,7}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol]//.SHtest//.SPAB//FullSimplify


Expand[Spaa[1,5] (Spbb[1,4]+a[1] Spbb[2,4])+Spaa[3,5] Spbb[3,4]]//.SPAB


Product[1/a[i],{i,1,7}]//Simplify;
\[CapitalOmega] = Product[1/a[i],{i,1,7}]*J (Spbb[4,6]^2Spaa[1,3]^2Spaa[3,5])/Spab[3,P[1]+P[5]+P[6],6]^4//.Sol//Simplify


Collect[FullSimplify[FullSimplify[SEQ[[1]]//.Sol]*Spab[3,P[1]+P[5]+P[6],6]//.SHtest],Spbb[1,6]]//. (Spbb[5,6] \[Eta][1]+Spbb[1,5] \[Eta][6])-> (Spbb[1,6] \[Eta][5])//Simplify

Collect[Collect[Together[FullSimplify[FullSimplify[SEQ[[2]]//.Sol]]]*(Spaa[2,3] Spab[3,P[1]+P[5]+P[6],6] Spbb[1,6]),\[Eta][4]Spbb[1,6]]//.{-Spaa[3,4] Spab[2,P[1]+P[5]+P[6],6]+Spaa[2,4] Spab[3,P[1]+P[5]+P[6],6]->Spaa[2,3] Spab[4,P[1]+P[5]+P[6],6]},Spaa[2,3] Spbb[1,6]]
(FullSimplify[Collect[Together[FullSimplify[SEQ[[3]]//.Sol]]*(Spab[3,P[1]+P[5]+P[6],6] Spbb[1,6]),\[Eta][6]]//.{-Spab[3,P[1]+P[5]+P[6],6] Spbb[1,5]-Spab[3,P[1]+P[5]+P[6],1] Spbb[5,6]->Spab[3,P[1]+P[5]+P[6],5] Spbb[1,6]}//.SHtest]//. (Spbb[1,6] \[Eta][5]+Spbb[1,5] \[Eta][6])-> (Spbb[5,6] \[Eta][1])//FullSimplify)/Spbb[1,6]


(Spab[2,P[1]+P[5]+P[6],6] \[Eta][2]+Spab[3,P[1]+P[5]+P[6],6] \[Eta][3]+Spab[4,P[1]+P[5]+P[6],6] \[Eta][4])//.SHtest//Expand//FullSimplify



(* ::InheritFromParent:: *)
(*-Spaa[1,2] Spbb[1,6] \[Eta][2]-Spbb[1,6] (Spaa[1,3] \[Eta][3]+Spaa[1,4] \[Eta][4])+Spbb[5,6] (Spaa[1,5] \[Eta][2]+Spaa[5,5] \[Eta][3]+Spaa[6,5] \[Eta][4])*)


(* ::InheritFromParent:: *)
(*-Spaa[1,2] Spbb[1,6] \[Eta][2]-Spbb[1,6] (Spaa[1,3] \[Eta][3]+Spaa[1,4] \[Eta][4])+Spbb[5,6] (Spaa[1,5] \[Eta][1]-Spaa[5,6] \[Eta][6])//FullSimplify*)


(* ::InheritFromParent:: *)
(*-Spbb[1,6] (Spaa[1,1] \[Eta][1]+Spaa[1,5] \[Eta][5]+Spaa[1,6] \[Eta][6])+Spbb[5,6] (Spaa[1,5] \[Eta][1]-Spaa[5,6] \[Eta][6])//FullSimplify*)


(* ::InheritFromParent:: *)
(*(-Spbb[1,6] (Spaa[1,5] \[Eta][5]+Spaa[1,6] \[Eta][6])+Spbb[5,6] (Spaa[1,5] \[Eta][1]-Spaa[5,6] \[Eta][6])//Expand*)


(* ::InheritFromParent:: *)
(*Spaa[1,5] Spbb[5,6] \[Eta][1]-Spaa[1,5] Spbb[1,6] \[Eta][5]-Spaa[1,6] Spbb[1,6] \[Eta][6]-Spaa[5,6] Spbb[5,6] \[Eta][6]//.SPAB*)


(* ::InheritFromParent:: *)
(*Spaa[1,5] Spbb[5,6] \[Eta][1]-Spaa[1,5] Spbb[1,6] \[Eta][5]-Spab[6,P[1]+P[5]+P[6],6]\[Eta][6]*)


(* ::InheritFromParent:: *)
(*Collect[(Spaa[1,5] Spbb[5,6] \[Eta][1]-Spaa[1,5] Spbb[1,6] \[Eta][5]-Spab[6,P[1]+P[5]+P[6],6]\[Eta][6])Spaa[2,3] Spbb[1,6] +Spab[2,P[1]+P[5]+P[6],6] Spab[3,P[1]+P[5]+P[6],1] \[Eta][6]//FullSimplify,\[Eta][6]]*)


DefNumSH[6]
(Spab[2,P[1]+P[5]+P[6],6] Spab[3,P[1]+P[5]+P[6],1]-Spaa[2,3] Spab[6,P[1]+P[5]+P[6],6] Spbb[1,6])//.SHtest//.NSpinHel
-Spaa[1,5] Spaa[2,3] Spbb[1,6]Spbb[5,6]//.SHtest//.NSpinHel


(* ::Subsubsection::Closed:: *)
(*No cycle, one less loop *)


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}]}]}], "0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}]}], "0", 
RowBox[{"a", "[", "4", "]"}], "1", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}]}]}], ")"}]}], "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}]}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}]}], "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], ")"}]}], "1", 
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}]}], ")"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][3]]//.RB//.RR//FullSimplify
A3 = TensorExpand[(perpEQ[[1]]) . \[Lambda][5]]//.RB//.RR//FullSimplify
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A5 = TensorExpand[(perpEQ[[2]]) . \[Lambda][3]]//.RB//.RR//FullSimplify
A6 = TensorExpand[(perpEQ[[2]]) . \[Lambda][5]]//.RB//.RR//FullSimplify
A7 = TensorExpand[(perpEQ[[3]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A8 = TensorExpand[(perpEQ[[3]]) . \[Lambda][3]]//.RB//.RR//FullSimplify
A9 = TensorExpand[(perpEQ[[3]]) . \[Lambda][5]]//.RB//.RR//FullSimplify

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify
B7 = TensorExpand[(CEQ[[3]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify
B8 = TensorExpand[(CEQ[[3]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify
B9 = TensorExpand[(CEQ[[3]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify


FullSimplify[Simplify[Simplify[FullSimplify[Solve[{A2==0,A5==0,A1==0,B3==0,A6==0,A7==0,A8==0},{a[1],a[2],a[3],a[4],a[5],a[6],a[7]}]]//.schoutenA]//.schoutenA//.schoutenB]//.SPAB]//.FullSPAB//.{-Spab[5,P[1]+P[2],6]+Spaa[4,5] Spbb[4,6]->-Spab[5,P[1]+P[2]+P[4],6],Spab[4,P[1]+P[2],6]->Spab[4,P[1]+P[2]+P[4],6]}


Sol = {a[1]->Spaa[2,4]/Spaa[1,4],a[2]->-(Spab[4,P[1]+P[2]+P[4],6]/(Spaa[1,4] Spbb[3,6])),a[3]->Spbb[3,6]/Spbb[5,6],a[4]->-((Spaa[1,4] Spbb[5,6])/Spab[1,P[1]+P[2]+P[4],6]),a[5]->-(Spaa[5,6]/Spaa[4,5]),a[6]->-((Spaa[1,2] Spaa[4,5])/(Spaa[1,4] Spaa[5,6])),a[7]->Spaa[4,6]/Spaa[4,5]}


FullSimplify[Simplify[Simplify[FullSimplify[Solve[{A2==0,A5==0,B3==0,A6==0,A7==0,A8==0},{a[2],a[3],a[4],a[5],a[6],a[7]}]]//.schoutenA]//.schoutenA//.schoutenB]//.SPAB]//.FullSPAB//.{-Spab[5,P[1]+P[2],6]+Spaa[4,5] Spbb[4,6]->-Spab[5,P[1]+P[2]+P[4],6],Spab[4,P[1]+P[2],6]->Spab[4,P[1]+P[2]+P[4],6]};
Sol = {{a[2]->-((Spaa[3,4] Spaa[3,5] (Spbb[1,6]+a[1] Spbb[2,6]))/(Spaa[1,5] Spaa[3,4] (Spbb[1,6]+a[1] Spbb[2,6])+Spaa[4,5] ((a[1] Spaa[1,3]-Spaa[2,3]) Spbb[2,6]+Spaa[3,4] Spbb[4,6]))),a[3]->(Spaa[1,5] Spaa[3,4] (Spbb[1,6]+a[1] Spbb[2,6])+Spaa[4,5] ((a[1] Spaa[1,3]-Spaa[2,3]) Spbb[2,6]+Spaa[3,4] Spbb[4,6]))/(Spaa[3,4] Spab[3,P[1]+P[2]+P[4],6]),a[4]->(Spaa[3,4] Spab[3,P[1]+P[2]+P[4],6])/(Spaa[3,5] ((a[1] Spaa[1,3]-Spaa[2,3]) Spbb[2,6]+Spaa[3,4] Spbb[4,6])),a[5]->-(Spaa[5,6]/Spaa[4,5]),a[6]->((-a[1] Spaa[1,3]+Spaa[2,3]) Spaa[4,5])/(Spaa[3,4] Spaa[5,6]),a[7]->Spaa[4,6]/Spaa[4,5]}}



(* ::InheritFromParent:: *)
(**)


a[1] Spaa[1,3] Spbb[2,6]-Spaa[2,3] Spbb[2,6]+Spaa[3,4] Spbb[4,6]//.SPAB


(* ::InheritFromParent:: *)
(**)


Together[1+a[1]^(-1)a[2]a[3]a[4]a[5]a[6]//.Sol]//.{Spaa[2,4] Spab[1,P[1]+P[2]+P[4],6]+Spaa[1,2] Spab[4,P[1]+P[2]+P[4],6]->Spaa[1,4] Spab[2,P[1]+P[2]+P[4],6]}





TA[1] = Simplify[A1//.Sol//.SHtest//.NSpinHel]
TA[2] = A2//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[3] = A3//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[4] = A4//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[5] = A5//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[6] = A6//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[7] = A7//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[8] = A8//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[9] = A9//.Sol//.SHtest//.NSpinHel//FullSimplify

TB[1] = B1//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[2] = B2//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[3] = B3//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[4] = B4//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[5] = B5//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[6] = B6//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[7] = B7//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[8] = B8//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[9] = B9//.Sol//.SHtest//.NSpinHel//FullSimplify


(* ::InheritFromParent:: *)
(*0*)


Together[FullSimplify[B7//.Sol]//.SPAB]


(* ::InheritFromParent:: *)
(*(-Spab[1,P[1]+P[2]+P[4],6] Spab[4,P[2]+P[5]+P[6],2]+Spaa[1,4] Spab[5,P[2]+P[4]+P[6],2] Spbb[5,6])/(Spaa[4,5] Spab[1,P[1]+P[2]+P[4],6])*)


//.SHtest//Expand


Exp[I \[Pi]/2]


(*Different solutions. *)
EE[1] = A1;
EE[2] = A2;
EE[3] = A5;
EE[4] = A6;
EE[5] = A7;
EE[6] = A8;
EE[7] = B3;


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,7},{j,1,7}];
J = FullSimplify[FullSimplify[Simplify[1/(Det[Mat])]//.Sol]//.SHtest//.SPAB]//.SPAB//.FullSPAB;
J = Spab[1,P[1]+P[2]+P[4],6]/(Spaa[1,3]^2 Spaa[1,4]^2 Spaa[3,5]^2 Spaa[5,6] Spbb[3,6] Spbb[5,6]);


Product[1/a[i],{i,1,7}]//Simplify;
\[CapitalOmega] = Product[1/a[i],{i,1,7}]*J//.Sol//Simplify
\[CapitalOmega]*Spaa[1,3]^2*Spaa[3,5]^2*Spaa[5,6]/(Spaa[4,5]Spab[1,P[1]+P[2]+P[4],6]) Spaa[4,6]


Sol


(* ::Subsubsection::Closed:: *)
(*With cycle*)


(*\[Delta] = 1/(1-a[7] a[8])*)
CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], "0", "0", 
RowBox[{
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "3", "]"}], "\[Delta]"}], "1", "0", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], "0", "1", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "7", "]"}]}], "\[Delta]"}], "1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], "0", "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], "\[Delta]"}], 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "6", "]"}]}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}]}], ")"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[1]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[2]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[3]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[3]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A9 = TensorExpand[(perpEQ[[3]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;
B7 = TensorExpand[(CEQ[[3]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B8 = TensorExpand[(CEQ[[3]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B9 = TensorExpand[(CEQ[[3]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;


Sol = {a[1]->Spbb[5,6]/Spbb[1,6],a[2]->-Spbb[1,5]/Spbb[1,6],a[3]->(Spaa[2,4]/Spaa[2,3])^(-1),a[4]->(Spaa[3,4]/Spaa[2,3]),a[5]->-Spab[2,P[1]+P[5]+P[6],6]/(Spaa[2,3] Spbb[1,6]),a[6]->Spab[3,P[1]+P[5]+P[6],1]/(Spaa[2,3] Spbb[1,6]),a[7]->-((Spaa[2,3] Spbb[1,6])/Spab[3,P[1]+P[5]+P[6],6])}


\[Delta] = Together[1/(1-a[3]a[4]a[5]a[7])//.Sol]


DefNumSH[6]


TA[1] = Simplify[A1//.Sol//.SHtest//.NSpinHel]
TA[2] = A2//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[3] = A3//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[4] = A4//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[5] = A5//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[6] = A6//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[7] = A7//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[8] = A8//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[9] = A9//.Sol//.SHtest//.NSpinHel//FullSimplify

TB[1] = B1//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[2] = B2//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[3] = B3//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[4] = B4//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[5] = B5//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[6] = B6//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[7] = B7//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[8] = B8//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[9] = B9//.Sol//.SHtest//.NSpinHel//FullSimplify


Together[FullSimplify[A8//.Sol]//.Spaa[3,4] Spab[2,P[1]+P[5]+P[6],6]-Spaa[2,4] Spab[3,P[1]+P[5]+P[6],6]->Spaa[2,3] Spab[4,P[1]+P[5]+P[6],6]//.SPAB//.Spab[4,P[1]+P[5],6]->Spab[4,P[1]+P[5]+P[6],6]]//.-Spaa[2,3] Spaa[4,5] Spbb[1,5]-Spaa[2,3] Spaa[4,6] Spbb[1,6]->Spaa[2,3] Spab[4,P[1]+P[5]+P[6],1]


(* ::InheritFromParent:: *)
(*(Spaa[3,4] Spab[2,P[1]+P[5]+P[6],1])/(Spaa[2,3] Spbb[1,6])*)


1+a[1]a[7]a[6]a[2]^(-1)//.Sol//Together


Residue[1/(Spaa[3,4]\[Beta] \[Alpha] Spaa[2,3]/Spaa[3,4] Spaa[2,4](\[Alpha] Spaa[2,3]+\[Beta] \[Alpha] Spaa[2,3])Spab[2,P[1]+P[5]+P[6],5]Spbb[5,6]),{\[Beta],0}]


SEQ//.Sol//FullSimplify


(* ::Section:: *)
(*Singularities *)


(* ::Subsection::Closed:: *)
(*4 pt N=3 before residue with extra alpha*)


(*4 pt MHV*)
(*Define C-matrices and lambda*)
CC = {{a[2]a[3]a[4]\[Alpha] \[Delta], 1,a[2]\[Delta],0},{a[4]\[Alpha] \[Delta],0,a[1]a[2]a[4]\[Delta],1}};
Cperp = {{1,-a[2]a[3]a[4]\[Alpha] \[Delta],0,-a[4]\[Alpha] \[Delta]},{0,-a[2]\[Delta],1,- a[1]a[2]a[4]\[Delta]}};
lambda = {\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4]};
tlambda = {t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4]};

perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4]};
SEQ = CC . Transpose[eta];
(*Solve for \[Alpha]'s by solving one delta function constraint. Here we get the equations from the eq below*)

CC . Transpose[Cperp];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;


\[Delta]=1/(1-a[1]a[2]a[3]a[4]);


Sol = FullSimplify[Solve[{A1==0,A2==0,A3==0,A4==0},{a[1],a[2],a[3],a[4]}]]//.schoutenA


FullSimplify[FullSimplify[B3*Spaa[2,4]//.Sol]//.schoutenA]
FullSimplify[FullSimplify[B1*Spaa[2,4]//.Sol]//.schoutenA]
FullSimplify[FullSimplify[B2*Spaa[2,4]//.Sol]//.schoutenA]
FullSimplify[FullSimplify[B4*Spaa[2,4]//.Sol]//.schoutenA]


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A4;
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,4},{j,1,4}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol]//.schoutenA


(* ::Subsection::Closed:: *)
(*4 pt N=3 on residue*)


(*4 pt MHV*)
(*Define C-matrices and lambda*)
CC = {{a[1]a[2]\[Alpha], 1,a[1]a[2] a[3],0},{a[2]\[Alpha],0,a[2] a[3],1}};
Cperp = {{1,-a[1]a[2]\[Alpha],0,-a[2]\[Alpha]},{0,- a[3] a[1]a[2],1,- a[3] a[2]}};
lambda = {\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4]};
tlambda = {t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4]};

perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4]};
SEQ = CC . Transpose[eta];
(*Solve for \[Alpha]'s by solving one delta function constraint. Here we get the equations from the eq below*)

CC . Transpose[Cperp];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;


Sol = Solve[{A2==0,A3==0,A4==0},{a[1],a[2],a[3]}]


FullSimplify[A1*Spaa[3,4]//.Sol]//.schoutenA
FullSimplify[A1//.Sol]//.schoutenA


FullSimplify[CEQ[[1]]*Spaa[2,4]//.Sol]//.schoutenA
Simplify[FullSimplify[CEQ[[2]]*Spaa[3,4]Spaa[2,4]//.Sol]//.schoutenA//.{(Spaa[2,3] t\[Lambda][3]+Spaa[2,4] t\[Lambda][4])->(-Spaa[2,1] t\[Lambda][1])}]/Spaa[2,4]//.schoutenA
FullSimplify[SEQ[[1]]*Spaa[2,4]//.Sol]//.schoutenA
Simplify[FullSimplify[SEQ[[2]]*Spaa[3,4]Spaa[2,4]//.Sol]//.schoutenA//.{(Spaa[2,3] t\[Lambda][3]+Spaa[2,4] t\[Lambda][4])->(-Spaa[2,1] t\[Lambda][1])}]//.schoutenA


(Spaa[2,3]Spaa[2,4] \[Eta][2]+Spaa[3,4]Spaa[2,4] \[Eta][4])/Spaa[2,4]//Simplify


EE[1] = A2;
EE[2] = A3;
EE[3] = A4;
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,3},{j,1,3}];
J = Simplify[1/(Det[Mat])]//.Sol


1/(a[1]a[2]a[3]\[Alpha])*J*Spaa[3,4]//.Sol


\[CapitalOmega] = Spaa[2,4]/(Spaa[1,2]Spaa[2,3]Spaa[3,4]Spaa[4,1])*((Spaa[1,3] Spaa[2,4])/(Spaa[1,2] Spaa[3,4]))^(-1)
sing = {Spaa[i_,3]->\[Alpha] Spaa[i,1]+\[Beta] Spaa[i,j],Spaa[3,i_]->\[Alpha] Spaa[1,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]//.sing;
Residue[(\[CapitalOmega]//.sing),{\[Beta],0}]

sing2 = {Spaa[i_,1]->\[Alpha] Spaa[i,3]+\[Beta] Spaa[i,j],Spaa[1,i_]->\[Alpha] Spaa[3,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]//.sing2;
Residue[(\[CapitalOmega]//.sing2),{\[Beta],0}]


(* ::Subsection::Closed:: *)
(*Normal 4 pt on residue without extra parameter*)


(*4 pt MHV*)
(*Define C-matrices and lambda*)
CC = {{a[1]a[2]a[3], 1,a[1]a[2],0},{a[2]a[3],0,a[2],1}};
Cperp = {{1,-a[1]a[2]a[3],0,-a[2]a[3]},{0,-a[1]a[2],1,-a[2]}};
lambda = {\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4]};
tlambda = {t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4]};

perpEQ = Cperp . Transpose[lambda]
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4]};
SEQ = CC . Transpose[eta];
(*Solve for \[Alpha]'s by solving one delta function constraint. Here we get the equations from the eq below*)

CC . Transpose[Cperp];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;


Sol = Solve[{A1==0,A2==0,A3==0},{a[1],a[2],a[3]}]


CEQ[[1]]


(FullSimplify[A4*Spaa[1,2]//.Sol]//.schoutenA)/Spaa[2,4]


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,3},{j,1,3}];
J = Simplify[1/(Det[Mat])]//.Sol


\[CapitalOmega] = 1/(a[1]a[2]a[3])*J*Spaa[1,2]//.Sol
sing = {Spaa[i_,1]->\[Alpha] Spaa[i,3],Spaa[1,i_]->\[Alpha] Spaa[3,i]};
\[CapitalOmega]//.sing


(* ::Subsection::Closed:: *)
(*5 pt general N on residue (according to correct rule)*)


CC = \!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{"\[Alpha]", " ", 
RowBox[{"a", "[", "6", "]"}]}], "1", 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "6", "]"}]}], "0"},
{
RowBox[{"\[Alpha]", " ", 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "4", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}]}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp = \!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"-", "\[Alpha]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}], "0", "0", 
RowBox[{"-", 
RowBox[{"\[Alpha]", " ", 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}]}]}]},
{"0", 
RowBox[{"-", 
RowBox[{"a", "[", "6", "]"}]}], "1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{"a", "[", "6", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"a", "[", "6", "]"}]}], "0", "1", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}]}]}], ")"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);


lambda = {\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]};
tlambda = {t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5]};

perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5]};
SEQ = CC . Transpose[eta];
(*Solve for \[Alpha]'s by solving one delta function constraint. Here we get the equations from the eq below*)
CC . Transpose[Cperp];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;


Sol = Solve[{A6==0,A5==0,A1==0,A2==0,A4==0},{a[3],a[4],a[5],a[6],\[Alpha]}]//.schoutenA


FullSimplify[A3*Spaa[1,5]//.Sol]//.schoutenA


EE[1] = A1;
EE[2] = A2;
EE[3] = A4;
EE[3] = A5;
EE[3] = A6;
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,3},{j,1,3}];
J = Simplify[1/(Det[Mat])]//.Sol


1/(a[1]a[2]a[3]\[Alpha])*J*Spaa[3,4]//.Sol


\[CapitalOmega] = Spaa[2,4]/(Spaa[1,2]Spaa[2,3]Spaa[3,4]Spaa[4,1])*((Spaa[1,3] Spaa[2,4])/(Spaa[1,2] Spaa[3,4]))^(-1)
sing = {Spaa[i_,3]->\[Alpha] Spaa[i,1]+\[Beta] Spaa[i,j],Spaa[3,i_]->\[Alpha] Spaa[1,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]//.sing;
Residue[(\[CapitalOmega]//.sing),{\[Beta],0}]

sing2 = {Spaa[i_,1]->\[Alpha] Spaa[i,3]+\[Beta] Spaa[i,j],Spaa[1,i_]->\[Alpha] Spaa[3,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]//.sing2;
Residue[(\[CapitalOmega]//.sing2),{\[Beta],0}]


(* ::Subsection::Closed:: *)
(*5 pt gravity no internal loop (from Enrico paper)*)


\[CapitalOmega] = (Spbb[1,2]Spbb[2,3]Spbb[4,5]^2)/(Spaa[1,2]Spaa[2,3]Spaa[3,4]Spaa[4,5]Spaa[5,1]Spaa[1,3]);
sing = {Spaa[i_,3]->\[Alpha] Spaa[i,1]+\[Beta] Spaa[i,2],Spaa[3,i_]->\[Alpha] Spaa[1,i]+\[Beta] Spaa[2,i]};
\[CapitalOmega]//.sing
Residue[(\[CapitalOmega]//.sing),{\[Beta],0}]


(* ::Subsection::Closed:: *)
(*5 pt N=3 with internal loop, *)


\[CapitalOmega] = Spaa[1,4]/(Spaa[1,2]Spaa[2,3]Spaa[3,4]Spaa[4,5]Spaa[5,1])*((Spaa[1,4] Spaa[3,5])/(Spaa[1,5] Spaa[3,4]))^(-1);
sing = {Spaa[i_,3]->\[Alpha] Spaa[i,5]+\[Beta] Spaa[i,j],Spaa[3,i_]->\[Alpha] Spaa[5,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]//.sing;
Residue[(\[CapitalOmega]//.sing),{\[Beta],0}]

sing2 = {Spaa[i_,5]->\[Alpha] Spaa[i,3]+\[Beta] Spaa[i,j],Spaa[5,i_]->\[Alpha] Spaa[3,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]//.sing2;
Residue[(\[CapitalOmega]//.sing2),{\[Beta],0}]


(* ::Subsection::Closed:: *)
(*5 pt N=3 other config with internal loop (residue calc), *)


\[CapitalOmega]5 = Spaa[2,5]/(Spaa[1,2]Spaa[2,3]Spaa[3,4]Spaa[4,5]Spaa[5,1])*((Spaa[1,3] Spaa[2,5])/(Spaa[1,5] Spaa[2,3]))^(-1)
delJ = ((Spaa[1,5]\[Beta] Spaa[1,j]*(\[Alpha] Spaa[3,2]+\[Beta] Spaa[j,2]))/(Spaa[1,3]Spaa[1,2]*(\[Alpha] Spaa[3,5]+\[Beta] Spaa[j,5])))^(-1)//Simplify
sing = {Spaa[i_,3]->\[Alpha] Spaa[i,1]+\[Beta] Spaa[i,j],Spaa[3,i_]->\[Alpha] Spaa[1,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]5//.sing;
(\[CapitalOmega]5//.sing)
Residue[(\[CapitalOmega]5//.sing),{\[Beta],0}]
sing2 = {Spaa[i_,1]->\[Alpha] Spaa[i,3]+\[Beta] Spaa[i,j],Spaa[1,i_]->\[Alpha] Spaa[3,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]5//.sing2;
Residue[(\[CapitalOmega]5//.sing2),{\[Beta],0}];


CC={{a[1]+a[2]a[3]a[4],1,a[1]a[5]+a[2]a[3]a[4]a[5],a[3]a[4],0},{a[2]a[3],0,a[2]a[3]a[5],a[3],1}};
Cperp ={{1,-(a[1]+a[2]a[3]a[4]),0,0,-a[2]a[3]},{0,-(a[1]a[5]+a[2]a[3]a[4]a[5]),1,0,-a[2]a[3]a[5]},{0,-a[4]a[3],0,1,-a[3]}};
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5]};
CC . Transpose[Cperp];
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda]


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][5]]//.RB//.RR//FullSimplify
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][5]]//.RB//.RR//FullSimplify
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][5]]//.RB//.RR//FullSimplify


Solve


CEQ//.Sol//FullSimplify


1/(Spaa[2,4] Spaa[2,5]) ( (t\[Lambda][1]+a[5] t\[Lambda][3])(Spaa[1,4] Spaa[2,5]-Spaa[1,2] Spaa[4,5])+Spaa[2,4] (Spaa[2,5] t\[Lambda][2]+Spaa[4,5] t\[Lambda][4]))//.schoutenA//Simplify


Collect[perpEQ[[2]]//.Sol[[1]]//Simplify,\[Lambda][2]]
((a[5](-Spaa[1,4] Spaa[2,5]+Spaa[1,2] Spaa[4,5])) \[Lambda][2]+Spaa[2,4] Spaa[2,5] \[Lambda][3]+a[5] Spaa[1,2] Spaa[2,4] \[Lambda][5]//.schoutenA)/(Spaa[2,4]*Spaa[2,5])//Simplify
 \[Lambda][3]+a[5] \[Lambda][1]


Sol = Solve[{A1==0,A2==0,A3==0,A5==0,A6==0},{a[1],a[2],a[3],a[4],a[5]}]//.schoutenA


EE[1]=A1;
EE[2]=A2;
EE[3]=A5;
EE[4]=A6;
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,4},{j,1,4}];
J = (Simplify[1/(Det[Mat])]//.Sol//FullSimplify)[[1]];
\[CapitalDelta]b1 = a[4] Spaa[2,5]//.Sol[[1]]
\[CapitalDelta]b2 = a[1]a[2]a[3] Spaa[2,5]//.Sol[[1]]
\[CapitalDelta]w1 = a[5]Spbb[1,3]//.Sol[[1]]
\[CapitalDelta]w2 = a[2]Spbb[1,4]+a[5]Spbb[3,4]//.Sol[[1]]//Together
\[CapitalDelta]w3 = a[3]Spbb[41]+a[3]a[5]Spbb[4,3]//.Sol[[1]]//Together
\[CapitalDelta]b = \[CapitalDelta]b1*\[CapitalDelta]b2//FullSimplify;
\[CapitalDelta]w = \[CapitalDelta]w1*\[CapitalDelta]w2*\[CapitalDelta]w3//FullSimplify;
\[CapitalDelta]b*\[CapitalDelta]w//FullSimplify


Product[1/a[i]^3,{i,1,5}]*J//.Sol[[1]]


(* ::Subsection::Closed:: *)
(*5 pt three-loop with internal loop*)


\[Delta]1 = 1/(1-a1 a2 a6);
CC = {{a1 \[Delta]1,1,a7+a1 a6 \[Delta]1, a3 a1 a6 \[Delta]1,0},{a5 a6 a2 a1 \[Delta]1, 0, a5 a6 \[Delta]1, a4+a5 a3 a6 \[Delta]1, 1}};
Cperp = {{1, -a1 \[Delta]1,0,0,-a5 a6 a2 a1 \[Delta]1},{0,-a7-a1 a6 \[Delta]1,1,0,-a5 a6 \[Delta]1},{0,-a3 a1 a6 \[Delta]1,0,1,-a4-a5 a3 a6 \[Delta]1}};
lambda = {\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5]};
Ca . Transpose[CaP];
(*Solve for \[Alpha]'s by solving one delta function constraint. Here we get the equations from the eq below*)
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];

A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;


SolA = FullSimplify[CEQ//.Sol[[1]]]//.schoutenA//FullSimplify;
SolA[[1]]//Together//.schoutenA
Spaa[1,5] t\[Lambda][1]+Spaa[2,5] t\[Lambda][2]+Spaa[3,5] t\[Lambda][3]+Spaa[4,5] t\[Lambda][4];
SolA[[2]]//Together//.schoutenA;
Residue[SolA[[1]],{a7,Spaa[1,3]/Spaa[1,2]}]
Residue[SolA[[2]],{a7,Spaa[1,3]/Spaa[1,2]}]


(* ::InheritFromParent:: *)
(*((a7 Spaa[1,2]-Spaa[1,3]) (Spaa[1,5] t\[Lambda][1]+Spaa[2,5] t\[Lambda][2]+Spaa[3,5] t\[Lambda][3]+Spaa[4,5] t\[Lambda][4]))/(-Spaa[1,3] Spaa[2,5]+a7 Spaa[1,2] Spaa[2,5]//Simplify)*)


(* ::InheritFromParent:: *)
(*S/Spaa[2,5]*)


Sol = {{a1 -> (-a7 Spaa[1,2]+Spaa[1,3])/Spaa[2,3],a2 -> Spaa[1,2]/(a7 Spaa[1,2]-Spaa[1,3]),a3 -> -(Spaa[4,5]/(a7 Spaa[2,5]-Spaa[3,5])),a4 -> (-a7 Spaa[2,4]+Spaa[3,4])/(-a7 Spaa[2,5]+Spaa[3,5]),a5 -> (-a7 Spaa[1,2]+Spaa[1,3])/(-a7 Spaa[2,5]+Spaa[3,5]),a6 -> (-a7 Spaa[2,5]+Spaa[3,5])/Spaa[1,5]}}


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


\[CapitalOmega] = 1/(a7 Spaa[1,2] (a7 Spaa[1,2]-Spaa[1,3]) (a7 Spaa[2,4]-Spaa[3,4]) Spaa[4,5])
Residue[\[CapitalOmega],{a7,Spaa[1,3]/Spaa[1,2]}]//.schoutenA


(* ::Subsection::Closed:: *)
(*5 pt NMHV*)


\[CapitalOmega] = Spbb[1,3]/(Spbb[1,2] Spbb[1,5] Spbb[2,3] Spbb[3,4] Spbb[3,5]);
sing = {Spbb[i_,3]->\[Alpha] Spbb[i,5]+\[Beta] Spbb[i,j],Spbb[3,i_]->\[Alpha] Spbb[5,i]+\[Beta] Spbb[j,i]};
\[CapitalOmega]//.sing;
Residue[(\[CapitalOmega]//.sing),{\[Beta],0}]//.Spbb[5,j]->1


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "6", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "5", "]"}]}]}], "1", 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}], "0"},
{
RowBox[{
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "3", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "7", "]"}]}], 
RowBox[{"a", "[", "5", "]"}]}], "0", "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], ")"}]}]},
{"0", "1", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "6", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "5", "]"}]}]}], ")"}]}], "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}]},
{"0", "0", 
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], "1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{"a", "[", "4", "]"}]}]},
{"0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], " ", 
RowBox[{"a", "[", "5", "]"}]}], "0", "1", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}]}], ")"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]};
CC . Transpose[Cperp];
perpEQ = Cperp . Transpose[lambda]
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][3]]//.RB//.RR//FullSimplify
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][6]]//.RB//.RR//FullSimplify
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][3]]//.RB//.RR//FullSimplify
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][6]]//.RB//.RR//FullSimplify
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][3]]//.RB//.RR//FullSimplify
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][6]]//.RB//.RR//FullSimplify
A7 = TensorExpand[(perpEQ[[4]]) . \[Lambda][3]]//.RB//.RR//FullSimplify
A8 = TensorExpand[(perpEQ[[4]]) . \[Lambda][6]]//.RB//.RR//FullSimplify


Sol = FullSimplify[Solve[{A5==0,A6==0,A3==0,A4==0,A7==0,A8==0},{a[6],a[4],a[2],a[5],a[3],a[1]}]//.schoutenA]//.schoutenA


(*Remaining delta function*)
Simplify[perpEQ[[1]]//.Sol[[1]]]//.simSchotenA


AA = Simplify[Collect[Simplify[CEQ[[1]]//.Sol[[1]]//FullSimplify//Expand],t\[Lambda][2]]//.schoutenA]*Spaa[3,6]
BB = Simplify[Collect[Simplify[Collect[Simplify[CEQ[[2]]//.Sol[[1]]//FullSimplify//Expand],t\[Lambda][2]]//.schoutenA],t\[Lambda][5]]//.schoutenA]*Spaa[3,6]


EE[1] = A3;
EE[2] = A4;
EE[3] = A5;
EE[4] = A6;
EE[5] = A7;
EE[6] = A8;
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,6},{j,1,6}];
J = Simplify[1/(Det[Mat])]//.Sol//FullSimplify;
J = J[[1]]//.schoutenA


Product[1/a[i],{i,1,7}]*Spaa[3,6]^2*J//.Sol[[1]]//FullSimplify//Together
1/(\[Alpha] Spaa[2,3] Spaa[2,4] Spaa[4,5] Spaa[5,6])

















(* ::Subsection::Closed:: *)
(*6 pt with internal (pentagon) loop (containing two pentagons in total)*)


\[CapitalOmega] = 1/(Spaa[1,2] Spaa[1,4] Spaa[2,3] Spaa[4,5] Spaa[5,6]);
sing = {Spaa[i_,4]->\[Alpha] Spaa[i,1]+\[Beta] Spaa[i,j],Spaa[4,i_]->\[Alpha] Spaa[1,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]//.sing;
Residue[(\[CapitalOmega]//.sing),{\[Beta],0}]//.Spaa[1,j]->1

sing2 = {Spaa[i_,1]->\[Alpha] Spaa[i,4]+\[Beta] Spaa[i,j],Spaa[1,i_]->\[Alpha] Spaa[4,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]//.sing2;
Residue[(\[CapitalOmega]//.sing2),{\[Beta],0}]//.Spaa[4,j]->1


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "6", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "5", "]"}]}]}], "1", 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}], "0"},
{
RowBox[{
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "3", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "7", "]"}]}], 
RowBox[{"a", "[", "5", "]"}]}], "0", "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], ")"}]}]},
{"0", "1", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "6", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "5", "]"}]}]}], ")"}]}], "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}]},
{"0", "0", 
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], "1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{"a", "[", "4", "]"}]}]},
{"0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], " ", 
RowBox[{"a", "[", "5", "]"}]}], "0", "1", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}]}], ")"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]};
CC . Transpose[Cperp];
perpEQ = Cperp . Transpose[lambda]
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][3]]//.RB//.RR//FullSimplify
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][6]]//.RB//.RR//FullSimplify
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][3]]//.RB//.RR//FullSimplify
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][6]]//.RB//.RR//FullSimplify
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][3]]//.RB//.RR//FullSimplify
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][6]]//.RB//.RR//FullSimplify
A7 = TensorExpand[(perpEQ[[4]]) . \[Lambda][3]]//.RB//.RR//FullSimplify
A8 = TensorExpand[(perpEQ[[4]]) . \[Lambda][6]]//.RB//.RR//FullSimplify


Sol = FullSimplify[Solve[{A5==0,A6==0,A3==0,A4==0,A7==0,A8==0},{a[6],a[4],a[2],a[5],a[3],a[1]}]//.schoutenA]//.schoutenA


(*Remaining delta function*)
Simplify[perpEQ[[1]]//.Sol[[1]]]//.simSchotenA


AA = Simplify[Collect[Simplify[CEQ[[1]]//.Sol[[1]]//FullSimplify//Expand],t\[Lambda][2]]//.schoutenA]*Spaa[3,6]
BB = Simplify[Collect[Simplify[Collect[Simplify[CEQ[[2]]//.Sol[[1]]//FullSimplify//Expand],t\[Lambda][2]]//.schoutenA],t\[Lambda][5]]//.schoutenA]*Spaa[3,6]


EE[1] = A3;
EE[2] = A4;
EE[3] = A5;
EE[4] = A6;
EE[5] = A7;
EE[6] = A8;
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,6},{j,1,6}];
J = Simplify[1/(Det[Mat])]//.Sol//FullSimplify;
J = J[[1]]//.schoutenA


Product[1/a[i],{i,1,7}]*Spaa[3,6]^2*J//.Sol[[1]]//FullSimplify//Together
1/(\[Alpha] Spaa[2,3] Spaa[2,4] Spaa[4,5] Spaa[5,6])

















(* ::Subsection::Closed:: *)
(*6 pt N=3 with internal loop, *)


\[CapitalOmega]6 = Spaa[2,6]/(Spaa[1,2]Spaa[2,3]Spaa[3,4]Spaa[4,5]Spaa[5,6]Spaa[6,1])*((Spaa[1,3] Spaa[2,6])/(Spaa[1,6] Spaa[2,3]))^(-1);
sing = {Spaa[i_,3]->\[Alpha] Spaa[i,1]+\[Beta] Spaa[i,j],Spaa[3,i_]->\[Alpha] Spaa[1,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]6//.sing;
Residue[(\[CapitalOmega]6//.sing),{\[Beta],0}]

sing2 = {Spaa[i_,1]->\[Alpha] Spaa[i,3]+\[Beta] Spaa[i,j],Spaa[1,i_]->\[Alpha] Spaa[3,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]6//.sing2;
Residue[(\[CapitalOmega]6//.sing2),{\[Beta],0}]


(* ::Subsection::Closed:: *)
(*6 pt N=3 with internal loop in middle hexagon*)


CC={{a[7],1,(a[1]+a[2] a[5]\[Delta]) a[8],0,\[Delta] a[3] a[4] a[5] a[8],0,a[7] a[10]},{0,0,\[Delta] a[2] a[4],1,\[Delta] a[4],0,0},{a[6],0,\[Delta] a[2] a[5],0,\[Delta] a[3] a[4] a[5],1,a[9]+a[6] a[10]}};
Cperp ={{-a[1]a[2]\[Delta],1,0,-a[5]a[6]a[2]\[Delta],0,0},{-a[1]a[2]a[4]\[Delta],0,1,-a[3]-a[5]a[6]a[2]a[4]\[Delta],0,0},{-a[1]a[2]a[6]\[Delta],0,0,-a[5]a[6]\[Delta],1,0},{-a[7]-a[1]a[2]a[6]a[8]\[Delta],0,0,-a[5]a[6]a[8]\[Delta],0,1}};
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
perpEQ = Cperp . Transpose[lambda]
(*CEQ = CC . Transpose[tlambda];*)
\[Delta] = 1/(1-a[2] a[6]);


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[4]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[4]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;


Sol = Solve[{A1==0,A2==0,A3==0,A4==0,A5==0,A6==0,A7==0,A8==0},{a[6],a[4],a[2],a[5],a[8],a[3],a[1],a[7]}]//.schoutenA//FullSimplify


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A4;
EE[5] = A5;
EE[6] = A6;
EE[7] = A7;
EE[8] = A8;
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,8},{j,1,8}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol[[1]]]//.schoutenA
Product[1/a[i],{i,1,8}]//.Sol[[1]]
Jac = (Together[\[Delta]//.Sol[[1]]]//.schoutenA)^(-1)
Jacb = (Together[1/(1-1/(a[2]a[6]))//.Sol[[1]]]//.schoutenA)^(-1)


\[CapitalOmega] = Product[1/a[i],{i,1,8}]*J*Spaa[1,4]^3//.Sol[[1]]


\[CapitalOmega]6 = \[CapitalOmega]*Jac^(-1)
sing = {Spaa[i_,2]->\[Alpha] Spaa[i,5]+\[Beta] Spaa[i,j],Spaa[2,i_]->\[Alpha] Spaa[5,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]6//.sing
Residue[(\[CapitalOmega]6//.sing),{\[Beta],0}]//.Spaa[5,j]->1

sing2 = {Spaa[i_,5]->\[Alpha] Spaa[i,2]+\[Beta] Spaa[i,j],Spaa[5,i_]->\[Alpha] Spaa[2,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]6//.sing2;
Residue[(\[CapitalOmega]6//.sing2),{\[Beta],0}]


(* ::Subsection::Closed:: *)
(*7 pt N=3 with internal loop, *)


\[CapitalOmega]7 = Spaa[2,7]/(Spaa[1,2]Spaa[2,3]Spaa[3,4]Spaa[4,5]Spaa[5,6]Spaa[6,7]Spaa[7,1])*((Spaa[1,3] Spaa[2,7])/(Spaa[1,7] Spaa[2,3]))^(-1);
sing = {Spaa[i_,3]->\[Alpha] Spaa[i,1]+\[Beta] Spaa[i,j],Spaa[3,i_]->\[Alpha] Spaa[1,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]7//.sing;
Residue[(\[CapitalOmega]7//.sing),{\[Beta],0}]

sing2 = {Spaa[i_,1]->\[Alpha] Spaa[i,3]+\[Beta] Spaa[i,j],Spaa[1,i_]->\[Alpha] Spaa[3,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]7//.sing2;
Residue[(\[CapitalOmega]7//.sing2),{\[Beta],0}]





(* ::Subsection::Closed:: *)
(*8 pt N=3 with internal loop, *)


\[CapitalOmega]8 = Spaa[2,8]/(Spaa[1,2]Spaa[2,3]Spaa[3,4]Spaa[4,5]Spaa[5,6]Spaa[6,7]Spaa[7,8]Spaa[8,1])*((Spaa[1,4] Spaa[2,8])/(Spaa[1,8] Spaa[2,4]))^(-1)
sing = {Spaa[i_,4]->\[Alpha] Spaa[i,1]+\[Beta] Spaa[i,j],Spaa[4,i_]->\[Alpha] Spaa[1,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]8//.sing;
Residue[(\[CapitalOmega]8//.sing),{\[Beta],0}]

sing2 = {Spaa[i_,1]->\[Alpha] Spaa[i,4]+\[Beta] Spaa[i,j],Spaa[1,i_]->\[Alpha] Spaa[4,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]8//.sing2;
Residue[(\[CapitalOmega]8//.sing2),{\[Beta],0}]








a1 = Spaa[1,4]/Spaa[2,4]
a2 =-(Spaa[1,2]/Spaa[2,4])
a3 = Spaa[2,4]/Spaa[2,5]
a4 = Spaa[4,5]/Spaa[2,4]


\[CapitalDelta]1 = a5 Spbb[1,3]//FullSimplify
\[CapitalDelta]2 = a2 a5 Spbb[4,3]+a2 Spbb[4,1]//FullSimplify
\[CapitalDelta]3 = a1 a5(a3 a4 Spbb[3,4]+a2 Spbb[3,1])+a1 (a3 a4 Spbb[1,4]+a2 a5 Spbb[1,3])//FullSimplify
\[CapitalDelta]1 \[CapitalDelta]2 \[CapitalDelta]3


(Spaa[1,2] Spaa[1,3] Spaa[1,4] Spaa[4,5] Spbb[1,3] (Spaa[3,5] Spbb[1,4]+Spaa[1,3] Spbb[3,4])^2)/(Spaa[2,4]^2 Spaa[2,5] Spaa[3,5]^3)


a2*a3*Spbb[4,5]


(* ::Subsection::Closed:: *)
(*9 pt MHV with cycle*)


(*Define C-matrices and lambda*)
CC={{\[Delta] a[1],1,\[Delta] a[1] a[6],\[Delta] a[1] a[3] a[6],\[Delta] a[1] a[3] a[6] (a[9]+a[7] a[10]),\[Delta] a[1] a[3] a[6] a[7],0},{\[Delta] a[1] a[2] a[5] a[6],0,\[Delta] a[5] a[6],a[4]+\[Delta] a[3] a[5] a[6],a[8] a[10]+a[4] (a[9]+a[7] a[10])+\[Delta] a[3] a[5] a[6] (a[9]+a[7] a[10]),a[4] a[7]+\[Delta] a[3] a[5] a[6] a[7]+a[8],1}};
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "13", "]"}]}], 
RowBox[{"a", "[", "4", "]"}]}], "0", "0", "0", "0", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "13", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "11", "]"}]}], "-", 
RowBox[{
RowBox[{"a", "[", "12", "]"}], 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "9", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "10", "]"}]}]}], ")"}]}]}], "1", "0", "0", "0", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "10", "]"}], 
RowBox[{"a", "[", "12", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "9", "]"}]}], "-", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "10", "]"}]}]}], "0", "1", "0", "0", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "10", "]"}]}]},
{"0", 
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], "0", "0", "1", "0", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"a", "[", "4", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "4", "]"}]}], "0", "0", "0", "1", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], "-", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]}]},
{"0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "8", "]"}]}]}], ")"}]}], "0", "0", "0", "0", "1", "0", 
RowBox[{
RowBox[{
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]}], ")"}]}], 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "8", "]"}]}]}], ")"}]}], "-", 
RowBox[{
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "8", "]"}]}]}]},
{"0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], "0", "0", "0", "0", "0", "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "6", "]"}]}], "-", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]}], ")"}]}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7],\[Lambda][8],\[Lambda][9]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
(*Test transpose orthogonality*)
(*CC . Transpose[Cperp]=={{0,0,0,0,0},{0,0,0,0,0}};*)
perpEQ = Cperp . Transpose[lambda]


A[1] = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A[2] = TensorExpand[(perpEQ[[1]]) . \[Lambda][9]]//.RB//.RR//FullSimplify
A[3] = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A[4] = TensorExpand[(perpEQ[[2]]) . \[Lambda][9]]//.RB//.RR//FullSimplify
A[5] = TensorExpand[(perpEQ[[3]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A[6] = TensorExpand[(perpEQ[[3]]) . \[Lambda][9]]//.RB//.RR//FullSimplify
A[7] = TensorExpand[(perpEQ[[4]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A[8] = TensorExpand[(perpEQ[[4]]) . \[Lambda][9]]//.RB//.RR//FullSimplify
A[9] = TensorExpand[(perpEQ[[5]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A[10]= TensorExpand[(perpEQ[[5]]) . \[Lambda][9]]//.RB//.RR//FullSimplify
A[11]= TensorExpand[(perpEQ[[6]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A[12]= TensorExpand[(perpEQ[[6]]) . \[Lambda][9]]//.RB//.RR//FullSimplify
A[13]= TensorExpand[(perpEQ[[7]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A[14]= TensorExpand[(perpEQ[[7]]) . \[Lambda][9]]//.RB//.RR//FullSimplify


Sol = Solve[{A[13]==0,A[14]==0,A[3]==0,A[4]==0,A[5]==0,A[6]==0,A[7]==0,A[8]==0,A[9]==0,A[10]==0,A[11]==0,A[12]==0},{a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10],a[11],a[12]}]//.schoutenA


EE[1] = A[3];
EE[2] = A[4];
EE[3] = A[5];
EE[4] = A[6];
EE[5] = A[7];
EE[6] = A[8];
EE[7] = A[9];
EE[8] = A[10];
EE[9] = A[11];
EE[10]= A[12];
EE[11]= A[13];
EE[12]= A[14];

F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,12},{j,1,12}];
J = FullSimplify[Simplify[1/(Det[Mat])]*Spaa[2,9]^5//.Sol]//.schoutenA
\[CapitalOmega] = Product[1/(a[i]),{i,1,12}]*J//.Sol[[1]]


\[CapitalOmega]9 = Spaa[2,5]/(Spaa[1,2] Spaa[1,5] Spaa[2,3] Spaa[3,4] Spaa[4,5] Spaa[5,6] Spaa[6,7] Spaa[7,8] Spaa[8,9])(*\[CapitalOmega][[1]]*JacA^(-1)*)
sing = {Spaa[i_,5]->\[Alpha] Spaa[i,1]+\[Beta] Spaa[i,j],Spaa[5,i_]->\[Alpha] Spaa[1,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]9//.sing;
Residue[(\[CapitalOmega]9//.sing),{\[Beta],0}]//.Spaa[1,j]->1

sing2 = {Spaa[i_,1]->\[Alpha] Spaa[i,5]+\[Beta] Spaa[i,j],Spaa[1,i_]->\[Alpha] Spaa[5,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]6//.sing2;
Residue[(\[CapitalOmega]9//.sing2),{\[Beta],0}]//.Spaa[5,j]->1


(* ::InheritFromParent:: *)
(**)


(* ::Section::Closed:: *)
(*Double loop calculation*)


(* ::Subsection::Closed:: *)
(*5 pt MHV calculation, double loops*)


(* ::Subsubsection:: *)
(*Before residue*)


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "7", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "6", "]"}], " ", "\[Delta]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"\[Delta]", "[", "1", "]"}], 
RowBox[{"\[Delta]", "[", "2", "]"}]}], "0"},
{
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"aa", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"\[Delta]", "[", "1", "]"}], 
RowBox[{"\[Delta]", "[", "2", "]"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
(*//.a[5]\[Rule]1*)
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"\[Delta]", "[", "1", "]"}], 
RowBox[{"\[Delta]", "[", "2", "]"}]}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"(", 
RowBox[{"1", "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"\[Delta]", "[", "1", "]"}], 
RowBox[{"\[Delta]", "[", "2", "]"}]}]}], ")"}]}]},
{"0", "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], " ", 
RowBox[{"(", 
RowBox[{"1", "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], " ", 
RowBox[{"\[Delta]", "[", "1", "]"}], 
RowBox[{"\[Delta]", "[", "2", "]"}]}]}], ")"}]}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"\[Delta]", "[", "1", "]"}], 
RowBox[{"\[Delta]", "[", "2", "]"}]}]},
{"0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"\[Delta]", "[", "1", "]"}], 
RowBox[{"\[Delta]", "[", "2", "]"}]}], "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"\[Delta]", "[", "1", "]"}], 
RowBox[{"\[Delta]", "[", "2", "]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][3]]//.RB//.RR//FullSimplify
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][5]]//.RB//.RR//FullSimplify
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][3]]//.RB//.RR//FullSimplify
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][5]]//.RB//.RR//FullSimplify
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][3]]//.RB//.RR//FullSimplify
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][5]]//.RB//.RR//FullSimplify

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify


\[Delta][1] = 1/(1-(a[2]a[5]a[6]));
\[Delta][2] = 1/(1-(a[1]a[2]a[3]a[4]));
Sol = FullSimplify[Simplify[Solve[{A1==0,A2==0,A3==0,A4==0,A5==0,A6==0},{a[1],a[2],a[3],a[4],a[5],a[6]}]//.schoutenA]]//.schoutenA


Sqrt[Spaa[3,4] Spaa[4,5] (-4 Spaa[1,4] Spaa[1,5] Spaa[2,3] Spaa[2,4] Spaa[3,5]^2+Spaa[1,2]^2 Spaa[3,4] Spaa[3,5]^2 Spaa[4,5])]//FullSimplify


\[CapitalDelta]1 = Together[\[Delta][1]//.Sol[[1]]]//.schoutenA
\[CapitalDelta]2 = Together[\[Delta][2]//.Sol[[1]]]//.schoutenA
\[CapitalDelta]1*\[CapitalDelta]2


Together[FullSimplify[B1//.Sol[[1]]]//.schoutenA]
Together[FullSimplify[B2//.Sol[[1]]]//.schoutenA]


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A4;
EE[5] = A5;
EE[6] = A6;


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,6},{j,1,6}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol]//.schoutenA


Product[1/a[i],{i,1,6}]//.Sol//Simplify;
\[CapitalOmega] = Product[1/a[i],{i,1,6}]*J*Spaa[3,5]//.Sol//Simplify
\[CapitalOmega]5 = \[CapitalOmega]*\[CapitalDelta]1*\[CapitalDelta]2//Simplify


\[CapitalOmega]5 

sing = {Spaa[i_,1]->\[Alpha] Spaa[i,4]+\[Beta] Spaa[i,j],Spaa[1,i_]->\[Alpha] Spaa[4,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]5//.sing
Residue[(\[CapitalOmega]5[[1]][[1]]//.sing),{\[Beta],0}]//.Spaa[4,j]->1
1/(\[Alpha] Spaa[2,3] Spaa[2,4] Spaa[3,5] Spaa[4,5])


(* ::InheritFromParent:: *)
(**)


(* ::Subsubsection::Closed:: *)
(*after residue*)


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "1", "]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], "1", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);

(*//.a[5]\[Rule]1*)
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}], "1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}]}], "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}]}], "0", "1", 
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], "0"},
{
RowBox[{" ", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]}], "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][4]]//.RB//.RR//FullSimplify

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify


Sol = FullSimplify[Simplify[Solve[{A1==0,A2==0,A3==0,A6==0},{a[1],a[2],a[3],a[4]}]//.schoutenA]]//.schoutenA


FullSimplify[A4*Spaa[1,2]//.Sol]//.schoutenA
FullSimplify[A5*Spaa[2,4]//.Sol]//.schoutenA


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A6;


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,4},{j,1,4}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol]//.schoutenA


Product[1/a[i],{i,1,4}]//.Sol//Simplify;
\[CapitalOmega] = Product[1/a[i],{i,1,4}]*J*Spaa[1,2]*Spaa[2,4]//.Sol[[1]]//Simplify
-(1/(\[Alpha] Spaa[1,3] Spaa[2,4]))
sing = {Spaa[i_,5]->\[Alpha] Spaa[i,2],Spaa[i_,5]->\[Alpha] Spaa[i,2]};
\[CapitalOmega]//.sing


(* ::Subsection::Closed:: *)
(*5 pt MHV calculation, double uv pole check*)


(* ::Subsubsection:: *)
(*Before residue*)


Sol = {a[1]->-((a[7] Spaa[1,2]-Spaa[1,3])/Spaa[2,3]),a[2]->-(Spaa[1,2]/(a[7] Spaa[1,2]-Spaa[1,3])),a[3]->-(Spaa[4,5]/(a[7] Spaa[2,5]-Spaa[3,5])),a[4]->-((a[7] Spaa[2,4]-Spaa[3,4])/(a[7] Spaa[2,5]-Spaa[3,5])),a[5]->(a[7] Spaa[1,2]-Spaa[1,3])/(a[7] Spaa[2,5]-Spaa[3,5]),a[6]->-((a[7] Spaa[2,5]-Spaa[3,5])/Spaa[1,5])};
\[Delta] = (Spaa[1,5] Spaa[2,3])/((a[7] Spaa[1,2]-Spaa[1,3]) Spaa[2,5]);


Nn = 0;
\[CapitalOmega]bare =Spaa[2,5]^(4-Nn)/(a[7]Spaa[1,2]Spaa[2,3]Spaa[4,5]Spaa[5,1](a[7]Spaa[2,4]-Spaa[3,4]))//.Sol//Simplify;
\[CapitalOmega] = \[CapitalOmega]bare *\[Delta]^(4-Nn)//Factor;
DefNumSH[5]
Res1 = Residue[\[CapitalOmega],{a[7],0}]//.schoutenA
Res2 = Residue[\[CapitalOmega],{a[7],Spaa[3,4]/Spaa[2,4]}]//.schoutenA
Res3 = Residue[\[CapitalOmega],{a[7],Spaa[1,3]/Spaa[1,2]}]//.schoutenA
ComRes = Factor[FullSimplify[Res1+Res2]]//.schoutenA
(ComRes + Res3)//.NSpinHel


J = (Spaa[1,3] Spaa[2,4])/(Spaa[1,4] Spaa[2,3]);
j = Together[(1+J+J^2+J^3)]//.schoutenA//FullSimplify;
ComRes
Spaa[2,5]^(4-Nn)/(Spaa[1,3]Spaa[3,2]Spaa[2,5]Spaa[5,4]Spaa[4,1])*((Spaa[2,5]Spaa[1,3])/(Spaa[1,5]Spaa[2,3]))^(Nn-3)*j//FullSimplify


(* ::InheritFromParent:: *)
(**)


(* ::InheritFromParent:: *)
(*Together[1-(Spaa[1,3]^4 Spaa[2,5]^4)/(Spaa[1,5]^4 Spaa[2,3]^4)]*)


(Spaa[1,5]^3 Spaa[2,3]^3+Spaa[1,3] Spaa[1,5]^2 Spaa[2,3]^2 Spaa[2,5]-Spaa[1,3]^2 Spaa[1,5] Spaa[2,3] Spaa[2,5]^2+Spaa[1,3]^3 Spaa[2,5]^3) //FullSimplify


((Spaa[1,5] Spaa[2,3]+Spaa[1,3] Spaa[2,5])/(Spaa[1,5] Spaa[2,3])) (Spaa[1,2] Spaa[3,5])/(Spaa[1,5] Spaa[2,3])//FullSimplify


(* ::InheritFromParent:: *)
(**)


(* ::Subsubsection::Closed:: *)
(*after residue*)


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "1", "]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], "1", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);

(*//.a[5]\[Rule]1*)
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}], "1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}]}], "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}]}], "0", "1", 
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], "0"},
{
RowBox[{" ", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]}], "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][4]]//.RB//.RR//FullSimplify

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify


Sol = FullSimplify[Simplify[Solve[{A1==0,A2==0,A3==0,A6==0},{a[1],a[2],a[3],a[4]}]//.schoutenA]]//.schoutenA


FullSimplify[A4*Spaa[1,2]//.Sol]//.schoutenA
FullSimplify[A5*Spaa[2,4]//.Sol]//.schoutenA


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A6;


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,4},{j,1,4}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol]//.schoutenA


Product[1/a[i],{i,1,4}]//.Sol//Simplify;
\[CapitalOmega] = Product[1/a[i],{i,1,4}]*J*Spaa[1,2]*Spaa[2,4]//.Sol[[1]]//Simplify
-(1/(\[Alpha] Spaa[1,3] Spaa[2,4]))
sing = {Spaa[i_,5]->\[Alpha] Spaa[i,2],Spaa[i_,5]->\[Alpha] Spaa[i,2]};
\[CapitalOmega]//.sing


(* ::Subsection::Closed:: *)
(*Residue of Double-Box*)


(* ::Subsubsection:: *)
(*N=3*)


(*4 pt MHV*)
(*Define C-matrices and lambda*)
CC = \!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "+", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "3", "]"}]}]}], "0"},
{
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "1", "]"}]}], "0", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp = \!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}]}]},
{"0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "+", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "3", "]"}]}]}], ")"}]}], "1", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda = {\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4]};
tlambda = {t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4]};

perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4]};
SEQ = CC . Transpose[eta];
(*Solve for \[Alpha]'s by solving one delta function constraint. Here we get the equations from the eq below*)
CC . Transpose[Cperp]


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;


\[Delta] = 1/(1-a[1]a[2]a[3]a[4])
Sol =  (Solve[{A1==0,A2==0,A3==0,A4==0},{a[2],a[3],a[4],a[1]}]//FullSimplify)//.schoutenA


Sol = {a[2]->Spaa[2,3]/(a[5] Spaa[1,2]-Spaa[1,3]),a[3]->-a[5]+Spaa[1,3]/Spaa[1,2],a[4]->Spaa[1,4]/(a[5] Spaa[1,2]-Spaa[1,3]),a[1]->(-a[5] Spaa[1,2]+Spaa[1,3])/(a[5] Spaa[2,4]-Spaa[3,4])}


1/(1-a[1]a[2]a[3]a[4]-a[3]a[5])//.Sol//.a[5]->-1/z//.z->a[5]//FullSimplify
(Spaa[1,2] Spaa[2,4]+a[5] (a[5]^2 Spaa[1,4] Spaa[2,3]+a[5] Spaa[1,2] Spaa[2,4]+Spaa[1,3] Spaa[2,4]+((1+a[5]^2) Spaa[1,2]+a[5] Spaa[1,3]) Spaa[3,4]))//Expand


(* ::InheritFromParent:: *)
(*Collect[a[5]^3 Spaa[1,4] Spaa[2,3]+Spaa[1,2] Spaa[2,4]+a[5]^2 Spaa[1,2] Spaa[2,4]+a[5] Spaa[1,3] Spaa[2,4]+a[5] Spaa[1,2] Spaa[3,4]+a[5]^3 Spaa[1,2] Spaa[3,4]+a[5]^2 Spaa[1,3] Spaa[3,4],a[5]]//.schoutenA*)


(* ::InheritFromParent:: *)
(*(a[5] Spaa[1,2] (a[5] Spaa[2,4]-Spaa[3,4]))/((a[5] Spaa[1,2]-Spaa[1,3]) Spaa[3,4])*)


Collect[(a[5] (-Spaa[1,4] Spaa[2,3]+Spaa[1,3] Spaa[2,4])-Spaa[1,3] Spaa[3,4]//Expand),a[5]]//.schoutenA//FullSimplify


Sol//.a[5]->-(1/z)//.z->a[5]//FullSimplify


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A4;
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,4},{j,1,4}];
J = Simplify[1/(Det[Mat])]//.Sol//FullSimplify


\[Delta] = ((1/(1-a[1]a[2]a[3]a[4])//.Sol//FullSimplify)//Together)//.schoutenA//Simplify
\[CapitalOmega]a = 1/(a[1]a[2]a[3]a[4]a[5])*Spaa[2,4]//.Sol//FullSimplify;
\[CapitalOmega]bare = ((\[CapitalOmega]a*J//FullSimplify)//.schoutenA//FullSimplify)//Factor
\[CapitalOmega] = \[Delta]^4*\[CapitalOmega]bare*Spaa[2,4]^3


Res1 = Residue[\[CapitalOmega],{a[5],0}]
Res2 = Residue[\[CapitalOmega],{a[5],Spaa[1,3]/Spaa[1,2]}]
Res1+Res2


-((Spaa[1,2] Spaa[3,4])/(Spaa[1,3]^2 Spaa[1,4] Spaa[2,3]))

-((Spaa[1,2]^2 Spaa[3,4]^2)/(Spaa[1,3]^3 Spaa[1,4] Spaa[2,3]))


(* ::Subsubsection::Closed:: *)
(*inverse cycle direction*)


(*4 pt MHV*)
(*Define C-matrices and lambda*)
CC = \!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "+", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "3", "]"}]}]}], "0"},
{
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "1", "]"}]}], "0", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp = \!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}]}]},
{"0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "+", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "3", "]"}]}]}], ")"}]}], "1", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda = {\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4]};
tlambda = {t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4]};

perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4]};
SEQ = CC . Transpose[eta];
(*Solve for \[Alpha]'s by solving one delta function constraint. Here we get the equations from the eq below*)
CC . Transpose[Cperp]


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;


\[Delta] = 1/(1-a[1]a[2]a[3]a[4])
Sol =  (Solve[{A1==0,A2==0,A3==0,A4==0},{a[2],a[3],a[4],a[1]}]//FullSimplify)//.schoutenA


Sol = {a[2]->Spaa[2,3]/(a[5] Spaa[1,2]-Spaa[1,3]),a[3]->-a[5]+Spaa[1,3]/Spaa[1,2],a[4]->Spaa[1,4]/(a[5] Spaa[1,2]-Spaa[1,3]),a[1]->(-a[5] Spaa[1,2]+Spaa[1,3])/(a[5] Spaa[2,4]-Spaa[3,4])}


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A4;
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,4},{j,1,4}];
J = Simplify[1/(Det[Mat])]//.Sol//FullSimplify


J = 1/(Spaa[1,2]^2 (-a[5] Spaa[2,4]+Spaa[3,4])^2);
\[Delta] = ((1/(1-1/(a[1]a[2]a[3]a[4]))//.Sol//FullSimplify)//Together)//.schoutenA//Simplify
\[CapitalOmega]a = 1/(a[1]a[2]a[3]a[4]a[5])*Spaa[2,4]//.Sol//FullSimplify;
\[CapitalOmega]bare = ((\[CapitalOmega]a*J//FullSimplify)//.schoutenA//FullSimplify)//Factor
\[CapitalOmega] = \[Delta]^2*\[CapitalOmega]bare*Spaa[2,4]^2


Nn=2;
A41 = Spaa[2,4]^(4-Nn)/(Spaa[1,2]Spaa[2,3]Spaa[3,4]Spaa[4,1]) ((Spaa[2,1]Spaa[3,4])/(Spaa[1,3]Spaa[2,4]))^(4-Nn);
A42 = Spaa[2,4]^(4-Nn)/(Spaa[1,2]Spaa[2,3]Spaa[3,4]Spaa[4,1]) ((Spaa[4,1]Spaa[2,3])/(Spaa[1,3]Spaa[2,4]))^(4-Nn);
Together[A41+A42]//.schoutenA

ComRes = Factor[FullSimplify[Res1+Res2]]//.schoutenA


(* ::InheritFromParent:: *)
(**)


Res1 = Residue[\[CapitalOmega],{a[5],0}]//.schoutenA;
Res2 = Residue[\[CapitalOmega],{a[5],Spaa[3,4]/Spaa[2,4]}]//.schoutenA;
Res3 = Residue[\[CapitalOmega],{a[5],Spaa[1,3]/Spaa[1,2]}]//.schoutenA
ComRes = Factor[FullSimplify[Res1+Res2]]//.schoutenA
Res3//.NSpinHel;
ComRes//.NSpinHel;
Res1//FullSimplify


Spaa[1,4]^4 Spaa[2,3]^4+Spaa[1,3] Spaa[1,4]^3 Spaa[2,3]^3 Spaa[2,4]+Spaa[1,3]^2 Spaa[1,4]^2 Spaa[2,3]^2 Spaa[2,4]^2+Spaa[1,3]^3 Spaa[1,4] Spaa[2,3] Spaa[2,4]^3+Spaa[1,3]^4 Spaa[2,4]^4//FullSimplify


(* ::InheritFromParent:: *)
(**)


((Spaa[2,4] (Spaa[1,4] Spaa[2,3]+Spaa[1,3] Spaa[2,4]) (Spaa[1,4]^2 Spaa[2,3]^2+Spaa[1,3]^2 Spaa[2,4]^2))/(Spaa[1,3]^4 Spaa[1,4] Spaa[2,3])) (*N=0*)
((Spaa[2,4] ((Spaa[1,4] Spaa[2,3]+Spaa[1,3] Spaa[2,4])^2-Spaa[1,3] Spaa[1,4] Spaa[2,3] Spaa[2,4]))/(Spaa[1,3]^3 Spaa[1,4] Spaa[2,3])) (*N=1*)
((Spaa[2,4] (Spaa[1,4] Spaa[2,3]+Spaa[1,3] Spaa[2,4]))/(Spaa[1,3]^2 Spaa[1,4] Spaa[2,3])) (*N=2*)
(Spaa[2,4]/(Spaa[1,3] Spaa[1,4] Spaa[2,3]))(*N=3*)


(Spaa[1,4] Spaa[2,3]+Spaa[1,3] Spaa[2,4]) (Spaa[1,4]^2 Spaa[2,3]^2+Spaa[1,3]^2 Spaa[2,4]^2)//Expand


Spaa[1,4]^2 Spaa[2,3]^2+Spaa[1,3] Spaa[1,4] Spaa[2,3] Spaa[2,4]+Spaa[1,3]^2 Spaa[2,4]^2
(Spaa[1,4] Spaa[2,3]+Spaa[1,3]Spaa[2,4])(Spaa[1,4] Spaa[2,3]+Spaa[1,3]Spaa[2,4])//Expand


x^3*y^3+w^3*r^3


(* ::InheritFromParent:: *)
(**)


(* ::InheritFromParent:: *)
(**)


(* ::InheritFromParent:: *)
(**)


(* ::Subsection::Closed:: *)
(*Residue of Double-Box, two cycles*)


(* ::Subsubsection:: *)
(*N=3*)


CC =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"(", 
RowBox[{"1", "-", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "4", "]"}]}]}], ")"}], " ", 
RowBox[{"a", "[", "5", "]"}], "\[Delta]"}], "1", "0"},
{
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"(", 
RowBox[{"1", "-", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}]}], ")"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], "\[Delta]"}], "0", "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp = \!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], " ", 
RowBox[{"(", 
RowBox[{"1", "-", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}]}], ")"}], "\[Delta]"}]},
{"0", "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"(", 
RowBox[{"1", "-", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "4", "]"}]}]}], ")"}]}], " ", 
RowBox[{"a", "[", "5", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], "\[Delta]"}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda = {\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4]};
tlambda = {t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4]};
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4]};
SEQ = CC . Transpose[eta];
(*Solve for \[Alpha]'s by solving one delta function constraint. Here we get the equations from the eq below*)
CC . Transpose[Cperp]//Simplify


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;


\[Delta] = 1/(-1+a[1] a[2] a[3] a[4]+a[3] a[5]);
Sol =  (Solve[{A1==0,A2==0,A3==0,A4==0},{a[2],a[3],a[4],a[1]}]//FullSimplify)//.schoutenA;


\[Delta] = (Spaa[1,2] (-Spaa[1,3]+a[5] Spaa[3,4]))/(a[5] (Spaa[1,2]-a[5] Spaa[2,4]) Spaa[3,4]);


Sol = {a[2]->-((a[5] Spaa[2,3])/(Spaa[1,2]+a[5] Spaa[1,3])),a[3]->1/a[5]+Spaa[1,3]/Spaa[1,2],a[4]->(a[5] Spaa[1,4])/(Spaa[1,2]+a[5] Spaa[1,3]),a[1]->(Spaa[1,2]+a[5] Spaa[1,3])/(Spaa[2,4]+a[5] Spaa[3,4])}


\[Delta] = (Spaa[1,2] (Spaa[2,4]+a[5] Spaa[3,4]))/(a[5] (Spaa[1,2]+a[5] Spaa[1,3]) Spaa[3,4])


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A4;
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,4},{j,1,4}];
J = Simplify[1/(Det[Mat])]//.Sol//FullSimplify


J=(a[5] (-Spaa[1,2]+a[5] Spaa[2,4]))/(Spaa[1,2]^2 Spaa[1,4] Spaa[2,3] (Spaa[1,3]-a[5] Spaa[3,4]));


(* ::InheritFromParent:: *)
(**)


\[CapitalOmega]bare = FullSimplify[Product[1/a[i],{i,1,5}]//.Sol]*J*Spaa[3,4]//FullSimplify
Residue[\[CapitalOmega]bare,{a[5],0}]//.schoutenA
\[CapitalOmega]bare a[5]//.a[5]->0


\[CapitalOmega]bare = (Spaa[3,4]/(a[5](Spaa[2,4]+a[5]Spaa[3,4])Spaa[1,2]Spaa[2,3]Spaa[1,4])//.schoutenA//FullSimplify)//Factor
\[CapitalOmega] = \[CapitalOmega]bare*\[Delta]^3*Spaa[3,4]^3
Residue[\[CapitalOmega],{a[5],Spaa[1,2]/Spaa[3,1]}]//.schoutenA//Simplify
Residue[\[CapitalOmega],{a[5],0}]//.schoutenA//Simplify


"


























(* ::InheritFromParent:: *)
(**)


(* ::InheritFromParent:: *)
(**)


Res1 = Residue[\[CapitalOmega],{a[5],0}]
Res2 = Residue[\[CapitalOmega],{a[5],Spaa[1,3]/Spaa[1,2]}]
Res1+Res2


-((Spaa[1,2] Spaa[3,4])/(Spaa[1,3]^2 Spaa[1,4] Spaa[2,3]))

-((Spaa[1,2]^2 Spaa[3,4]^2)/(Spaa[1,3]^3 Spaa[1,4] Spaa[2,3]))


(* ::Subsubsection::Closed:: *)
(*inverse cycle direction*)


(*4 pt MHV*)
(*Define C-matrices and lambda*)
CC = \!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "+", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "3", "]"}]}]}], "0"},
{
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "1", "]"}]}], "0", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp = \!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}]}]},
{"0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "+", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "3", "]"}]}]}], ")"}]}], "1", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda = {\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4]};
tlambda = {t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4]};

perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4]};
SEQ = CC . Transpose[eta];
(*Solve for \[Alpha]'s by solving one delta function constraint. Here we get the equations from the eq below*)
CC . Transpose[Cperp]


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;


\[Delta] = 1/(1-a[1]a[2]a[3]a[4])
Sol =  (Solve[{A1==0,A2==0,A3==0,A4==0},{a[2],a[3],a[4],a[1]}]//FullSimplify)//.schoutenA


Sol = {a[2]->Spaa[2,3]/(a[5] Spaa[1,2]-Spaa[1,3]),a[3]->-a[5]+Spaa[1,3]/Spaa[1,2],a[4]->Spaa[1,4]/(a[5] Spaa[1,2]-Spaa[1,3]),a[1]->(-a[5] Spaa[1,2]+Spaa[1,3])/(a[5] Spaa[2,4]-Spaa[3,4])}


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A4;
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,4},{j,1,4}];
J = Simplify[1/(Det[Mat])]//.Sol//FullSimplify


J = 1/(Spaa[1,2]^2 (-a[5] Spaa[2,4]+Spaa[3,4])^2);
\[Delta] = ((1/(1-1/(a[1]a[2]a[3]a[4]))//.Sol//FullSimplify)//Together)//.schoutenA//Simplify
\[CapitalOmega]a = 1/(a[1]a[2]a[3]a[4]a[5])*Spaa[2,4]//.Sol//FullSimplify;
\[CapitalOmega]bare = ((\[CapitalOmega]a*J//FullSimplify)//.schoutenA//FullSimplify)//Factor
\[CapitalOmega] = \[Delta]^2*\[CapitalOmega]bare*Spaa[2,4]^2


Nn=2;
A41 = Spaa[2,4]^(4-Nn)/(Spaa[1,2]Spaa[2,3]Spaa[3,4]Spaa[4,1]) ((Spaa[2,1]Spaa[3,4])/(Spaa[1,3]Spaa[2,4]))^(4-Nn);
A42 = Spaa[2,4]^(4-Nn)/(Spaa[1,2]Spaa[2,3]Spaa[3,4]Spaa[4,1]) ((Spaa[4,1]Spaa[2,3])/(Spaa[1,3]Spaa[2,4]))^(4-Nn);
Together[A41+A42]//.schoutenA

ComRes = Factor[FullSimplify[Res1+Res2]]//.schoutenA


(* ::InheritFromParent:: *)
(**)


Res1 = Residue[\[CapitalOmega],{a[5],0}]//.schoutenA;
Res2 = Residue[\[CapitalOmega],{a[5],Spaa[3,4]/Spaa[2,4]}]//.schoutenA;
Res3 = Residue[\[CapitalOmega],{a[5],Spaa[1,3]/Spaa[1,2]}]//.schoutenA
ComRes = Factor[FullSimplify[Res1+Res2]]//.schoutenA
Res3//.NSpinHel;
ComRes//.NSpinHel;
Res1//FullSimplify


Spaa[1,4]^4 Spaa[2,3]^4+Spaa[1,3] Spaa[1,4]^3 Spaa[2,3]^3 Spaa[2,4]+Spaa[1,3]^2 Spaa[1,4]^2 Spaa[2,3]^2 Spaa[2,4]^2+Spaa[1,3]^3 Spaa[1,4] Spaa[2,3] Spaa[2,4]^3+Spaa[1,3]^4 Spaa[2,4]^4//FullSimplify


(* ::InheritFromParent:: *)
(**)


((Spaa[2,4] (Spaa[1,4] Spaa[2,3]+Spaa[1,3] Spaa[2,4]) (Spaa[1,4]^2 Spaa[2,3]^2+Spaa[1,3]^2 Spaa[2,4]^2))/(Spaa[1,3]^4 Spaa[1,4] Spaa[2,3])) (*N=0*)
((Spaa[2,4] ((Spaa[1,4] Spaa[2,3]+Spaa[1,3] Spaa[2,4])^2-Spaa[1,3] Spaa[1,4] Spaa[2,3] Spaa[2,4]))/(Spaa[1,3]^3 Spaa[1,4] Spaa[2,3])) (*N=1*)
((Spaa[2,4] (Spaa[1,4] Spaa[2,3]+Spaa[1,3] Spaa[2,4]))/(Spaa[1,3]^2 Spaa[1,4] Spaa[2,3])) (*N=2*)
(Spaa[2,4]/(Spaa[1,3] Spaa[1,4] Spaa[2,3]))(*N=3*)


(Spaa[1,4] Spaa[2,3]+Spaa[1,3] Spaa[2,4]) (Spaa[1,4]^2 Spaa[2,3]^2+Spaa[1,3]^2 Spaa[2,4]^2)//Expand


Spaa[1,4]^2 Spaa[2,3]^2+Spaa[1,3] Spaa[1,4] Spaa[2,3] Spaa[2,4]+Spaa[1,3]^2 Spaa[2,4]^2
(Spaa[1,4] Spaa[2,3]+Spaa[1,3]Spaa[2,4])(Spaa[1,4] Spaa[2,3]+Spaa[1,3]Spaa[2,4])//Expand


x^3*y^3+w^3*r^3


(* ::InheritFromParent:: *)
(**)


(* ::InheritFromParent:: *)
(**)


(* ::InheritFromParent:: *)
(**)


(* ::Subsection::Closed:: *)
(*Residue of Double-Box, two cycles, one nested*)


(* ::Subsubsection:: *)
(*N=3*)


(*4 pt MHV*)
(*Define C-matrices and lambda*)
CC = \!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
FractionBox[
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{
RowBox[{"-", "1"}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}]}]], 
FractionBox[
RowBox[{
RowBox[{"a", "[", "3", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "4", "]"}]}]}], 
RowBox[{
RowBox[{"-", "1"}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}]}]], "1", "0"},
{
FractionBox[
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"(", 
RowBox[{"1", "-", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}]}], ")"}]}], 
RowBox[{
RowBox[{"-", "1"}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}]}]], 
FractionBox[
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{
RowBox[{"-", "1"}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}]}]], "0", "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp = \!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", "0", 
RowBox[{"-", 
FractionBox[
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{
RowBox[{"-", "1"}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}]}]]}], 
RowBox[{"-", 
FractionBox[
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"(", 
RowBox[{"1", "-", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}]}], ")"}]}], 
RowBox[{
RowBox[{"-", "1"}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}]}]]}]},
{"0", "1", 
RowBox[{"-", 
FractionBox[
RowBox[{
RowBox[{"a", "[", "3", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "4", "]"}]}]}], 
RowBox[{
RowBox[{"-", "1"}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}]}]]}], 
RowBox[{"-", 
FractionBox[
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{
RowBox[{"-", "1"}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}]}]]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda = {\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4]};
tlambda = {t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4]};

perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4]};
SEQ = CC . Transpose[eta];
(*Solve for \[Alpha]'s by solving one delta function constraint. Here we get the equations from the eq below*)
CC . Transpose[Cperp]


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;


Sol =  (Solve[{A1==0,A2==0,A3==0,A4==0},{a[2],a[3],a[4],a[5]}]//FullSimplify)//.schoutenA


(*Solutions for \[Alpha]5 as parameter*)
Sol = {a[2]->(Spaa[2,3] Spaa[3,4])/((Simplify[a[5] Spaa[1,4] Spaa[2,3]-a[5] Spaa[1,3] Spaa[2,4]]//.schoutenA)+Spaa[1,3] Spaa[3,4])//Simplify,a[3]->-((Spaa[1,2] Spaa[3,4])/((Simplify[a[5] Spaa[1,4] Spaa[2,3]-a[5] Spaa[1,3] Spaa[2,4]]//.schoutenA)+Spaa[1,3] Spaa[3,4]))//Simplify,a[4]->-((Spaa[1,4] Spaa[3,4])/((Simplify[a[5] Spaa[1,4] Spaa[2,3]-a[5] Spaa[1,3] Spaa[2,4]]//.schoutenA)+Spaa[1,3] Spaa[3,4]))//Simplify,a[1]->-(((Simplify[a[5] Spaa[1,4] Spaa[2,3]-a[5] Spaa[1,3] Spaa[2,4]]//.schoutenA)+Spaa[1,3] Spaa[3,4])/(a[5] Spaa[2,4] Spaa[3,4]-Spaa[3,4]^2))//Simplify}


(*Solutions for \[Alpha]1 as parameter*)
Sol ={a[2]->(Expand[Spaa[1,4] Spaa[2,3]+Spaa[2,4] (-Spaa[1,3]+a[1] Spaa[3,4])]//.schoutenA//FullSimplify)/(a[1] Spaa[1,4] Spaa[3,4]),a[3]->-(((Simplify[Spaa[1,2] Spaa[1,4] Spaa[2,3]-Spaa[1,2] Spaa[1,3] Spaa[2,4]]//.schoutenA)+a[1] Spaa[1,2] Spaa[2,4] Spaa[3,4])/(a[1] Spaa[1,4] Spaa[2,3] Spaa[3,4]))//FullSimplify,a[4]->(Expand[-Spaa[1,4] Spaa[2,3]+Spaa[2,4] (Spaa[1,3]-a[1] Spaa[3,4])]//.schoutenA)/(a[1] Spaa[2,3] Spaa[3,4])//Simplify,a[5]->(Spaa[3,4] (-Spaa[1,3]+a[1] Spaa[3,4]))/(Expand[Spaa[1,4] Spaa[2,3]+Spaa[2,4] (-Spaa[1,3]+a[1] Spaa[3,4])]//.schoutenA)//Simplify}


Ja = ((Spaa[1,2]-a[1] Spaa[2,4]) Spaa[3,4])/(Spaa[1,4] Spaa[2,3])


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A4;
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,4},{j,1,4}];
J = (Simplify[1/(Det[Mat])]//.Sol//FullSimplify)//.schoutenA//FullSimplify
((Expand[Spaa[1,4] Spaa[2,3]+Spaa[2,4] (-Spaa[1,3]+a[1] Spaa[3,4])]//.schoutenA))^4/(a[1]^2 Spaa[1,4]^4 Spaa[2,3]^4 Spaa[3,4]^4)//FullSimplify


\[CapitalOmega]a = 1/(a[1]a[2]a[3]a[4]a[5])*Spaa[3,4]//.Sol//FullSimplify;
\[CapitalOmega]bare = (((\[CapitalOmega]a*J*Spaa[3,4]^1//FullSimplify)//.schoutenA//FullSimplify)//.schoutenA//Factor)//.schoutenA//FullSimplify
\[CapitalOmega]bare//.a[1]->1/z//FullSimplify
\[CapitalOmega] = Ja^(-1)*\[CapitalOmega]bare//.a[1]->1/z//FullSimplify


(* ::InheritFromParent:: *)
(**)


Res1 = Residue[\[CapitalOmega]/.a[1]->1/z//FullSimplify,{z,Spaa[3,4]/Spaa[1,3]}]//.schoutenA


(Spaa[1,2] Spaa[2,4] Spaa[3,4])/(Spaa[1,3]^2 Spaa[1,4] Spaa[2,3])
(Spaa[1,2]^2 Spaa[2,4] Spaa[3,4]^2)/(Spaa[1,3]^3 Spaa[1,4] Spaa[2,3])


(* ::Subsection::Closed:: *)
(*Residue of Double-Box, paper 1 *)


(* ::Subsubsection:: *)
(*N=3*)


(*4 pt MHV*)
(*Define C-matrices and lambda*)
CC = \!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]}], 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "0"},
{"0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "+", 
RowBox[{"a", "[", "3", "]"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp = \!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]}], ")"}]}], "1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}]}]},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"a", "[", "4", "]"}]}], "0", "1", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "+", 
RowBox[{"a", "[", "3", "]"}]}], ")"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda = {\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4]};
tlambda = {t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4]};

perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4]};
SEQ = CC . Transpose[eta];
(*Solve for \[Alpha]'s by solving one delta function constraint. Here we get the equations from the eq below*)
CC . Transpose[Cperp]


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;


Sol =  (Solve[{A1==0,A2==0,A3==0,A4==0},{a[1],a[2],a[3],a[4]}]//FullSimplify)//.schoutenA


Sol ={a[1]->(Together[Spaa[2,4]+(Spaa[1,2] Spaa[3,4])/(-Spaa[1,3]+a[5] Spaa[1,4])]//.schoutenA)/Spaa[1,4]//FullSimplify,a[2]->Spaa[1,2]/(Spaa[1,3]-a[5] Spaa[1,4]),a[3]->-a[5]+Spaa[1,3]/Spaa[1,4],a[4]->Spaa[3,4]/(Spaa[1,3]-a[5] Spaa[1,4])};


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A4;
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,4},{j,1,4}];
J = Simplify[1/(Det[Mat])]//.Sol//FullSimplify


\[CapitalOmega]a = 1/(a[1]a[2]a[3]a[4]a[5])*Spaa[2,4]//.Sol//FullSimplify;
\[CapitalOmega]bare = ((\[CapitalOmega]a*J//FullSimplify)//.schoutenA//FullSimplify)//Factor;
\[CapitalOmega]bare//.a[5]->-z//Simplify//Factor


(*)


\[Delta] = (Together[1/(1-(-a[1])^(-1)a[2]a[3]a[4])//.Sol]//.schoutenA//FullSimplify)//.a[5]->-z


\[CapitalOmega]bare=Spaa[2,4]/(z Spaa[1,2] Spaa[1,4] (Spaa[2,3]+z Spaa[2,4]) Spaa[3,4]);
\[CapitalOmega] = \[CapitalOmega]bare*\[Delta]//Simplify//Factor


Res1 = Residue[\[CapitalOmega],{z,0}]
Res2 = Residue[\[CapitalOmega],{z,-Spaa[1,3]/Spaa[1,4]}]
Res1+Res2


-((Spaa[1,2] Spaa[3,4])/(Spaa[1,3]^2 Spaa[1,4] Spaa[2,3]))

-((Spaa[1,2]^2 Spaa[3,4]^2)/(Spaa[1,3]^3 Spaa[1,4] Spaa[2,3]))




















(* ::Subsubsection::Closed:: *)
(*inverse cycle direction*)


(*4 pt MHV*)
(*Define C-matrices and lambda*)
CC = \!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "+", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "3", "]"}]}]}], "0"},
{
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "1", "]"}]}], "0", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp = \!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}]}]},
{"0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "+", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "3", "]"}]}]}], ")"}]}], "1", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda = {\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4]};
tlambda = {t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4]};

perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4]};
SEQ = CC . Transpose[eta];
(*Solve for \[Alpha]'s by solving one delta function constraint. Here we get the equations from the eq below*)
CC . Transpose[Cperp]


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;


\[Delta] = 1/(1-a[1]a[2]a[3]a[4])
Sol =  (Solve[{A1==0,A2==0,A3==0,A4==0},{a[2],a[3],a[4],a[1]}]//FullSimplify)//.schoutenA


Sol = {a[2]->Spaa[2,3]/(a[5] Spaa[1,2]-Spaa[1,3]),a[3]->-a[5]+Spaa[1,3]/Spaa[1,2],a[4]->Spaa[1,4]/(a[5] Spaa[1,2]-Spaa[1,3]),a[1]->(-a[5] Spaa[1,2]+Spaa[1,3])/(a[5] Spaa[2,4]-Spaa[3,4])}


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A4;
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,4},{j,1,4}];
J = Simplify[1/(Det[Mat])]//.Sol//FullSimplify


J = 1/(Spaa[1,2]^2 (-a[5] Spaa[2,4]+Spaa[3,4])^2);
\[Delta] = ((1/(1-1/(a[1]a[2]a[3]a[4]))//.Sol//FullSimplify)//Together)//.schoutenA//Simplify
\[CapitalOmega]a = 1/(a[1]a[2]a[3]a[4]a[5])*Spaa[2,4]//.Sol//FullSimplify;
\[CapitalOmega]bare = ((\[CapitalOmega]a*J//FullSimplify)//.schoutenA//FullSimplify)//Factor
\[CapitalOmega] = \[Delta]^2*\[CapitalOmega]bare*Spaa[2,4]^2


Nn=2;
A41 = Spaa[2,4]^(4-Nn)/(Spaa[1,2]Spaa[2,3]Spaa[3,4]Spaa[4,1]) ((Spaa[2,1]Spaa[3,4])/(Spaa[1,3]Spaa[2,4]))^(4-Nn);
A42 = Spaa[2,4]^(4-Nn)/(Spaa[1,2]Spaa[2,3]Spaa[3,4]Spaa[4,1]) ((Spaa[4,1]Spaa[2,3])/(Spaa[1,3]Spaa[2,4]))^(4-Nn);
Together[A41+A42]//.schoutenA

ComRes = Factor[FullSimplify[Res1+Res2]]//.schoutenA


(* ::InheritFromParent:: *)
(**)


Res1 = Residue[\[CapitalOmega],{a[5],0}]//.schoutenA;
Res2 = Residue[\[CapitalOmega],{a[5],Spaa[3,4]/Spaa[2,4]}]//.schoutenA;
Res3 = Residue[\[CapitalOmega],{a[5],Spaa[1,3]/Spaa[1,2]}]//.schoutenA
ComRes = Factor[FullSimplify[Res1+Res2]]//.schoutenA
Res3//.NSpinHel;
ComRes//.NSpinHel;
Res1//FullSimplify


Spaa[1,4]^4 Spaa[2,3]^4+Spaa[1,3] Spaa[1,4]^3 Spaa[2,3]^3 Spaa[2,4]+Spaa[1,3]^2 Spaa[1,4]^2 Spaa[2,3]^2 Spaa[2,4]^2+Spaa[1,3]^3 Spaa[1,4] Spaa[2,3] Spaa[2,4]^3+Spaa[1,3]^4 Spaa[2,4]^4//FullSimplify


(* ::InheritFromParent:: *)
(**)


((Spaa[2,4] (Spaa[1,4] Spaa[2,3]+Spaa[1,3] Spaa[2,4]) (Spaa[1,4]^2 Spaa[2,3]^2+Spaa[1,3]^2 Spaa[2,4]^2))/(Spaa[1,3]^4 Spaa[1,4] Spaa[2,3])) (*N=0*)
((Spaa[2,4] ((Spaa[1,4] Spaa[2,3]+Spaa[1,3] Spaa[2,4])^2-Spaa[1,3] Spaa[1,4] Spaa[2,3] Spaa[2,4]))/(Spaa[1,3]^3 Spaa[1,4] Spaa[2,3])) (*N=1*)
((Spaa[2,4] (Spaa[1,4] Spaa[2,3]+Spaa[1,3] Spaa[2,4]))/(Spaa[1,3]^2 Spaa[1,4] Spaa[2,3])) (*N=2*)
(Spaa[2,4]/(Spaa[1,3] Spaa[1,4] Spaa[2,3]))(*N=3*)


(Spaa[1,4] Spaa[2,3]+Spaa[1,3] Spaa[2,4]) (Spaa[1,4]^2 Spaa[2,3]^2+Spaa[1,3]^2 Spaa[2,4]^2)//Expand


Spaa[1,4]^2 Spaa[2,3]^2+Spaa[1,3] Spaa[1,4] Spaa[2,3] Spaa[2,4]+Spaa[1,3]^2 Spaa[2,4]^2
(Spaa[1,4] Spaa[2,3]+Spaa[1,3]Spaa[2,4])(Spaa[1,4] Spaa[2,3]+Spaa[1,3]Spaa[2,4])//Expand


x^3*y^3+w^3*r^3


(* ::InheritFromParent:: *)
(**)


(* ::InheritFromParent:: *)
(**)


(* ::InheritFromParent:: *)
(**)


(* ::Subsection::Closed:: *)
(*Residue of Double-Box, paper 2*)


(* ::Subsubsection:: *)
(*N=3*)


(*4 pt MHV*)
(*Define C-matrices and lambda*)
CC = \!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}]}], 
RowBox[{"a", "[", "3", "]"}], "0"},
{"0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp = \!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}]}], ")"}]}], "1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]},
{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], "0", "1", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]}], ")"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda = {\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4]};
tlambda = {t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4]};

perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4]};
SEQ = CC . Transpose[eta];
(*Solve for \[Alpha]'s by solving one delta function constraint. Here we get the equations from the eq below*)
CC . Transpose[Cperp]


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;


Sol =  (Solve[{A1==0,A2==0,A3==0,A4==0},{a[1],a[2],a[3],a[4]}]//FullSimplify)//.schoutenA


Together[(Spaa[2,4]+(Spaa[1,2] Spaa[3,4])/(-Spaa[1,3]+a[5] Spaa[1,4]))/Spaa[1,4]]//.schoutenA//Simplify


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A4;
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,4},{j,1,4}];
J = Simplify[1/(Det[Mat])]//.Sol//FullSimplify


J*Spaa[1,4]
\[CapitalOmega]a = 1/(a[1]a[2]a[3]a[4]a[5])*Spaa[1,4]//.Sol//FullSimplify;
\[CapitalOmega]bare = ((\[CapitalOmega]a*J//FullSimplify)//.schoutenA//FullSimplify)//Factor;
Simplify[\[CapitalOmega]bare//.a[5]->-z]//.schoutenA//Factor


(*)


\[Delta] = (Together[1/(1-(-a[1])^(-1)a[2]a[3]a[4])//.Sol]//.schoutenA//FullSimplify)//.a[5]->-z


\[CapitalOmega]bare=Spaa[2,4]/(z Spaa[1,2] Spaa[1,4] (Spaa[2,3]+z Spaa[2,4]) Spaa[3,4]);
\[CapitalOmega] = \[CapitalOmega]bare*\[Delta]//Simplify//Factor


Res1 = Residue[\[CapitalOmega],{z,0}]
Res2 = Residue[\[CapitalOmega],{z,-Spaa[1,3]/Spaa[1,4]}]
Res1+Res2


-((Spaa[1,2] Spaa[3,4])/(Spaa[1,3]^2 Spaa[1,4] Spaa[2,3]))

-((Spaa[1,2]^2 Spaa[3,4]^2)/(Spaa[1,3]^3 Spaa[1,4] Spaa[2,3]))




















(* ::Subsubsection::Closed:: *)
(*inverse cycle direction*)


(*4 pt MHV*)
(*Define C-matrices and lambda*)
CC = \!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "+", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "3", "]"}]}]}], "0"},
{
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "1", "]"}]}], "0", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp = \!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}]}]},
{"0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "+", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "3", "]"}]}]}], ")"}]}], "1", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda = {\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4]};
tlambda = {t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4]};

perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4]};
SEQ = CC . Transpose[eta];
(*Solve for \[Alpha]'s by solving one delta function constraint. Here we get the equations from the eq below*)
CC . Transpose[Cperp]


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;


\[Delta] = 1/(1-a[1]a[2]a[3]a[4])
Sol =  (Solve[{A1==0,A2==0,A3==0,A4==0},{a[2],a[3],a[4],a[1]}]//FullSimplify)//.schoutenA


Sol = {a[2]->Spaa[2,3]/(a[5] Spaa[1,2]-Spaa[1,3]),a[3]->-a[5]+Spaa[1,3]/Spaa[1,2],a[4]->Spaa[1,4]/(a[5] Spaa[1,2]-Spaa[1,3]),a[1]->(-a[5] Spaa[1,2]+Spaa[1,3])/(a[5] Spaa[2,4]-Spaa[3,4])}


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A4;
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,4},{j,1,4}];
J = Simplify[1/(Det[Mat])]//.Sol//FullSimplify


J = 1/(Spaa[1,2]^2 (-a[5] Spaa[2,4]+Spaa[3,4])^2);
\[Delta] = ((1/(1-1/(a[1]a[2]a[3]a[4]))//.Sol//FullSimplify)//Together)//.schoutenA//Simplify
\[CapitalOmega]a = 1/(a[1]a[2]a[3]a[4]a[5])*Spaa[2,4]//.Sol//FullSimplify;
\[CapitalOmega]bare = ((\[CapitalOmega]a*J//FullSimplify)//.schoutenA//FullSimplify)//Factor
\[CapitalOmega] = \[Delta]^2*\[CapitalOmega]bare*Spaa[2,4]^2


Nn=2;
A41 = Spaa[2,4]^(4-Nn)/(Spaa[1,2]Spaa[2,3]Spaa[3,4]Spaa[4,1]) ((Spaa[2,1]Spaa[3,4])/(Spaa[1,3]Spaa[2,4]))^(4-Nn);
A42 = Spaa[2,4]^(4-Nn)/(Spaa[1,2]Spaa[2,3]Spaa[3,4]Spaa[4,1]) ((Spaa[4,1]Spaa[2,3])/(Spaa[1,3]Spaa[2,4]))^(4-Nn);
Together[A41+A42]//.schoutenA

ComRes = Factor[FullSimplify[Res1+Res2]]//.schoutenA


(* ::InheritFromParent:: *)
(**)


Res1 = Residue[\[CapitalOmega],{a[5],0}]//.schoutenA;
Res2 = Residue[\[CapitalOmega],{a[5],Spaa[3,4]/Spaa[2,4]}]//.schoutenA;
Res3 = Residue[\[CapitalOmega],{a[5],Spaa[1,3]/Spaa[1,2]}]//.schoutenA
ComRes = Factor[FullSimplify[Res1+Res2]]//.schoutenA
Res3//.NSpinHel;
ComRes//.NSpinHel;
Res1//FullSimplify


Spaa[1,4]^4 Spaa[2,3]^4+Spaa[1,3] Spaa[1,4]^3 Spaa[2,3]^3 Spaa[2,4]+Spaa[1,3]^2 Spaa[1,4]^2 Spaa[2,3]^2 Spaa[2,4]^2+Spaa[1,3]^3 Spaa[1,4] Spaa[2,3] Spaa[2,4]^3+Spaa[1,3]^4 Spaa[2,4]^4//FullSimplify


(* ::InheritFromParent:: *)
(**)


((Spaa[2,4] (Spaa[1,4] Spaa[2,3]+Spaa[1,3] Spaa[2,4]) (Spaa[1,4]^2 Spaa[2,3]^2+Spaa[1,3]^2 Spaa[2,4]^2))/(Spaa[1,3]^4 Spaa[1,4] Spaa[2,3])) (*N=0*)
((Spaa[2,4] ((Spaa[1,4] Spaa[2,3]+Spaa[1,3] Spaa[2,4])^2-Spaa[1,3] Spaa[1,4] Spaa[2,3] Spaa[2,4]))/(Spaa[1,3]^3 Spaa[1,4] Spaa[2,3])) (*N=1*)
((Spaa[2,4] (Spaa[1,4] Spaa[2,3]+Spaa[1,3] Spaa[2,4]))/(Spaa[1,3]^2 Spaa[1,4] Spaa[2,3])) (*N=2*)
(Spaa[2,4]/(Spaa[1,3] Spaa[1,4] Spaa[2,3]))(*N=3*)


(Spaa[1,4] Spaa[2,3]+Spaa[1,3] Spaa[2,4]) (Spaa[1,4]^2 Spaa[2,3]^2+Spaa[1,3]^2 Spaa[2,4]^2)//Expand


Spaa[1,4]^2 Spaa[2,3]^2+Spaa[1,3] Spaa[1,4] Spaa[2,3] Spaa[2,4]+Spaa[1,3]^2 Spaa[2,4]^2
(Spaa[1,4] Spaa[2,3]+Spaa[1,3]Spaa[2,4])(Spaa[1,4] Spaa[2,3]+Spaa[1,3]Spaa[2,4])//Expand


x^3*y^3+w^3*r^3


(* ::InheritFromParent:: *)
(**)


(* ::InheritFromParent:: *)
(**)


(* ::InheritFromParent:: *)
(**)


(* ::Subsection::Closed:: *)
(*7 pt non planar internal cycle calculation, double loops*)


(* ::Subsubsection::Closed:: *)
(*Before residue*)


(*x1 = \[Delta] a[1]a[3]a[6](1+a[7]a[9]);
x2 = (\[Delta] a[3]a[5]a[6]+a[4]);
x3 = a[8]a[9]+x2(1+a[7]a[9]);

CC=(a[1] \[Delta]	1	a[1]a[6]\[Delta]	x1	x1 a[10]	0	\[Delta] a[1]a[3]a[6]a[7]
a[1]a[2]a[5]a[6]\[Delta]	0	a[5]a[6]\[Delta]	x3	x3 a[10]+a[11]	1	a[8]+x2 a[7]

);
(*//.a[5]\[Rule]1*)
Cperp =(1	-a[1] \[Delta]	0	0	0	-a[1]a[2]a[5]a[6]\[Delta]	0
0	-a[1]a[6]\[Delta]	1	0	0	-a[5]a[6]\[Delta]	0
0	-x1	0	1	0	-x3	0
0	-x1 a[10]	0	0	1	-(x3 a[10]+a[11])	0
0	-\[Delta] a[1]a[3]a[6]a[7]	0	0	0	-(a[8]+x2 a[7])	1

);*)
x1 = \[Delta] a[1]a[3]a[6](1+a[7]a[11]);
x2 = (\[Delta] a[3]a[5]a[6]+a[4]);
x3 = a[8]a[11]+x2(1+a[7]a[11]);

CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], "x1", 
RowBox[{"x1", " ", 
RowBox[{"a", "[", "10", "]"}]}], "0", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}]}]},
{
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], "x3", 
RowBox[{
RowBox[{"x3", " ", 
RowBox[{"a", "[", "10", "]"}]}], "+", 
RowBox[{"a", "[", "9", "]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "8", "]"}], "+", 
RowBox[{"x2", " ", 
RowBox[{"a", "[", "7", "]"}]}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
(*//.a[5]\[Rule]1*)
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], " ", "\[Delta]"}], "0", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], "0"},
{"0", 
RowBox[{"-", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}]}], "1", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], "0"},
{"0", 
RowBox[{"-", "x1"}], "0", "1", "0", 
RowBox[{"-", "x3"}], "0"},
{"0", 
RowBox[{
RowBox[{"-", "x1"}], " ", 
RowBox[{"a", "[", "10", "]"}]}], "0", "0", "1", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"x3", " ", 
RowBox[{"a", "[", "10", "]"}]}], "+", 
RowBox[{"a", "[", "9", "]"}]}], ")"}]}], "0"},
{"0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}]}], "0", "0", "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "8", "]"}], "+", 
RowBox[{"x2", " ", 
RowBox[{"a", "[", "7", "]"}]}]}], ")"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6],t\[Lambda][7]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6],\[Eta][7]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[4]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[4]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A9 = TensorExpand[(perpEQ[[5]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A10 =TensorExpand[(perpEQ[[5]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;


\[Delta] = 1/(1-(a[1]a[2]a[6]));
Sol = FullSimplify[Simplify[Solve[{A1==0,A2==0,A3==0,A4==0,A5==0,A6==0,A7==0,A8==0,A9==0,A10==0},{a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10]}]//.schoutenA]]//.schoutenA


Together[\[Delta]//.Sol]//.schoutenA


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A4;
EE[5] = A5;
EE[6] = A6;
EE[7] = A7;
EE[8] = A8;
EE[9] = A9;
EE[10]=A10;


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,10},{j,1,10}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol]//.schoutenA


Product[1/a[i],{i,1,11}]//.Sol//Simplify
\[CapitalOmega] = Product[1/a[i],{i,1,11}]*J*Spaa[2,6]^2//.Sol[[1]]//Simplify


Res1 = Residue[\[CapitalOmega][[1]],{a[11],Spaa[3,4]/Spaa[3,7]}]
Res1 = Residue[\[CapitalOmega][[1]],{a[11],0}]


(* ::InheritFromParent:: *)
(**)


(* ::Subsection::Closed:: *)
(*7 pt non planar internal cycle calculation, double loops, 2nd ite*)


(* ::Subsubsection:: *)
(*Before residue*)


x1 = \[Delta] a[1]a[3]a[6];
x2 = (\[Delta] a[3]a[5]a[6]+a[4]);

CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"a", "[", "11", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}]}], "x1", 
RowBox[{"x1", " ", 
RowBox[{"a", "[", "9", "]"}]}], "0", 
RowBox[{"x1", " ", 
RowBox[{"a", "[", "7", "]"}]}]},
{
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], "x2", 
RowBox[{
RowBox[{"x2", " ", 
RowBox[{"a", "[", "9", "]"}]}], "+", 
RowBox[{"a", "[", "10", "]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "8", "]"}], "+", 
RowBox[{"x2", " ", 
RowBox[{"a", "[", "7", "]"}]}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
(*//.a[5]\[Rule]1*)
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], " ", "\[Delta]"}], "0", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], "0"},
{"0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "11", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}]}], ")"}]}], "1", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], "0"},
{"0", 
RowBox[{"-", "x1"}], "0", "1", "0", 
RowBox[{"-", "x2"}], "0"},
{"0", 
RowBox[{
RowBox[{"-", "x1"}], " ", 
RowBox[{"a", "[", "9", "]"}]}], "0", "0", "1", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"x2", " ", 
RowBox[{"a", "[", "9", "]"}]}], "+", 
RowBox[{"a", "[", "10", "]"}]}], ")"}]}], "0"},
{"0", 
RowBox[{
RowBox[{"-", "x1"}], " ", 
RowBox[{"a", "[", "7", "]"}]}], "0", "0", "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "8", "]"}], "+", 
RowBox[{"x2", " ", 
RowBox[{"a", "[", "7", "]"}]}]}], ")"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6],t\[Lambda][7]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6],\[Eta][7]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[4]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[4]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A9 = TensorExpand[(perpEQ[[5]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A10 =TensorExpand[(perpEQ[[5]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;


\[Delta] = 1/(1-(a[1]a[2]a[6]));
Sol = FullSimplify[Simplify[Solve[{A1==0,A2==0,A3==0,A4==0,A5==0,A6==0,A7==0,A8==0,A9==0,A10==0},{a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10]}]//.schoutenA]]//.schoutenA
Sol = Sol[[1]]


\[Delta] = (Together[\[Delta]//.Sol]//.schoutenA)//Factor


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A4;
EE[5] = A5;
EE[6] = A6;
EE[7] = A7;
EE[8] = A8;
EE[9] = A9;
EE[10]=A10;


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,10},{j,1,10}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol]//.schoutenA


Product[1/a[i],{i,1,11}]//.Sol//Simplify
\[CapitalOmega] =( Product[1/a[i],{i,1,11}]*J*Spaa[2,6]^2//.Sol//Simplify)//Factor


Res1 = Residue[\[CapitalOmega],{a[11],Spaa[3,4]/Spaa[2,4]}]
Res1 = Residue[\[CapitalOmega],{a[11],0}]


(* ::InheritFromParent:: *)
(**)


(* ::Subsection::Closed:: *)
(*7 pt non planar internal cycle calculation, double loops, 3rd ite*)


(* ::Subsubsection:: *)
(*Before residue*)


x1 = \[Delta] a[1]a[3]a[6];
x2 = (\[Delta] a[3]a[5]a[6]+a[4]);

CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], 
RowBox[{"x1", 
RowBox[{"(", 
RowBox[{"1", "+", 
RowBox[{
RowBox[{"a", "[", "9", "]"}], 
RowBox[{"a", "[", "11", "]"}]}]}], ")"}]}], 
RowBox[{"x1", " ", 
RowBox[{"a", "[", "9", "]"}]}], "0", 
RowBox[{"x1", " ", 
RowBox[{"a", "[", "7", "]"}]}]},
{
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"x2", 
RowBox[{"(", 
RowBox[{"1", "+", 
RowBox[{
RowBox[{"a", "[", "9", "]"}], 
RowBox[{"a", "[", "11", "]"}]}]}], ")"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "10", "]"}], 
RowBox[{"a", "[", "11", "]"}]}]}], 
RowBox[{
RowBox[{"x2", " ", 
RowBox[{"a", "[", "9", "]"}]}], "+", 
RowBox[{"a", "[", "10", "]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "8", "]"}], "+", 
RowBox[{"x2", " ", 
RowBox[{"a", "[", "7", "]"}]}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
(*//.a[5]\[Rule]1*)
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], " ", "\[Delta]"}], "0", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], "0"},
{"0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], ")"}]}], "1", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], "0"},
{"0", 
RowBox[{
RowBox[{"-", "x1"}], 
RowBox[{"(", 
RowBox[{"1", "+", 
RowBox[{
RowBox[{"a", "[", "9", "]"}], 
RowBox[{"a", "[", "11", "]"}]}]}], ")"}]}], "0", "1", "0", 
RowBox[{
RowBox[{
RowBox[{"-", "x2"}], 
RowBox[{"(", 
RowBox[{"1", "+", 
RowBox[{
RowBox[{"a", "[", "9", "]"}], 
RowBox[{"a", "[", "11", "]"}]}]}], ")"}]}], "-", 
RowBox[{
RowBox[{"a", "[", "10", "]"}], 
RowBox[{"a", "[", "11", "]"}]}]}], "0"},
{"0", 
RowBox[{
RowBox[{"-", "x1"}], " ", 
RowBox[{"a", "[", "9", "]"}]}], "0", "0", "1", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"x2", " ", 
RowBox[{"a", "[", "9", "]"}]}], "+", 
RowBox[{"a", "[", "10", "]"}]}], ")"}]}], "0"},
{"0", 
RowBox[{
RowBox[{"-", "x1"}], " ", 
RowBox[{"a", "[", "7", "]"}]}], "0", "0", "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "8", "]"}], "+", 
RowBox[{"x2", " ", 
RowBox[{"a", "[", "7", "]"}]}]}], ")"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6],t\[Lambda][7]};
CC . Transpose[Cperp]//Simplify
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6],\[Eta][7]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[4]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[4]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A9 = TensorExpand[(perpEQ[[5]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A10 =TensorExpand[(perpEQ[[5]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;


\[Delta] = 1/(1-(a[1]a[2]a[6]));
Sol = FullSimplify[Simplify[Solve[{A1==0,A2==0,A3==0,A4==0,A5==0,A6==0,A7==0,A8==0,A9==0,A10==0},{a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10]}]//.schoutenA]]//.schoutenA;
Sol = Sol[[1]]


\[Delta] = (Together[\[Delta]//.Sol]//.schoutenA)//Factor


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A4;
EE[5] = A5;
EE[6] = A6;
EE[7] = A7;
EE[8] = A8;
EE[9] = A9;
EE[10]=A10;


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,10},{j,1,10}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol]//.schoutenA


Product[1/a[i],{i,1,11}]//.Sol//Simplify;
\[CapitalOmega]bare =( Product[1/a[i],{i,1,11}]*J*Spaa[2,6]^2//.Sol//Simplify)//Factor
\[CapitalOmega] =  \[CapitalOmega]bare*\[Delta]//Simplify


DefNumSH[7]
IRRes1 = Residue[\[CapitalOmega],{a[11],Spaa[3,4]/Spaa[3,5]}]//.schoutenA
IRRes2 = Residue[\[CapitalOmega],{a[11],0}]
IRRes3 = Residue[\[CapitalOmega],{a[11],Spaa[4,7]/Spaa[5,7]}]//.schoutenA
IRRes1+IRRes2+IRRes3//.NSpinHel
sing = {Spaa[i_,3]->\[Alpha] Spaa[i,1]+\[Beta] \[Gamma] Spaa[i,2],Spaa[3,i_]->\[Alpha] Spaa[1,i]+\[Beta] \[Gamma] Spaa[2,i]};
gg = \[Gamma]->Spaa[4,3]/Spaa[4,2];
\[Omega] = Residue[\[CapitalOmega]//.sing//.gg,{\[Beta],0}]


(* ::InheritFromParent:: *)
(**)


(* ::Subsection::Closed:: *)
(*7 pt non planar internal cycle calculation, double loops, 4th ite*)


(* ::Subsubsection::Closed:: *)
(*Before residue*)


x1 = \[Delta] a[1]a[3]a[6];
x2 = (\[Delta] a[3]a[5]a[6]+a[4]);

CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], 
RowBox[{"x1", "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "11", "]"}], "\[Delta]"}]}], 
RowBox[{"x1", " ", 
RowBox[{"a", "[", "9", "]"}]}], "0", 
RowBox[{"x1", " ", 
RowBox[{"a", "[", "7", "]"}]}]},
{
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], 
RowBox[{"x2", "+", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "11", "]"}], "\[Delta]"}]}], 
RowBox[{
RowBox[{"x2", " ", 
RowBox[{"a", "[", "9", "]"}]}], "+", 
RowBox[{"a", "[", "10", "]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "8", "]"}], "+", 
RowBox[{"x2", " ", 
RowBox[{"a", "[", "7", "]"}]}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
(*//.a[5]\[Rule]1*)
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], " ", "\[Delta]"}], "0", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], "0"},
{"0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], ")"}]}], "1", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], "0"},
{"0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{"x1", "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "11", "]"}], "\[Delta]"}]}], ")"}]}], "0", "1", "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{"x2", "+", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "11", "]"}], "\[Delta]"}]}], ")"}]}], "0"},
{"0", 
RowBox[{
RowBox[{"-", "x1"}], " ", 
RowBox[{"a", "[", "9", "]"}]}], "0", "0", "1", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"x2", " ", 
RowBox[{"a", "[", "9", "]"}]}], "+", 
RowBox[{"a", "[", "10", "]"}]}], ")"}]}], "0"},
{"0", 
RowBox[{
RowBox[{"-", "x1"}], " ", 
RowBox[{"a", "[", "7", "]"}]}], "0", "0", "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "8", "]"}], "+", 
RowBox[{"x2", " ", 
RowBox[{"a", "[", "7", "]"}]}]}], ")"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6],t\[Lambda][7]};
CC . Transpose[Cperp]//Simplify
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6],\[Eta][7]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[4]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[4]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A9 = TensorExpand[(perpEQ[[5]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A10 =TensorExpand[(perpEQ[[5]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;


\[Delta] = 1/(1-(a[1]a[2]a[6]));
Sol = FullSimplify[Simplify[Solve[{A1==0,A2==0,A3==0,A4==0,A5==0,A6==0,A7==0,A8==0,A9==0,A10==0},{a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10]}]//.schoutenA]]//.schoutenA;
Sol = Sol[[1]]


\[Delta] = (Together[\[Delta]//.Sol]//.schoutenA)//Factor


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A4;
EE[5] = A5;
EE[6] = A6;
EE[7] = A7;
EE[8] = A8;
EE[9] = A9;
EE[10]=A10;


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,10},{j,1,10}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol]//.schoutenA


Spaa[4,6]/(Spaa[1,2] Spaa[1,4]^2 Spaa[1,6] Spaa[2,3] Spaa[3,4] Spaa[4,5] Spaa[4,7] Spaa[5,6] Spaa[6,7])*Spaa[1,4]^2/Spaa[2,6]
\[CapitalOmega]bare =( Product[1/a[i],{i,1,11}]*J*Spaa[2,6]^2//.Sol//Simplify)//Factor;
 Residue[\[CapitalOmega]bare,{a[11],0}]






Product[1/a[i],{i,1,11}]//.Sol//Simplify;
\[CapitalOmega]bare =( Product[1/a[i],{i,1,11}]*J*Spaa[2,6]^2//.Sol//Simplify)//Factor
\[Delta] = Together[FullSimplify[1/(1-(-a[3])^(-1)a[4](a[5])^(-1)(a[6])^(-1))//.Sol]]//.schoutenA//Simplify
\[CapitalOmega] =  \[CapitalOmega]bare*\[Delta]//Simplify


DefNumSH[7]
IRRes1 = Residue[\[CapitalOmega],{a[11],Spaa[4,5]/Spaa[3,5]}]//.schoutenA;
IRRes2 = Residue[\[CapitalOmega],{a[11],0}];
IRRes3 = Residue[\[CapitalOmega],{a[11],Spaa[4,7]/Spaa[3,7]}]//.schoutenA;
UVRes = Residue[\[CapitalOmega],{a[11],Spaa[1,4]/Spaa[1,3]}]//.schoutenA
IRRes1+IRRes2+IRRes3+UVRes//.NSpinHel



(* ::InheritFromParent:: *)
(**)


(* ::Subsection::Closed:: *)
(*7 pt non planar internal cycle calculation, double loops, 5th ite*)


(* ::Subsubsection:: *)
(*Before residue*)


x1 = \[Delta] a[1]a[3]a[6];
x2 = (\[Delta] a[3]a[5]a[6]+a[4]);

CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], 
RowBox[{"x1", "+", 
RowBox[{"a", "[", "11", "]"}]}], 
RowBox[{"x1", " ", 
RowBox[{"a", "[", "9", "]"}]}], "0", 
RowBox[{"x1", " ", 
RowBox[{"a", "[", "7", "]"}]}]},
{
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], "x2", 
RowBox[{
RowBox[{"x2", " ", 
RowBox[{"a", "[", "9", "]"}]}], "+", 
RowBox[{"a", "[", "10", "]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "8", "]"}], "+", 
RowBox[{"x2", " ", 
RowBox[{"a", "[", "7", "]"}]}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
(*//.a[5]\[Rule]1*)
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], " ", "\[Delta]"}], "0", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], "0"},
{"0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], ")"}]}], "1", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], "0"},
{"0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{"x1", "+", 
RowBox[{"a", "[", "11", "]"}]}], ")"}]}], "0", "1", "0", 
RowBox[{"-", 
RowBox[{"(", "x2", ")"}]}], "0"},
{"0", 
RowBox[{
RowBox[{"-", "x1"}], " ", 
RowBox[{"a", "[", "9", "]"}]}], "0", "0", "1", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"x2", " ", 
RowBox[{"a", "[", "9", "]"}]}], "+", 
RowBox[{"a", "[", "10", "]"}]}], ")"}]}], "0"},
{"0", 
RowBox[{
RowBox[{"-", "x1"}], " ", 
RowBox[{"a", "[", "7", "]"}]}], "0", "0", "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "8", "]"}], "+", 
RowBox[{"x2", " ", 
RowBox[{"a", "[", "7", "]"}]}]}], ")"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6],t\[Lambda][7]};
CC . Transpose[Cperp]//Simplify
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6],\[Eta][7]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[4]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[4]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A9 = TensorExpand[(perpEQ[[5]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A10 =TensorExpand[(perpEQ[[5]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;


\[Delta] = 1/(1-(a[1]a[2]a[6]));
Sol = FullSimplify[Simplify[Solve[{A1==0,A2==0,A3==0,A4==0,A5==0,A6==0,A7==0,A8==0,A9==0,A10==0},{a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10]}]//.schoutenA]]//.schoutenA;
Sol = Sol[[1]]


\[Delta] = (Together[\[Delta]//.Sol]//.schoutenA)//Factor


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A4;
EE[5] = A5;
EE[6] = A6;
EE[7] = A7;
EE[8] = A8;
EE[9] = A9;
EE[10]=A10;


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,10},{j,1,10}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol]//.schoutenA


Product[1/a[i],{i,1,11}]//.Sol//Simplify;
\[CapitalOmega]bare =( Product[1/a[i],{i,1,11}]*J*Spaa[2,6]^2//.Sol//Simplify)//Factor
\[CapitalOmega] =  \[CapitalOmega]bare*\[Delta]//Simplify


DefNumSH[7]
IRRes1 = Residue[\[CapitalOmega],{a[11],Spaa[3,4]/Spaa[3,5]}]//.schoutenA
IRRes2 = Residue[\[CapitalOmega],{a[11],0}]
IRRes3 = Residue[\[CapitalOmega],{a[11],Spaa[4,7]/Spaa[5,7]}]//.schoutenA
IRRes1+IRRes2+IRRes3//.NSpinHel
sing = {Spaa[i_,3]->\[Alpha] Spaa[i,1]+\[Beta] \[Gamma] Spaa[i,2],Spaa[3,i_]->\[Alpha] Spaa[1,i]+\[Beta] \[Gamma] Spaa[2,i]};
gg = \[Gamma]->Spaa[4,3]/Spaa[4,2];
\[Omega] = Residue[\[CapitalOmega]//.sing//.gg,{\[Beta],0}]


(* ::InheritFromParent:: *)
(**)


Sol = {a[1]->Spaa[1,3]/Spaa[2,3],a[2]->-(Spaa[1,2]/Spaa[1,3]),a[3]->(-a[11] Spaa[2,6]+Spaa[4,6])/Spaa[3,6],a[4]->(a[11] Spaa[2,3]+Spaa[3,4])/Spaa[3,6],a[5]->Spaa[1,3]/Spaa[3,6],a[6]->Spaa[3,6]/Spaa[1,6],a[7]->Spaa[6,7]/(a[11] Spaa[2,6]-Spaa[4,6]),a[8]->(a[11] Spaa[2,7]-Spaa[4,7])/(a[11] Spaa[2,6]-Spaa[4,6]),a[9]->-(Spaa[5,6]/(a[11] Spaa[2,6]-Spaa[4,6])),a[10]->(-a[11] Spaa[2,5]+Spaa[4,5])/(-a[11] Spaa[2,6]+Spaa[4,6])}


(* ::Subsection:: *)
(*7 pt non planar internal cycle calculation, double loops, 5th ite, cycle in box*)


(* ::Subsubsection::Closed:: *)
(*Before residue*)


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], "\[Delta]"}]}], 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "10", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "5", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "8", "]"}], "\[Delta]"}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], " ", "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "11", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], "\[Delta]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "9", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "10", "]"}], "\[Delta]"}]}], 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "7", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "8", "]"}], "\[Delta]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);

Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], "\[Delta]"}]}], ")"}]}], "1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], " ", "\[Delta]"}], "0", "0", "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], " ", "\[Delta]"}], "0", "1", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "11", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], "\[Delta]"}]}], ")"}]}], "0", "0", "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{"a", "[", "10", "]"}], "\[Delta]"}], "0", "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "9", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "10", "]"}], "\[Delta]"}]}], ")"}]}], "1", "0", "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], "\[Delta]"}], "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], "0", "1", "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{"a", "[", "8", "]"}], "\[Delta]"}], "0", "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "8", "]"}], "\[Delta]"}]}], ")"}]}], "0", "0", "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6],t\[Lambda][7]};
CC . Transpose[Cperp]//Simplify
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6],\[Eta][7]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][4]]//.RB//.RR//FullSimplify
A7 = TensorExpand[(perpEQ[[4]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A8 = TensorExpand[(perpEQ[[4]]) . \[Lambda][4]]//.RB//.RR//FullSimplify
A9 = TensorExpand[(perpEQ[[5]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A10 =TensorExpand[(perpEQ[[5]]) . \[Lambda][4]]//.RB//.RR//FullSimplify


\[Delta] = 1/(1-(a[3]a[4]a[5]a[6]));
Sol = FullSimplify[Simplify[Solve[{A1==0,A2==0,A3==0,A4==0,A5==0,A6==0,A7==0,A8==0,A9==0,A10==0},{a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10]}]//.schoutenA]]//.schoutenA//Simplify;
Sol = Sol[[1]]


\[Delta] = (Together[\[Delta]//.Sol]//.schoutenA)//Factor


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A4;
EE[5] = A5;
EE[6] = A6;
EE[7] = A7;
EE[8] = A8;
EE[9] = A9;
EE[10]=A10;


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,10},{j,1,10}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol]//.schoutenA


Product[1/a[i],{i,1,11}]//.Sol//Simplify;
\[CapitalOmega]bare =(( Product[1/a[i],{i,1,11}]*J*Spaa[1,4]//.Sol//.schoutenA//FullSimplify)//Factor)
\[CapitalOmega] =  \[CapitalOmega]bare*\[Delta]//FullSimplify


DefNumSH[7]
IRRes1 = Residue[\[CapitalOmega],{a[11],Spaa[2,3]/Spaa[2,4]}]//.schoutenA
IRRes2 = Residue[\[CapitalOmega],{a[11],0}]
IRRes3 = Residue[\[CapitalOmega],{a[11],Spaa[3,6]/Spaa[4,6]}]//.schoutenA
IRRes1+IRRes2+IRRes3//.NSpinHel
sing = {Spaa[i_,3]->\[Alpha] Spaa[i,1]+\[Beta] \[Gamma] Spaa[i,2],Spaa[3,i_]->\[Alpha] Spaa[1,i]+\[Beta] \[Gamma] Spaa[2,i]};
gg = \[Gamma]->Spaa[4,3]/Spaa[4,2];
\[Omega] = Residue[\[CapitalOmega]//.sing//.gg,{\[Beta],0}]


(* ::InheritFromParent:: *)
(**)


Sol = {a[1]->Spaa[1,3]/Spaa[2,3],a[2]->-(Spaa[1,2]/Spaa[1,3]),a[3]->(-a[11] Spaa[2,6]+Spaa[4,6])/Spaa[3,6],a[4]->(a[11] Spaa[2,3]+Spaa[3,4])/Spaa[3,6],a[5]->Spaa[1,3]/Spaa[3,6],a[6]->Spaa[3,6]/Spaa[1,6],a[7]->Spaa[6,7]/(a[11] Spaa[2,6]-Spaa[4,6]),a[8]->(a[11] Spaa[2,7]-Spaa[4,7])/(a[11] Spaa[2,6]-Spaa[4,6]),a[9]->-(Spaa[5,6]/(a[11] Spaa[2,6]-Spaa[4,6])),a[10]->(-a[11] Spaa[2,5]+Spaa[4,5])/(-a[11] Spaa[2,6]+Spaa[4,6])}


(* ::Section::Closed:: *)
(*Disconnected graphs*)


(* ::Subsection::Closed:: *)
(*Residue of Box*)


(* ::Subsubsection::Closed:: *)
(*N=3*)


(*4 pt MHV*)
(*Define C-matrices and lambda*)
CC = {{a[1]a[2]a[3], 1,a[1]a[2],0},{a[2]a[3],0,a[2],1}};
Cperp = {{1,-a[1]a[2]a[3],0,-a[2]a[3]},{0,-a[1]a[2],1,-a[2]}};
lambda = {\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4]};
tlambda = {t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4]};

perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4]};
SEQ = CC . Transpose[eta];
(*Solve for \[Alpha]'s by solving one delta function constraint. Here we get the equations from the eq below*)

CC . Transpose[Cperp];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;


Sol = Solve[{A1==0,A2==0,A3==0,A4==0},{a[1],a[2],a[3],a[4]}]


CEQ[[1]]


(FullSimplify[A4*Spaa[1,2]//.Sol]//.schoutenA)/Spaa[2,4]


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,3},{j,1,3}];
J = Simplify[1/(Det[Mat])]//.Sol


\[CapitalOmega] = 1/(a[1]a[2]a[3])*J*Spaa[1,2]//.Sol
sing = {Spaa[i_,1]->\[Alpha] Spaa[i,3],Spaa[1,i_]->\[Alpha] Spaa[3,i]};
\[CapitalOmega]//.sing


(* ::Subsubsection::Closed:: *)
(*N=8*)


\[CapitalDelta] = a[3] Spbb[1,3];
t\[CapitalDelta] = a[1]Spaa[2,4];
\[CapitalOmega] = 1/(a[1]a[2]a[3])^3*\[CapitalDelta]*t\[CapitalDelta]*J*Spaa[1,2]/Spaa[2,4]^4//.Sol[[1]]
sing = {Spaa[i_,1]->\[Alpha] Spaa[i,3],Spaa[1,i_]->\[Alpha] Spaa[3,i]};
\[CapitalOmega]//.sing


(* ::Subsection::Closed:: *)
(*Pentagon*)


(* ::Subsubsection:: *)
(*Before residue*)


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], " ", "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "5", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], " ", "\[Delta]"}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}], " ", "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "4", "]"}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], " ", "\[Delta]"}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
(*//.a[5]\[Rule]1*)
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], " ", "\[Delta]"}], "1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}], " ", "\[Delta]"}], "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "5", "]"}], " ", "\[Delta]"}], "0", "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "4", "]"}], " ", "\[Delta]"}], "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], " ", "\[Delta]"}], "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], " ", "\[Delta]"}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][4]]//.RB//.RR//FullSimplify

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify


\[Delta] = 1/(1-(a[1]a[2]a[3]a[4]a[5]));
Sol = FullSimplify[Simplify[Solve[{A1==0,A2==0,A5==0,A6==0,A3==0},{a[1],a[2],a[3],a[4],a[5]}]//.schoutenA]]//.schoutenA


\[CapitalDelta] = Together[\[Delta]//.Sol[[1]]]//.schoutenA
Together[1/(1-1/(a[1]a[2]a[3]a[4]a[5]))//.Sol[[1]]]//.schoutenA


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A5;
EE[5] = A6;


FullSimplify[A4*Spaa[1,2]//.Sol]//.schoutenA





F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,5},{j,1,5}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol]//.schoutenA


Product[1/a[i],{i,1,5}]//.Sol//Simplify;
\[CapitalOmega] = Product[1/a[i],{i,1,5}]*J*Spaa[1,4]Spaa[1,2]//.Sol//Simplify


\[CapitalOmega]5 = \[CapitalOmega]*\[CapitalDelta]//Simplify

sing = {Spaa[i_,5]->\[Alpha] Spaa[i,2]+\[Beta] Spaa[i,j],Spaa[5,i_]->\[Alpha] Spaa[2,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]5//.sing
Residue[(\[CapitalOmega]5[[1]][[1]]//.sing),{\[Beta],0}]//.Spaa[2,j]->1


(* ::InheritFromParent:: *)
(**)


(* ::Subsubsection::Closed:: *)
(*N=8 Before residue*)


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{"a", "[", "5", "]"}], "1", 
RowBox[{"a", "[", "3", "]"}], "0"},
{
RowBox[{"a", "[", "1", "]"}], "0", "0", 
RowBox[{"a", "[", "4", "]"}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);

Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "5", "]"}]}], "0", 
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}]},
{"0", "1", 
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], "0", "0"},
{"0", "0", 
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], "1", 
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5]};
SEQ = CC . Transpose[eta];
A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
Sol = FullSimplify[Simplify[Solve[{A1==0,A2==0,A5==0,A4==0,A6==0},{a[1],a[2],a[3],a[4],a[5]}]//.schoutenA]]//.schoutenA
EE[1] = A1;
EE[2] = A2;
EE[3] = A4;
EE[4] = A5;
EE[5] = A6;
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,5},{j,1,5}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol[[1]]]//.schoutenA
J2 = (FullSimplify[A3//.Sol[[1]]]//.schoutenA)/Spaa[2,3]


FullSimplify[Together[Product[1/a[i],{i,1,5}]*J*Spaa[3,5]//.Sol[[1]]]]


\[CapitalDelta]1 = a[1]a[4] \[CapitalDelta]  Spaa[1,4]//.Sol[[1]]//FullSimplify;
\[CapitalDelta]2 = a[2]a[3]a[5] \[CapitalDelta]  Spaa[1,4]//.Sol[[1]]//FullSimplify;
t\[CapitalDelta]1 =Together[FullSimplify[a[1] a[2] \[CapitalDelta] (Spbb[2,5]+a[5]Spbb[3,5])//.Sol[[1]]]]//.SPAB//.Spab[1,P[2]+P[3],5]->-Spab[1,P[1]+P[4]+P[5],5]//.SHtest
t\[CapitalDelta]2 = Together[FullSimplify[a[5] \[CapitalDelta] (Spbb[2,3]+a[3]a[4]Spbb[2,5])//.a[3]a[4]->Spaa[4,5]/Spaa[3,4]]]//.Sol[[1]]//.Spaa[3,4] Spbb[2,3]+Spaa[4,5] Spbb[2,5]->Spaa[4,1] Spbb[1,2]
t\[CapitalDelta]3 = Together[FullSimplify[a[3]a[4] \[CapitalDelta] (Spbb[3,5]+a[1]a[2]Spbb[3,2])]//.Sol[[1]]]//.{Spaa[1,2] Spbb[2,3]-Spaa[1,5] Spbb[3,5]->Spaa[1,4] Spbb[4,3]}
ja = FullSimplify[\[CapitalDelta]1*\[CapitalDelta]2*t\[CapitalDelta]1*t\[CapitalDelta]2*t\[CapitalDelta]3]






\[CapitalOmega] = FullSimplify[Together[Product[1/a[i],{i,1,5}]^3*J*Spaa[1,2]*ja//.Sol[[1]]]]


((Spaa[1,2] Spaa[2,3]) Spbb[1,2] Spbb[1,4] Spbb[3,4])/(\[Alpha]^4 Spaa[1,2]^2 Spaa[1,3] Spaa[2,3]^2 Spaa[2,4]^2 Spaa[3,4])


(* ::Subsubsection::Closed:: *)
(*after residue*)


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "1", "]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], "1", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);

(*//.a[5]\[Rule]1*)
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}], "1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}]}], "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}]}], "0", "1", 
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], "0"},
{
RowBox[{" ", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]}], "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][4]]//.RB//.RR//FullSimplify

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify


Sol = FullSimplify[Simplify[Solve[{A1==0,A2==0,A3==0,A6==0},{a[1],a[2],a[3],a[4]}]//.schoutenA]]//.schoutenA


FullSimplify[A4*Spaa[1,2]//.Sol]//.schoutenA
FullSimplify[A5*Spaa[2,4]//.Sol]//.schoutenA


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A6;


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,4},{j,1,4}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol]//.schoutenA


Product[1/a[i],{i,1,4}]//.Sol//Simplify;
\[CapitalOmega] = Product[1/a[i],{i,1,4}]*J*Spaa[1,2]*Spaa[2,4]//.Sol[[1]]//Simplify
-(1/(\[Alpha] Spaa[1,3] Spaa[2,4]))
sing = {Spaa[i_,5]->\[Alpha] Spaa[i,2],Spaa[i_,5]->\[Alpha] Spaa[i,2]};
\[CapitalOmega]//.sing


(* ::Subsubsection::Closed:: *)
(*N=8*)


\[CapitalDelta] = a[1] Spaa[1,4];
t\[CapitalDelta]1 = a[3](Spbb[2,3]+a[4]Spbb[5,3]);
t\[CapitalDelta]2 = a[4]Spbb[2,5];
\[CapitalOmega] = Together[Product[1/a[i],{i,1,4}]^3*J*\[CapitalDelta]*t\[CapitalDelta]1*t\[CapitalDelta]2*Spaa[1,2]*Spaa[2,4]/Spaa[1,4]^5//.Sol[[1]]]//.SPAB//.Spab[4,P[2]+P[5],3]->Spaa[1,4]Spbb[1,3] 
sing = {Spaa[i_,5]->\[Alpha] Spaa[i,2],Spaa[i_,5]->\[Alpha] Spaa[i,2]};
\[CapitalOmega]1 = \[CapitalOmega]//.sing//.Spbb[1,3]->a[1]Spbb[4,3]//.Sol[[1]]


\[CapitalOmega]2 = (Spbb[1,2] Spbb[1,4] Spbb[3,4])/(\[Alpha]^2 Spaa[1,3] Spaa[1,3] Spaa[3,4] Spaa[4,2]);
\[CapitalOmega]1 = (Spbb[2,5] Spbb[3,4])/(\[Alpha]^2 Spaa[1,2] Spaa[1,3]^2 Spaa[1,4] Spaa[2,4]^2);
\[CapitalOmega]2/\[CapitalOmega]1//Simplify


a[5]//.Sol


(* ::InheritFromParent:: *)
(**)


(* ::Subsection::Closed:: *)
(*Other pentagon*)


(* ::Subsubsection:: *)
(*Before residue*)


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], " ", "\[Delta]"}]},
{
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], " ", "\[Delta]"}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
(*//.a[5]\[Rule]1*)
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], " ", "\[Delta]"}], "0"},
{"0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"a", "[", "4", "]"}], " ", "\[Delta]"}], "0"},
{"0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], " ", "\[Delta]"}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5]};
CC . Transpose[Cperp]//Simplify
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;


\[Delta] = 1/(1-(a[1]a[2]a[3]a[4]a[5]));
Sol = FullSimplify[Simplify[Solve[{A1==0,A2==0,A5==0,A6==0,A3==0},{a[1],a[2],a[3],a[4],a[5]}]//.schoutenA]]//.schoutenA


\[CapitalDelta] = Together[\[Delta]//.Sol[[1]]]//.schoutenA


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A5;
EE[5] = A6;


FullSimplify[Expand[A4*Spaa[2,5]//.Sol]]//.schoutenA





F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,5},{j,1,5}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol]//.schoutenA


Product[1/a[i],{i,1,5}]//.Sol//Simplify;
\[CapitalOmega] = Product[1/a[i],{i,1,5}]*J*Spaa[2,4]Spaa[2,5]//.Sol//Simplify
\[CapitalOmega]5 = \[CapitalOmega]*\[CapitalDelta]//Simplify
Spaa[2,5]/(Spaa[1,2] Spaa[1,3] Spaa[2,5] Spaa[4,5])


\[CapitalOmega]5 = \[CapitalOmega]*\[CapitalDelta]//Simplify

sing = {Spaa[i_,5]->\[Alpha] Spaa[i,2]+\[Beta] Spaa[i,j],Spaa[5,i_]->\[Alpha] Spaa[2,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]5//.sing
Residue[(\[CapitalOmega]5[[1]][[1]]//.sing),{\[Beta],0}]//.Spaa[2,j]->1


(* ::InheritFromParent:: *)
(**)


(* ::Subsubsection::Closed:: *)
(*N=8 Before residue*)


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{"a", "[", "5", "]"}], "1", 
RowBox[{"a", "[", "3", "]"}], "0"},
{
RowBox[{"a", "[", "1", "]"}], "0", "0", 
RowBox[{"a", "[", "4", "]"}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);

Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "5", "]"}]}], "0", 
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}]},
{"0", "1", 
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], "0", "0"},
{"0", "0", 
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], "1", 
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5]};
SEQ = CC . Transpose[eta];
A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
Sol = FullSimplify[Simplify[Solve[{A1==0,A2==0,A5==0,A4==0,A6==0},{a[1],a[2],a[3],a[4],a[5]}]//.schoutenA]]//.schoutenA
EE[1] = A1;
EE[2] = A2;
EE[3] = A4;
EE[4] = A5;
EE[5] = A6;
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,5},{j,1,5}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol[[1]]]//.schoutenA
J2 = (FullSimplify[A3//.Sol[[1]]]//.schoutenA)/Spaa[2,3]


FullSimplify[Together[Product[1/a[i],{i,1,5}]*J*Spaa[3,5]//.Sol[[1]]]]


\[CapitalDelta]1 = a[1]a[4] \[CapitalDelta]  Spaa[1,4]//.Sol[[1]]//FullSimplify;
\[CapitalDelta]2 = a[2]a[3]a[5] \[CapitalDelta]  Spaa[1,4]//.Sol[[1]]//FullSimplify;
t\[CapitalDelta]1 =Together[FullSimplify[a[1] a[2] \[CapitalDelta] (Spbb[2,5]+a[5]Spbb[3,5])//.Sol[[1]]]]//.SPAB//.Spab[1,P[2]+P[3],5]->-Spab[1,P[1]+P[4]+P[5],5]//.SHtest
t\[CapitalDelta]2 = Together[FullSimplify[a[5] \[CapitalDelta] (Spbb[2,3]+a[3]a[4]Spbb[2,5])//.a[3]a[4]->Spaa[4,5]/Spaa[3,4]]]//.Sol[[1]]//.Spaa[3,4] Spbb[2,3]+Spaa[4,5] Spbb[2,5]->Spaa[4,1] Spbb[1,2]
t\[CapitalDelta]3 = Together[FullSimplify[a[3]a[4] \[CapitalDelta] (Spbb[3,5]+a[1]a[2]Spbb[3,2])]//.Sol[[1]]]//.{Spaa[1,2] Spbb[2,3]-Spaa[1,5] Spbb[3,5]->Spaa[1,4] Spbb[4,3]}
ja = FullSimplify[\[CapitalDelta]1*\[CapitalDelta]2*t\[CapitalDelta]1*t\[CapitalDelta]2*t\[CapitalDelta]3]






\[CapitalOmega] = FullSimplify[Together[Product[1/a[i],{i,1,5}]^3*J*Spaa[1,2]*ja//.Sol[[1]]]]


((Spaa[1,2] Spaa[2,3]) Spbb[1,2] Spbb[1,4] Spbb[3,4])/(\[Alpha]^4 Spaa[1,2]^2 Spaa[1,3] Spaa[2,3]^2 Spaa[2,4]^2 Spaa[3,4])


(* ::Subsubsection::Closed:: *)
(*after residue*)


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "1", "]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], "1", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);

(*//.a[5]\[Rule]1*)
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}], "1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}]}], "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}]}], "0", "1", 
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], "0"},
{
RowBox[{" ", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]}], "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][4]]//.RB//.RR//FullSimplify

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify


Sol = FullSimplify[Simplify[Solve[{A1==0,A2==0,A3==0,A6==0},{a[1],a[2],a[3],a[4]}]//.schoutenA]]//.schoutenA


FullSimplify[A4*Spaa[1,2]//.Sol]//.schoutenA
FullSimplify[A5*Spaa[2,4]//.Sol]//.schoutenA


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A6;


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,4},{j,1,4}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol]//.schoutenA


Product[1/a[i],{i,1,4}]//.Sol//Simplify;
\[CapitalOmega] = Product[1/a[i],{i,1,4}]*J*Spaa[1,2]*Spaa[2,4]//.Sol[[1]]//Simplify
-(1/(\[Alpha] Spaa[1,3] Spaa[2,4]))
sing = {Spaa[i_,5]->\[Alpha] Spaa[i,2],Spaa[i_,5]->\[Alpha] Spaa[i,2]};
\[CapitalOmega]//.sing


(* ::Subsubsection::Closed:: *)
(*N=8*)


\[CapitalDelta] = a[1] Spaa[1,4];
t\[CapitalDelta]1 = a[3](Spbb[2,3]+a[4]Spbb[5,3]);
t\[CapitalDelta]2 = a[4]Spbb[2,5];
\[CapitalOmega] = Together[Product[1/a[i],{i,1,4}]^3*J*\[CapitalDelta]*t\[CapitalDelta]1*t\[CapitalDelta]2*Spaa[1,2]*Spaa[2,4]/Spaa[1,4]^5//.Sol[[1]]]//.SPAB//.Spab[4,P[2]+P[5],3]->Spaa[1,4]Spbb[1,3] 
sing = {Spaa[i_,5]->\[Alpha] Spaa[i,2],Spaa[i_,5]->\[Alpha] Spaa[i,2]};
\[CapitalOmega]1 = \[CapitalOmega]//.sing//.Spbb[1,3]->a[1]Spbb[4,3]//.Sol[[1]]


\[CapitalOmega]2 = (Spbb[1,2] Spbb[1,4] Spbb[3,4])/(\[Alpha]^2 Spaa[1,3] Spaa[1,3] Spaa[3,4] Spaa[4,2]);
\[CapitalOmega]1 = (Spbb[2,5] Spbb[3,4])/(\[Alpha]^2 Spaa[1,2] Spaa[1,3]^2 Spaa[1,4] Spaa[2,4]^2);
\[CapitalOmega]2/\[CapitalOmega]1//Simplify


a[5]//.Sol


(* ::InheritFromParent:: *)
(**)


(* ::Subsection::Closed:: *)
(*Hexagon MHV*)


(* ::Subsubsection::Closed:: *)
(*Before residue*)


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], " ", "\[Delta]"}], "0"},
{
RowBox[{
RowBox[{"a", "[", "1", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], " ", "\[Delta]"}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], "\[Delta]"}]},
{"0", "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], " ", "\[Delta]"}], "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], " ", "\[Delta]"}]},
{"0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], "\[Delta]"}], "1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], "\[Delta]"}]},
{"0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"a", "[", "5", "]"}], " ", "\[Delta]"}], "0", "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], " ", "\[Delta]"}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
CC . Transpose[Cperp];
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[4]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[4]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[1]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B7 = TensorExpand[(CEQ[[2]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B8 = TensorExpand[(CEQ[[2]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;

\[Delta] = 1/(1-(a[1]a[2]a[3]a[4]a[5]a[6]));

Print["Solutions of edge-variables"]
Sol = FullSimplify[Simplify[Solve[{A1==0,A2==0,A5==0,A6==0,A3==0,A8==0},{a[1],a[2],a[3],a[4],a[5],a[6]}]//.schoutenA]]//.schoutenA
Print["\[Delta] solution"]
\[CapitalDelta] = Together[\[Delta]//.Sol[[1]]]//.schoutenA

Print["inverse \[Delta] solution"]
\[CapitalDelta] = Together[1/(1-(1/(a[1]a[2]a[3]a[4]a[5]a[6])))//.Sol[[1]]]//.schoutenA

EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A5;
EE[5] = A6;
EE[6] = A8;

(*4,7*)

Print["Leftover \[Delta]-functions"]
FullSimplify[A4*Spaa[1,3]//.Sol]//.schoutenA
FullSimplify[A7*Spaa[4,6]//.Sol]//.schoutenA


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,6},{j,1,6}];
Print["Jacobian from solving \[Delta] functions:"]
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol[[1]]]//.schoutenA

Print["Bare form:"]
\[CapitalOmega] = Product[1/a[i],{i,1,6}]*J*Spaa[3,6]Spaa[1,3]Spaa[4,6]//.Sol[[1]]//Simplify

Print["N=3 Form:"]
\[CapitalOmega]6 = \[CapitalOmega]*\[CapitalDelta]//Simplify

sing = {Spaa[i_,1]->\[Alpha] Spaa[i,4]+\[Beta] Spaa[i,j],Spaa[1,i_]->\[Alpha] Spaa[4,i]+\[Beta] Spaa[j,i]};

Print["Residue of the form:"]
(Residue[(\[CapitalOmega]6//.sing),{\[Beta],0}]//.Spaa[4,j]->1)

(*Remember here the delta function also changes \[Delta](\[LeftAngleBracket]12\[RightAngleBracket])\[Rule]1/\[Alpha]\[Delta](\[LeftAngleBracket]24\[RightAngleBracket]) *)








(* ::InheritFromParent:: *)
(**)


(* ::Subsubsection:: *)
(*after residue*)


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}], "0"},
{
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], "0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
(*//.a[5]\[Rule]1*)
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}]},
{"0", "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}]}], "0", "0", 
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}]},
{"0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}]},
{"0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}], "0", "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
CC . Transpose[Cperp];
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][3]]//.RB//.RR//FullSimplify
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][6]]//.RB//.RR//FullSimplify
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][3]]//.RB//.RR//FullSimplify
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][6]]//.RB//.RR//FullSimplify
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][3]]//.RB//.RR//FullSimplify
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][6]]//.RB//.RR//FullSimplify
A7 = TensorExpand[(perpEQ[[4]]) . \[Lambda][3]]//.RB//.RR//FullSimplify
A8 = TensorExpand[(perpEQ[[4]]) . \[Lambda][6]]//.RB//.RR//FullSimplify

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify
B4 = TensorExpand[(CEQ[[1]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify
B7 = TensorExpand[(CEQ[[2]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify
B8 = TensorExpand[(CEQ[[2]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify


Sol = FullSimplify[Simplify[Solve[{A1==0,A2==0,A3==0,A8==0,A6==0},{a[1],a[2],a[3],a[4],a[5]}]//.schoutenA]]//.schoutenA


FullSimplify[A4*Spaa[1,3]//.Sol]//.schoutenA
FullSimplify[A5*Spaa[1,6]//.Sol]//.schoutenA
FullSimplify[A7*Spaa[1,6]//.Sol]//.schoutenA


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A6;
EE[5] = A8;


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,5},{j,1,5}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol]//.schoutenA


Product[1/a[i],{i,1,5}]//.Sol//Simplify;
\[CapitalOmega] = Product[1/a[i],{i,1,5}]*J*Spaa[1,3]*Spaa[1,6]^2//.Sol[[1]]//Simplify
sing = {Spaa[i_,4]->\[Alpha] Spaa[i,1],Spaa[4,i_]->\[Alpha] Spaa[1,i]};
\[CapitalOmega][[1]]//.sing


(* ::Subsection::Closed:: *)
(*Hexagon*)


(* ::Subsubsection:: *)
(*Before residue*)


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"a", "[", "6", "]"}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], " ", "\[Delta]"}], "0"},
{
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "6", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], " ", "\[Delta]"}], "0"},
{
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "6", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], " ", "\[Delta]"}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "6", "]"}]}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "6", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "6", "]"}], " ", "\[Delta]"}]},
{"0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], " ", "\[Delta]"}]},
{"0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], " ", "\[Delta]"}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
CC . Transpose[Cperp];
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[1]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[2]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[3]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[3]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A9 = TensorExpand[(perpEQ[[3]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;
B7 = TensorExpand[(CEQ[[3]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B8 = TensorExpand[(CEQ[[3]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B9 = TensorExpand[(CEQ[[3]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;


\[Delta] = 1/(1-(a[1]a[2]a[3]a[4]a[5]a[6]))//Together//Simplify


Sol = Together[(Simplify[Solve[{A1==0,A4==0,A7==0,A8==0,A2==0,A6==0},{a[1],a[2],a[3],a[4],a[5],a[6]}]//.schoutenA]//.schoutenA//Simplify)//.schoutenA]//.schoutenA


\[Delta] = 1/(1-(a[1]a[2]a[3]a[4]a[5]a[6]))//.Sol//Together//Simplify
\[Delta]pole = Simplify[\[Delta][[1]]//.Spaa[5,i_]->\[Alpha] Spaa[1,i]//.Spaa[i_,5]->\[Alpha] Spaa[i,1]]//.schoutenA


Simplify[Simplify[Together[A3[[1]]//.Sol[[1]]//FullSimplify]]//.schoutenA]//.schoutenA
Simplify[Simplify[Together[A5[[1]]//.Sol[[1]]//FullSimplify]]//.schoutenA]//.schoutenA
Simplify[Simplify[Together[A9[[1]]//.Sol[[1]]//FullSimplify]]//.schoutenA]//.schoutenA


CEQ[[1]]//.Sol;
CEQ[[2]]//.Sol;
CEQ[[3]]//.Sol;


EE[1] = A1;
EE[2] = A2;
EE[3] = A4;
EE[4] = A6;
EE[5] = A7;
EE[6] = A8;


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,6},{j,1,6}];
FullSimplify[1/(Det[Mat])]


(* ::InheritFromParent:: *)
(**)


J= FullSimplify[(\[Delta])^-5/(a[2]^2 a[4]^2 a[6]^2 Spaa[2,4]^2 Spaa[2,6] (Spaa[2,4]+a[3] a[4] Spaa[2,6]) (a[5] a[6] Spaa[2,4]-Spaa[4,6]) (Spaa[2,6]+a[1] a[2] Spaa[4,6]))//.Sol[[1]]]


Product[1/a[i],{i,1,6}]//Simplify;
\[CapitalOmega] = Product[1/a[i],{i,1,6}]*J//.Sol[[1]]//Simplify;
\[CapitalOmega]6 = \[CapitalOmega]*\[Delta]//Simplify;


sing = {Spaa[i_,5]->\[Alpha] Spaa[i,1]+\[Beta] Spaa[i,j],Spaa[5,i_]->\[Alpha] Spaa[1,i]+\[Beta] Spaa[j,i]};
sing2 = {Spaa[i_,3]->\[Gamma] Spaa[i,1]+\[Beta] Spaa[i,j],Spaa[3,i_]->\[Gamma] Spaa[1,i]+\[Beta] Spaa[j,i]};
\[Omega] = \[CapitalOmega]6//.sing//FullSimplify
\[Omega]2 = Residue[\[Omega][[1]],{\[Beta],0}]//.schoutenA//.Spaa[1,j]->1
Residue[FullSimplify[\[Omega]2//.sing2],{\[Beta],0}]//.schoutenA//.Spaa[1,j]->1


(*sing = {Spbb[i_,1]->\[Alpha] Spab[i,P[1]+P[5]+P[6],2]+\[Beta] Spbb[i,j],Spbb[1,i_]->\[Alpha] Spab[2,P[1]+P[5]+P[6],i]+\[Beta] Spbb[j,i]};*)
sing = {Spab[2,P[1]+P[5]+P[6],i_]->\[Alpha] Spbb[1,i]+\[Beta] Spbb[i,j]};
A = \[Omega]//.sing//FullSimplify
ResA = Residue[(A),{\[Beta],0}]//.Spbb[1,j]->1//FullSimplify




(* ::Subsubsection:: *)
(*Residue calc*)


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "0"},
{
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "0"},
{
RowBox[{"a", "[", "3", "]"}], "0", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}]}], "0", 
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"a", "[", "4", "]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify
A3 = TensorExpand[(perpEQ[[1]]) . \[Lambda][6]]//.RB//.RR//FullSimplify
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A5 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify
A6 = TensorExpand[(perpEQ[[2]]) . \[Lambda][6]]//.RB//.RR//FullSimplify
A7 = TensorExpand[(perpEQ[[3]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A8 = TensorExpand[(perpEQ[[3]]) . \[Lambda][4]]//.RB//.RR//FullSimplify
A9 = TensorExpand[(perpEQ[[3]]) . \[Lambda][6]]//.RB//.RR//FullSimplify

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;
B7 = TensorExpand[(CEQ[[3]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B8 = TensorExpand[(CEQ[[3]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B9 = TensorExpand[(CEQ[[3]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;


Sol = FullSimplify[Together[(Simplify[Solve[{A1==0,A3==0,A9==0,A6==0,B4==0},{a[3],a[2],a[4],a[5],a[1]}]//.schoutenA]//.schoutenA//Simplify)//.schoutenA]//.schoutenA//.SPAB]//.SPAB


a[3] = Spab[1,P[3]+P[5]+P[6],1]/Spab[6,P[3]+P[5]+P[6],1];
a[2] =-((Spaa[1,6] Spbb[1,4])/Spab[1,P[3]+P[5]+P[6],1]);
a[4] = Spaa[5,6]/Spaa[1,6];
a[5] = Spaa[3,6]/Spaa[5,6];
a[1] = Spbb[1,2]/Spbb[1,4];


(*simplifications*)
aa = {Spaa[1,6] Spaa[2,4] Spbb[1,4]->Spab[2,P[3]+P[5]+P[6],1]Spaa[1,6],Spaa[2,4] Spaa[3,6] Spbb[1,2]->Spaa[3,6]Spab[4,P[3]+P[5]+P[6],1],Spaa[2,4] Spaa[5,6] Spbb[1,2]->Spaa[5,6]Spab[4,P[3]+P[5]+P[6],1]};
schoutenS = {Spaa[i_,j_] Spab[l_,P[r_]+P[q_]+P[p_],l_]-Spaa[l_,j_] Spab[i_,P[r_]+P[q_]+P[p_],l_]->-Spaa[l,i]Spab[j,P[r]+P[q]+P[p],l],Spaa[3,6] Spab[1,P[3]+P[5]+P[6],1]+Spaa[1,6] Spab[3,P[3]+P[5]+P[6],1]->Spaa[1,3] Spab[6,P[3]+P[5]+P[6],1],Spaa[4,6] Spab[1,P[3]+P[5]+P[6],1]+Spaa[1,6] Spab[4,P[3]+P[5]+P[6],1]->-Spaa[1,4] Spab[6,P[3]+P[5]+P[6],1]};
(*A7*)

-((Spaa[1,5] Spaa[2,6])/Spaa[1,6])
Together[FullSimplify[Together[A4]]//.aa//.schoutenS]//.schoutenA
Simplify[Together[Simplify[Together[FullSimplify[Together[A5]]//.aa//.schoutenS]//.schoutenA]//.aa]//.{Spaa[1,6] Spaa[3,6] Spab[4,P[3]+P[5]+P[6],1]+Spaa[1,6] Spaa[3,4] Spab[6,P[3]+P[5]+P[6],1]->Spaa[1,6] Spaa[4,6] Spab[3,P[3]+P[5]+P[6],1]}]//.schoutenS
Together[Collect[Together[Simplify[Together[FullSimplify[Together[A8]]//.aa//.schoutenS]//.schoutenA]//.aa],Spaa[5,6]]//.schoutenS]//.schoutenA
(*A2 gives 0*)


(* ::InheritFromParent:: *)
(**)


DefNumSH[6]
TB[1] = B1//.SHtest//.NSpinHel//FullSimplify
TB[2] = B2//.SHtest//.NSpinHel//FullSimplify
TB[3] = B3//.SHtest//.NSpinHel//FullSimplify
TB[4] = B4//.SHtest//.NSpinHel//FullSimplify
TB[5] = B5//.SHtest//.NSpinHel//FullSimplify
TB[6] = B6//.SHtest//.NSpinHel//FullSimplify
TB[7] = B7//.SHtest//.NSpinHel//FullSimplify
TB[8] = B8//.SHtest//.NSpinHel//FullSimplify
TB[9] = B9//.SHtest//.NSpinHel//FullSimplify


ScS = {Spab[6,P[1]+P[3]+P[5],5] Spbb[1,2]+Spab[6,P[1]+P[3]+P[5],1] Spbb[2,5]->Spab[6,P[1]+P[3]+P[5],2] Spbb[1,5],Spab[6,P[1]+P[3]+P[5],3] Spbb[1,4]-Spab[6,P[1]+P[3]+P[5],1] Spbb[3,4]->Spab[6,P[1]+P[3]+P[5],4] Spbb[1,3],Spab[6,P[1]+P[3]+P[5],5] Spbb[1,4]+Spab[6,P[1]+P[3]+P[5],1] Spbb[4,5]->Spab[6,P[1]+P[3]+P[5],4] Spbb[1,5]};
FullSimplify[B2]//.SPAB//.{-Spaa[1,6] Spbb[1,3]+Spaa[5,6] Spbb[3,5]->Spab[6,P[1]+P[5]+P[3],3]};
(*B2\[Rule](Spaa[4,6] Spbb[1,3] Spbb[2,4])/Spab[6,P[3]+P[5]+P[6],1]*)
Together[FullSimplify[B3]//.SPAB//.{-Spaa[1,6] Spbb[1,3]+Spaa[5,6] Spbb[3,5]->Spab[6,P[1]+P[5]+P[3],3],Spab[6,P[1]+P[3],5]->Spab[6,P[1]+P[3]+P[5],5],Spab[6,P[3]+P[5]+P[6],1]->Spab[6,P[3]+P[5]+P[1],1]}]//.ScS//.Spab[6,P[1]+P[3]+P[5],2]->Spaa[6,4]Spbb[4,2];
(*B3\[Rule](Spaa[4,6] Spbb[1,5] Spbb[2,4])/Spab[6,P[1]+P[3]+P[5],1]*)
Together[FullSimplify[B5]//.SPAB//.{-Spaa[1,6] Spbb[1,3]+Spaa[5,6] Spbb[3,5]->Spab[6,P[1]+P[5]+P[3],3],Spab[6,P[1]+P[3],5]->Spab[6,P[1]+P[3]+P[5],5],Spab[6,P[3]+P[5]+P[6],1]->Spab[6,P[3]+P[5]+P[1],1]}]//.ScS//.{Spab[6,P[1]+P[3]+P[5],2]->Spaa[6,4]Spbb[4,2],Spab[6,P[1]+P[3]+P[5],4]->Spaa[6,2]Spbb[2,4]}//.schoutenS;
(*B5\[Rule](Spaa[2,6] Spbb[1,3] Spbb[2,4])/Spab[6,P[1]+P[3]+P[5],1]*)
Together[FullSimplify[B6]//.SPAB//.{-Spaa[1,6] Spbb[1,3]+Spaa[5,6] Spbb[3,5]->Spab[6,P[1]+P[5]+P[3],3],Spab[6,P[1]+P[3],5]->Spab[6,P[1]+P[3]+P[5],5],Spab[6,P[3]+P[5]+P[6],1]->Spab[6,P[3]+P[5]+P[1],1]}]//.ScS//.{Spab[6,P[1]+P[3]+P[5],2]->Spaa[6,4]Spbb[4,2],Spab[6,P[1]+P[3]+P[5],4]->Spaa[6,2]Spbb[2,4]}//.schoutenS;
(*B6\[Rule](Spaa[2,6] Spbb[1,3] Spbb[2,4])/Spab[6,P[1]+P[3]+P[5],1]*)




EE[1] = A1;
EE[2] = A3;
EE[3] = A9;
EE[4] = A6;
EE[5] = B4;
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,5},{j,1,5}];
Simplify[1/(Det[Mat])]//.schoutenA//.schoutenB//FullSimplify


(* ::InheritFromParent:: *)
(**)


J=1/(a[2]^3 a[3]^4 a[4]^2 Spaa[2,6]^2 (a[1] Spaa[2,6]+Spaa[4,6])^2 (a[5] Spbb[1,3]+Spbb[1,5]))//FullSimplify;


Product[1/a[i],{i,1,5}]*J//.SPAB


Spab[6,P[3]+P[5]+P[6],1]^5/(Spaa[1,6] Spaa[2,6]^2 Spaa[3,6] Spaa[5,6] Spab[1,P[3]+P[5]+P[6],1] Spab[6,P[3]+P[5]+P[6],1]^3 Spbb[1,2] Spbb[1,4])/Spab[6,P[3]+P[5]+P[6],1]^2*Spaa[2,6]^2*Spaa[4,6]


Spaa[4,6]/(Spaa[1,6] Spaa[3,6] Spaa[5,6]Spaa[1,6]Spbb[1,6] Spbb[1,2] Spbb[1,4])






(* ::Subsection::Closed:: *)
(*Hexagon from paper*)


(* ::Subsubsection:: *)
(*Before residue*)


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], " ", "\[Delta]"}], "0"},
{
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], " ", "\[Delta]"}], "0"},
{
RowBox[{
RowBox[{"a", "[", "6", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "6", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "6", "]"}], " ", "\[Delta]"}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "6", "]"}]}], " ", "\[Delta]"}]},
{"0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "6", "]"}], " ", "\[Delta]"}]},
{"0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], " ", "\[Delta]"}], "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "6", "]"}], " ", "\[Delta]"}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
CC . Transpose[Cperp];
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[1]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[2]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[3]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[3]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A9 = TensorExpand[(perpEQ[[3]]) . \[Lambda][6]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;
B7 = TensorExpand[(CEQ[[3]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B8 = TensorExpand[(CEQ[[3]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B9 = TensorExpand[(CEQ[[3]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;


\[Delta] = 1/(1-(a[1]a[2]a[3]a[4]a[5]a[6]))//Together//Simplify


Sol = Together[(Simplify[Solve[{A1==0,A4==0,A7==0,A8==0,A2==0,A6==0},{a[1],a[2],a[3],a[4],a[5],a[6]}]//.schoutenA]//.schoutenA//Simplify)//.schoutenA]//.schoutenA


\[Delta] = 1/(1-(a[1]a[2]a[3]a[4]a[5]a[6]))//.Sol[[1]]//Together//Simplify


Simplify[Simplify[Together[A3[[1]]//.Sol[[1]]//FullSimplify]]//.schoutenA]//.schoutenA
Simplify[Simplify[Together[A5[[1]]//.Sol[[1]]//FullSimplify]]//.schoutenA]//.schoutenA
Simplify[Simplify[Together[A9[[1]]//.Sol[[1]]//FullSimplify]]//.schoutenA]//.schoutenA


CEQ[[1]]//.Sol;
CEQ[[2]]//.Sol;
CEQ[[3]]//.Sol;


EE[1] = A1;
EE[2] = A2;
EE[3] = A4;
EE[4] = A6;
EE[5] = A7;
EE[6] = A8;


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,6},{j,1,6}];
J = FullSimplify[1/(Det[Mat])]//.Sol//FullSimplify


J= FullSimplify[(\[Delta])^-5/(a[2]^2 a[4]^2 a[6]^2 Spaa[2,4]^2 Spaa[2,6] (Spaa[2,4]+a[3] a[4] Spaa[2,6]) (a[5] a[6] Spaa[2,4]-Spaa[4,6]) (Spaa[2,6]+a[1] a[2] Spaa[4,6]))//.Sol[[1]]]


Product[1/a[i],{i,1,6}]//Simplify;
\[CapitalOmega] = Product[1/a[i],{i,1,6}]*J//.Sol[[1]]//Simplify
\[CapitalOmega]6 = \[CapitalOmega]*\[Delta]//Simplify;


sing = {Spaa[i_,5]->\[Alpha] Spaa[i,1]+\[Beta] Spaa[i,j],Spaa[5,i_]->\[Alpha] Spaa[1,i]+\[Beta] Spaa[j,i]};
sing2 = {Spaa[i_,3]->\[Gamma] Spaa[i,1]+\[Beta] Spaa[i,j],Spaa[3,i_]->\[Gamma] Spaa[1,i]+\[Beta] Spaa[j,i]};
\[Omega] = \[CapitalOmega]6//.sing//FullSimplify
\[Omega]2 = Residue[\[Omega][[1]],{\[Beta],0}]//.schoutenA//.Spaa[1,j]->1
Residue[FullSimplify[\[Omega]2//.sing2],{\[Beta],0}]//.schoutenA//.Spaa[1,j]->1


(* ::Subsubsection:: *)
(*Residue calc*)


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "0"},
{
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "0"},
{
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "2", "]"}]}], "0", 
RowBox[{"a", "[", "3", "]"}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"a", "[", "2", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"a", "[", "4", "]"}]}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "1", 
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify
A3 = TensorExpand[(perpEQ[[1]]) . \[Lambda][6]]//.RB//.RR//FullSimplify
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A5 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify
A6 = TensorExpand[(perpEQ[[2]]) . \[Lambda][6]]//.RB//.RR//FullSimplify
A7 = TensorExpand[(perpEQ[[3]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A8 = TensorExpand[(perpEQ[[3]]) . \[Lambda][4]]//.RB//.RR//FullSimplify
A9 = TensorExpand[(perpEQ[[3]]) . \[Lambda][6]]//.RB//.RR//FullSimplify

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;
B7 = TensorExpand[(CEQ[[3]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B8 = TensorExpand[(CEQ[[3]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B9 = TensorExpand[(CEQ[[3]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify;


Sol = FullSimplify[Together[(Simplify[Solve[{A1==0,A3==0,A9==0,A6==0,B4==0},{a[3],a[2],a[4],a[5],a[1]}]//.schoutenA]//.schoutenA//Simplify)//.schoutenA]//.schoutenA//.SPAB]//.SPAB


Sol = {{a[3]->-((Spaa[5,6] (Spaa[2,6] Spab[1,P[1]+P[2]+P[4],1]))/(Spaa[1,6] Spaa[2,6] Spab[6,P[3]+P[5]+P[6],1])),a[2]->Spaa[3,6]/Spaa[5,6],a[4]->(Spaa[1,6]Spaa[2,6] Spbb[1,2])/(Spaa[2,6] Spab[1,P[1]+P[2]+P[4],1]),a[5]->Spbb[1,4]/Spbb[1,2],a[1]->Spaa[1,6]/Spaa[3,6]}}//Simplify


DefNumSH[6]
TB[1] = A1//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[2] = A2//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[3] = A3//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[4] = A6//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[5] = A9//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[6] = B1//.Sol//.SHtest//.NSpinHel//FullSimplify
TB[7] = B4//.Sol//.SHtest//.NSpinHel//FullSimplify


ScS = {Spab[6,P[1]+P[3]+P[5],5] Spbb[1,2]+Spab[6,P[1]+P[3]+P[5],1] Spbb[2,5]->Spab[6,P[1]+P[3]+P[5],2] Spbb[1,5],Spab[6,P[1]+P[3]+P[5],3] Spbb[1,4]-Spab[6,P[1]+P[3]+P[5],1] Spbb[3,4]->Spab[6,P[1]+P[3]+P[5],4] Spbb[1,3],Spab[6,P[1]+P[3]+P[5],5] Spbb[1,4]+Spab[6,P[1]+P[3]+P[5],1] Spbb[4,5]->Spab[6,P[1]+P[3]+P[5],4] Spbb[1,5]};
FullSimplify[B2]//.SPAB//.{-Spaa[1,6] Spbb[1,3]+Spaa[5,6] Spbb[3,5]->Spab[6,P[1]+P[5]+P[3],3]};
(*B2\[Rule](Spaa[4,6] Spbb[1,3] Spbb[2,4])/Spab[6,P[3]+P[5]+P[6],1]*)
Together[FullSimplify[B3]//.SPAB//.{-Spaa[1,6] Spbb[1,3]+Spaa[5,6] Spbb[3,5]->Spab[6,P[1]+P[5]+P[3],3],Spab[6,P[1]+P[3],5]->Spab[6,P[1]+P[3]+P[5],5],Spab[6,P[3]+P[5]+P[6],1]->Spab[6,P[3]+P[5]+P[1],1]}]//.ScS//.Spab[6,P[1]+P[3]+P[5],2]->Spaa[6,4]Spbb[4,2];
(*B3\[Rule](Spaa[4,6] Spbb[1,5] Spbb[2,4])/Spab[6,P[1]+P[3]+P[5],1]*)
Together[FullSimplify[B5]//.SPAB//.{-Spaa[1,6] Spbb[1,3]+Spaa[5,6] Spbb[3,5]->Spab[6,P[1]+P[5]+P[3],3],Spab[6,P[1]+P[3],5]->Spab[6,P[1]+P[3]+P[5],5],Spab[6,P[3]+P[5]+P[6],1]->Spab[6,P[3]+P[5]+P[1],1]}]//.ScS//.{Spab[6,P[1]+P[3]+P[5],2]->Spaa[6,4]Spbb[4,2],Spab[6,P[1]+P[3]+P[5],4]->Spaa[6,2]Spbb[2,4]}//.schoutenS;
(*B5\[Rule](Spaa[2,6] Spbb[1,3] Spbb[2,4])/Spab[6,P[1]+P[3]+P[5],1]*)
Together[FullSimplify[B6]//.SPAB//.{-Spaa[1,6] Spbb[1,3]+Spaa[5,6] Spbb[3,5]->Spab[6,P[1]+P[5]+P[3],3],Spab[6,P[1]+P[3],5]->Spab[6,P[1]+P[3]+P[5],5],Spab[6,P[3]+P[5]+P[6],1]->Spab[6,P[3]+P[5]+P[1],1]}]//.ScS//.{Spab[6,P[1]+P[3]+P[5],2]->Spaa[6,4]Spbb[4,2],Spab[6,P[1]+P[3]+P[5],4]->Spaa[6,2]Spbb[2,4]}//.schoutenS;
(*B6\[Rule](Spaa[2,6] Spbb[1,3] Spbb[2,4])/Spab[6,P[1]+P[3]+P[5],1]*)




EE[1] = A1;
EE[2] = A3;
EE[3] = A9;
EE[4] = A6;
EE[5] = B4;
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,5},{j,1,5}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.schoutenA//.schoutenB//.Sol[[1]]]//.SPAB//. Spab[6,P[2]+P[4],1]->Spab[6,P[3]+P[5]+P[6],1]//.Spab[6,P[3]+P[5],1] ->Spab[6,P[3]+P[5]+P[6],1] 


(* ::InheritFromParent:: *)
(**)


Product[1/a[i],{i,1,5}]*J/Spab[6,P[3]+P[5]+P[6],1]//.Sol[[1]]


(* ::Subsection::Closed:: *)
(*Hexagon no internal loop (just to check \[Alpha]'s. They are correct.)*)


(* ::Subsubsection:: *)
(*Before residue*)


(*\[Delta] = 1/(1-a[7] a[8])*)
CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{"a", "[", "6", "]"}], "0", "0", "0", 
RowBox[{"a", "[", "5", "]"}]},
{"0", 
RowBox[{"a", "[", "1", "]"}], "1", 
RowBox[{"a", "[", "2", "]"}], "0", "0"},
{"0", "0", "0", 
RowBox[{"a", "[", "3", "]"}], "1", 
RowBox[{"a", "[", "4", "]"}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{"-", 
RowBox[{"a", "[", "6", "]"}]}], "1", 
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], "0", "0", "0"},
{"0", "0", 
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], "1", 
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], "0"},
{
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], "0", "0", "0", 
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
CC . Transpose[Cperp];
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[1]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[2]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[2]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[3]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[3]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A9 = TensorExpand[(perpEQ[[3]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;
B7 = TensorExpand[(CEQ[[3]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B8 = TensorExpand[(CEQ[[3]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B9 = TensorExpand[(CEQ[[3]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;


Sol = Simplify[Solve[{A1==0,A4==0,A7==0,A8==0,A2==0,A5==0},{a[1],a[2],a[3],a[4],a[5],a[6]}]//.schoutenA]//.schoutenA//Simplify


\[Delta] = 1/(1-(a[1]a[2]a[3]a[4]a[5]a[6]))//.Sol//Together//Simplify
\[Delta] = 1/(1-(a[1]a[2]a[3]a[4]a[5]a[6]))//.Sol//Simplify


A = Spaa[1,6] Spaa[2,3] Spaa[4,5]-Spaa[1,2] Spaa[3,4] Spaa[5,6]
sing = {Spaa[3,i_]->\[Alpha] Spbb[1,i]+\[Beta] Spbb[i,j],Spaa[i_,3]->\[Alpha] Spbb[i,1]+\[Beta] Spbb[j,i]};
B = A//.sing//FullSimplify
ResA = Residue[(B),{\[Beta],0}]//.Spbb[1,j]->1//FullSimplify
B//.\[Beta]->0//Simplify


DefNumSH[6]
TA[1] = Simplify[A1//.Sol//.SHtest//.NSpinHel]
TA[2] = A2//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[3] = A3//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[4] = A4//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[5] = A5//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[6] = A6//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[7] = A7//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[8] = A8//.Sol//.SHtest//.NSpinHel//FullSimplify
TA[9] = A9//.Sol//.SHtest//.NSpinHel//FullSimplify


A3//.Sol//FullSimplify


CEQ[[1]]//.Sol
CEQ[[2]]//.Sol
CEQ[[3]]//.Sol


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A4;
EE[5] = A5;
EE[6] = A6;
EE[7] = A7;
EE[8] = A8;


1/(a[1]a[2]a[3]a[4]a[5]a[6])//.Sol



F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,8},{j,1,8}];
Simplify[1/(Det[Mat])]


Product[1/a[i],{i,1,6}]//Simplify;
\[CapitalOmega] = Product[1/a[i],{i,1,6}]*J//Simplify
\[CapitalOmega]6 = \[CapitalOmega]*\[Delta]1//Simplify
sht = s[i_,j_,k_]->Spaa[i,j]Spbb[j,i]+Spaa[i,k]Spbb[k,i]+Spaa[j,k]Spbb[k,j];
\[Omega] = \[CapitalOmega]6;


(*sing = {Spbb[i_,1]->\[Alpha] Spab[i,P[1]+P[5]+P[6],2]+\[Beta] Spbb[i,j],Spbb[1,i_]->\[Alpha] Spab[2,P[1]+P[5]+P[6],i]+\[Beta] Spbb[j,i]};*)
sing = {Spab[2,P[1]+P[5]+P[6],i_]->\[Alpha] Spbb[1,i]+\[Beta] Spbb[i,j]};
A = \[Omega]//.sing//FullSimplify
ResA = Residue[(A),{\[Beta],0}]//.Spbb[1,j]->1//FullSimplify




(* ::Subsection::Closed:: *)
(*Heptagon MHV*)


(* ::Subsubsection:: *)
(*Before residue*)


aa = a[4]a[5]a[6]a[7]a[1]\[Delta];
bb = a[1]a[2]a[3]a[4] \[Delta];
CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], "\[Delta]"}], "0", "bb", 
RowBox[{"bb", " ", 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{"bb", " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}]},
{"0", "aa", 
RowBox[{"aa", " ", 
RowBox[{"a", "[", "2", "]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], "\[Delta]"}], "1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "1", "]"}], "\[Delta]"}], "0", "0", "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], "\[Delta]"}], "0", "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "1", "]"}], "\[Delta]"}], "0", "0", "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], " ", "\[Delta]"}], "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], "\[Delta]"}], "1", "0", "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], " ", "\[Delta]"}], "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"a", "[", "5", "]"}], "\[Delta]"}], "0", "1", "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], " ", 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], " ", "\[Delta]"}], "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], "0", "0", "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6],t\[Lambda][7]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6],\[Eta][7]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[4]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[4]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;
A9 = TensorExpand[(perpEQ[[5]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A10 = TensorExpand[(perpEQ[[5]]) . \[Lambda][4]]//.RB//.RR//FullSimplify;


\[Delta] = 1/(1-(a[1]a[2]a[3]a[4]a[5]a[6]a[7]));
Sol = FullSimplify[Simplify[Solve[{A4==0,A3==0,A5==0,A7==0,A8==0,A10==0,A2==0},{a[1],a[2],a[3],a[4],a[5],a[6],a[7]}]//.schoutenA]]//.schoutenA


\[CapitalDelta] = Together[\[Delta]//.Sol[[1]]]//.schoutenA


EE[1] = A10;
EE[2] = A2;
EE[3] = A3;
EE[4] = A4;
EE[5] = A5;
EE[6] = A7;
EE[7] = A8;


FullSimplify[A1*Spaa[3,4]//.Sol]//.schoutenA
FullSimplify[A6*Spaa[1,6]//.Sol]//.schoutenA
FullSimplify[A9*Spaa[4,6]//.Sol]//.schoutenA


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,7},{j,1,7}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol[[1]]]//.schoutenA


\[CapitalOmega] = Product[1/a[i],{i,1,7}]*J*Spaa[3,4]*Spaa[1,6]Spaa[4,6]*Spaa[1,4]//.Sol[[1]]//Simplify
\[CapitalDelta] = Together[\[Delta]//.Sol[[1]]]//.schoutenA//.{Spaa[1,6]->Spaa[1,5]Spaa[3,6]/Spaa[3,5]}


(* ::InheritFromParent:: *)
(*(Spaa[1,6] Spaa[3,4])/(Spaa[1,4] Spaa[3,6])//.{Spaa[1,6]->Spaa[1,5]Spaa[3,6]/Spaa[3,5]}//.{Spaa[3,4]->Spaa[2,4]Spaa[1,3]/Spaa[1,2]}*)


(\[CapitalOmega]7 = \[CapitalOmega]*\[CapitalDelta]//Simplify)//.{Spaa[1,6]->Spaa[1,5]Spaa[3,6]/Spaa[3,5]}//.{Spaa[3,4]->Spaa[2,4]Spaa[1,3]/Spaa[1,2]}


-(Spaa[1,4]/(Spaa[1,3] Spaa[1,5] Spaa[2,4] Spaa[4,7]))*(Spaa[1,3] Spaa[1,5] Spaa[2,4])/(Spaa[1,2] Spaa[1,4] Spaa[3,5])


sing = {Spaa[i_,2]->\[Alpha] Spaa[i,5]+\[Beta] Spaa[i,j],Spaa[2,i_]->\[Alpha] Spaa[5,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]7//.sing
(*Coeffecient from changing the remaining delta functions*)
(Residue[(\[CapitalOmega]7//.sing),{\[Beta],0}]//.Spaa[5,j]->1)



(* ::InheritFromParent:: *)
(**)


(* ::Subsubsection::Closed:: *)
(*after residue*)


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], "0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}]}], "1", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}]}], "0", "0", "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "0", "1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "0", "0", "0"},
{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], "0", "0", "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}]}], "0", "0", "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}]}], "0", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}]}], "1", "0", "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], "0", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], "0", "1", "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}]}], "0", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}], "0", "0", "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7],\[Lambda][8]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6],t\[Lambda][7],t\[Lambda][8]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6],\[Eta][7],\[Eta][8]};
SEQ = CC . Transpose[eta];
A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[4]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[4]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A9 = TensorExpand[(perpEQ[[5]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A10 = TensorExpand[(perpEQ[[5]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A11 = TensorExpand[(perpEQ[[6]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A12 = TensorExpand[(perpEQ[[6]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;


Sol = FullSimplify[Simplify[Solve[{A1==0,A3==0,A6==0,A7==0,A8==0,A9==0,A12==0},{a[1],a[2],a[3],a[4],a[5],a[6],a[7]}]//.schoutenA]]//.schoutenA


FullSimplify[A2*Spaa[1,6]//.Sol]//.schoutenA
FullSimplify[A4*Spaa[1,6]//.Sol]//.schoutenA
FullSimplify[A5*Spaa[5,6]//.Sol]//.schoutenA
FullSimplify[A10*Spaa[1,6]//.Sol]//.schoutenA
FullSimplify[A11*Spaa[5,6]//.Sol]//.schoutenA


EE[1] = A1;
EE[2] = A12;
EE[3] = A3;
EE[4] = A6;
EE[5] = A7;
EE[6] = A8;
EE[7] = A9;

F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,7},{j,1,7}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol[[1]]]//.schoutenA


\[CapitalOmega] = Product[1/a[i],{i,1,7}]*J*Spaa[1,6]^3*Spaa[5,6]^2//.Sol[[1]]//Simplify
\[CapitalOmega]6Res = \[CapitalOmega]//.Spaa[i_,2]->\[Alpha] Spaa[i,6]


-((Spaa[1,6] Spaa[5,6])/(\[Alpha] Spaa[1,3] Spaa[1,7] Spaa[4,5] Spaa[5,8]))


(* ::Subsection::Closed:: *)
(*Heptagon MHV 1,3*)


(* ::Subsubsection::Closed:: *)
(*Before residue*)


\!\(\*
TagBox[
RowBox[{"CC", " ", "=", " ", 
RowBox[{"(", GridBox[{
{"1", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "1", "]"}]}], "0", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}]},
{"0", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}]}], "1", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "3", "]"}]}], 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}]}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], "\[Delta]"}], "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "3", "]"}], "\[Delta]"}], "0", "0", "0", "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], "\[Delta]"}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], "\[Delta]"}], "1", "0", "0", "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], "\[Delta]"}], "0", "1", "0", "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "3", "]"}], "\[Delta]"}], "0", "0", "1", "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], " ", 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], " ", "\[Delta]"}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "3", "]"}], "\[Delta]"}], "0", "0", "0", "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6],t\[Lambda][7]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6],\[Eta][7]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[4]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[4]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A9 = TensorExpand[(perpEQ[[5]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A10 = TensorExpand[(perpEQ[[5]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;


\[Delta] = 1/(1-(a[1]a[2]a[3]a[4]a[5]a[6]a[7]));
Sol = FullSimplify[Simplify[Solve[{A1==0,A2==0,A3==0,A4==0,A5==0,A7==0,A9==0},{a[1],a[2],a[3],a[4],a[5],a[6],a[7]}]//.schoutenA]]//.schoutenA


\[CapitalDelta] = Together[\[Delta]//.Sol[[1]]]//.schoutenA


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A4;
EE[5] = A5;
EE[6] = A7;
EE[7] = A9;


FullSimplify[A6*Spaa[1,4]//.Sol]//.schoutenA
FullSimplify[A8*Spaa[1,4]//.Sol]//.schoutenA
FullSimplify[A10*Spaa[1,4]//.Sol]//.schoutenA


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,7},{j,1,7}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol[[1]]]//.schoutenA


\[CapitalOmega] = Product[1/a[i],{i,1,7}]*J*Spaa[1,4]^3*Spaa[1,3]//.Sol[[1]]//Simplify


\[CapitalOmega] =Spaa[1,3]/(Spaa[1,2] Spaa[1,6]  Spaa[2,3] Spaa[3,4])
\[CapitalDelta] = (Spaa[1,6] Spaa[2,3])/(Spaa[1,3] Spaa[2,6])


\[CapitalOmega]7 = \[CapitalOmega]*\[CapitalDelta]//Simplify


(* ::InheritFromParent:: *)
(*1/(Spaa[1,2] Spaa[2,4] Spaa[3,4])*)


(* ::InheritFromParent:: *)
(**)


(* ::Subsubsection::Closed:: *)
(*after residue*)


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], "0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}]}], "1", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}]}], "0", "0", "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "0", "1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "0", "0", "0"},
{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], "0", "0", "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}]}], "0", "0", "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}]}], "0", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}]}], "1", "0", "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], "0", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], "0", "1", "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}]}], "0", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}], "0", "0", "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7],\[Lambda][8]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6],t\[Lambda][7],t\[Lambda][8]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6],\[Eta][7],\[Eta][8]};
SEQ = CC . Transpose[eta];
A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[4]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[4]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A9 = TensorExpand[(perpEQ[[5]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A10 = TensorExpand[(perpEQ[[5]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A11 = TensorExpand[(perpEQ[[6]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A12 = TensorExpand[(perpEQ[[6]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;


Sol = FullSimplify[Simplify[Solve[{A1==0,A3==0,A6==0,A7==0,A8==0,A9==0,A12==0},{a[1],a[2],a[3],a[4],a[5],a[6],a[7]}]//.schoutenA]]//.schoutenA


FullSimplify[A2*Spaa[1,6]//.Sol]//.schoutenA
FullSimplify[A4*Spaa[1,6]//.Sol]//.schoutenA
FullSimplify[A5*Spaa[5,6]//.Sol]//.schoutenA
FullSimplify[A10*Spaa[1,6]//.Sol]//.schoutenA
FullSimplify[A11*Spaa[5,6]//.Sol]//.schoutenA


EE[1] = A1;
EE[2] = A12;
EE[3] = A3;
EE[4] = A6;
EE[5] = A7;
EE[6] = A8;
EE[7] = A9;

F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,7},{j,1,7}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol[[1]]]//.schoutenA


\[CapitalOmega] = Product[1/a[i],{i,1,7}]*J*Spaa[1,6]^3*Spaa[5,6]^2//.Sol[[1]]//Simplify
\[CapitalOmega]6Res = \[CapitalOmega]//.Spaa[i_,2]->\[Alpha] Spaa[i,6]


-((Spaa[1,6] Spaa[5,6])/(\[Alpha] Spaa[1,3] Spaa[1,7] Spaa[4,5] Spaa[5,8]))


(* ::Subsection::Closed:: *)
(*Octagon MHV*)


(* ::Subsubsection:: *)
(*Before residue*)


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}], "\[Delta]"}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}], "\[Delta]"}], "1", 
RowBox[{
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}], "\[Delta]"}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], "\[Delta]"}], "1", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}], "\[Delta]"}], "0", "0", "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], "\[Delta]"}], "0", "1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}], "\[Delta]"}], "0", "0", "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], "\[Delta]"}], "0", "0", "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}], "\[Delta]"}], "0", "0", "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], "\[Delta]"}], "0", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "6", "]"}]}], "\[Delta]"}], "1", "0", "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], "0", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "6", "]"}]}], 
RowBox[{"a", "[", "7", "]"}], "\[Delta]"}], "0", "1", "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}], "\[Delta]"}], "0", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "6", "]"}]}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}], "\[Delta]"}], "0", "0", "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7],\[Lambda][8]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6],t\[Lambda][7],t\[Lambda][8]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6],\[Eta][7],\[Eta][8]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[4]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[4]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A9 = TensorExpand[(perpEQ[[5]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A10 = TensorExpand[(perpEQ[[5]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A11 = TensorExpand[(perpEQ[[6]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A12 = TensorExpand[(perpEQ[[6]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;


\[Delta] = 1/(1-(a[1]a[2]a[3]a[4]a[5]a[6]a[7]a[8]));
Sol = FullSimplify[Simplify[Solve[{A1==0,A2==0,A3==0,A6==0,A7==0,A8==0,A9==0,A12==0},{a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8]}]//.schoutenA]]//.schoutenA


\[CapitalDelta] = Together[\[Delta]//.Sol[[1]]]//.schoutenA
Together[1/(1-1/(a[1]a[2]a[3]a[4]a[5]a[6]a[7]a[8]))//.Sol[[1]]]//.schoutenA


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A6;
EE[5] = A7;
EE[6] = A8;
EE[7] = A9;
EE[8] = A12;


FullSimplify[A4*Spaa[1,2]//.Sol]//.schoutenA
FullSimplify[A5*Spaa[2,5]//.Sol]//.schoutenA
FullSimplify[A10*Spaa[1,6]//.Sol]//.schoutenA
FullSimplify[A11*Spaa[5,6]//.Sol]//.schoutenA


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,8},{j,1,8}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol[[1]]]//.schoutenA


\[CapitalOmega] = Product[1/a[i],{i,1,8}]*J*Spaa[1,5]*Spaa[1,6]*Spaa[1,2]*Spaa[2,5]Spaa[5,6]//.Sol[[1]]//Simplify


\[CapitalOmega]8 = \[CapitalOmega]*\[CapitalDelta]//Simplify

sing = {Spaa[i_,2]->\[Alpha] Spaa[i,6]+\[Beta] Spaa[i,j],Spaa[2,i_]->\[Alpha] Spaa[6,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]8//.sing
(*Coeffecient from changing the remaining delta functions*)
coeff = 1/Coefficient[Spaa[2,3]Spaa[2,4]Spaa[6,7]Spaa[6,8]//.sing//.\[Beta]->0,Spaa[3,6] Spaa[4,6] Spaa[6,7] Spaa[6,8]];
(Residue[(\[CapitalOmega]8//.sing),{\[Beta],0}]//.Spaa[6,j]->1)*coeff



(* ::InheritFromParent:: *)
(**)


(* ::Subsubsection:: *)
(*after residue*)


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], "0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}]}], "1", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}]}], "0", "0", "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "0", "1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}]}], "0", "0", "0"},
{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], "0", "0", "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}]}], "0", "0", "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}]}], "0", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}]}], "1", "0", "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], "0", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}]}], "0", "1", "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}]}], "0", "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}], "0", "0", "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6],\[Lambda][7],\[Lambda][8]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6],t\[Lambda][7],t\[Lambda][8]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6],\[Eta][7],\[Eta][8]};
SEQ = CC . Transpose[eta];
A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[4]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[4]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A9 = TensorExpand[(perpEQ[[5]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A10 = TensorExpand[(perpEQ[[5]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A11 = TensorExpand[(perpEQ[[6]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A12 = TensorExpand[(perpEQ[[6]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;


Sol = FullSimplify[Simplify[Solve[{A1==0,A3==0,A6==0,A7==0,A8==0,A9==0,A12==0},{a[1],a[2],a[3],a[4],a[5],a[6],a[7]}]//.schoutenA]]//.schoutenA


FullSimplify[A2*Spaa[1,6]//.Sol]//.schoutenA
FullSimplify[A4*Spaa[1,6]//.Sol]//.schoutenA
FullSimplify[A5*Spaa[5,6]//.Sol]//.schoutenA
FullSimplify[A10*Spaa[1,6]//.Sol]//.schoutenA
FullSimplify[A11*Spaa[5,6]//.Sol]//.schoutenA


EE[1] = A1;
EE[2] = A12;
EE[3] = A3;
EE[4] = A6;
EE[5] = A7;
EE[6] = A8;
EE[7] = A9;

F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,7},{j,1,7}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol[[1]]]//.schoutenA


\[CapitalOmega] = Product[1/a[i],{i,1,7}]*J*Spaa[1,6]^3*Spaa[5,6]^2//.Sol[[1]]//Simplify
\[CapitalOmega]6Res = \[CapitalOmega]//.Spaa[i_,2]->\[Alpha] Spaa[i,6]


-((Spaa[1,6] Spaa[5,6])/(\[Alpha] Spaa[1,3] Spaa[1,7] Spaa[4,5] Spaa[5,8]))


(* ::Section::Closed:: *)
(*Gravity calculations*)


(* ::Subsection::Closed:: *)
(*5 pt MHV calculation,  one internal loop*)


\[Delta] = 1/(1-a[1] a[2]a[6]);
CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], "\[Delta]", " "}], "0"},
{
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "5", "]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "5", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "4", "]"}], "+", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "5", "]"}]}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}], "0", "0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "2", "]"}]}], "1", "0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}]}], "0", "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], "-", 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}]}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify;
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify;
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;


Sol = Solve[{A1==0,A2==0,A3==0,A4==0,A5==0,A6==0},{a[1],a[2],a[3],a[4],a[5],a[6]}]//.schoutenA//.schoutenB


\[Delta] = Together[\[Delta]//.Sol[[1]]]//.schoutenA


\[CapitalDelta][1]=a[2]a[3]a[4]\[Delta] Spaa[5,2]//.Sol//FullSimplify;
\[CapitalDelta][2]=a[2]a[5]a[6]\[Delta] Spaa[2,5]//.Sol//FullSimplify;
\[CapitalDelta][3]=a[1]a[5]\[Delta] Spaa[2,5]//.Sol//FullSimplify;
t\[CapitalDelta][1]=Simplify[FullSimplify[a[4]a[5]\[Delta]( Spbb[4,1]+a[1]a[2]Spbb[4,3])]//.Sol]//.SPAB//.{Spab[2,P[1]+P[3],4]->-Spab[2,P[2]+P[4]+P[5],4]}//.SHtest;
t\[CapitalDelta][2]=Simplify[FullSimplify[\[Delta](a[1]a[2](Spbb[1,3]+a[3]Spbb[1,4]))]//.Sol]//.SPAB//.{Spab[5,P[3]+P[4],1]->-Spab[5,P[2]+P[1]+P[5],1]}//.SHtest;
t\[CapitalDelta][3]=Simplify[FullSimplify[\[Delta](a[3]Spbb[3,4]+a[6]Spbb[3,1])]//.Sol]//.{Spaa[1,5] Spbb[1,3]-Spaa[4,5] Spbb[3,4]->-Spab[5,P[1]+P[4],3]}//.{Spab[5,P[1]+P[4],3]->-Spab[5,P[2]+P[3]+P[5],3]}//.SHtest;
t\[CapitalDelta][4]=Simplify[FullSimplify[a[3]a[6]\[Delta]( Spbb[4,1]+a[1]a[2]Spbb[4,3])]//.Sol]//.SPAB//.{Spab[2,P[1]+P[3],4]->-Spab[2,P[2]+P[4]+P[5],4]}//.SHtest;

Product[\[CapitalDelta][i],{i,1,3}]*FullSimplify[Product[t\[CapitalDelta][i],{i,1,4}]]//Simplify


(*\[Delta]a = 1/(1-a[3] a[4]);*)
EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A4;
EE[5] = A5;
EE[6] = A6;


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,6},{j,1,6}];
J = (FullSimplify[Simplify[1/(Det[Mat])]//.Sol[[1]]]//.schoutenA//Simplify)


\[CapitalOmega] = Product[1/a[i]^3,{i,1,6}]*J*Product[\[CapitalDelta][i],{i,1,3}]*Product[t\[CapitalDelta][i],{i,1,4}]*1/Spaa[2,5]^3*\[Delta]^(-4)//.Sol//Simplify


a1 = Spaa[2,3]/Spaa[1,3];
a2 = Spaa[1,2]/Spaa[1,3];
a3 = Spaa[4,5]/Spaa[3,5];
a4 = Spaa[3,5]/Spaa[3,4];
a5 = Spaa[1,3]/Spaa[3,5];
a6 = Spaa[3,5]/Spaa[1,5];
\[Delta]1 = 1/(1-a3 a4 a5 a6)


a1 a6 \[Delta]1 Spaa[4,1] Spbb[1,2]/Spaa[3,4]*a5 a6 \[Delta]1 Spaa[4,1] Spbb[4,5]/Spaa[1,3]*a3 a4 \[Delta]1 Spaa[4,1] Spbb[4,5]/Spaa[1,3]


Solve[fr==(1-v)/(1+v) fs,v]


\[CapitalDelta][1]=a[2]a[3]a[4]Spaa[5,2]//.Sol//FullSimplify;
\[CapitalDelta][2]=a[2]a[5]a[6]Spaa[2,5]//.Sol//FullSimplify;
\[CapitalDelta][3]=a[1]a[5]Spaa[2,5]//.Sol//FullSimplify;
t\[CapitalDelta][1]=Simplify[FullSimplify[a[4]a[5]( Spbb[4,1]+a[1]a[2]Spbb[4,3])]//.Sol]//.SPAB//.{Spab[2,P[1]+P[3],4]->-Spab[2,P[2]+P[4]+P[5],4]}//.SHtest;
t\[CapitalDelta][2]=Simplify[FullSimplify[(a[1]a[2](Spbb[1,3]+a[3]Spbb[1,4]))]//.Sol]//.SPAB//.{Spab[5,P[3]+P[4],1]->-Spab[5,P[2]+P[1]+P[5],1]}//.SHtest;
t\[CapitalDelta][3]=Simplify[FullSimplify[(a[3]Spbb[3,4]+a[6]Spbb[3,1])]//.Sol]//.{Spaa[1,5] Spbb[1,3]-Spaa[4,5] Spbb[3,4]->-Spab[5,P[1]+P[4],3]}//.{Spab[5,P[1]+P[4],3]->-Spab[5,P[2]+P[3]+P[5],3]}//.SHtest;
t\[CapitalDelta][4]=Simplify[FullSimplify[a[3]a[6]( Spbb[4,1]+a[1]a[2]Spbb[4,3])]//.Sol]//.SPAB//.{Spab[2,P[1]+P[3],4]->-Spab[2,P[2]+P[4]+P[5],4]}//.SHtest;

Product[\[CapitalDelta][i],{i,1,3}]*FullSimplify[Product[t\[CapitalDelta][i],{i,1,4}]]//.{Spaa[1,2] Spbb[1,4]-Spaa[2,3] Spbb[3,4]->Spaa[2,5] Spbb[5,4],Spaa[3,5] Spbb[1,3]+Spaa[4,5] Spbb[1,4]->Spaa[5,2] Spbb[2,1],Spaa[1,5] Spbb[1,3]-Spaa[4,5] Spbb[3,4]->Spaa[5,2] Spbb[2,3]}


Product[1/a[i]^3,{i,1,6}]*J*1/Spaa[2,5]^2*(Spaa[1,3]^4 Spaa[1,5]^2 Spaa[2,3]^2 Spaa[2,5]^7 Spaa[3,4]^2 Spaa[4,5]^2 Spbb[1,2] Spbb[2,3] Spbb[4,5]^2)/(Spaa[1,2]^5 Spaa[3,5]^11)*\[Delta]^(3)//.Sol//FullSimplify


(* ::Subsection::Closed:: *)
(*5 pt residue calc  *)


\[CapitalOmega]5 = Spbb[1,2]Spbb[2,3]Spbb[4,5]^2/(Spaa[1,2]Spaa[2,3]Spaa[3,4]Spaa[4,5]Spaa[5,1]Spaa[1,3]);
sing = {Spaa[i_,3]->\[Alpha] Spaa[i,1]+\[Beta] Spaa[i,j],Spaa[3,i_]->\[Alpha] Spaa[1,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]5//.sing;
(\[CapitalOmega]5//.sing)
Residue[(\[CapitalOmega]5//.sing),{\[Beta],0}]//.Spaa[1,j]->1


CC={{a[1]+a[2]a[3]a[4],1,a[1]a[5]+a[2]a[3]a[4]a[5],a[3]a[4],0},{a[2]a[3],0,a[2]a[3]a[5],a[3],1}};
Cperp ={{1,-(a[1]+a[2]a[3]a[4]),0,0,-a[2]a[3]},{0,-(a[1]a[5]+a[2]a[3]a[4]a[5]),1,0,-a[2]a[3]a[5]},{0,-a[4]a[3],0,1,-a[3]}};
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5]};
CC . Transpose[Cperp];
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda]


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][5]]//.RB//.RR//FullSimplify
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][5]]//.RB//.RR//FullSimplify
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][5]]//.RB//.RR//FullSimplify


1/(Spaa[2,4] Spaa[2,5]) ( (t\[Lambda][1]+a[5] t\[Lambda][3])(Spaa[1,4] Spaa[2,5]-Spaa[1,2] Spaa[4,5])+Spaa[2,4] (Spaa[2,5] t\[Lambda][2]+Spaa[4,5] t\[Lambda][4]))//.schoutenA//Simplify


Collect[perpEQ[[2]]//.Sol[[1]]//Simplify,\[Lambda][2]]
((a[5](-Spaa[1,4] Spaa[2,5]+Spaa[1,2] Spaa[4,5])) \[Lambda][2]+Spaa[2,4] Spaa[2,5] \[Lambda][3]+a[5] Spaa[1,2] Spaa[2,4] \[Lambda][5]//.schoutenA)/(Spaa[2,4]*Spaa[2,5])//Simplify
 \[Lambda][3]+a[5] \[Lambda][1]


Sol = Solve[{A1==0,A2==0,A5==0,A6==0},{a[1],a[2],a[3],a[4]}]//.schoutenA


\[CapitalDelta][1]=a[1]a[2]a[3]Spaa[2,5]//.Sol//FullSimplify
\[CapitalDelta][2]=a[4] Spaa[2,5]//.Sol//FullSimplify
t\[CapitalDelta][1]=Simplify[FullSimplify[a[5] Spbb[1,3]]//.Sol]//.SPAB//.{Spab[2,P[1]+P[3],4]->-Spab[2,P[2]+P[4]+P[5],4]}//.SHtest
t\[CapitalDelta][2]=Simplify[FullSimplify[(a[2](Spbb[1,4]+a[5]Spbb[3,4]))]//.Sol]//.SPAB//.{Spab[2,P[1]+P[3],4]->-Spab[2,P[2]+P[4]+P[5],4]}//.SHtest
t\[CapitalDelta][3]=Simplify[FullSimplify[a[3]a[1]a[4](Spbb[1,4]+a[5]Spbb[3,4])]//.Sol]//.{Spaa[1,5] Spbb[1,3]-Spaa[4,5] Spbb[3,4]->-Spab[5,P[1]+P[4],3]}//.{Spab[5,P[1]+P[4],3]->-Spab[5,P[2]+P[3]+P[5],3]}//.SHtest
A = Simplify[Product[\[CapitalDelta][i],{i,1,2}]*FullSimplify[Product[t\[CapitalDelta][i],{i,1,3}]]]


B=A//.Spbb[1,4]+a[5] Spbb[3,4]->Spaa[2,5]Spbb[4,5]/Spaa[1,2]
B2=A//.Spbb[1,4]+a[5] Spbb[3,4]->Spaa[2,5]Spbb[2,5]/Spaa[1,5]
A


EE[1]=A1;
EE[2]=A2;
EE[3]=A5;
EE[4]=A6;
F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,4},{j,1,4}];
J = (Simplify[1/(Det[Mat])]//.Sol//FullSimplify)[[1]]


\[CapitalOmega] = Product[1/a[i]^3,{i,1,5}]*J*B2/Spaa[2,5]^3/.Sol[[1]]
\[CapitalOmega] = Product[1/a[i]^3,{i,1,5}]*J*B/Spaa[2,5]^3//.Sol[[1]]
Residue[(\[CapitalOmega]5//.sing),{\[Beta],0}]//.Spaa[1,j]->1


\[CapitalOmega]*Spaa[1,2]Spbb[1,2]Spbb[2,3]/(Spbb[1,3]Spaa[1,5])//.SHtest


MM = ((Collect[((perpEQ[[2]]//.Sol[[1]])*Spaa[2,4] Spaa[2,5]//Simplify),\[Lambda][2]]//.{-a[5] Spaa[1,4] Spaa[2,5]+a[5] Spaa[1,2] Spaa[4,5]->-a[5] Spaa[1,5] Spaa[2,4]})/Spaa[2,4]//Simplify)//.simSchotenA
(Spaa[2,5] \[Lambda][3]+a[5] (-Spaa[2,5] \[Lambda][1]))/Spaa[2,5]//Simplify


CEQ[[2]]Spaa[2,5]//.Sol[[1]]//FullSimplify
(Collect[FullSimplify[CEQ[[1]]Spaa[2,5]*Spaa[2,4]//.Sol[[1]]],(t\[Lambda][1]+a[5] t\[Lambda][3])]//.schoutenA)/Spaa[2,4]//Simplify


(* ::InheritFromParent:: *)
(**)


A = -s[1,6]Spab[2,P[2]+P[4]+P[5],5]+s[3,4]Spab[2,P[2]+P[6]+P[5],5]
B = s[2,5]Spab[2,P[3]+P[2]+P[5],5]
DefNumSH[6]
AA = Simplify[A//.SHtest//.NSpinHel]
BB = Simplify[B//.SHtest//.NSpinHel]
AA/BB//FullSimplify//N


BB/5


(* ::Section::Closed:: *)
(*Higher order poles*)


(* ::Subsection::Closed:: *)
(*Residue of Box*)


(*4 pt MHV*)
Nn = 3;
\[CapitalOmega]bare = Spaa[2,4]^(4-Nn)/(Spaa[1,2]Spaa[2,3]Spaa[3,4]Spaa[4,1]);
J = ((Spaa[1,2]Spaa[3,4])/(Spaa[2,4]Spaa[1,3]))^(4-Nn);
\[CapitalOmega] = \[CapitalOmega]bare*J;
sing ={Spaa[i_,1]->\[Alpha] Spaa[i,3]+\[Beta] \[Gamma] Spaa[i,j],Spaa[1,i_]->\[Alpha] Spaa[3,i]+\[Beta] \[Gamma] Spaa[j,i]};
\[Omega] = \[CapitalOmega]//.sing//.\[Gamma]->Spaa[1,2]/Spaa[j,2]//.Spaa[i_,j]->Spaa[i,4]
Together[Residue[(\[CapitalOmega]//.sing//.\[Gamma]->Spaa[1,2]/Spaa[j,2]),{\[Beta],0}]//FullSimplify]//.Spaa[i_,j]->Spaa[i,4]//.schoutenA
Together[Residue[(J//.sing//.\[Gamma]->Spaa[1,2]/Spaa[j,2]),{\[Beta],0}]//FullSimplify]//.Spaa[i_,j]->Spaa[i,4]//.schoutenA


(*4 pt MHV*)
Nn = 0;
\[CapitalOmega]bare = Spaa[2,4]^(4-Nn)/(Spaa[1,2]Spaa[2,3]Spaa[3,4]Spaa[4,1]);
J = ((Spaa[2,4]Spaa[1,3])/(Spaa[1,2]Spaa[3,4]));
\[CapitalOmega] = \[CapitalOmega]bare*J^(Nn-4)
sing ={Spaa[i_,1]->\[Alpha] Spaa[i,3]+\[Alpha] \[Beta] Spaa[2,3]/Spaa[2,4] Spaa[i,4],Spaa[1,i_]->\[Alpha] Spaa[3,i]+\[Alpha] \[Beta] Spaa[2,3]/Spaa[2,4] Spaa[4,i]};
\[Omega] = \[CapitalOmega]//.sing
Together[Residue[\[CapitalOmega]//.sing//.sing2,{\[Beta],0}]//FullSimplify]//.schoutenA
Together[Residue[J^(-1)//.sing//.sing2,{\[Beta],0}]//FullSimplify]//.schoutenA


Together[Limit[Spaa[2,4]/(Spaa[2,1]Spaa[3,4])//.sing//.sing2,\[Beta]->0]//FullSimplify]//.schoutenA


Limit[(\[CapitalOmega]//.sing//.sing2),\[Beta]->0]


(* ::Subsection::Closed:: *)
(*Residue of Pentagon*)


(*5 pt MHV*)
Nn = 1;
\[CapitalOmega]bare = Spaa[1,4]^(4-Nn)/(Spaa[1,3]Spaa[2,4]Spaa[4,5]Spaa[5,1]);
J = ((Spaa[1,5]Spaa[2,4])/(Spaa[1,4]Spaa[2,5]))^(4-Nn);
\[CapitalOmega] = \[CapitalOmega]bare*J//FullSimplify;
sing = {Spaa[i_,5]->\[Alpha] Spaa[i,2]+\[Beta] \[Gamma] Spaa[i,j],Spaa[5,i_]->\[Alpha] Spaa[2,i]+\[Beta] \[Gamma] Spaa[j,i]};
(\[CapitalOmega]//.sing//.\[Gamma]->Spaa[4,5]/Spaa[4,j])//.Spaa[i_,j]->Spaa[i,1]//Simplify//.schoutenA//Factor;
resA = Residue[(\[CapitalOmega]//.sing//.\[Gamma]->Spaa[4,5]/Spaa[4,j]),{\[Beta],0}]//.Spaa[i_,j]->Spaa[i,1]//Simplify//.schoutenA


(* ::Subsection::Closed:: *)
(*Residue of Hexagon*)


(*6 pt MHV*)
Nn = 1;
\[CapitalOmega]bare = Spaa[3,6]^(4-Nn)/(Spaa[1,6] Spaa[2,3] Spaa[3,4] Spaa[5,6]);
J = ((Spaa[1,6] Spaa[3,4])/(Spaa[1,4] Spaa[3,6]))^(4-Nn);
\[CapitalOmega] = \[CapitalOmega]bare*J
sing = {Spaa[i_,1]->\[Alpha] Spaa[i,4]+\[Beta] \[Gamma] Spaa[i,j],Spaa[1,i_]->\[Alpha] Spaa[4,i]+\[Beta] \[Gamma] Spaa[j,i]};

resA = Residue[(\[CapitalOmega]//.sing//.\[Gamma]->Spaa[1,6]/Spaa[j,6])//.j->3,{\[Beta],0}]//FullSimplify


(* ::Subsection::Closed:: *)
(*Residue of Heptagon1,3*)


(*7 pt MHV*)
Nn =0;
\[CapitalOmega]bare =Spaa[1,3]^(4-Nn)/(Spaa[1,2] Spaa[1,6]  Spaa[2,3] Spaa[3,4]) ;
J = ((Spaa[1,6] Spaa[2,3])/(Spaa[1,3] Spaa[2,6]))^(4-Nn);
\[CapitalOmega] = \[CapitalOmega]bare*J
sing = {Spaa[i_,2]->\[Alpha] Spaa[i,6]+\[Beta] \[Gamma] Spaa[i,1],Spaa[2,i_]->\[Alpha] Spaa[6,i]+\[Beta] \[Gamma] Spaa[1,i]};
gg = \[Gamma]->Spaa[2,3]/Spaa[1,3];

resA = Residue[(\[CapitalOmega]//.sing//.gg),{\[Beta],0}]//FullSimplify


(* ::Subsection::Closed:: *)
(*Residue of Heptagon1,4*)


(*7 pt MHV*)
Nn =0;
\[CapitalOmega]bare =Spaa[1,4]^(4-Nn)/(Spaa[1,3] Spaa[1,5] Spaa[2,4] Spaa[4,7]);
J = ((Spaa[1,3] Spaa[1,5] Spaa[2,4])/(Spaa[1,2] Spaa[1,4] Spaa[3,5]))^(4-Nn);
\[CapitalOmega] = \[CapitalOmega]bare*J
sing = {Spaa[i_,3]->\[Alpha] Spaa[i,5]+\[Beta] \[Gamma] Spaa[i,2],Spaa[3,i_]->\[Alpha] Spaa[5,i]+\[Beta] \[Gamma] Spaa[2,i]};
gg = \[Gamma]->Spaa[1,3]/Spaa[1,2];

resA = Residue[(\[CapitalOmega]//.sing//.gg),{\[Beta],0}]//FullSimplify


(* ::Subsection::Closed:: *)
(*Residue of Octagon*)


(*5 pt MHV*)
Nn = 1;
\[CapitalOmega]bare = -(Spaa[1,5]^(4-Nn)/(Spaa[1,3] Spaa[1,7] Spaa[4,5] Spaa[5,8]));
J = ((Spaa[1,6] Spaa[2,5])/(Spaa[1,5] Spaa[2,6]))^(4-Nn)
J2 = ((Spaa[1,2] Spaa[5,6])/(Spaa[1,5] Spaa[2,6]))^(4-Nn)
\[CapitalOmega] = \[CapitalOmega]bare*J
\[CapitalOmega]2 = \[CapitalOmega]bare*J2;
sing = {Spaa[i_,6]->\[Alpha] Spaa[i,2]+\[Beta] Spaa[i,j],Spaa[6,i_]->\[Alpha] Spaa[2,i]+\[Beta] Spaa[j,i]};
resA = (Residue[(\[CapitalOmega]//.sing),{\[Beta],0}]//.Spaa[i_,j]->1//Simplify)1/\[Alpha]^2
resB = (Residue[(\[CapitalOmega]2//.sing),{\[Beta],0}]//.Spaa[i_,j]->1//Simplify)1/\[Alpha]^2


resA = (Residue[(\[CapitalOmega]//.sing),{\[Beta],0}]//.Spaa[i_,j]->1//Simplify)1/\[Alpha]^2


-((3 Spaa[1,2] Spaa[2,5]^3)/(\[Alpha] Spaa[1,3] Spaa[1,7] Spaa[4,5] Spaa[5,8]))//.Spaa[4,5]->Spaa[1,4]/Spaa[1,2]Spaa[2,5]


Spaa[1,2]^2/(\[Alpha] Spaa[1,3] Spaa[1,7] Spaa[1,4] Spaa[5,8])


(* ::Section::Closed:: *)
(*Numerical checks of poles*)


(* ::Subsection:: *)
(*Residue of Box*)


(*We define momentumconserving spinors*)
\[Lambda][1]={1,2};\[Lambda][2]={1,-5};\[Lambda][3]={1,-1};\[Lambda][4]={1,-2};
t\[Lambda][1]={1,3};t\[Lambda][4]={-1,-3};t\[Lambda][3]={-1,-3};t\[Lambda][2]={1,3};
MA = Sum[Outer[Times,t\[Lambda][i],\[Lambda][i]],{i,1,4}];
(*We then shift the lambda*)
\[Lambda][3]=\[Alpha] \[Lambda][1]+\[Alpha] \[Beta] (ab[1,4])/(ab[2,4])\[Lambda][2]//FullSimplify;
(*Below is the bare form and the Jacobian*)
\[CapitalOmega]4 = (ab[2,4])^(4-Nn)/(ab[1,2]ab[2,3]ab[3,4]ab[4,1])//FullSimplify;
J = ((ab[2,4]ab[1,3])/(ab[1,2]ab[3,4]))//FullSimplify
(*We take the residue of the Jacobian and then define the form and take the residue of it*)
Residue[J^(-4),{\[Beta],0}];
\[CapitalOmega] = \[CapitalOmega]4*J^(Nn-4)//FullSimplify;
\[Omega] = Residue[\[CapitalOmega],{\[Beta],0}];
(*The tree form is defined below*)
\[CapitalOmega]tree = (ab[2,4]^(3-Nn))/(ab[2,3]ab[4,1])*(ab[2,4]/(ab[1,2]ab[3,4]))//.\[Beta]->0//FullSimplify;
(*We compare the two expressions for diffrent N*)
(\[Omega]//.Nn->0)==(\[CapitalOmega]tree//.Nn->0)
(\[Omega]//.Nn->1)==(\[CapitalOmega]tree//.Nn->1)
(\[Omega]//.Nn->2)==(\[CapitalOmega]tree//.Nn->2)
(\[Omega]//.Nn->3)==(\[CapitalOmega]tree//.Nn->3)


(* ::Subsection:: *)
(*Residue of pentagon*)


\[Lambda][1]={124/5,89/5};\[Lambda][2]={-4,-3};\[Lambda][3]=3 \[Lambda][2];\[Lambda][4]={4,1};\[Lambda][5]={-(24/5),-(4/5)};
t\[Lambda][1]={1,-3};t\[Lambda][5]={1,2};t\[Lambda][3]={2,-7};t\[Lambda][4]={1,4};t\[Lambda][2]={0,4};
MA = Sum[Outer[Times,t\[Lambda][i],\[Lambda][i]],{i,1,5}]
\[Lambda][5]=\[Alpha] \[Lambda][2]+\[Alpha] \[Beta] (ab[1,2])/(ab[4,1])\[Lambda][4]//FullSimplify;
\[CapitalOmega]5 = (ab[1,4])^(4-Nn)/(ab[1,2]ab[3,4]ab[4,5]ab[5,1])//FullSimplify;
J = ((ab[1,4]ab[2,5])/(ab[5,1]ab[2,4]))//FullSimplify
Residue[J^(-2),{\[Beta],0}]
\[CapitalOmega] = \[CapitalOmega]5*J^(Nn-4)//FullSimplify;
Residue[\[CapitalOmega]//.Nn->1,{\[Beta],0}]
(ab[1,4]^(3-Nn))/(ab[1,3]ab[2,4])*(ab[1,4]/(ab[1,5]ab[2,4]))//.Nn->1//.\[Beta]->0//FullSimplify


(* ::Subsection:: *)
(*Residue of Hexagon*)


(*Solving*)
\[Lambda][1]={124/5,1/5};\[Lambda][2]=3\[Lambda][1];\[Lambda][3]=3 {2,b};\[Lambda][4]={4,1};\[Lambda][5]=2 \[Lambda][4];\[Lambda][6]={a,1};
t\[Lambda][1]={1,-3};t\[Lambda][2]={1,2};t\[Lambda][3]={2,-7};t\[Lambda][4]={1,4};t\[Lambda][6]={0,4};t\[Lambda][5]={d,e};
MA = Sum[Outer[Times,t\[Lambda][i],\[Lambda][i]],{i,1,6}];
Solve[MA == {{0,0},{0,0}},{a,b,d,e}]


(*We define momentumconserving spinors*)
\[Lambda][1]={124/5,1/5};\[Lambda][2]=3\[Lambda][1];\[Lambda][3]=3 {2,9/2};\[Lambda][4]={4,1};\[Lambda][5]=2 \[Lambda][4];\[Lambda][6]={-98,1};
t\[Lambda][1]={1,-3};t\[Lambda][2]={1,2};t\[Lambda][3]={2,-7};t\[Lambda][4]={1,4};t\[Lambda][6]={0,4};t\[Lambda][5]={-(72/5),859/20};
MA = Sum[Outer[Times,t\[Lambda][i],\[Lambda][i]],{i,1,6}]
(*We then shift the lambda*)
\[Lambda][1]=\[Alpha] \[Lambda][4]+\[Alpha] \[Beta] (ab[4,6])/(ab[3,6])\[Lambda][3]//FullSimplify;
(*Below is the bare form and the Jacobian*)
\[CapitalOmega]4 = (ab[3,6])^(4-Nn)/(ab[2,3]ab[3,4]ab[5,6]ab[6,1])//FullSimplify;
J = ((ab[3,6]ab[1,4])/(ab[1,6]ab[3,4]))//FullSimplify;
Residue[J^(-4),{\[Beta],0}];
\[CapitalOmega] = \[CapitalOmega]4*J^(Nn-4)//FullSimplify;
\[Omega] = Residue[\[CapitalOmega],{\[Beta],0}];


\[CapitalOmega]tree = (ab[3,6]^(3-Nn))/(ab[2,3]ab[5,6])*(ab[3,6]/(ab[6,1]ab[3,4]))//.\[Beta]->0//FullSimplify;
(*We compare the two expressions for different N*)
(\[Omega]//.Nn->0)==(\[CapitalOmega]tree//.Nn->0)
(\[Omega]//.Nn->1)==(\[CapitalOmega]tree//.Nn->1)
(\[Omega]//.Nn->2)==(\[CapitalOmega]tree//.Nn->2)
(\[Omega]//.Nn->3)==(\[CapitalOmega]tree//.Nn->3)





(* ::Section::Closed:: *)
(*Non-planar*)


(* ::Subsection::Closed:: *)
(*Five point*)


(* ::Subsubsection::Closed:: *)
(*Before residue*)


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"\[Delta]", "[", "1", "]"}], 
RowBox[{"\[Delta]", "[", "2", "]"}]}], "1", "p", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"\[Delta]", "[", "1", "]"}], 
RowBox[{"\[Delta]", "[", "2", "]"}]}], "0"},
{
RowBox[{
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"\[Delta]", "[", "1", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"\[Delta]", "[", "1", "]"}], 
RowBox[{"\[Delta]", "[", "2", "]"}]}]}], "0", 
RowBox[{
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "8", "]"}], "p"}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}], 
RowBox[{"\[Delta]", "[", "1", "]"}], " ", "p"}]}], 
RowBox[{
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"(", 
RowBox[{
RowBox[{"\[Delta]", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}], 
RowBox[{"\[Delta]", "[", "2", "]"}]}], ")"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}], 
RowBox[{"\[Delta]", "[", "1", "]"}], 
RowBox[{"\[Delta]", "[", "2", "]"}]}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], " ", 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"\[Delta]", "[", "1", "]"}], 
RowBox[{"\[Delta]", "[", "2", "]"}]}], "0", "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"\[Delta]", "[", "1", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"\[Delta]", "[", "1", "]"}], 
RowBox[{"\[Delta]", "[", "2", "]"}]}]}], ")"}]}]},
{"0", 
RowBox[{"-", "p"}], "1", "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "8", "]"}], "p"}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}], 
RowBox[{"\[Delta]", "[", "1", "]"}], " ", "p"}]}], ")"}]}]},
{"0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"\[Delta]", "[", "1", "]"}], 
RowBox[{"\[Delta]", "[", "2", "]"}]}], "0", "1", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"(", 
RowBox[{
RowBox[{"\[Delta]", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}], 
RowBox[{"\[Delta]", "[", "2", "]"}]}], ")"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"a", "[", "8", "]"}], 
RowBox[{"\[Delta]", "[", "1", "]"}], 
RowBox[{"\[Delta]", "[", "2", "]"}]}]}], ")"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][4]]//.RB//.RR//FullSimplify
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][4]]//.RB//.RR//FullSimplify
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][1]]//.RB//.RR//FullSimplify
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][4]]//.RB//.RR//FullSimplify

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][5]]//.RB//.RR//FullSimplify


\[Delta] = 1/(1-(a[1]a[2]a[3]a[4]a[5]));
Sol = FullSimplify[Simplify[Solve[{A1==0,A2==0,A5==0,A6==0,A3==0},{a[1],a[2],a[3],a[4],a[5]}]//.schoutenA]]//.schoutenA


\[CapitalDelta] = Together[\[Delta]//.Sol[[1]]]//.schoutenA
Together[1/(1-1/(a[1]a[2]a[3]a[4]a[5]))//.Sol[[1]]]//.schoutenA


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A5;
EE[5] = A6;


FullSimplify[A4*Spaa[1,2]//.Sol]//.schoutenA





F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,5},{j,1,5}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol]//.schoutenA


Product[1/a[i],{i,1,5}]//.Sol//Simplify;
\[CapitalOmega] = Product[1/a[i],{i,1,5}]*J*Spaa[1,4]Spaa[1,2]//.Sol//Simplify


\[CapitalOmega]5 = \[CapitalOmega]*\[CapitalDelta]//Simplify

sing = {Spaa[i_,5]->\[Alpha] Spaa[i,2]+\[Beta] Spaa[i,j],Spaa[5,i_]->\[Alpha] Spaa[2,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]5//.sing
Residue[(\[CapitalOmega]5[[1]][[1]]//.sing),{\[Beta],0}]//.Spaa[2,j]->1


\[CapitalOmega] = Spaa[3,4]^4/(a[5](a[5]Spaa[2,4]-Spaa[3,4])Spaa[1,2]Spaa[2,3]Spaa[1,4])*((a[5] Spaa[2,4]-Spaa[3,4])/Spaa[3,4])^(4)
Residue[\[CapitalOmega],{a[5],0}]


(* ::Subsection::Closed:: *)
(*Five point from paper*)


(* ::Subsubsection:: *)
(*Before residue*)


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], "\[Delta]"}], "1", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], "\[Delta]"}], 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"(", 
RowBox[{"1", "+", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}]}]}], ")"}], "\[Delta]"}], "0"},
{
RowBox[{
RowBox[{"a", "[", "5", "]"}], "\[Delta]"}], "0", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "5", "]"}], "\[Delta]"}], 
RowBox[{"\[Delta]", " ", 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "6", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}]}], ")"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], " ", 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], "\[Delta]"}], "0", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], "\[Delta]"}]},
{"0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], "\[Delta]"}], "1", "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "5", "]"}], "\[Delta]"}]},
{"0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "3", "]"}], 
RowBox[{"(", 
RowBox[{"1", "+", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}]}]}], ")"}], "\[Delta]"}], "0", "1", 
RowBox[{
RowBox[{"-", "\[Delta]"}], " ", 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "6", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], 
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "3", "]"}]}]}], ")"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][5]]//.RB//.RR//FullSimplify
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][5]]//.RB//.RR//FullSimplify
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][5]]//.RB//.RR//FullSimplify

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][1]]//.RB//.RR//FullSimplify
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][3]]//.RB//.RR//FullSimplify
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify


\[Delta] = 1/(1-(a[1]a[2]a[3]a[4]a[5]));
Sol = FullSimplify[Simplify[Solve[{A1==0,A2==0,A3==0,A4==0,A5==0,A6==0},{a[1],a[2],a[3],a[4],a[5],a[6]}]//.schoutenA]]//.schoutenA


\[CapitalDelta] = Together[\[Delta]//.Sol[[1]]]//.schoutenA

Together[1/(1+a[1]a[2]a[3]a[6]^(-1))//.Sol[[1]]]//.schoutenA
Together[1/(1-a[4]a[5]^(-1)a[6]^(-1))//.Sol[[1]]]//.schoutenA


Spaa[1,4] Spaa[3,4]+Spaa[1,5] Spaa[3,5]//.schoutenA


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A4;
EE[5] = A5;
EE[6] = A6;


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,6},{j,1,6}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol]//.schoutenA


Product[1/a[i],{i,1,5}]//.Sol//Simplify;
\[CapitalOmega] = Product[1/a[i],{i,1,5}]*J*Spaa[2,5]//.Sol//Simplify


\[CapitalOmega]5 = \[CapitalOmega]*\[CapitalDelta]//Simplify

sing = {Spaa[i_,5]->\[Alpha] Spaa[i,2]+\[Beta] Spaa[i,j],Spaa[5,i_]->\[Alpha] Spaa[2,i]+\[Beta] Spaa[j,i]};
\[CapitalOmega]5//.sing
Residue[(\[CapitalOmega]5[[1]][[1]]//.sing),{\[Beta],0}]//.Spaa[2,j]->1


\[CapitalOmega] = Spaa[3,4]^4/(a[5](a[5]Spaa[2,4]-Spaa[3,4])Spaa[1,2]Spaa[2,3]Spaa[1,4])*((a[5] Spaa[2,4]-Spaa[3,4])/Spaa[3,4])^(4)
Residue[\[CapitalOmega],{a[5],0}]


DefNumSH[6]
s[1,2](Spab[1,P[1]+P[5]+P[6],1]+Spab[2,P[2]+P[5]+P[6],2])-4 Spab[4,P[1]+P[2]+P[3],3]Spab[3,P[1]+P[2]+P[3],4]//.SHtest//.NSpinHel
-4 s[1,2]s[5,6]//.SHtest//.NSpinHel


(* ::Section::Closed:: *)
(*5/6-point NMHV N=3*)


(* ::Subsection::Closed:: *)
(*6 pt NMHV calculation,  hectagon*)


CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
FractionBox[
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}]}], 
RowBox[{
RowBox[{"-", "1"}], "+", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "8", "]"}]}]}]], "1", 
RowBox[{"-", 
FractionBox[
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"1", "+", 
FractionBox[
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "8", "]"}]}], 
RowBox[{
RowBox[{"-", "1"}], "+", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}]}]]}]]}], 
FractionBox[
RowBox[{
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}]}], 
RowBox[{
RowBox[{"-", "1"}], "+", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "8", "]"}]}]}]], "0", 
FractionBox[
RowBox[{
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}]}], 
RowBox[{
RowBox[{"-", "1"}], "+", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "8", "]"}]}]}]]},
{
FractionBox[
RowBox[{
RowBox[{"a", "[", "1", "]"}], "+", 
RowBox[{
RowBox[{"(", 
RowBox[{
RowBox[{
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}]}], "-", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "4", "]"}]}]}], ")"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}]}], 
RowBox[{
RowBox[{"-", "1"}], "+", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "8", "]"}]}]}]], "0", 
FractionBox[
RowBox[{
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], "+", 
RowBox[{
RowBox[{"(", 
RowBox[{
RowBox[{
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}]}], "-", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "4", "]"}]}]}], ")"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}]}], ")"}], " ", 
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "8", "]"}]}], 
RowBox[{
RowBox[{"-", "1"}], "+", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "8", "]"}]}]}]], 
FractionBox[
RowBox[{
RowBox[{"a", "[", "2", "]"}], "+", 
RowBox[{
RowBox[{"(", 
RowBox[{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], " ", 
RowBox[{"a", "[", "3", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "4", "]"}]}]}], ")"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "8", "]"}]}]}], 
RowBox[{
RowBox[{"-", "1"}], "+", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "8", "]"}]}]}]], "1", 
FractionBox[
RowBox[{
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"(", 
RowBox[{
RowBox[{
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "8", "]"}]}]}], ")"}]}], 
RowBox[{
RowBox[{"-", "1"}], "+", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "8", "]"}]}]}]]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{"-", 
FractionBox[
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}]}], 
RowBox[{
RowBox[{"-", "1"}], "+", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "8", "]"}]}]}]]}], "0", "0", 
RowBox[{"-", 
FractionBox[
RowBox[{
RowBox[{"a", "[", "1", "]"}], "+", 
RowBox[{
RowBox[{"(", 
RowBox[{
RowBox[{
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}]}], "-", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "4", "]"}]}]}], ")"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}]}], 
RowBox[{
RowBox[{"-", "1"}], "+", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "8", "]"}]}]}]]}], "0"},
{"0", 
FractionBox[
RowBox[{"a", "[", "7", "]"}], 
RowBox[{"1", "+", 
FractionBox[
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "8", "]"}]}], 
RowBox[{
RowBox[{"-", "1"}], "+", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}]}]]}]], "1", "0", 
RowBox[{"-", 
FractionBox[
RowBox[{
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], "+", 
RowBox[{
RowBox[{"(", 
RowBox[{
RowBox[{
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "3", "]"}]}], "-", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "4", "]"}]}]}], ")"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}]}], ")"}], " ", 
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "8", "]"}]}], 
RowBox[{
RowBox[{"-", "1"}], "+", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "8", "]"}]}]}]]}], "0"},
{"0", 
RowBox[{"-", 
FractionBox[
RowBox[{
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}]}], 
RowBox[{
RowBox[{"-", "1"}], "+", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "8", "]"}]}]}]]}], "0", "1", 
RowBox[{"-", 
FractionBox[
RowBox[{
RowBox[{"a", "[", "2", "]"}], "+", 
RowBox[{
RowBox[{"(", 
RowBox[{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], " ", 
RowBox[{"a", "[", "3", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "4", "]"}]}]}], ")"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "8", "]"}]}]}], 
RowBox[{
RowBox[{"-", "1"}], "+", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "8", "]"}]}]}]]}], "0"},
{"0", 
RowBox[{"-", 
FractionBox[
RowBox[{
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}]}], 
RowBox[{
RowBox[{"-", "1"}], "+", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "8", "]"}]}]}]]}], "0", "0", 
RowBox[{"-", 
FractionBox[
RowBox[{
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"(", 
RowBox[{
RowBox[{
RowBox[{"a", "[", "2", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "8", "]"}]}]}], ")"}]}], 
RowBox[{
RowBox[{"-", "1"}], "+", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "6", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], " ", 
RowBox[{"a", "[", "5", "]"}], " ", 
RowBox[{"a", "[", "7", "]"}], " ", 
RowBox[{"a", "[", "8", "]"}]}]}]]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
CC . Transpose[Cperp]
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][2]]//.RB//.RR//FullSimplify
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[2]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[3]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[3]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[4]]) . \[Lambda][2]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[4]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;


Sol = FullSimplify[Simplify[Solve[{A1==0,A2==0,A3==0,A4==0,A5==0,A6==0,A7==0,A8==0},{a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8]}]//.schoutenA]]//.schoutenA


EE[1] = A1;
EE[2] = A2;
EE[3] = A3;
EE[4] = A4;
EE[5] = A5;
EE[6] = A6;
EE[7] = A7;
EE[8] = A8;


F[i_,j_]:=D[EE[i],a[j]];
Mat = Table[F[i,j],{i,1,8},{j,1,8}];
J = FullSimplify[Simplify[1/(Det[Mat])]//.Sol[[1]]]//.schoutenA


J = -((Spaa[1,3] Spaa[4,6])/(Spaa[1,2]^2 Spaa[2,5]^2 Spaa[3,4]^2 Spaa[5,6]^4));
\[CapitalOmega]bare = Product[1/a[i],{i,1,8}]*J*Spaa[2,5]^3//.Sol[[1]]//Simplify
Jac = Together[Simplify[Together[FullSimplify[(1-a[4]a[5]a[6]-a[3]a[5]a[7]a[8])/(1-a[4]a[5]a[6])//.Sol[[1]]]]//.schoutenA]//.schoutenA]//.schoutenA
\[CapitalOmega]bare*Jac^(-1)
Together[Simplify[Together[FullSimplify[1-a[4]a[5]a[6]-a[3]a[5]a[7]a[8]//.Sol[[1]]]]//.schoutenA]//.schoutenA]//.schoutenA
(Spaa[1,3] Spaa[2,5] Spaa[4,6])/(Spaa[1,2] Spaa[3,4] Spaa[5,6])


(* ::InheritFromParent:: *)
(*(Spaa[1,5] Spaa[2,3] Spaa[4,6]+Spaa[1,2] Spaa[3,5] Spaa[4,6]//Simplify)/(Spaa[1,2] Spaa[3,4] Spaa[5,6])//.schoutenA*)


a[7] = (Spbb[5,6]/Spbb[1,6])^(1);
a[8] = -(Spaa[3,4]/Spaa[2,3])^(1);
a[2] = -(s[1,5,6]/Spab[2,P[1]+P[5]+P[6],1])^(-1);
a[3] = Spab[2,P[1]+P[5]+P[6],1]/Spab[3,P[1]+P[5]+P[6],1];
a[4] =((Spab[2,P[1]+P[5]+P[6],6] Spab[3,P[1]+P[5]+P[6],1])/(Spaa[3,4] Spab[2,P[1]+P[5]+P[6],1] Spbb[5,6]))^(1);
a[6] = (Spab[4,P[1]+P[5]+P[6],1]/Spab[3,P[1]+P[5]+P[6],1])^(-1);


Together[1-(a[3] a[6] a[8])^(-1)//FullSimplify]


(* ::InheritFromParent:: *)
(*(Spaa[2,4] Spab[3,P[1]+P[5]+P[6],1])/(Spaa[3,4] Spab[2,P[1]+P[5]+P[6],1])*)


1-a[3] a[6] a[8]-a[2] a[4] a[7] a[8]//FullSimplify
1+Together[(Spaa[3,4] Spab[2,P[1]+P[5]+P[6],1]^3)/Spab[4,P[1]+P[5]+P[6],1]-(s[1,5,6] Spab[2,P[1]+P[5]+P[6],6] Spab[3,P[1]+P[5]+P[6],1])/Spbb[1,6]]/(Spaa[2,3] Spab[2,P[1]+P[5]+P[6],1]^2);


Together[1+((Spaa[3,4] Spab[2,P[1]+P[5]+P[6],1])/Spab[4,P[1]+P[5]+P[6],1]-(Spab[2,P[1]+P[5]+P[6],6] Spab[3,P[1]+P[5]+P[6],1])/(s[1,5,6] Spbb[1,6]))/Spaa[2,3]]

(-Spab[2,P[1]+P[5]+P[6],6] Spab[3,P[1]+P[5]+P[6],1] Spab[4,P[1]+P[5]+P[6],1]+s[1,5,6] Spaa[3,4] Spab[2,P[1]+P[5]+P[6],1] Spbb[1,6]+s[1,5,6] Spaa[2,3] Spab[4,P[1]+P[5]+P[6],1] Spbb[1,6])//FullSimplify


(* ::InheritFromParent:: *)
(*Spab[2,P[1]+P[5]+P[6],1] (-Spab[3,P[1]+P[5]+P[6],1] Spab[4,P[1]+P[5]+P[6],6])/(s[1,5,6] Spaa[2,3] Spab[4,P[1]+P[5]+P[6],1] Spbb[1,6])*)


(* ::InheritFromParent:: *)
(*s[1,5,6] Spaa[3,4] Spab[2,P[1]+P[5]+P[6],1] Spbb[1,6]+Spab[4,P[1]+P[5]+P[6],1] (-Spab[2,P[1]+P[5]+P[6],1] Spab[3,P[1]+P[5]+P[6],6])//Simplify*)


(* ::InheritFromParent:: *)
(*Spab[2,P[1]+P[5]+P[6],1] (-Spab[3,P[1]+P[5]+P[6],1] Spab[4,P[1]+P[5]+P[6],6])*)


(-s[1,5,6] Spab[2,P[1]+P[5]+P[6],6] Spab[3,P[1]+P[5]+P[6],1] Spab[4,P[1]+P[5]+P[6],1]+Spaa[3,4] Spab[2,P[1]+P[5]+P[6],1]^3 Spbb[1,6])


(* ::InheritFromParent:: *)
(*Together[1/(1-a[2] a[4] a[7] a[8]-a[3]a[6]a[8])]//FullSimplify*)


Together[1-a[3]a[6]a[8]]
(Spaa[3,4] Spaa[2,7]+Spaa[2,3] Spaa[4,7])/(Spaa[2,3] Spab[4,P[1]+P[5]+P[6],1])//.schoutenA


(Spaa[2,3] Spaa[2,7] Spaa[4,7])/(Spaa[3,4] Spaa[3,7]^2)


(Spaa[2,3] Spaa[4,7])/(Spaa[3,4] Spaa[2,7])


(Spaa[2,3] Spaa[7,8])/(Spaa[2,7] Spaa[3,8])


(* ::InheritFromParent:: *)
(*(Spaa[2,3] Spaa[7,8])/(Spaa[2,7] Spaa[3,8])+(Spaa[2,3] Spaa[2,7] Spaa[4,7])/(Spaa[3,4] Spaa[3,7]^2)//Together//Simplify*)


(* ::InheritFromParent:: *)
(*(Spaa[2,3] Factor[(Spaa[2,7]^2 Spaa[3,8] Spaa[4,7]+Spaa[3,4] Spaa[3,7]^2 Spaa[7,8])])/(Spaa[2,7] Spaa[3,4] Spaa[3,7]^2 Spaa[3,8])*)


(* ::InheritFromParent:: *)
(*(Spaa[2,3] Spaa[7,8])/(Spaa[2,7] Spaa[3,8])+(Spaa[2,3] Spaa[4,7])/(Spaa[3,4] Spaa[2,7])//FullSimplify*)


(* ::InheritFromParent:: *)
(*(Spaa[2,3] (Spaa[3,8] Spaa[4,7]+Spaa[3,4] Spaa[7,8])//.schoutenA)/(Spaa[2,7] Spaa[3,4] Spaa[3,8])*)


(Spaa[2,3] Spaa[3,P[1]+P[5]+P[6],1] Spaa[4,8])/(Spab[2,P[1]+P[5]+P[6],1] Spaa[3,4] Spaa[3,8])


(*7\[Rule]1,8\[Rule]1+5+6|6]*)


\[CapitalOmega]bare=Spaa[2,4]/(z Spaa[1,2] Spaa[1,4] (Spaa[2,3]+z Spaa[2,4]) Spaa[3,4]);
\[Delta] = Spaa[1,4] (Spaa[2,3]+z Spaa[2,4])/(Spaa[2,4](Spaa[1,3]+z Spaa[1,4]))
\[CapitalOmega] = \[CapitalOmega]bare*\[Delta]//Simplify//Factor
Res2 = Residue[\[CapitalOmega],{z,-Spaa[1,3]/Spaa[1,4]}]
Res1+Res2





Sol = {a[1]->Spaa[1,3]/Spaa[2,3],a[2]->Spaa[1,2]/Spaa[1,3],a[6]->Spaa[3,5]/Spaa[1,5]}


Together[1+a[1]a[2]a[6]//.Sol]//.schoutenA


\[CapitalOmega] = (Spaa[1,2]Spaa[3,4])/(z Spaa[1,4](Spaa[2,3]+z Spaa[2,4])(Spaa[1,3]+z Spaa[1,4])^2);
Res1 = Residue[\[CapitalOmega],{z,0}]
Res2 = Residue[\[CapitalOmega],{z,-Spaa[2,3]/Spaa[2,4]}]//.schoutenA
Res3 = Residue[\[CapitalOmega],{z,-Spaa[1,3]/Spaa[1,4]}]//.schoutenA//.{-Spaa[1,4] Spaa[2,3]+2 Spaa[1,3] Spaa[2,4]->Spaa[1,2] Spaa[3,4]+Spaa[1,3] Spaa[2,4]}
FullSimplify[Res1+Res2+Res3]//.schoutenA


Res1+Res2//Together//Simplify


Spaa[1,3] Spaa[2,4]+Spaa[1,2] Spaa[3,4]/.schoutenA
-Spaa[1,4] Spaa[2,3]+2 Spaa[1,3] Spaa[2,4]->Spaa[1,2] Spaa[3,4]+Spaa[1,3] Spaa[2,4]


a[2]=(Spaa[1,3]+z Spaa[1,4])/Spaa[1,2];
a[1]=(Spaa[2,3]+z Spaa[2,4])/(Spaa[1,3]+z Spaa[1,4]);
a[3]=Spaa[1,4]/Spaa[3,4];
(Together[1+(a[1]a[2]a[3])^(-1)//FullSimplify]//Simplify//Factor//.schoutenA)
(Together[1+a[1]a[2]a[3]//FullSimplify]//Simplify//Factor//.schoutenA)
Spaa[1,4] Spaa[2,3]+Spaa[1,2] Spaa[3,4]//.schoutenA


(* ::InheritFromParent:: *)
(*(Spaa[1,3] Spaa[2,4]+z Spaa[1,4] Spaa[2,4])/(Spaa[1,2] Spaa[3,4])//FullSimplify*)


J=((Spaa[1,2]Spaa[3,4])/(Spaa[2,4]Spaa[1,3]))
AA = (1+J)*Spaa[2,4]/(Spaa[1,3]Spaa[1,2]Spaa[3,4])//Together
BB = (Spaa[1,3] Spaa[2,4]+Spaa[1,2] Spaa[3,4])/(Spaa[1,2] Spaa[1,3]^2 Spaa[3,4])





\[CapitalOmega] = (Spaa[2,3]Spaa[5,1])/(Spaa[1,2]Spaa[3,4]Spaa[4,5]Spaa[1,3]^2)
sing = {Spaa[i_,1]->\[Alpha] Spaa[i,3]+\[Beta] \[Gamma] Spaa[i,4],Spaa[1,i_]->\[Alpha] Spaa[3,i]+\[Beta] \[Gamma] Spaa[4,i]};
\[CapitalOmega]1 = \[CapitalOmega]//.sing//.{\[Gamma]->Spaa[1,2]/Spaa[2,4]}//FullSimplify
Residue[\[CapitalOmega]1,{\[Beta],0}]//.schoutenA





a[7] = (Spbb[5,6]/Spbb[1,6])^(1);
a[8] = -(Spaa[3,4]/Spaa[2,3])^(-1);
a[1] = -((Spab[2,P[1]+P[5]+P[6],1]/Spab[2,P[1]+P[5]+P[6],6]))^(-1);
a[2] = -(s[1,5,6]/Spab[2,P[1]+P[5]+P[6],1])^(1);
a[5] = -(Spab[2,P[1]+P[5]+P[6],5]/Spab[2,P[1]+P[5]+P[6],6]);
a[3] = Spab[2,P[1]+P[5]+P[6],1]/Spab[3,P[1]+P[5]+P[6],1];
a[4] =((Spab[2,P[1]+P[5]+P[6],6] Spab[3,P[1]+P[5]+P[6],1])/(Spaa[3,4] Spab[2,P[1]+P[5]+P[6],1] Spbb[5,6]))^(-1);
a[6] = Spab[4,P[1]+P[5]+P[6],1]/Spab[3,P[1]+P[5]+P[6],1];


Together[1-1/((a[1]a[5]a[7]^(-1)))]
(Spab[2,P[1]+P[5]+P[6],6] Spbb[1,5])/(Spab[2,P[1]+P[5]+P[6],1] Spbb[5,6])//.SHtest//.NSpinHel


(* ::InheritFromParent:: *)
(**)


(* ::Subsection::Closed:: *)
(*Top cell residue*)


(*\[Delta] = 1/(1-a[7] a[8])*)
CC=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{"1", 
RowBox[{
RowBox[{"a", "[", "1", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "8", "]"}]}]}], "0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "8", "]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "8", "]"}]}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "8", "]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "3", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "8", "]"}]}]}], "0", 
RowBox[{"a", "[", "8", "]"}]},
{"0", 
RowBox[{
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "8", "]"}]}], "0", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "8", "]"}]}], "1", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "8", "]"}]}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cperp =\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "1", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "2", "]"}], 
RowBox[{"a", "[", "4", "]"}], 
RowBox[{"a", "[", "8", "]"}]}]}], "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"a", "[", "8", "]"}]}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "4", "]"}]}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "8", "]"}]}], "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "8", "]"}]}], "0", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "3", "]"}]}], "+", 
RowBox[{
RowBox[{"a", "[", "5", "]"}], 
RowBox[{"a", "[", "8", "]"}]}]}], "1", 
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "5", "]"}]}], 
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "8", "]"}]}], "0"},
{
RowBox[{
RowBox[{"-", 
RowBox[{"a", "[", "2", "]"}]}], 
RowBox[{"a", "[", "8", "]"}]}], "0", 
RowBox[{"-", 
RowBox[{"a", "[", "8", "]"}]}], "0", 
RowBox[{"-", 
RowBox[{"(", 
RowBox[{
RowBox[{"a", "[", "7", "]"}], "+", 
RowBox[{
RowBox[{"a", "[", "6", "]"}], 
RowBox[{"a", "[", "8", "]"}]}]}], ")"}]}], "1"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
lambda={\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]};
tlambda={t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]};
CC . Transpose[Cperp];
perpEQ = Cperp . Transpose[lambda];
CEQ = CC . Transpose[tlambda];
eta = {\[Eta][1],\[Eta][2],\[Eta][3],\[Eta][4],\[Eta][5],\[Eta][6]};
SEQ = CC . Transpose[eta];


A1 = TensorExpand[(perpEQ[[1]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A2 = TensorExpand[(perpEQ[[1]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A3 = TensorExpand[(perpEQ[[1]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A4 = TensorExpand[(perpEQ[[2]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A5 = TensorExpand[(perpEQ[[2]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A6 = TensorExpand[(perpEQ[[2]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;
A7 = TensorExpand[(perpEQ[[3]]) . \[Lambda][1]]//.RB//.RR//FullSimplify;
A8 = TensorExpand[(perpEQ[[3]]) . \[Lambda][3]]//.RB//.RR//FullSimplify;
A9 = TensorExpand[(perpEQ[[3]]) . \[Lambda][5]]//.RB//.RR//FullSimplify;

B1 = TensorExpand[(CEQ[[1]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B2 = TensorExpand[(CEQ[[1]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B3 = TensorExpand[(CEQ[[1]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;
B4 = TensorExpand[(CEQ[[2]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B5 = TensorExpand[(CEQ[[2]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B6 = TensorExpand[(CEQ[[2]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;
B7 = TensorExpand[(CEQ[[3]]) . t\[Lambda][2]]//.RB//.RR//FullSimplify;
B8 = TensorExpand[(CEQ[[3]]) . t\[Lambda][4]]//.RB//.RR//FullSimplify;
B9 = TensorExpand[(CEQ[[3]]) . t\[Lambda][6]]//.RB//.RR//FullSimplify;


Simplify[Simplify[Simplify[FullSimplify[Solve[{A2==0,A9==0,A4==0,A3==0,A5==0,A7==0},{a[1],a[2],a[3],a[4],a[5],a[6]}]]//.schoutenA]//.schoutenA//.schoutenB]//.SPAB];
Sol = {{a[1]->(Spaa[1,5] (a[7] Spaa[2,5]+Spaa[2,6])+2 a[8] Spaa[1,2] Spaa[3,5])/(Spaa[1,5] (a[7] Spaa[1,5]-Spaa[1,6])),a[2]->-((a[8] Spaa[3,5]+Spaa[5,6])/(a[8] Spaa[1,5])),a[3]->-((2 a[8] Spaa[3,4]-a[7] Spaa[4,5]+Spaa[4,6])/(a[7] Spaa[3,5]-Spaa[3,6])),a[4]->-(Spaa[1,2]/(a[7] Spaa[1,5]-Spaa[1,6])),a[5]->-(Spaa[3,4]/(a[7] Spaa[3,5]-Spaa[3,6])),a[6]->(-a[8] Spaa[1,3]-a[7] Spaa[1,5]+Spaa[1,6])/(a[8] Spaa[1,5]),a[8]->((a[7] Spaa[1,5]-Spaa[1,6]) Spbb[3,4])/(Spaa[1,2] Spbb[2,4]+(a[7] Spaa[1,5]-Spaa[1,6]) Spbb[4,6])}}
(*Solve[B5\[Equal]0//.Sol[[1]]//FullSimplify,a[8]]//FullSimplify*)


(* ::InheritFromParent:: *)
(*{{a[1]->(Spaa[1,5] (a[7] Spaa[2,5]+Spaa[2,6])+2 a[8] Spaa[1,2] Spaa[3,5])/(Spaa[1,5] (a[7] Spaa[1,5]-Spaa[1,6])),a[2]->-((a[8] Spaa[3,5]+Spaa[5,6])/(a[8] Spaa[1,5])),a[3]->-((2 a[8] Spaa[3,4]-a[7] Spaa[4,5]+Spaa[4,6])/(a[7] Spaa[3,5]-Spaa[3,6])),a[4]->-(Spaa[1,2]/(a[7] Spaa[1,5]-Spaa[1,6])),a[5]->-(Spaa[3,4]/(a[7] Spaa[3,5]-Spaa[3,6])),a[6]->-((-Spaa[1,5] Spbb[4,5]+a[7] Spaa[1,5] Spbb[4,6])/(Spaa[1,5] Spbb[3,4])),a[8]->((a[7] Spaa[1,5]-Spaa[1,6]) Spbb[3,4])/(Spaa[1,2] Spbb[2,4]+(a[7] Spaa[1,5]-Spaa[1,6]) Spbb[4,6])}}*)


(2 a[8] Spaa[3,4]-a[7] Spaa[4,5]+Spaa[4,6])/(a[7] Spaa[3,5]-Spaa[3,6])//.{a[8]->((a[7] Spaa[1,5]-Spaa[1,6]) Spbb[3,4])/(Spaa[1,2] Spbb[2,4]+(a[7] Spaa[1,5]-Spaa[1,6]) Spbb[4,6])}//Together


(* ::InheritFromParent:: *)
(*(-a[7] Spaa[1,2] Spaa[4,5] Spbb[2,4]+Spaa[1,2] Spaa[4,6] Spbb[2,4]+2 a[7] Spaa[1,5] Spaa[3,4] Spbb[3,4]-2 Spaa[1,6] Spaa[3,4] Spbb[3,4]-a[7]^2 Spaa[1,5] Spaa[4,5] Spbb[4,6]+a[7] Spaa[1,6] Spaa[4,5] Spbb[4,6]+a[7] Spaa[1,5] Spaa[4,6] Spbb[4,6]-Spaa[1,6] Spaa[4,6] Spbb[4,6])/((a[7] Spaa[3,5]-Spaa[3,6]) (Spaa[1,2] Spbb[2,4]+a[7] Spaa[1,5] Spbb[4,6]-Spaa[1,6] Spbb[4,6]))*)


Collect[Collect[(a[7] Spaa[3,5]-Spaa[3,6]) (Spaa[1,2] Spbb[2,4]+a[7] Spaa[1,5] Spbb[4,6]+Spaa[1,6] Spbb[4,6])//Expand,a[7]Spbb[4,6]]//.schoutenA,a[7]]//.SPAB


(* ::InheritFromParent:: *)
(*-Spaa[1,2] Spaa[3,6] Spbb[2,4]+a[7]^2 Spaa[1,5] Spaa[3,5] Spbb[4,6]-Spaa[1,6] Spaa[3,6] Spbb[4,6]+a[7] (SpabSpaa[1,2] Spaa[3,5] Spbb[2,4]-Spaa[1,3] Spaa[5,6] Spbb[4,6])*)


Solve[B5==0//.Sol[[1]]//FullSimplify,a[8]]//FullSimplify
Solve[B5==0//.Sol[[1]]//FullSimplify,a[8]]//FullSimplify


Simplify[Simplify[Simplify[Together[(a[7] Spaa[1,5] Spaa[2,5]-Spaa[1,6] Spaa[2,5]+a[8] (-2 Spaa[1,5] Spaa[2,3]+2 Spaa[1,3] Spaa[2,5])+Spaa[1,2] Spaa[5,6])/(Spaa[1,5] (a[7] Spaa[1,5]-Spaa[1,6]))]]//.schoutenA]//.schoutenA]//.schoutenA//Simplify



(* ::InheritFromParent:: *)
(*(a[7] Spaa[1,5] Spaa[2,5]-Spaa[1,6] Spaa[2,5]+a[8] 2(-Spaa[1,5] Spaa[2,3]+Spaa[1,3] Spaa[2,5])+Spaa[1,2] Spaa[5,6])/(Spaa[1,5] (a[7] Spaa[1,5]-Spaa[1,6]))//.schoutenA*)


(* ::InheritFromParent:: *)
(*(a[7] Spaa[1,5] Spaa[2,5]+Spaa[1,6] Spaa[2,5]+Spaa[1,2] Spaa[5,6]+2 a[8] Spaa[1,2] Spaa[3,5])/(Spaa[1,5] (a[7] Spaa[1,5]-Spaa[1,6]))//.schoutenA*)


(* ::InheritFromParent:: *)
(*(a[7] Spaa[1,5] Spaa[2,5]+Spaa[1,5] Spaa[2,6]+2 a[8] Spaa[1,2] Spaa[3,5])/(Spaa[1,5] (a[7] Spaa[1,5]-Spaa[1,6]))//FullSimplify*)


(* ::InheritFromParent:: *)
(**)


Expand[Spab[1,P[1]+P[5]+P[6],2]Spab[2,P[1]+P[5]+P[6],1]//.SHtest]//.Spaa[2,6]Spaa[1,6] Spbb[1,6] Spbb[2,6]->s[2,6]s[1,6]//.Spaa[1,5] Spaa[2,5] Spbb[1,5] Spbb[2,5]->s[1,5]s[2,5]//.{Spaa[2,6] Spbb[1,6]->-Spab[2,P[6],1],Spaa[2,5] Spbb[1,5]->-Spab[2,P[5],1]}//.{Spaa[1,5]Spbb[2,5]->-Spab[1,P[5],2],Spaa[1,6]Spbb[2,6]->-Spab[1,P[6],2]}


DefNumSH[6]
s[1,5] s[2,5]+s[1,6] s[2,6]+Spaa[1,5] Spaa[2,6] Spbb[1,6] Spbb[2,5]+Spaa[1,6] Spaa[2,5] Spbb[1,5] Spbb[2,6]//.SHtest//.NSpinHel
Spab[1,P[1]+P[5]+P[6],2]Spab[2,P[1]+P[5]+P[6],1]//.SHtest//.NSpinHel


Expand[Spab[1,P[1]+P[5]+P[6],2]Spab[2,P[1]+P[5]+P[6],1]//.SHtest]//.Spaa[2,6]Spaa[1,6] Spbb[1,6] Spbb[2,6]->s[2,6]s[1,6]//.Spaa[1,5] Spaa[2,5] Spbb[1,5] Spbb[2,5]->s[1,5]s[2,5]//.{Spaa[2,6] Spbb[1,6]->-Spab[2,P[6],1],Spaa[2,5] Spbb[1,5]->-Spab[2,P[5],1]}//.{Spaa[1,5]Spbb[2,5]->-Spab[1,P[5],2],Spaa[1,6]Spbb[2,6]->-Spab[1,P[6],2]}

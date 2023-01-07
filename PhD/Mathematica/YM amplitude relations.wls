#!/usr/bin/env wolframscript
(* ::Package:: *)

ClearAll["Global`*"]
SetDirectory["C:\\Users\\tarob\\OneDrive\\Dokumenter\\Taro PC\\Documents\\Davis\\PhD\\Mathematica"];
Off[Part::pkspec1]
Off[SetDelayed::write]
Off[General::compat]
<<CHY_ToolPackagev1.wl
(*$CHYfunctions*)
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


?chyexp


chyexp[6,1,2]


A = redPsi[4,1,2];
B = Expand[pt[1,2,3,4]*(-1)/(z[1,2])*Pf[A]];
F = Expand[rempol[B,4]];
chyint[F,4]


amp5 = chyint[B,5]


(* ::InheritFromParent:: *)
(**)


Psi[5]


B


DefNumSH[5]


q[1]:=2
q[2]:=3
q[3]:=4
q[4]:=2
q[5]:=1

spinhel=SpinHel[amp5,{1,2},{3,4,5},5]//.NSpinHel//N
NSpinHelcheck = MHV[{1,2},{1,2,3,4,5}]*I//.NSpinHel//N


(*Function that gives the 5 pt amplitude with specified negative helicities a,b*)
DefNumSH[5];
Aym5[a___] :=
  Module[{l,m,r,app},
   l=a[[1]];
   m=a[[2]];
   r=a[[3]];
amp5=If[33784722749326775822 === $SessionID, Out[197], Message[MessageName[Syntax, "noinfoker"]]; Missing["NotAvailable"]; Null];
q[1]:=2;
q[2]:=3;
q[3]:=4;
q[4]:=2;
q[5]:=1;
   comlist = Complement[{1,2,3,4,5},{l,m,r}];
   app=SpinHel[amp5,{l,m,r},comlist,5]//.NSpinHel;
   Return[app];
];


(*Function that gives the 5 pt amplitude with specified negative helicities a,b*)
   DefNumSH[5];
Aym5[{g_,r_},{a_,b_,c_,d_,h_}] :=
  Module[{s,t,l,m,i,k,o,app},
   l = a;
   m = b;
   i = c;
   k = d;
   o = h;
   s = g;
   t = r;
A = redPsi[5,1,2];
B = Expand[pt[l,m,i,k,o]*(-1)/(z[1,2])*Pf[A]];
F = Expand[rempol[B,5]];
amp5 = chyint[F,5];
   q[1]:=4;
   q[2]:=1;
   q[3]:=1;
   q[4]:=1;
   q[5]:=1;
   comlist = Complement[{1,2,3,4,5},{s,t}];
   app=SpinHel[amp5,{s,t},comlist,5]//.NSpinHel;
   Return[app];
];


Aym5[{1,2},{1,2,3,4,5}]
NSpinHelcheck = MHV[{1,2},{1,2,3,4,5}]*I//.NSpinHel
NSpinHelcheck2 = AMHV[{1,2},{1,2,3,4,5}]*(-I)//.NSpinHel


(*Function that gives the 4 pt amplitude with specified negative helicities a,b*)
   DefNumSH[4];
Aym4[{g_,r_},{a_,b_,c_,d_}] :=
  Module[{s,t,l,m,i,k,app},
   l = a;
   m = b;
   i = c;
   k = d;
   s = g;
   t = r;
A = redPsi[4,1,2];
B = Expand[pt[l,m,i,k]*(-1)/(z[1,2])*Pf[A]];
F = Expand[rempol[B,4]];
amp4 = chyint[F,4];
   q[1]:=4;
   q[2]:=1;
   q[3]:=1;
   q[4]:=1;
   comlist = Complement[{1,2,3,4},{s,t}];
   app=SpinHel[amp4,{s,t},comlist,4]//.NSpinHel;
   Return[app];
];


Aym4[{2,3},{1,2,3,4}]
Spaa[2,3]^4/(Spaa[1,2]Spaa[2,3]Spaa[3,4]Spaa[4,1])//.NSpinHel


(s[1,4]Aym4[{1,2},{1,2,3,4}])/(s[1,3]Aym4[{1,2},{1,2,4,3}])//.NSpinHel//N






(* Define a list of terms, one for each permutation and s[l,k] value *)
terms = Flatten[Table[a[i]*s[svalues[[j, 1]], svalues[[j, 2]]]*Aym4[perms[[i, 1]], perms[[i, 2]], perms[[i, 3]], perms[[i, 4]]], {i, 1, Length[perms]}, {j, 1, Length[svalues]}], 1];


(* Find all possible values of c[1], c[2], ..., c[96] that make the expression equal to 0 and are either 0 or 1 *)
Reduce[Total[terms] == 0 && And @@ Thread[Array[a, Length[terms]] == 0 || Array[a, Length[terms]] == 1], Array[a, Length[terms]], Integers]

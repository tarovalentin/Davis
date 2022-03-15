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
SHtest = {Spab[i_,P[j_]+P[k_]+P[l_],r_]->Spaa[i,j]Spbb[j,r]+Spaa[i,k]Spbb[k,r]+Spaa[i,l]Spbb[l,r],s[i_,j_,k_]->Spaa[i,j]Spbb[j,i]+Spaa[i,k]Spbb[k,i]+Spaa[j,k]Spbb[k,j]};
simSchotenA = {Spaa[j_,k_] \[Lambda][i_]+Spaa[i_,j_] \[Lambda][k_]->Spaa[i,k] \[Lambda][j]};
schoutenLong={Spab[i_,x___,j_] Spbb[k_,l_]+Spab[i_,x___,k_] Spbb[l_,j_]->Spab[i,x,l] Spbb[k,j],Spaa[k_,l_]Spab[i_,x___,j_]+Spaa[l_,j_]Spab[i_,x___,k_]->Spaa[k,j]Spab[i,x,l],Spab[i_,P[x_]+P[y_]+P[w_],j_] Spab[k_,P[x_]+P[y_]+P[w_],l_]-Spab[k_,P[x_]+P[y_]+P[w_],j_] Spab[i_,P[x_]+P[y_]+P[w_],l_]->Spaa[j,l] Spbb[i,k]s[x,y,w]};


A[{i_,j_},{k_},3]:=Spaa[i,j]^6/(Spaa[j,k]^2Spaa[i,k]^2);
A[{i_},{j_,k_},3]:=Spbb[j,k]^6/(Spbb[i,j]^2Spbb[i,k]^2);
A[{i_,j_},{k_,l_},4]:=(Spaa[i,j]^6Spbb[k,l])/(Spaa[i,k]Spaa[i,l]Spaa[j,k]Spaa[j,l]Spaa[k,l]);
Shift1 = {Spbb[1,i_]->Spbb[1,i]+z Spaa[2,3]/Spaa[2,1] Spbb[3,i],Spbb[i_,1]->Spbb[i,1]+z Spaa[2,3]/Spaa[2,1] Spbb[i,1],Spbb[2,i_]->Spbb[2,i]+z Spaa[1,3]/Spaa[1,2] Spbb[3,i],Spbb[i_,2]->Spbb[i,2]+z Spaa[1,3]/Spaa[1,2] Spbb[i,3],Spaa[3,i_]->Spaa[3,i](1-z),Spaa[i_,3]->Spaa[i,3](1-z)};
Shift2 = {Spbb[3,i_]->Spbb[3,i]+z Spaa[4,1]/Spaa[4,3] Spbb[1,i],Spbb[i_,3]->Spbb[i,3]+z Spaa[4,1]/Spaa[4,3] Spbb[i,3],Spbb[4,i_]->Spbb[4,i]+z Spaa[3,1]/Spaa[3,4] Spbb[1,i],Spbb[i_,4]->Spbb[i,4]+z Spaa[3,1]/Spaa[3,4] Spbb[i,1],Spaa[1,i_]->Spaa[1,i](1-z),Spaa[i_,1]->Spaa[i,1](1-z)};
Shift3 = {Spbb[2,i_]->Spbb[2,i]+z Spaa[3,4]/Spaa[3,2] Spbb[4,i],Spbb[i_,2]->Spbb[i,2]+z Spaa[3,4]/Spaa[3,2] Spbb[i,2],Spbb[3,i_]->Spbb[3,i]+z Spaa[2,4]/Spaa[2,3] Spbb[4,i],Spbb[i_,3]->Spbb[i,3]+z Spaa[2,4]/Spaa[2,3] Spbb[i,4],Spaa[4,i_]->Spaa[4,i](1-z),Spaa[i_,4]->Spaa[i,4](1-z)};
Shift4 = {Spbb[2,i_]->Spbb[2,i]+z Spaa[3,1]/Spaa[3,2] Spbb[1,i],Spbb[i_,2]->Spbb[i,2]+z Spaa[3,1]/Spaa[3,2] Spbb[i,2],Spbb[3,i_]->Spbb[3,i]+z Spaa[2,1]/Spaa[2,3] Spbb[1,i],Spbb[i_,3]->Spbb[i,3]+z Spaa[2,1]/Spaa[2,3] Spbb[i,1],Spaa[1,i_]->Spaa[1,i](1-z),Spaa[i_,1]->Spaa[i,1](1-z)};



Spbb[3,2]/.{Spbb[i_,3]->Spbb[i,3]+z Spaa[4,1]/Spaa[4,3] Spbb[i,3]}


A[{1,2},{3,4},4]
\[Phi] = A[{1,2},{3,4},4]/.Shift4//FullSimplify
Spbb[3,4]/.Spbb[3,i_]->Spbb[3,i]+z*Spaa[2,4]/Spaa[2,3]Spbb[4,i]


\[CapitalPhi] = ( Spaa[1,2]^6 (Spaa[1,4] Spbb[1,4]))/(Spaa[1,3] Spaa[1,4] Spaa[2,3] Spaa[2,4] Spaa[3,4]^2 x)
\[CapitalPhi]2 = ( Spaa[1,2]^6 (x Spaa[1,2] Spbb[1,4]-Spaa[2,3] Spbb[3,4]))/(Spaa[1,3] Spaa[1,4] Spaa[2,3]^2 Spaa[2,4] Spaa[3,4]) 1/(x)
Residue[\[CapitalPhi],{x,0}]
Residue[\[CapitalPhi]2,{x,0}]


\[AliasDelimiter]

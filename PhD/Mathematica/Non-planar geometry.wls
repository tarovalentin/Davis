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
SHtest = {Spab[i_,P[j_]+P[k_]+P[l_],r_]->Spaa[i,j]Spbb[j,r]+Spaa[i,k]Spbb[k,r]+Spaa[i,l]Spbb[l,r],s[i_,j_,k_]->Spaa[i,j]Spbb[j,i]+Spaa[i,k]Spbb[k,i]+Spaa[j,k]Spbb[k,j],Spbbb[i_,(P[j_]+P[k_]) . (P[l_]+P[r_]),m_]->Spbb[i,j]Spaa[j,l]Spbb[l,m]+Spbb[i,j]Spaa[j,r]Spbb[r,m]+Spbb[i,k]Spaa[k,l]Spbb[l,m]+Spbb[i,k]Spaa[k,r]Spbb[r,m],Spaaa[i_,(P[j_]+P[k_]) . (P[l_]+P[r_]),m_]->Spaa[i,j]Spbb[j,l]Spaa[l,m]+Spaa[i,j]Spbb[j,r]Spaa[r,m]+Spaa[i,k]Spbb[k,l]Spaa[l,m]+Spaa[i,k]Spbb[k,r]Spaa[r,m]};
simSchotenA = {Spaa[j_,k_] \[Lambda][i_]+Spaa[i_,j_] \[Lambda][k_]->Spaa[i,k] \[Lambda][j]};
schoutenLong={Spab[i_,x___,j_] Spbb[k_,l_]+Spab[i_,x___,k_] Spbb[l_,j_]->Spab[i,x,l] Spbb[k,j],Spaa[k_,l_]Spab[i_,x___,j_]+Spaa[l_,j_]Spab[i_,x___,k_]->Spaa[k,j]Spab[i,x,l],Spab[i_,P[x_]+P[y_]+P[w_],j_] Spab[k_,P[x_]+P[y_]+P[w_],l_]-Spab[k_,P[x_]+P[y_]+P[w_],j_] Spab[i_,P[x_]+P[y_]+P[w_],l_]->Spaa[j,l] Spbb[i,k]s[x,y,w]};


(*Defines non cyclic and non-reversible permutations*)

cy := Permute[#, CyclicGroup[Length@#]] &
set = Complement[Permutations[Range[6]], cy[Range@6]];
primaryPermutations[a_List] :=
  Module[{f1, f2},
    f1 = RotateLeft[#, Ordering[#, 1] - 1] &;
    f2 = # ~Extract~ Ordering[#, 1] &[f1 /@ {#, Reverse@#}] &;
    DeleteDuplicates[f2 /@ a]
  ]
p = set//primaryPermutations;
p = Join[{{1,2,3,4,5,6}},p];
(*Function that finds relations between large and small integers*)
FindRel[exp_] := Block[{},
   Match1 = exp;
   Match = 1/(GCD @@ Match1)*Match1;
   X = Table[0, {i, 1, Length[Match]}, {j, 1, Length[Match] + 1}];
   Do[X[[i, i]] = 1;
    X[[i, Length[Match] + 1]] = 10^100*Match[[i]], {i, 1,
     Length[Match]}];
   LatticeMatrix = LatticeReduce[X]];

(*Defines a C matrix function with random integers for entries (modded out by (GL(
k)))*)
CC = \!\(\*
TagBox[
RowBox[{"(", "", GridBox[{
{"1", 
RowBox[{"RandomInteger", "[", 
RowBox[{"{", 
RowBox[{"1000000000000", ",", "15000000000000"}], "}"}], "]"}], "0", 
RowBox[{"RandomInteger", "[", 
RowBox[{"{", 
RowBox[{"1000000000000", ",", "15000000000000"}], "}"}], "]"}], "0", 
RowBox[{"RandomInteger", "[", 
RowBox[{"{", 
RowBox[{"1000000000000", ",", "15000000000000"}], "}"}], "]"}]},
{"0", 
RowBox[{"RandomInteger", "[", 
RowBox[{"{", 
RowBox[{"1000000000000", ",", "15000000000000"}], "}"}], "]"}], "1", 
RowBox[{"RandomInteger", "[", 
RowBox[{"{", 
RowBox[{"1000000000000", ",", "15000000000000"}], "}"}], "]"}], "0", 
RowBox[{"RandomInteger", "[", 
RowBox[{"{", 
RowBox[{"1000000000000", ",", "15000000000000"}], "}"}], "]"}]},
{"0", 
RowBox[{"RandomInteger", "[", 
RowBox[{"{", 
RowBox[{"1000000000000", ",", "15000000000000"}], "}"}], "]"}], "0", 
RowBox[{"RandomInteger", "[", 
RowBox[{"{", 
RowBox[{"1000000000000", ",", "15000000000000"}], "}"}], "]"}], "1", 
RowBox[{"RandomInteger", "[", 
RowBox[{"{", 
RowBox[{"1000000000000", ",", "15000000000000"}], "}"}], "]"}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], "", ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\);
Cmat2 = CC;
(*We define the function that caclculates minors*)
m[i_,j_,k_]:=Det[Cmat2[[{1,2,3},{i, j, k}]]]

(* And here the function that calculated Parke-Taylor factors. q runs over permutations of 123456, while l runs over different random C matrices.*)
PT[q_]:= m[p[[q]][[1]],p[[q]][[2]],p[[q]][[3]]]m[p[[q]][[2]],p[[q]][[3]],p[[q]][[4]]]m[p[[q]][[3]],p[[q]][[4]],p[[q]][[5]]]m[p[[q]][[4]],p[[q]][[5]],p[[q]][[6]]]m[p[[q]][[5]],p[[q]][[6]],p[[q]][[1]]]m[p[[q]][[6]],p[[q]][[1]],p[[q]][[2]]]


\[CapitalOmega]2 = m[2,3,5]/(m[1,2,3]m[1,3,5]m[1,5,6]m[2,3,4]m[2,4,5]m[2,5,6]m[3,4,5]);
\[CapitalOmega]3 = m[2,3,5]^2/(m[1,2,3]m[1,3,5]m[1,5,6]m[2,3,4]m[2,3,6]m[2,4,5]m[2,5,6]m[3,4,5]);
\[CapitalOmega]4 = (m[1,3,5]m[1,4,5])/(m[1,2,3]m[1,2,5]m[1,3,4]m[1,3,6]m[1,5,6]m[2,4,5]m[4,5,6]m[3,4,5]);
\[CapitalOmega]7 = (m[1,6,3]m[2,4,5]-m[1,6,2]m[3,4,5])/(m[1,2,3]m[1,2,6]m[1,3,6]m[1,5,6]m[2,3,4]m[2,4,5]m[3,4,5]m[4,5,6]);


Join[{\[CapitalOmega]7},Table[1/PT[i],{i,61}]]//FindRel


p[[2]]
p[[60]]




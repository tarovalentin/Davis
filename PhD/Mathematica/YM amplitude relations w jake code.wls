#!/usr/bin/env wolframscript
(* ::Package:: *)

ClearAll["Global`*"]
SetDirectory[NotebookDirectory[]];
<<bcfw.m


(* ::Subsection::Closed:: *)
(*Function that gives the 4 pt amplitude with specified negative helicities a, b*)


(*The position function is there because we change the momentum matrix to matcth the order of the input {a,b,c,d}. 
	This gives problem when specifying the helicity since in {g,r} since what would previously be {1,2} could then 
	actually be read as for instance {1,3}.*)
useRandomKinematics[4,1];
referenceFourMomenta = fourMomenta;

k[i_] := referenceFourMomenta[[i]]
\[Eta] = {{1,0,0,0},{0,-1,0,0},{0,0,-1,0},{0,0,0,-1}};
s[i_,j_]:=2 k[i] . \[Eta] . k[j]

Aym4[{g_,r_},{a_,b_,c_,d_}] :=
	Module[{Am,A,B,s,t,l,q,i,h,app},
		l = a;
		q = b;
		i = c;
		h = d;
		s = g;
		t = r;
		A = Position[{l,q,i,h},s]; 
		B = Position[{l,q,i,h},t];
			k[i_] := referenceFourMomenta[[i]];
			fourMomenta2 = {k[l],k[q],k[i],k[h]};
			setupUsingFourMomenta[fourMomenta2];
			Am = If[A[[1]][[1]]<B[[1]][[1]],Insert[Insert[{p,p},m,A],m,B],Insert[Insert[{p,p},m,B],m,A]];
			app=nAmp[Am[[1]],Am[[2]],Am[[3]],Am[[4]]];
				Return[app];
];


(*Show of U1 decoupling*)
Chop[Aym4[{1,2},{1,2,3,4}]+Aym4[{1,2},{1,3,2,4}]+Aym4[{1,2},{1,3,4,2}]]


(*Brute force find of KLT relations*)
cy := Permute[#, CyclicGroup[Length@#]] &
cy[Range@4];
list = Complement[Permutations[Range[4]], cy[Range@4]];
list3 = {{1,2,4,3},{1,3,2,4},{1,2,3,4}};
A = Table[Aym4[{1,2},list3[[i]]],{i,3}];
list2 = DeleteDuplicates[Subsets[{1, 2, 3, 4}, {2}]//.{{2,3}->{1,4},{2,4}->{1,3},{3,4}->{1,2}}];
s2[{i_,j_}]:=s[i,j]
s3 = Table[s2[list2[[i]]],{i,3}];
c = {-1,1};
table = Table[Table[Table[Table[Table[Chop[c[[i]]s3[[j]]A[[k]]+s3[[l]]A[[r]]],{i,1,2}],{j,1,3}],{k,1,3}],{l,1,3}],{r,1,3}];
pos = Position[table,0];
rel[{i_,j_,k_,l_,r_}]:=c[[r]]*ss[list2[[l]]]Am[list[[k]]]+ss[list2[[j]]]Am[list[[i]]]//.{ss[{1,2}]->s,ss[{1,4}]->t,ss[{1,3}]->u}
rel4pt = Table[rel[pos[[i]]],{i,15}];
finalRel = DeleteCases[DeleteDuplicates[Simplify@rel4pt, FullSimplify[# == #2 || -# == #2] &], 0, Infinity];
finalRel//MatrixForm


(* ::Subsection:: *)
(*Function that gives the 5 pt amplitude with specified negative helicities a, b*)


(*The position function is there because we change the momentum matrix to matcth the order of the input {a,b,c,d}. 
	This gives problem when specifying the helicity since in {g,r} since what would previously be {1,2} could then 
	actually be read as for instance {1,3}.*)
useRandomKinematics[5,1];
referenceFourMomenta = fourMomenta;

k[i_] := referenceFourMomenta[[i]]
\[Eta] = {{1,0,0,0},{0,-1,0,0},{0,0,-1,0},{0,0,0,-1}};
s[i_,j_]:=2 k[i] . \[Eta] . k[j]

Aym5[{g_,r_},{a_,b_,c_,d_,ff_}] :=
	Module[{Am,A,B,s,t,l,q,i,h,f,app},
		l = a;
		q = b;
		i = c;
		h = d;
		s = g;
		t = r;
		f = ff;
		A = Position[{l,q,i,h,f},s]; 
		B = Position[{l,q,i,h,f},t];
			k[i_] := referenceFourMomenta[[i]];
			fourMomenta2 = {k[l],k[q],k[i],k[h],k[f]};
			setupUsingFourMomenta[fourMomenta2];
			Am = If[A[[1]][[1]]<B[[1]][[1]],Insert[Insert[{p,p,p},m,A],m,B],Insert[Insert[{p,p,p},m,B],m,A]];
			app=nAmp[Am[[1]],Am[[2]],Am[[3]],Am[[4]],Am[[5]]];
				Return[app];
];


(*Show of BCJ 5 point*)
Chop[s[1,2]Aym5[{1,2},{2,1,3,4,5}]-s[2,3]Aym5[{1,2},{1,3,2,4,5}]-(s[2,3]+s[2,4])Aym5[{1,2},{1,3,4,2,5}]]
(*Show of U1 decoupling*)
Chop[Aym5[{1,2},{1,2,3,4,5}]+Aym5[{1,2},{1,3,2,4,5}]+Aym5[{1,2},{1,3,4,2,5}]+Aym5[{1,2},{1,3,4,5,2}]]


cy := Permute[#, CyclicGroup[Length@#]] &
list = Complement[Permutations[Range[5]], cy[Range@5]];
newList = Map[Function[x, RotateLeft[x, Position[x, 1][[1, 1]] - 1]], list];
newList = DeleteDuplicates[newList];
removeReversedDuplicates[lst_] :=
  DeleteDuplicates[    lst,    First[#1] == First[#2] && Reverse[Rest[#1]] == Rest[#2] &
  ]
list3 = removeReversedDuplicates[newList];


Permutations[{2,3,4}]


(*list2 = {{1,2},{1,3},{1,4},{1,5},{2,3}};*)
list2 = DeleteDuplicates[Subsets[{1, 2, 3, 4, 5}, {2}]];
list3 = {{1,2,3,4,5},{1,2,4,3,5},{1,3,2,4,5},{1,3,4,2,5},{1,4,2,3,5},{1,4,3,2,5}};
M = Length[list2];
L = Length[list3];
A = Table[Aym5[{1,2},list3[[i]]],{i,L}];
s2[{i_,j_}]:=s[i,j]
s3 = Table[s2[list2[[i]]],{i,M}];
c1 = {-1,1};
c2 = {-1,1};
c3 = {-1,1};


(*Below we test whether there are any 2 term identities. Since the rel5pt table only gives 0, then all the identitiess are trivial*)
table = Table[Table[Table[Table[Table[Table[Chop[c1[[i]]s3[[j]]A[[k]]+c2[[t]]s3[[l]]A[[r]]],{i,1,2}],{j,1,M}],{k,1,L}],{l,1,M}],{r,1,L}],{t,1,2}];
pos = Position[table,0];
rel[{t_,i_,j_,k_,l_,r_}]:=c[[r]]*ss[list2[[l]]]Am[list[[k]]]+c[[t]]ss[list2[[j]]]Am[list[[i]]];
rel5pt = Table[rel[pos[[i]]],{i,240}]//Simplify


(*Below we test whether there are any 3 term identities. Since the rel5pt table is empty, there are no such identities*)
table = Table[Table[Table[Table[Table[Table[Table[Table[Table[Chop[c1[[i]]s3[[j]]A[[k]]+c2[[t]]s3[[l]]A[[r]]+c3[[q]]s3[[s]]A[[p]]],{i,1,2}],{j,1,M}],{k,1,L}],{l,1,M}],{r,1,L}],{t,1,2}],{q,1,2}],{s,1,M}],{p,1,L}];
pos = Position[table,0]


(*Below we test whether there are any 4 term identities.*)
table = Table[Table[Table[Table[Table[Table[Table[Table[Table[Table[Table[Chop[c1[[i]]s3[[j]]A[[k]]+c2[[t]]s3[[l]]A[[r]]+c3[[q]]s3[[s]]A[[p]]+s3[[aa]]A[[bb]]],{i,1,2}],{j,1,M}],{k,1,L}],{l,1,M}],{r,1,L}],{t,1,2}],{q,1,2}],{s,1,M}],{p,1,L}],{aa,1,M}],{bb,1,L}];


pos = Position[table,0];
Length[pos]


rel[{p4_,p3_,p2_,p1_,p0_,t_,i_,j_,k_,l_,r_}]:=c1[[r]]*ss[list2[[l]]]Am[list3[[k]]]+c2[[t]]ss[list2[[j]]]Am[list3[[i]]]+c3[[p0]]ss[list2[[p1]]]Am[list3[[p2]]]+ss[list2[[p3]]]Am[list3[[p4]]]


rel5pt = Simplify[Table[rel[pos[[i]]],{i,Length[pos]}]]//.{(ss[{1,2}]+ss[{1,3}]+ss[{1,4}]+ss[{1,5}])->0,ss[{1,2}]+ss[{2,3}]+ss[{2,4}]+ss[{2,5}]->0,(ss[{1,2}]+ss[{1,3}]+ss[{2,3}]-ss[{4,5}])->0,(ss[{1,2}]+ss[{1,4}]+ss[{2,4}]-ss[{3,5}])->0, (ss[{1,2}]+ss[{1,5}]+ss[{2,5}]-ss[{3,4}])->0,(ss[{1,2}]-ss[{3,4}]-ss[{3,5}]-ss[{4,5}])->0,(ss[{1,3}]+ss[{1,4}]-ss[{2,5}]+ss[{3,4}])->0, (ss[{1,3}]+ss[{1,5}]-ss[{2,4}]+ss[{3,5}])->0, (ss[{1,3}]+ss[{2,3}]+ss[{3,4}]+ss[{3,5}])->0,(ss[{1,3}]-ss[{2,4}]-ss[{2,5}]-ss[{4,5}])->0,(ss[{1,4}]+ss[{1,5}]-ss[{2,3}]+ss[{4,5}])->0,(ss[{1,4}]-ss[{2,3}]-ss[{2,5}]-ss[{3,5}])->0,(ss[{1,4}]+ss[{2,4}]+ss[{3,4}]+ss[{4,5}])->0,(ss[{1,5}]-ss[{2,3}]-ss[{2,4}]-ss[{3,4}])->0,(ss[{1,5}]+ss[{2,5}]+ss[{3,5}]+ss[{4,5}])->0,(-ss[{1,3}]+ss[{2,4}]+ss[{2,5}]+ss[{4,5}])->0,(-ss[{1,2}]+ss[{3,4}]+ss[{3,5}]+ss[{4,5}])->0, (-ss[{1,4}]+ss[{2,3}]+ss[{2,5}]+ss[{3,5}])->0,(-ss[{1,5}]+ss[{2,3}]+ss[{2,4}]+ss[{3,4}])->0,-ss[{1,4}]+ss[{2,5}]->ss[{1,3}]+ss[{3,4}]}//Simplify;
finalRel = DeleteCases[DeleteDuplicates[Simplify@rel5pt, Simplify[# == #2 || -# == #2] &], 0, Infinity];
finalRel//FullSimplify


rel5pt = Simplify[Table[rel[pos[[i]]],{i,Length[pos]}]]//.{(ss[{1,2}]+ss[{1,3}]+ss[{1,4}]+ss[{1,5}])->0,ss[{1,2}]+ss[{2,3}]+ss[{2,4}]+ss[{2,5}]->0,Am[{1,2,3,5,4}]+Am[{1,2,5,3,4}]+Am[{1,2,5,4,3}]+Am[{1,3,2,5,4}]->0}//Simplify;


Length[finalRel]





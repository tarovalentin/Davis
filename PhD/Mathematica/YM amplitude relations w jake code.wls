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


DeleteDuplicates[Simplify@rel4pt, FullSimplify[# == #2 || -# == #2] &]


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


DeleteDuplicates[Simplify@rel4pt, FullSimplify[# == #2 || -# == #2] &]

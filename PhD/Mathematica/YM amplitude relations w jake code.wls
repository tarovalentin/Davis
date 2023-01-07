#!/usr/bin/env wolframscript
(* ::Package:: *)

ClearAll["Global`*"]
SetDirectory[NotebookDirectory[]];
<<bcfw.m


(* ::Subsection:: *)
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


Aym4[{1,2},{1,2,3,4}]
Aym4[{1,2},{1,3,2,4}]


AA = 4
BB = 2
If[AA>BB,Print[1],Print[2]]


(*Show of U1 decoupling*)
Chop[Aym4[{1,2},{1,2,3,4}]+Aym4[{1,2},{1,3,2,4}]+Aym4[{1,2},{1,3,4,2}]]


Aym4[{1,2},{1,2,3,4}]


c = {-1,1};
table = Table[Table[Table[Table[Table[Chop[c[[i]]s3[[j]]A[[k]]+s3[[l]]A[[r]]],{i,1,2}],{j,1,3}],{k,1,3}],{l,1,3}],{r,1,3}];
pos = Position[table,0]
-1*ss[list2[[1]]]Am[list[[2]]]+ss[list2[[3]]]Am[list[[1]]]//.{ss[{1,2}]->s,ss[{1,4}]->t,ss[{1,3}]->u}
-1*ss[list2[[3]]]Am[list[[20]]]+ss[list2[[2]]]Am[list[[1]]]


rel[{i_,j_,k_,l_,r_}]:=c[[r]]*ss[list2[[l]]]Am[list[[k]]]+ss[list2[[j]]]Am[list[[i]]]//.{ss[{1,2}]->s,ss[{1,4}]->t,ss[{1,3}]->u}


Table[rel[pos[[i]]],{i,15}]//MatrixForm


(*Show of KLT relation*)
Chop[(s[1,4]Aym4[{1,2},{1,2,3,4}])-(s[1,3]Aym4[{1,2},{1,2,4,3}])]





cy := Permute[#, CyclicGroup[Length@#]] &
cy[Range@4];
list = Complement[Permutations[Range[4]], cy[Range@4]];
list3 = {{1,2,4,3},{1,3,2,4},{1,2,3,4}};
A = Table[Aym4[{1,2},list3[[i]]],{i,3}];
list2 = DeleteDuplicates[Subsets[{1, 2, 3, 4}, {2}]//.{{2,3}->{1,4},{2,4}->{1,3},{3,4}->{1,2}}]
s2[{i_,j_}]:=s[i,j]
s3 = Table[s2[list2[[i]]],{i,3}];


list = {{1, 2, 4, 3}, {1, 3, 2, 4}, {1, 3, 4, 2}, {1, 4, 2, 3}, {1, 4, 3, 2}, {2, 1, 3, 4}, {2, 1, 4, 3}, {2, 3, 1, 4}, {2, 4, 1, 3}, {2, 4, 3, 1}, {3, 1, 2, 4}, {3, 1, 4, 2}, {3, 2, 1, 4}, {3, 2, 4, 1}, {3, 4, 2, 1}, {4, 1, 3, 2}, {4, 2, 1, 3}, {4, 2, 3, 1}, {4, 3, 1, 2}, {4, 3, 2, 1}};

reorder[lst_] := RotateLeft[lst, -Position[lst, 1][[1, 1]]-1];  (* define reordering function *)

newList = Map[reorder, list];  (* apply reordering function to each sublist *)



list = DeleteDuplicates[{{1, 2, 4, 3}, {1, 3, 2, 4}, {1, 3, 4, 2}, {1, 4, 2, 3}, {1, 4, 3, 2}, {1, 3, 4, 2}, {1, 4, 3, 2}, {1, 4, 3, 2}, {1, 4, 3, 2}, {1, 4, 3, 2}, {1, 2, 4, 3}, {1, 4, 2, 3}, {1, 2, 4, 3}, {1, 4, 2, 3}, {1, 4, 2, 3}, {1, 3, 2, 4}, {1, 2, 3, 4}, {1, 2, 3, 4}, {1, 3, 2, 4}, {1, 3, 2, 4}}]


(* ::InheritFromParent:: *)
(**)


Sum[Aym4[{1,2},list[[i]]],{i,20}]


Aym4[{1,2},list[[1]]]
Aym4[{1,2},list[[3]]]


s = {s12, s23};
c = {-1, 0, 1};
A = {a1234, a1324, a1243};

For[i,i<3,res = A[[1]]s[[i]],Print[res]]

table//MatrixForm






list[[1]]
list[[9]]






cy := Permute[#, CyclicGroup[Length@#]] &
cy[Range@4]
list = Complement[Permutations[Range[4]], cy[Range@4]]
list = DeleteDuplicates[list, Sort[#1] == Sort[#2] &]


(* Generate all permutations of {1, 2, 3, 4} *)
perms = Permutations[{1, 2, 3, 4}]

(* Remove cyclic permutations *)
perms = Select[perms, !CyclicPermutationQ[#] &]

(* Remove permutations related by reflection *)
perms = Select[perms, !ReflectionPermutationQ[#] &]

(* Define helper functions for CyclicPermutationQ and ReflectionPermutationQ *)
CyclicPermutationQ[perm_] := Length[perm] == Length[Union[perm]]
ReflectionPermutationQ[perm_] := perm == Reverse[perm]






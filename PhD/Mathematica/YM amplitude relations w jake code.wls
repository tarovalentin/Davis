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


A = {2.3674499646865494` -3.0706851592090367` I,-3.1902351970258187`+ 4.137873247593859` I,0.8227852323392706` -1.067188088384824` I}
s3 = {1451727481/1185921,-(1007337730063609/3190670641818),-(35783630679169/39390995578)}
c = {-1,1};
table = Table[Table[Table[Table[Table[Chop[c[[i]]s3[[j]]A[[k]]+s3[[l]]A[[r]]],{i,1,2}],{j,1,3}],{k,1,3}],{l,1,3}],{r,1,3}];
pos = Position[table,0];
rel[{i_,j_,k_,l_,r_}]:=c[[r]]*ss[list2[[l]]]Am[list[[k]]]+ss[list2[[j]]]Am[list[[i]]]//.{ss[{1,2}]->s,ss[{1,4}]->t,ss[{1,3}]->u}
rel4pt = Table[rel[pos[[i]]],{i,15}];
finalRel = DeleteCases[DeleteDuplicates[Simplify@rel4pt, Simplify[# == #2 || -# == #2] &], 0, Infinity];


(* ::InheritFromParent:: *)
(**)


(* ::Subsection::Closed:: *)
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


list1 =  DeleteDuplicates[Subsets[{1, 2, 3, 4, 5}, {2}]]
list2 = {{1,2},{1,3},{1,4},{1,5},{2,3}};
list3 = {{1,3,2,4,5},{1,3,4,2,5}};
M = Length[list2];
L = Length[list3];
A = Table[Aym5[{1,2},list3[[i]]],{i,L}];
s2[{i_,j_}]:=s[i,j]//N
s3 = Table[s2[list2[[i]]],{i,M}];
c = {-1,1};


A = Table[Table[Aym5[list1[[j]],list3[[i]]],{i,L}],{j,Length[list1]}]//Flatten;


x = Table[c[[i]]s3[[j]]A[[k]],{i,1,2},{j,1,5},{k,1,Length[A]}]//Flatten;


(*Below we test whether there are any 2 term identities. Since the rel5pt table only gives 0, then all the identitiess are trivial*)
table = Table[Table[Chop[x[[i]]+x[[j]]],{i,1,Length[x]}],{j,1,Length[x]}];
pos = Position[table,0];
Length[pos]-Length[x]

(*Below we test whether there are any 3 term identities. Since the rel5pt table only gives 0, then all the identitiess are trivial*)
table = Table[Table[Table[Chop[x[[i]]+x[[j]]+x[[k]]],{i,1,Length[x]}],{j,1,Length[x]}],{k,1,Length[x]}];
pos = Position[table,0];
number = AbsoluteTiming[Count[table,0]];
Length[pos]-Length[x]


(*Below we test whether there are any 2 term identities. Since the rel5pt table only gives 0, then all the identitiess are trivial*)
table = Table[Table[Table[Table[Table[Table[Chop[c[[i]]s3[[j]]A[[k]]+c[[t]]s3[[l]]A[[r]]],{i,1,2}],{j,1,M}],{k,1,L}],{t,1,2}],{l,1,M}],{r,1,L}];
pos = Position[table,0];
TensorRank[table];
rel[{i_,j_,t_,k_,l_,r_}]:=c[[r]]*ss[list2[[l]]]Am[list3[[k]]]+c[[t]]ss[list2[[j]]]Am[list3[[i]]];
rel5pt = Table[rel[pos[[i]]],{i,Length[pos]}]//Simplify


(*Below we test whether there are any 2 term identities. Since the rel5pt table only gives 0, then all the identitiess are trivial*)
table = Table[Table[Chop[x[[i]]+x[[j]]],{i,1,20}],{j,1,20}];
pos = Position[table,0];
Length[pos]-Length[x]


(*Below we test whether there are any 2 term identities. Since the rel5pt table only gives 0, then all the identitiess are trivial*)
table = Table[Table[Table[Chop[x[[i]]+x[[j]]+x[[k]]],{i,1,20}],{j,1,20}],{k,1,20}];
pos = Position[table,0];
Length[pos]-Length[x]


(*Below we test whether there are any 2 term identities. Since the rel5pt table only gives 0, then all the identitiess are trivial*)
table = Table[Table[Table[Table[Chop[x[[i]]+x[[j]]+x[[k]]+x[[l]]],{i,1,20}],{j,1,20}],{k,1,20}],{k,1,20}];
pos = Position[table,0];
Length[pos]-Length[x]


pos = Position[table,0];
TensorRank[table];
rel[{i_,j_,t_,k_,l_,r_}]:=c[[r]]*ss[list2[[l]]]Am[list3[[k]]]+c[[t]]ss[list2[[j]]]Am[list3[[i]]];
rel5pt = Table[rel[pos[[i]]],{i,Length[pos]}]//Simplify


(*Below we test whether there are any 4 term identities.*)
table = Chop[Table[Table[Table[Table[Table[Table[Table[Table[Table[Table[Table[Table[c1[[i]]s3[[j]]A[[k]]+c2[[t]]s3[[l]]A[[r]]+c3[[q]]s3[[s]]A[[p]]+c1[[aa]]s3[[bb]]A[[cc]],{i,1,2}],{j,1,M}],{k,1,L}],{l,1,M}],{r,1,L}],{t,1,2}],{q,1,2}],{s,1,M}],{p,1,L}],{aa,1,2}],{bb,1,M}],{cc,1,L}]];


(*Below we test whether there are any 4 term identities.*)
table = Chop[Table[Table[Table[Table[x[[i]]+x[[j]]+x[[k]]+x[[l]],{i,1,60}],{j,1,60}],{k,1,60}],{l,1,60}]];


t2 = Flatten[table];


Length[t2]


t2[[4]]


pos = Position[table,0];
Length[pos]


pos = Position[table,0];
Length[pos];
rel[{p4_,p3_,p2_,p1_,p0_,t_,i_,j_,k_,l_,r_}]:=c1[[r]]*ss[list2[[l]]]Am[list3[[k]]]+c2[[t]]ss[list2[[j]]]Am[list3[[i]]]+c3[[p0]]ss[list2[[p1]]]Am[list3[[p2]]]+ss[list2[[p3]]]Am[list3[[p4]]]
rel5pt = Simplify[Table[rel[pos[[i]]],{i,Length[pos]}]]//.{(ss[{1,2}]+ss[{1,3}]+ss[{1,4}]+ss[{1,5}])->0,ss[{1,2}]+ss[{2,3}]+ss[{2,4}]+ss[{2,5}]->0,(ss[{1,2}]+ss[{1,3}]+ss[{2,3}]-ss[{4,5}])->0,(ss[{1,2}]+ss[{1,4}]+ss[{2,4}]-ss[{3,5}])->0, (ss[{1,2}]+ss[{1,5}]+ss[{2,5}]-ss[{3,4}])->0,(ss[{1,2}]-ss[{3,4}]-ss[{3,5}]-ss[{4,5}])->0,(ss[{1,3}]+ss[{1,4}]-ss[{2,5}]+ss[{3,4}])->0, (ss[{1,3}]+ss[{1,5}]-ss[{2,4}]+ss[{3,5}])->0, (ss[{1,3}]+ss[{2,3}]+ss[{3,4}]+ss[{3,5}])->0,(ss[{1,3}]-ss[{2,4}]-ss[{2,5}]-ss[{4,5}])->0,(ss[{1,4}]+ss[{1,5}]-ss[{2,3}]+ss[{4,5}])->0,(ss[{1,4}]-ss[{2,3}]-ss[{2,5}]-ss[{3,5}])->0,(ss[{1,4}]+ss[{2,4}]+ss[{3,4}]+ss[{4,5}])->0,(ss[{1,5}]-ss[{2,3}]-ss[{2,4}]-ss[{3,4}])->0,(ss[{1,5}]+ss[{2,5}]+ss[{3,5}]+ss[{4,5}])->0,(-ss[{1,3}]+ss[{2,4}]+ss[{2,5}]+ss[{4,5}])->0,(-ss[{1,2}]+ss[{3,4}]+ss[{3,5}]+ss[{4,5}])->0, (-ss[{1,4}]+ss[{2,3}]+ss[{2,5}]+ss[{3,5}])->0,(-ss[{1,5}]+ss[{2,3}]+ss[{2,4}]+ss[{3,4}])->0}//Simplify;
finalRel = DeleteCases[DeleteDuplicates[Simplify@rel5pt, Simplify[# == #2 || -# == #2] &], 0, Infinity];
FullSimplify[finalRel]


(*Below we test whether there are any 5 term identities.*)
table = Table[Table[Table[Table[Table[Table[Table[Table[Table[Table[Table[Table[Table[Table[Chop[c1[[i]]s3[[j]]A[[k]]+c2[[t]]s3[[l]]A[[r]]+c3[[q]]s3[[s]]A[[p]]+c4[[aa]]s3[[bb]]A[[cc]]+s3[[dd]]A[[ee]]],{i,1,2}],{j,1,M}],{k,1,L}],{l,1,M}],{r,1,L}],{t,1,2}],{q,1,2}],{s,1,M}],{p,1,L}],{aa,1,2}],{bb,1,L}],{cc,1,M}],{dd,1,L}],{ee,1,M}];
pos = Position[table,0];
Length[pos];
rel[{p4_,p3_,p2_,p1_,p0_,t_,i_,j_,k_,l_,r_}]:=c1[[r]]*ss[list2[[l]]]Am[list3[[k]]]+c2[[t]]ss[list2[[j]]]Am[list3[[i]]]+c3[[p0]]ss[list2[[p1]]]Am[list3[[p2]]]+ss[list2[[p3]]]Am[list3[[p4]]]
rel5pt = Simplify[Table[rel[pos[[i]]],{i,Length[pos]}]]//.{(ss[{1,2}]+ss[{1,3}]+ss[{1,4}]+ss[{1,5}])->0,ss[{1,2}]+ss[{2,3}]+ss[{2,4}]+ss[{2,5}]->0,(ss[{1,2}]+ss[{1,3}]+ss[{2,3}]-ss[{4,5}])->0,(ss[{1,2}]+ss[{1,4}]+ss[{2,4}]-ss[{3,5}])->0, (ss[{1,2}]+ss[{1,5}]+ss[{2,5}]-ss[{3,4}])->0,(ss[{1,2}]-ss[{3,4}]-ss[{3,5}]-ss[{4,5}])->0,(ss[{1,3}]+ss[{1,4}]-ss[{2,5}]+ss[{3,4}])->0, (ss[{1,3}]+ss[{1,5}]-ss[{2,4}]+ss[{3,5}])->0, (ss[{1,3}]+ss[{2,3}]+ss[{3,4}]+ss[{3,5}])->0,(ss[{1,3}]-ss[{2,4}]-ss[{2,5}]-ss[{4,5}])->0,(ss[{1,4}]+ss[{1,5}]-ss[{2,3}]+ss[{4,5}])->0,(ss[{1,4}]-ss[{2,3}]-ss[{2,5}]-ss[{3,5}])->0,(ss[{1,4}]+ss[{2,4}]+ss[{3,4}]+ss[{4,5}])->0,(ss[{1,5}]-ss[{2,3}]-ss[{2,4}]-ss[{3,4}])->0,(ss[{1,5}]+ss[{2,5}]+ss[{3,5}]+ss[{4,5}])->0,(-ss[{1,3}]+ss[{2,4}]+ss[{2,5}]+ss[{4,5}])->0,(-ss[{1,2}]+ss[{3,4}]+ss[{3,5}]+ss[{4,5}])->0, (-ss[{1,4}]+ss[{2,3}]+ss[{2,5}]+ss[{3,5}])->0,(-ss[{1,5}]+ss[{2,3}]+ss[{2,4}]+ss[{3,4}])->0}//Simplify;
finalRel = DeleteCases[DeleteDuplicates[Simplify@rel5pt, Simplify[# == #2 || -# == #2] &], 0, Infinity];
FullSimplify[finalRel]


(* ::Subsection:: *)
(*Function that gives the 6 pt amplitude with specified negative helicities a, b, c*)


(*The position function is there because we change the momentum matrix to matcth the order of the input {a,b,c,d}. 
	This gives problem when specifying the helicity since in {g,r} since what would previously be {1,2} could then 
	actually be read as for instance {1,3}.*)
useRandomKinematics[6,1];
referenceFourMomenta = fourMomenta;

k[i_] := referenceFourMomenta[[i]]
\[Eta] = {{1,0,0,0},{0,-1,0,0},{0,0,-1,0},{0,0,0,-1}};
s[i_,j_]:=2 k[i] . \[Eta] . k[j]

Aym6[{g_,r_},{a_,b_,c_,d_,ff_,ee_}] :=
	Module[{Am,A,B,s,t,l,q,i,h,f,a1,app},
		l = a;
		q = b;
		i = c;
		h = d;
		s = g;
		t = r;
		f = ff;
		a1 = ee;
		A = Position[{l,q,i,h,f,a1},s]; 
		B = Position[{l,q,i,h,f,a1},t];
			k[i_] := referenceFourMomenta[[i]];
			fourMomenta2 = {k[l],k[q],k[i],k[h],k[f],k[a1]};
			setupUsingFourMomenta[fourMomenta2];
			Am = If[A[[1]][[1]]<B[[1]][[1]],Insert[Insert[{p,p,p,p},m,A],m,B],Insert[Insert[{p,p,p,p},m,B],m,A]];
			app=nAmp[Am[[1]],Am[[2]],Am[[3]],Am[[4]],Am[[5]],Am[[6]]];
				Return[app];
];
Aym62[{g_,r_,r2_},{a_,b_,c_,d_,ff_,ee_}] :=
	Module[{Am,A,B,G,s,t,l,q,i,h,f,a1,u,app},
		l = a;
		q = b;
		i = c;
		h = d;
		s = g;
		t = r;
		f = ff;
		a1 = ee;
		u = r2;
		A = Position[{l,q,i,h,f,a1},s]; 
		B = Position[{l,q,i,h,f,a1},t];
		G = Position[{l,q,i,h,f,a1},u];
			k[i_] := referenceFourMomenta[[i]];
			fourMomenta2 = {k[l],k[q],k[i],k[h],k[f],k[a1]};
			setupUsingFourMomenta[fourMomenta2];
			sorted = Sort[{A[[1]][[1]], B[[1]][[1]], G[[1]][[1]]}];
            Am = Insert[Insert[Insert[{p, p, p}, m, sorted[[1]]], m, sorted[[2]]], m, sorted[[3]]];
			app=nAmp[Am[[1]],Am[[2]],Am[[3]],Am[[4]],Am[[5]],Am[[6]]];
				Return[app];
];


(*Show of U1 decoupling*)
Chop[Aym62[{1,2,3},{1,2,3,4,5,6}]+Aym62[{1,2,3},{1,3,2,4,5,6}]+Aym62[{1,2,3},{1,3,4,2,5,6}]+Aym62[{1,2,3},{1,3,4,5,2,6}]+Aym62[{1,2,3},{1,3,4,5,6,2}]]


(*list1 is a list of all 2 element subsets of 123456*)
list1 =  DeleteDuplicates[Subsets[{1, 2, 3, 4, 5, 6}, {2}]];
(*list2 is all minimal basis list of 2 point mandelstams:*)
list2 = {{1,2},{1,3},{1,4},{1,5},{2,3},{2,4},{2,5},{3,4},{3,5},{4,5}};
(*list3 is all minimal basis list 6 point color ordered apmplitudes*)
list3 = {{1,2,3,4,5,6},{1,2,4,3,5,6},{1,2,4,5,3,6},{1,4,2,3,5,6},{1,4,2,5,3,6},{1,4,5,2,3,6}};
(*list4 is a list of all 3 element subsets of 123456*)
list4 =  DeleteDuplicates[Subsets[{1, 2, 3, 4, 5, 6}, {3}]];
M = Length[list2];
L = Length[list3];

(*A1 gives mhv amplitudes and A2 gives NMHV amplitudes. By calling A1[[1]] we get the 6 bcj basis elements for a specific helicity configuration,
I.e. A is not a (6 x 35) matrix*)
A1 = Table[Table[Aym6[list1[[j]],list3[[i]]],{i,L}],{j,Length[list1]}];
A2 = Table[Table[Aym62[list4[[j]],list3[[i]]],{i,L}],{j,Length[list4]}];
A = Join[A1,A2];
s2[{i_,j_}]:=s[i,j]//N
s3 = Table[s2[list2[[i]]],{i,M}];
c = {-1,1};

(*Below we define a table y with dimensions 35x120, where each Subscript[y, i] are all combinations of s,c, and A for a specific helicity configuration*)
x[r_] := Table[c[[i]]s3[[j]]A[[r]][[k]],{i,1,2},{j,1,Length[s3]},{k,1,Length[A[[1]]]}]//Flatten;
y = Table[x[i],{i,Length[A]}];


(*Test for 1,2,3 config*)
(*Below we test whether there are any 2 term identities*)
z = y[[16]];
table = Table[Chop[z[[i]]+z[[j]]],{i,1,Length[z]},{j,1,Length[z]}];
table1 = table//Flatten;
pos = Count[table1,0];
Print["# of two term identities: ", pos-Length[z]]
(*Below we test whether there are any 3 term identities*)
table = Table[Chop[z[[i]]+z[[j]]+z[[l]]],{i,1,Length[z]},{j,1,Length[z]},{l,1,Length[z]}];
table1 = table//Flatten;
pos = Count[table1,0];
Print["# of three term identities: ", If[pos-Length[z]<0,0,pos-Length[z]]]
(*Below we test whether there are any 4 term identities*)



table = Table[Chop[z[[i]]+z[[j]]+z[[l]]+z[[r]]],{i,1,Length[z]},{j,1,Length[z]},{l,1,Length[z]},{r,1,Length[z]}];
table1 = table//Flatten;
pos = Count[table1,0];
Print["# of four term identities: ", If[pos-Length[z]<0,0,pos-Length[z]<0]]


(*Below we test whether there are any 2 term identities*)
table = Table[Chop[y[[k]][[i]]+y[[k]][[j]]],{k,1,Length[y]},{i,1,Length[y[[1]]]},{j,1,Length[y[[1]]]}];
table1 = table//Flatten;
pos = Count[table1,0];
pos-Length[y[[1]]]*Length[y]


(*Below we test whether there are any 3 term identities*)
table = Table[Chop[y[[k]][[i]]+y[[k]][[j]]+y[[k]][[l]]],{k,1,Length[y]},{i,1,Length[y[[1]]]},{j,1,Length[y[[1]]]},{l,1,Length[y[[1]]]}];
table1 = table//Flatten;
pos = Count[table1,0];
pos-Length[y[[1]]]*Length[y]


(*Below we test whether there are any 3 term identities*)
table = Table[Chop[y[[k]][[i]]+y[[k]][[j]]+y[[k]][[l]]],{k,1,Length[y]},{i,1,Length[y[[1]]]},{j,1,Length[y[[1]]]},{l,1,Length[y[[1]]]}];
table1 = table//Flatten;
pos = Count[table1,0];
pos-Length[y[[1]]]*Length[y]


table


(*Below we test whether there are any 3 term identities. Since the rel5pt table only gives 0, then all the identitiess are trivial*)
table = Table[Table[Table[Chop[x[[i]]+x[[j]]+x[[k]]],{i,1,Length[x]}],{j,1,Length[x]}],{k,1,Length[x]}];
pos = Count[table,0];
pos-Length[x]


(*Below we test whether there are any 2 term identities. Since the rel5pt table only gives 0, then all the identitiess are trivial*)
table = Table[Table[Table[Table[Table[Table[Chop[c[[i]]s3[[j]]A[[k]]+c[[t]]s3[[l]]A[[r]]],{i,1,2}],{j,1,M}],{k,1,L}],{t,1,2}],{l,1,M}],{r,1,L}];
pos = Position[table,0];
TensorRank[table];
rel[{i_,j_,t_,k_,l_,r_}]:=c[[r]]*ss[list2[[l]]]Am[list3[[k]]]+c[[t]]ss[list2[[j]]]Am[list3[[i]]];
rel5pt = Table[rel[pos[[i]]],{i,Length[pos]}]//Simplify


(*Below we test whether there are any 2 term identities. Since the rel5pt table only gives 0, then all the identitiess are trivial*)
table = Table[Table[Chop[x[[i]]+x[[j]]],{i,1,20}],{j,1,20}];
pos = Position[table,0];
Length[pos]-Length[x]


(*Below we test whether there are any 2 term identities. Since the rel5pt table only gives 0, then all the identitiess are trivial*)
table = Table[Table[Table[Chop[x[[i]]+x[[j]]+x[[k]]],{i,1,20}],{j,1,20}],{k,1,20}];
pos = Position[table,0];
Length[pos]-Length[x]


(*Below we test whether there are any 2 term identities. Since the rel5pt table only gives 0, then all the identitiess are trivial*)
table = Table[Table[Table[Table[Chop[x[[i]]+x[[j]]+x[[k]]+x[[l]]],{i,1,20}],{j,1,20}],{k,1,20}],{k,1,20}];
pos = Position[table,0];
Length[pos]-Length[x]


pos = Position[table,0];
TensorRank[table];
rel[{i_,j_,t_,k_,l_,r_}]:=c[[r]]*ss[list2[[l]]]Am[list3[[k]]]+c[[t]]ss[list2[[j]]]Am[list3[[i]]];
rel5pt = Table[rel[pos[[i]]],{i,Length[pos]}]//Simplify


(*Below we test whether there are any 4 term identities.*)
table = Chop[Table[Table[Table[Table[Table[Table[Table[Table[Table[Table[Table[Table[c1[[i]]s3[[j]]A[[k]]+c2[[t]]s3[[l]]A[[r]]+c3[[q]]s3[[s]]A[[p]]+c1[[aa]]s3[[bb]]A[[cc]],{i,1,2}],{j,1,M}],{k,1,L}],{l,1,M}],{r,1,L}],{t,1,2}],{q,1,2}],{s,1,M}],{p,1,L}],{aa,1,2}],{bb,1,M}],{cc,1,L}]];


(*Below we test whether there are any 4 term identities.*)
table = Chop[Table[Table[Table[Table[x[[i]]+x[[j]]+x[[k]]+x[[l]],{i,1,60}],{j,1,60}],{k,1,60}],{l,1,60}]];


t2 = Flatten[table];


Length[t2]


t2[[4]]


pos = Position[table,0];
Length[pos]


pos = Position[table,0];
Length[pos];
rel[{p4_,p3_,p2_,p1_,p0_,t_,i_,j_,k_,l_,r_}]:=c1[[r]]*ss[list2[[l]]]Am[list3[[k]]]+c2[[t]]ss[list2[[j]]]Am[list3[[i]]]+c3[[p0]]ss[list2[[p1]]]Am[list3[[p2]]]+ss[list2[[p3]]]Am[list3[[p4]]]
rel5pt = Simplify[Table[rel[pos[[i]]],{i,Length[pos]}]]//.{(ss[{1,2}]+ss[{1,3}]+ss[{1,4}]+ss[{1,5}])->0,ss[{1,2}]+ss[{2,3}]+ss[{2,4}]+ss[{2,5}]->0,(ss[{1,2}]+ss[{1,3}]+ss[{2,3}]-ss[{4,5}])->0,(ss[{1,2}]+ss[{1,4}]+ss[{2,4}]-ss[{3,5}])->0, (ss[{1,2}]+ss[{1,5}]+ss[{2,5}]-ss[{3,4}])->0,(ss[{1,2}]-ss[{3,4}]-ss[{3,5}]-ss[{4,5}])->0,(ss[{1,3}]+ss[{1,4}]-ss[{2,5}]+ss[{3,4}])->0, (ss[{1,3}]+ss[{1,5}]-ss[{2,4}]+ss[{3,5}])->0, (ss[{1,3}]+ss[{2,3}]+ss[{3,4}]+ss[{3,5}])->0,(ss[{1,3}]-ss[{2,4}]-ss[{2,5}]-ss[{4,5}])->0,(ss[{1,4}]+ss[{1,5}]-ss[{2,3}]+ss[{4,5}])->0,(ss[{1,4}]-ss[{2,3}]-ss[{2,5}]-ss[{3,5}])->0,(ss[{1,4}]+ss[{2,4}]+ss[{3,4}]+ss[{4,5}])->0,(ss[{1,5}]-ss[{2,3}]-ss[{2,4}]-ss[{3,4}])->0,(ss[{1,5}]+ss[{2,5}]+ss[{3,5}]+ss[{4,5}])->0,(-ss[{1,3}]+ss[{2,4}]+ss[{2,5}]+ss[{4,5}])->0,(-ss[{1,2}]+ss[{3,4}]+ss[{3,5}]+ss[{4,5}])->0, (-ss[{1,4}]+ss[{2,3}]+ss[{2,5}]+ss[{3,5}])->0,(-ss[{1,5}]+ss[{2,3}]+ss[{2,4}]+ss[{3,4}])->0}//Simplify;
finalRel = DeleteCases[DeleteDuplicates[Simplify@rel5pt, Simplify[# == #2 || -# == #2] &], 0, Infinity];
FullSimplify[finalRel]


(*Below we test whether there are any 5 term identities.*)
table = Table[Table[Table[Table[Table[Table[Table[Table[Table[Table[Table[Table[Table[Table[Chop[c1[[i]]s3[[j]]A[[k]]+c2[[t]]s3[[l]]A[[r]]+c3[[q]]s3[[s]]A[[p]]+c4[[aa]]s3[[bb]]A[[cc]]+s3[[dd]]A[[ee]]],{i,1,2}],{j,1,M}],{k,1,L}],{l,1,M}],{r,1,L}],{t,1,2}],{q,1,2}],{s,1,M}],{p,1,L}],{aa,1,2}],{bb,1,L}],{cc,1,M}],{dd,1,L}],{ee,1,M}];
pos = Position[table,0];
Length[pos];
rel[{p4_,p3_,p2_,p1_,p0_,t_,i_,j_,k_,l_,r_}]:=c1[[r]]*ss[list2[[l]]]Am[list3[[k]]]+c2[[t]]ss[list2[[j]]]Am[list3[[i]]]+c3[[p0]]ss[list2[[p1]]]Am[list3[[p2]]]+ss[list2[[p3]]]Am[list3[[p4]]]
rel5pt = Simplify[Table[rel[pos[[i]]],{i,Length[pos]}]]//.{(ss[{1,2}]+ss[{1,3}]+ss[{1,4}]+ss[{1,5}])->0,ss[{1,2}]+ss[{2,3}]+ss[{2,4}]+ss[{2,5}]->0,(ss[{1,2}]+ss[{1,3}]+ss[{2,3}]-ss[{4,5}])->0,(ss[{1,2}]+ss[{1,4}]+ss[{2,4}]-ss[{3,5}])->0, (ss[{1,2}]+ss[{1,5}]+ss[{2,5}]-ss[{3,4}])->0,(ss[{1,2}]-ss[{3,4}]-ss[{3,5}]-ss[{4,5}])->0,(ss[{1,3}]+ss[{1,4}]-ss[{2,5}]+ss[{3,4}])->0, (ss[{1,3}]+ss[{1,5}]-ss[{2,4}]+ss[{3,5}])->0, (ss[{1,3}]+ss[{2,3}]+ss[{3,4}]+ss[{3,5}])->0,(ss[{1,3}]-ss[{2,4}]-ss[{2,5}]-ss[{4,5}])->0,(ss[{1,4}]+ss[{1,5}]-ss[{2,3}]+ss[{4,5}])->0,(ss[{1,4}]-ss[{2,3}]-ss[{2,5}]-ss[{3,5}])->0,(ss[{1,4}]+ss[{2,4}]+ss[{3,4}]+ss[{4,5}])->0,(ss[{1,5}]-ss[{2,3}]-ss[{2,4}]-ss[{3,4}])->0,(ss[{1,5}]+ss[{2,5}]+ss[{3,5}]+ss[{4,5}])->0,(-ss[{1,3}]+ss[{2,4}]+ss[{2,5}]+ss[{4,5}])->0,(-ss[{1,2}]+ss[{3,4}]+ss[{3,5}]+ss[{4,5}])->0, (-ss[{1,4}]+ss[{2,3}]+ss[{2,5}]+ss[{3,5}])->0,(-ss[{1,5}]+ss[{2,3}]+ss[{2,4}]+ss[{3,4}])->0}//Simplify;
finalRel = DeleteCases[DeleteDuplicates[Simplify@rel5pt, Simplify[# == #2 || -# == #2] &], 0, Infinity];
FullSimplify[finalRel]

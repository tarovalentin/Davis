#!/usr/bin/env wolframscript
(* ::Package:: *)

ClearAll["Global`*"]
SetDirectory[NotebookDirectory[]];
<<bcfw.m

DefNumSH[a_]:=Module[{},Do[
					 lam[i, 1] = RandomInteger[{1,1000}]/RandomInteger[{1,1000}];
					 lam[i, 2] = RandomInteger[{1,100}]/RandomInteger[{1,1000}];
					 lambar[i, 1] = RandomInteger[{1,1000}]/RandomInteger[{1,1000}];
					 lambar[i, 2] = RandomInteger[{1,1000}]/RandomInteger[{1,1000}];
					   ,{i,a-2}];
					   lam[a-1,1]=1;  lam[a,1]=0;
					   lam[a-1,2]=0;  lam[a,2]=1;
					   lambar[a-1,1]=-Sum[lam[i,1]*lambar[i,1],{i,a-2}];
					   lambar[a-1,2]=-Sum[lam[i,1]*lambar[i,2],{i,a-2}];
					   lambar[a,1]=-Sum[lam[i,2]*lambar[i,1],{i,a-2}];
					   lambar[a,2]=-Sum[lam[i,2]*lambar[i,2],{i,a-2}];
					
					(*If[Sum[lam[j,1]lambar[j,1],{j,a}]==0,Print["Momcon"]]*)
					
					]
NSpinHel:={Spaa[a_,b_]:> (lam[a,1]*lam[b,2]-lam[a,2]*lam[b,1]),
			Spbb[a_,b_]:> lambar[a,1]*lambar[b,2]-lambar[a,2]*lambar[b,1],
			s[a_,b_]:> (lam[a,1]lam[b,2]-lam[a,2]lam[b,1])(lambar[b,1]lambar[a,2]-lambar[b,2]lambar[a,1])};


DefNumSH[a_]:=Module[{},Do[
					 lam[i, 1] = RandomReal[{0,1}];
					 lam[i, 2] =RandomReal[{0,1}];
					 lambar[i, 1] =RandomReal[{0,1}];
					 lambar[i, 2] = RandomReal[{0,1}];
					   ,{i,a-2}];
					   lam[a-1,1]=1;  lam[a,1]=0;
					   lam[a-1,2]=0;  lam[a,2]=1;
					   lambar[a-1,1]=-Sum[lam[i,1]*lambar[i,1],{i,a-2}];
					   lambar[a-1,2]=-Sum[lam[i,1]*lambar[i,2],{i,a-2}];
					   lambar[a,1]=-Sum[lam[i,2]*lambar[i,1],{i,a-2}];
					   lambar[a,2]=-Sum[lam[i,2]*lambar[i,2],{i,a-2}];
					
					(*If[Sum[lam[j,1]lambar[j,1],{j,a}]==0,Print["Momcon"]]*)
					
					]
NSpinHel:={Spaa[a_,b_]:> (lam[a,1]*lam[b,2]-lam[a,2]*lam[b,1]),
			Spbb[a_,b_]:> lambar[a,1]*lambar[b,2]-lambar[a,2]*lambar[b,1],
			s[a_,b_]:> (lam[a,1]lam[b,2]-lam[a,2]lam[b,1])(lambar[b,1]lambar[a,2]-lambar[b,2]lambar[a,1])};


(* ::Section:: *)
(*Complex numbers, first attempt.*)


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


(* ::Subsection::Closed:: *)
(*Function that gives the 6 pt amplitude with specified negative helicities a, b, c*)


useRandomKinematics[6]


(*The position function is there because we change the momentum matrix to matcth the order of the input {a,b,c,d}. 
	This gives problem when specifying the helicity since in {g,r} since what would previously be {1,2} could then 
	actually be read as for instance {1,3}.*)
useRandomKinematics[6];
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
list2 = {{1,2},{1,3},{1,4},{1,5},{2,3},{2,4},{2,5},{3,4},{3,5}};
(*list3 is all minimal basis list 6 point color ordered apmplitudes*)
list3 = {{1,2,3,4,5,6},{1,2,4,3,5,6},{1,2,4,5,3,6},{1,4,2,3,5,6},{1,4,2,5,3,6},{1,4,5,2,3,6}};
(*list4 is a list of all 3 element subsets of 123456*)
list4 =  DeleteDuplicates[Subsets[{1, 2, 3, 4, 5, 6}, {3}]];
L = Length[list3];

(*A1 gives mhv amplitudes and A2 gives NMHV amplitudes. By calling A1[[1]] we get the 6 bcj basis elements for a specific helicity configuration,
I.e. A is not a (6 x 35) matrix*)
(*A1 = Table[Table[Aym6[list1[[j]],list3[[i]]],{i,L}],{j,Length[list1]}];
A2 = Table[Table[Aym62[list4[[j]],list3[[i]]],{i,L}],{j,Length[list4]}];
A = Join[A1,A2];
s2[{i_,j_}]:=s[i,j]//N
s3 = Table[s2[list2[[i]]],{i,Length[list2]}];*)

(*Below we define a table y with dimensions 35x120, where each Subscript[y, i] are all combinations of s,c, and A for a specific helicity configuration*)
(*x[r_] := Table[c[[i]]s3[[j]]A[[r]][[k]],{i,1,2},{j,1,Length[s3]},{k,1,Length[A[[1]]]}]//Flatten;
y = Table[x[i],{i,Length[A]}];*)


Mat = {};
A = {};
mandel = {};
ref4 = {};
Do[
n;
useRandomKinematics[6];
referenceFourMomenta = fourMomenta;
k[i_] := referenceFourMomenta[[i]];
s[i_,j_]:=2 k[i] . \[Eta] . k[j];
s2[{i_,j_}]:=s[i,j]//N;
ref4 = Append[ref4,fourMomenta];
A = Append[A,Table[Aym62[{1,2,3},list3[[i]]],{i,Length[list3]}]];
mandel = Append[mandel,Table[s2[list2[[i]]],{i,Length[list2]}]];
Mat = Append[Mat,Table[mandel[[n]][[j]]Aym62[{1,2,3},list3[[i]]],{i,Length[list3]},{j,Length[list2]}]//Flatten],
{n,54}]
MatrixRank[mandel]
MatrixRank[A]
Dimensions[Mat]
nul = ConstantArray[0,54];
Mat2 = Transpose[Append[Transpose[Mat], nul]];
MatrixRank[Mat]


Mat = {};
A = {};
mandel = {};
Do[
n;
useRandomKinematics[6];
referenceFourMomenta = fourMomenta;
A = Append[A,Table[Aym6[{1,2},list3[[i]]],{i,Length[list3]}]];
s2[{i_,j_}]:=s[i,j]//N;
mandel = Append[mandel,Table[s2[list2[[i]]],{i,Length[list2]}]];
Mat = Append[Mat,Table[mandel[[n]][[j]]Aym6[{4,5},list3[[i]]],{i,Length[list3]},{j,Length[list2]}]//Flatten],
{n,55}]
MatrixRank[mandel]
MatrixRank[A]
Dimensions[Mat]
nul = ConstantArray[0,55];
Mat2 = Transpose[Append[Transpose[Mat], nul]];
MatrixRank[Mat2]





A


vec = Table[x[i],{i,1,54}];
sol = vec . Mat;
sols = Solve[vec . Mat==0]


sol[[1]]//.sols//FullSimplify


MatrixRank[mandel]
MatrixRank[A]
Dimensions[Mat]
nul = ConstantArray[0,55];
Mat2 = Transpose[Append[Transpose[Mat], nul]];
MatrixRank[Mat2]





Mat = {};
A = {};
mandel = {};
Do[
n;
useRandomKinematics[6,1];
referenceFourMomenta = fourMomenta;
A = Append[A,Table[Aym62[{1,2,3},list3[[i]]],{i,Length[list3]}]];
s2[{i_,j_}]:=s[i,j]//N;
mandel = Append[mandel,Table[s2[list2[[i]]],{i,Length[list2]}]];
a[i_] := a1[i]mandel[[n]][[1]]+a2[i]mandel[[n]][[2]]+a3[i]mandel[[n]][[3]]+a4[i]mandel[[n]][[4]]+a5[i]mandel[[n]][[5]]+a6[i]mandel[[n]][[6]]+a7[i]mandel[[n]][[7]]+a8[i]mandel[[n]][[8]]+a9[i]mandel[[n]][[9]];
Mat = Append[Mat,Table[a[j]Aym62[{1,2,3},list3[[i]]],{i,Length[list3]},{j,Length[list2]}]//Flatten],
{n,55}]


Dimensions[Mat]
nul = ConstantArray[0,55];
Mat2 = Transpose[Append[Transpose[Mat], nul]];
MatrixRank[Mat2]


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


DefNumSH[a_]:=Module[{},Do[
					 lam[i, 1] = RandomInteger[{1,100}]/RandomInteger[{1,100}];
					 lam[i, 2] = RandomInteger[{1,100}]/RandomInteger[{1,100}];
					 lambar[i, 1] = RandomInteger[{1,100}]/RandomInteger[{1,100}];
					 lambar[i, 2] = RandomInteger[{1,100}]/RandomInteger[{1,100}];
					   ,{i,a-2}];
					   lam[a-1,1]=1;  lam[a,1]=0;
					   lam[a-1,2]=0;  lam[a,2]=1;
					   lambar[a-1,1]=-Sum[lam[i,1]*lambar[i,1],{i,a-2}];
					   lambar[a-1,2]=-Sum[lam[i,1]*lambar[i,2],{i,a-2}];
					   lambar[a,1]=-Sum[lam[i,2]*lambar[i,1],{i,a-2}];
					   lambar[a,2]=-Sum[lam[i,2]*lambar[i,2],{i,a-2}];
					
					If[Sum[lam[j,1]lambar[j,1],{j,a}]==0,Print["Momentum Conserved"]]
					
					]


DefNumSH[6]


DefNumSH[6]
kmat[i_]:=\!\(\*
TagBox[
RowBox[{"(", GridBox[{
{
RowBox[{" ", 
RowBox[{
RowBox[{"lambar", "[", 
RowBox[{"i", ",", "1"}], "]"}], 
RowBox[{"lam", "[", 
RowBox[{"i", ",", "1"}], "]"}]}]}], 
RowBox[{
RowBox[{"lambar", "[", 
RowBox[{"i", ",", "2"}], "]"}], " ", 
RowBox[{"lam", "[", 
RowBox[{"i", ",", "1"}], "]"}]}]},
{
RowBox[{
RowBox[{"lambar", "[", 
RowBox[{"i", ",", "1"}], "]"}], " ", 
RowBox[{"lam", "[", 
RowBox[{"i", ",", "2"}], "]"}]}], 
RowBox[{
RowBox[{"lambar", "[", 
RowBox[{"i", ",", "2"}], "]"}], " ", 
RowBox[{"lam", "[", 
RowBox[{"i", ",", "2"}], "]"}]}]}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "Rows" -> {{Baseline}}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$]]]\)
kmat2 = {({
 { k10+k13, k11-I k12},
 {k11+I k12, k10-k13}
}),({
 { k20+k23, k21-I k22},
 {k21+I k22, k20-k23}
}),({
 { k30+k33, k31-I k32},
 {k31+I k32, k30-k33}
}),({
 { k40+k43, k41-I k42},
 {k41+I k42, k40-k43}
}),({
 { k50+k53, k51-I k52},
 {k51+I k52, k50-k53}
}),({
 { k60+k63, k61-I k62},
 {k61+I k62, k60-k63}
})};
sol[i_]:= Solve[kmat[i]==kmat2[[i]]][[1]]
moms = {{k10,k11,k12,k13},{k20,k21,k22,k23},{k30,k31,k32,k33},{k40,k41,k42,k43},{k50,k51,k52,k53},{k60,k61,k62,k63}}//.sol[1]//.sol[2] //.sol[3] //.sol[4] //.sol[5] //.sol[6]
taro\[Lambda][i_]:={lam[i,1],lam[i,2]}
tarot\[Lambda][i_]:={lambar[i,1],lambar[i,2]}
referenceSpinors={{taro\[Lambda][1],taro\[Lambda][2],taro\[Lambda][3],taro\[Lambda][4],taro\[Lambda][5],taro\[Lambda][6]},{tarot\[Lambda][1],tarot\[Lambda][2],tarot\[Lambda][3],tarot\[Lambda][4],tarot\[Lambda][5],tarot\[Lambda][6]}}


setupUsingSpinors[referenceSpinors];
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
		ref2 = {{taro\[Lambda][l],taro\[Lambda][q],taro\[Lambda][i],taro\[Lambda][h],taro\[Lambda][f],taro\[Lambda][a1]},{tarot\[Lambda][l],tarot\[Lambda][q],tarot\[Lambda][i],tarot\[Lambda][h],tarot\[Lambda][f],tarot\[Lambda][a1]}};		
		setupUsingSpinors[ref2];
			Am = If[A[[1]][[1]]<B[[1]][[1]],Insert[Insert[{p,p,p,p},m,A],m,B],Insert[Insert[{p,p,p,p},m,B],m,A]];
			app=nAmp[Am[[1]],Am[[2]],Am[[3]],Am[[4]],Am[[5]],Am[[6]]];
				Return[app];
];


NSpinHel:={Spaa[a_,b_]:> (lam[a,1]*lam[b,2]-lam[a,2]*lam[b,1]),
			Spbb[a_,b_]:> lambar[a,1]*lambar[b,2]-lambar[a,2]*lambar[b,1],
			s[a_,b_]:> (lam[a,1]lam[b,2]-lam[a,2]lam[b,1])(lambar[b,1]lambar[a,2]-lambar[b,2]lambar[a,1])};
Aym6[{1,2},{1,3,2,4,5,6}]
Spaa[1,2]^4/(Spaa[1,3]Spaa[3,2]Spaa[2,4]Spaa[4,5]Spaa[5,6]Spaa[6,1])//.NSpinHel


Chop[Aym6[{1,2},{1,2,3,4,5,6}]+Aym6[{1,2},{1,3,2,4,5,6}]+Aym6[{1,2},{1,3,4,2,5,6}]+Aym6[{1,2},{1,3,4,5,2,6}]+Aym6[{1,2},{1,3,4,5,6,2}]]


(*The position function is there because we change the momentum matrix to matcth the order of the input {a,b,c,d}. 
	This gives problem when specifying the helicity since in {g,r} since what would previously be {1,2} could then 
	actually be read as for instance {1,3}.*)
setupUsingFourMomenta[moms,1];

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


Chop[Aym6[{1,2},{1,2,3,4,5,6}]]


(* ::Input:: *)
(*-((4.720198464634531` +0.` I)/\[Lambda][2]^2)*)


{{0,{0.35`,0.1568627450980392`}},{2.711088342345192`,1.21505359881017`}}//MatrixForm


Chop[Aym62[{1,2,3},{1,2,3,4,5,6}]+Aym62[{1,2,3},{1,3,2,4,5,6}]+Aym62[{1,2,3},{1,3,4,2,5,6}]+Aym62[{1,2,3},{1,3,4,5,2,6}]+Aym62[{1,2,3},{1,3,4,5,6,2}]]


taro\[Lambda][i_]:={lam[i,1],lam[i,2]}
tarot\[Lambda][i_]:={lambar[i,1],lambar[i,2]}
referenceSpinors={{\[Lambda][1],\[Lambda][2],\[Lambda][3],\[Lambda][4],\[Lambda][5],\[Lambda][6]},{t\[Lambda][1],t\[Lambda][2],t\[Lambda][3],t\[Lambda][4],t\[Lambda][5],t\[Lambda][6]}}


referenceSpinors={{{4,2},{4,-1},{-3,0},{-2,4},{-5,6},{5,0},{4,-4},{-6,2}},{{1/24,37/120},{5/12,-(7/12)},{7/18,-(5/6)},{-(2/3),-(1/4)},{1/3,-(1/15)},{1/12,-(13/150)},{-(9/32),3/20},{-(1/16),2/5}}};





\[Lambda][1]


useRandomKinematics[6]


setupUsingSpinors[referenceSpinors]


fourMomenta


Sum[moms[[i]],{i,6}]



moms


s


(* ::Section:: *)
(*Real numbers corrected.*)


(* ::Subsection::Closed:: *)
(*Function that gives the 5 pt amplitude with specified negative helicities a, b (with real numbers)*)


DefNumSH[5];
taro\[Lambda][i_]:={lam[i,1],lam[i,2]};
tarot\[Lambda][i_]:={lambar[i,1],lambar[i,2]};
referenceSpinors={{taro\[Lambda][1],taro\[Lambda][2],taro\[Lambda][3],taro\[Lambda][4],taro\[Lambda][5]},{tarot\[Lambda][1],tarot\[Lambda][2],tarot\[Lambda][3],tarot\[Lambda][4],tarot\[Lambda][5]}};
s2[{i_,j_}]:=s[i,j]//.NSpinHel;
setupUsingSpinors[referenceSpinors];
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
			ref2 = {{taro\[Lambda][l],taro\[Lambda][q],taro\[Lambda][i],taro\[Lambda][h],taro\[Lambda][f]},{tarot\[Lambda][l],tarot\[Lambda][q],tarot\[Lambda][i],tarot\[Lambda][h],tarot\[Lambda][f]}};		
			setupUsingSpinors[ref2];
			Am = If[A[[1]][[1]]<B[[1]][[1]],Insert[Insert[{p,p,p},m,A],m,B],Insert[Insert[{p,p,p},m,B],m,A]];
			app=nAmp[Am[[1]],Am[[2]],Am[[3]],Am[[4]],Am[[5]]];
				Return[app];
];


(*Show of BCJ 5 point*)
s2[{1,2}]Aym5[{1,2},{2,1,3,4,5}]-s2[{2,3}]Aym5[{1,2},{1,3,2,4,5}]-(s2[{2,3}]+s2[{2,4}])Aym5[{1,2},{1,3,4,2,5}]
(*Show of U1 decoupling*)
Aym5[{1,2},{1,2,3,4,5}]+Aym5[{1,2},{1,3,2,4,5}]+Aym5[{1,2},{1,3,4,2,5}]+Aym5[{1,2},{1,3,4,5,2}]


list2 = {{1,2},{1,3},{1,4},{2,4},{2,3}};
list3 = {{1,3,2,4,5},{1,3,4,2,5}};


Mat = {};
A = {};
mandel = {};
ref4 = {};
Do[
n;
DefNumSH[5];
taro\[Lambda][i_]:={lam[i,1],lam[i,2]};
tarot\[Lambda][i_]:={lambar[i,1],lambar[i,2]};
referenceSpinors={{taro\[Lambda][1],taro\[Lambda][2],taro\[Lambda][3],taro\[Lambda][4],taro\[Lambda][5]},{tarot\[Lambda][1],tarot\[Lambda][2],tarot\[Lambda][3],tarot\[Lambda][4],tarot\[Lambda][5]}};
s2[{i_,j_}]:=s[i,j]//.NSpinHel;
A = Append[A,Table[Aym5[{1,2},list3[[i]]],{i,Length[list3]}]];
mandel = Append[mandel,Table[s2[list2[[i]]],{i,Length[list2]}]];
Mat = Append[Mat,Table[mandel[[n]][[j]]Aym5[{1,2},list3[[i]]],{i,Length[list3]},{j,Length[list2]}]//Flatten],
{n,10}]
MatrixRank[mandel]
MatrixRank[A]
Dimensions[Mat]
MatrixRank[Mat]


(* ::Subsection:: *)
(*Function that gives the 6 pt amplitude with specified negative helicities a, b, c (with real numbers)*)


DefNumSH[6];
taro\[Lambda][i_]:={lam[i,1],lam[i,2]};
tarot\[Lambda][i_]:={lambar[i,1],lambar[i,2]};
referenceSpinors={{taro\[Lambda][1],taro\[Lambda][2],taro\[Lambda][3],taro\[Lambda][4],taro\[Lambda][5],taro\[Lambda][6]},{tarot\[Lambda][1],tarot\[Lambda][2],tarot\[Lambda][3],tarot\[Lambda][4],tarot\[Lambda][5],tarot\[Lambda][6]}};
s2[{i_,j_}]:=s[i,j]//.NSpinHel;

setupUsingSpinors[referenceSpinors];
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
		ref2 = {{taro\[Lambda][l],taro\[Lambda][q],taro\[Lambda][i],taro\[Lambda][h],taro\[Lambda][f],taro\[Lambda][a1]},{tarot\[Lambda][l],tarot\[Lambda][q],tarot\[Lambda][i],tarot\[Lambda][h],tarot\[Lambda][f],tarot\[Lambda][a1]}};		
		setupUsingSpinors[ref2];
			Am = If[A[[1]][[1]]<B[[1]][[1]],Insert[Insert[{p,p,p,p},m,A],m,B],Insert[Insert[{p,p,p,p},m,B],m,A]];
			app=nAmp[Am[[1]],Am[[2]],Am[[3]],Am[[4]],Am[[5]],Am[[6]]];
				Return[app];
]
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
		ref2 = {{taro\[Lambda][l],taro\[Lambda][q],taro\[Lambda][i],taro\[Lambda][h],taro\[Lambda][f],taro\[Lambda][a1]},{tarot\[Lambda][l],tarot\[Lambda][q],tarot\[Lambda][i],tarot\[Lambda][h],tarot\[Lambda][f],tarot\[Lambda][a1]}};		
		setupUsingSpinors[ref2];
		sorted = Sort[{A[[1]][[1]], B[[1]][[1]], G[[1]][[1]]}];
            Am = Insert[Insert[Insert[{p, p, p}, m, sorted[[1]]], m, sorted[[2]]], m, sorted[[3]]];
				app=nAmp[Am[[1]],Am[[2]],Am[[3]],Am[[4]],Am[[5]],Am[[6]]];
				Return[app];
]
(*list1 is a list of all 2 element subsets of 123456*)
list1 =  DeleteDuplicates[Subsets[{1, 2, 3, 4, 5, 6}, {2}]];
(*list2 is all minimal basis list of 2 point mandelstams:*)
list2 = {{1,2},{1,3},{1,4},{1,5},{2,3},{2,4},{2,5},{3,4},{3,5}};
(*list3 is all minimal basis list 6 point color ordered apmplitudes*)
list3 = {{1,2,3,4,5,6},{1,2,4,3,5,6},{1,3,2,4,5,6},{1,3,4,2,5,6},{1,4,2,3,5,6},{1,4,3,2,5,6}};
(*list4 is a list of all 3 element subsets of 123456*)
list4 =  DeleteDuplicates[Subsets[{1, 2, 3, 4, 5, 6}, {3}]];
L = Length[list3];


(* ::Subsubsection::Closed:: *)
(*O(1)*)


Mat = {};
mandel = {};
check = {};
Do[
n;
DefNumSH[6];
taro\[Lambda][i_]:={lam[i,1],lam[i,2]};
tarot\[Lambda][i_]:={lambar[i,1],lambar[i,2]};
referenceSpinors={{taro\[Lambda][1],taro\[Lambda][2],taro\[Lambda][3],taro\[Lambda][4],taro\[Lambda][5],taro\[Lambda][6]},{tarot\[Lambda][1],tarot\[Lambda][2],tarot\[Lambda][3],tarot\[Lambda][4],tarot\[Lambda][5],tarot\[Lambda][6]}};
s2[{i_,j_}]:=s[i,j]//.NSpinHel;
mandel = Append[mandel,Table[s2[list2[[i]]],{i,Length[list2]}]];
Mat = Append[Mat,Table[Aym6[{1,2},list3[[i]]],{i,Length[list3]}]//Flatten],
{n,6}]
Print["Dimensions of NMHV Matrix is: ", Dimensions[Mat]]
Print["Rank of NMHV Matrix is: ",MatrixRank[Mat]]
Export["matrix-s0-mhv.csv",N[Mat,1000]];

Vec = Table[x[i],{i,1,6}];
sys = Vec . Mat;
sols = Solve[sys==0];
sys//.sols[[1]]//Simplify
sols//N;


(* ::Subsubsection::Closed:: *)
(*O(s)*)


Mat = {};
mandel = {};
check = {};
Do[
n;
DefNumSH[6];
taro\[Lambda][i_]:={lam[i,1],lam[i,2]};
tarot\[Lambda][i_]:={lambar[i,1],lambar[i,2]};
referenceSpinors={{taro\[Lambda][1],taro\[Lambda][2],taro\[Lambda][3],taro\[Lambda][4],taro\[Lambda][5],taro\[Lambda][6]},{tarot\[Lambda][1],tarot\[Lambda][2],tarot\[Lambda][3],tarot\[Lambda][4],tarot\[Lambda][5],tarot\[Lambda][6]}};
s2[{i_,j_}]:=s[i,j]//.NSpinHel;
mandel = Append[mandel,Table[s2[list2[[i]]],{i,Length[list2]}]];
Mat = Append[Mat,Table[mandel[[n]][[j]]Aym62[{1,2,3},list3[[i]]],{i,Length[list3]},{j,Length[list2]}]//Flatten],
{n,54}]
Print["Dimensions of NMHV Matrix is: ", Dimensions[Mat]]
Print["Rank of NMHV Matrix is: ",MatrixRank[Mat,Tolerance->10^-10]]
Export["matrix-s1-nmhv.csv",N[Mat,1000]]


Mat = {};
mandel = {};
check = {};
Do[
n;
DefNumSH[6];
taro\[Lambda][i_]:={lam[i,1],lam[i,2]};
tarot\[Lambda][i_]:={lambar[i,1],lambar[i,2]};
referenceSpinors={{taro\[Lambda][1],taro\[Lambda][2],taro\[Lambda][3],taro\[Lambda][4],taro\[Lambda][5],taro\[Lambda][6]},{tarot\[Lambda][1],tarot\[Lambda][2],tarot\[Lambda][3],tarot\[Lambda][4],tarot\[Lambda][5],tarot\[Lambda][6]}};
s2[{i_,j_}]:=s[i,j]//.NSpinHel;
mandel = Append[mandel,Table[s2[list2[[i]]],{i,Length[list2]}]];
Mat = Append[Mat,Table[mandel[[n]][[j]]Aym6[{1,2},list3[[i]]],{i,Length[list3]},{j,Length[list2]}]//Flatten],
{n,54}]
Print["Rank of MHV Matrix is: ",MatrixRank[Mat,Tolerance->10^-20]]
Export["matrix-s1-mhv.csv",N[Mat,1000]]


Min[Abs[Mat]]
Print["Rank of MHV Matrix is: ",MatrixRank[Mat,Tolerance->10^-12]]


Mat = {};
mandel = {};
check = {};
Do[
n;
DefNumSH[6];
taro\[Lambda][i_]:={lam[i,1],lam[i,2]};
tarot\[Lambda][i_]:={lambar[i,1],lambar[i,2]};
referenceSpinors={{taro\[Lambda][1],taro\[Lambda][2],taro\[Lambda][3],taro\[Lambda][4],taro\[Lambda][5],taro\[Lambda][6]},{tarot\[Lambda][1],tarot\[Lambda][2],tarot\[Lambda][3],tarot\[Lambda][4],tarot\[Lambda][5],tarot\[Lambda][6]}};
s2[{i_,j_}]:=s[i,j]//.NSpinHel;
AMHV[{i_,j_},{k_,l_,m_,r_,t_,p_}] := Spaa[i,j]^4/(Spaa[k,l]Spaa[l,m]Spaa[m,r]Spaa[r,t]Spaa[t,p]Spaa[p,k])//.NSpinHel;
mandel = Append[mandel,Table[s2[list2[[i]]],{i,Length[list2]}]];
Mat = Append[Mat,Table[mandel[[n]][[j]]AMHV[{1,2},list3[[i]]],{i,Length[list3]},{j,Length[list2]}]//Flatten],
{n,54}]
Print["Dimensions of NMHV Matrix is: ", Dimensions[Mat]]
Print["Rank of NMHV Matrix is: ",MatrixRank[Mat,Tolerance->10^-1]]
Export["matrix-s1-nmhv.csv",N[Mat,1000]];


(* ::Subsubsection::Closed:: *)
(*O((s^2))*)


Mat = {};
mandel = {};
check = {};
Do[
n;
DefNumSH[6];
taro\[Lambda][i_]:={lam[i,1],lam[i,2]};
tarot\[Lambda][i_]:={lambar[i,1],lambar[i,2]};
referenceSpinors={{taro\[Lambda][1],taro\[Lambda][2],taro\[Lambda][3],taro\[Lambda][4],taro\[Lambda][5],taro\[Lambda][6]},{tarot\[Lambda][1],tarot\[Lambda][2],tarot\[Lambda][3],tarot\[Lambda][4],tarot\[Lambda][5],tarot\[Lambda][6]}};
s2[{i_,j_}]:=s[i,j]//.NSpinHel;
mandel = Append[mandel,Table[s2[list2[[i]]],{i,Length[list2]}]];
Mat = Append[Mat,Table[mandel[[n]][[j]]mandel[[n]][[k]]Aym62[{1,2,3},list3[[i]]],{i,Length[list3]},{j,Length[list2]},{k,j,Length[list2]}]//Flatten],
{n,270}]
Print["Dimensions of MHV Matrix is: ",Dimensions[Mat]]
Export["matrix-s2-nmhv.csv",N[Mat,1000]]


Print["Rank of MHV Matrix is: ",MatrixRank[Mat,Tolerance->10^-25]]


Mat = {};
mandel = {};
check = {};
Do[
n;
DefNumSH[6];
taro\[Lambda][i_]:={lam[i,1],lam[i,2]};
tarot\[Lambda][i_]:={lambar[i,1],lambar[i,2]};
referenceSpinors={{taro\[Lambda][1],taro\[Lambda][2],taro\[Lambda][3],taro\[Lambda][4],taro\[Lambda][5],taro\[Lambda][6]},{tarot\[Lambda][1],tarot\[Lambda][2],tarot\[Lambda][3],tarot\[Lambda][4],tarot\[Lambda][5],tarot\[Lambda][6]}};
s2[{i_,j_}]:=s[i,j]//.NSpinHel;
mandel = Append[mandel,Table[s2[list2[[i]]],{i,Length[list2]}]];
Mat = Append[Mat,Table[mandel[[n]][[j]]mandel[[n]][[k]]Aym6[{1,2},list3[[i]]],{i,Length[list3]},{j,Length[list2]},{k,j,Length[list2]}]//Flatten],
{n,270}]
Print["Dimensions of MHV Matrix is: ",Dimensions[Mat]]
Print["Rank of MHV Matrix is: ",MatrixRank[Mat,Tolerance->10^-50]]
Export["matrix-s2-mhv.csv",Mat]


Print["Rank of MHV Matrix is: ",MatrixRank[Mat,Tolerance->10^-25]]


Mat = {};
mandel = {};
check = {};
Do[
n;
DefNumSH[6];
taro\[Lambda][i_]:={lam[i,1],lam[i,2]};
tarot\[Lambda][i_]:={lambar[i,1],lambar[i,2]};
referenceSpinors={{taro\[Lambda][1],taro\[Lambda][2],taro\[Lambda][3],taro\[Lambda][4],taro\[Lambda][5],taro\[Lambda][6]},{tarot\[Lambda][1],tarot\[Lambda][2],tarot\[Lambda][3],tarot\[Lambda][4],tarot\[Lambda][5],tarot\[Lambda][6]}};
s2[{i_,j_}]:=s[i,j]//.NSpinHel;
AMHV[{i_,j_},{k_,l_,m_,r_,t_,p_}] := Spaa[i,j]^4/(Spaa[k,l]Spaa[l,m]Spaa[m,r]Spaa[r,t]Spaa[t,p]Spaa[p,k])//.NSpinHel;
mandel = Append[mandel,Table[s2[list2[[i]]],{i,Length[list2]}]];
Mat = Append[Mat,Table[mandel[[n]][[j]]mandel[[n]][[k]]AMHV[{1,2},list3[[i]]],{i,Length[list3]},{j,Length[list2]},{k,j,Length[list2]}]//Flatten],
{n,270}]
Print["Dimensions of NMHV Matrix is: ", Dimensions[Mat]]


Export["matrix-s2-mhv.h5", {"Data" -> N[Mat, 100]}, "Datasets"]


Export["matrix-s2-mhv.csv",N[Mat,100]]


(* ::Subsubsection::Closed:: *)
(*O((s^3))*)


Mat = {};
mandel = {};
check = {};
A = {};
Do[
n;
DefNumSH[6];
taro\[Lambda][i_]:={lam[i,1],lam[i,2]};
tarot\[Lambda][i_]:={lambar[i,1],lambar[i,2]};
referenceSpinors={{taro\[Lambda][1],taro\[Lambda][2],taro\[Lambda][3],taro\[Lambda][4],taro\[Lambda][5],taro\[Lambda][6]},{tarot\[Lambda][1],tarot\[Lambda][2],tarot\[Lambda][3],tarot\[Lambda][4],tarot\[Lambda][5],tarot\[Lambda][6]}};
s2[{i_,j_}]:=s[i,j]//.NSpinHel;
mandel = Append[mandel,Table[s2[list2[[i]]],{i,Length[list2]}]];
A = Append[A,Table[Aym6[{1,5},list3[[i]]],{i,Length[list3]}]//Flatten];
check = Append[check,Chop[Aym6[{1,5},{1,2,3,4,5,6}]+Aym6[{1,5},{1,3,2,4,5,6}]+Aym6[{1,5},{1,3,4,2,5,6}]+Aym6[{1,5},{1,3,4,5,2,6}]+Aym6[{1,5},{1,3,4,5,6,2}]]];
Mat = Append[Mat,Table[mandel[[n]][[j]]mandel[[n]][[k]]mandel[[n]][[r]]Aym6[{1,5},list3[[i]]],{i,Length[list3]},{j,Length[list2]},{k,j,Length[list2]},{r,k,Length[list2]}]//Flatten],
{n,990}]
Print["Dimensions of MHV Matrix is: ",Dimensions[Mat]]
Print["Rank of MHV Matrix is: ",MatrixRank[Mat,Tolerance->10^-30]]

Mat = {};
mandel = {};
check = {};
A = {};
Do[
n;
DefNumSH[6];
taro\[Lambda][i_]:={lam[i,1],lam[i,2]};
tarot\[Lambda][i_]:={lambar[i,1],lambar[i,2]};
referenceSpinors={{taro\[Lambda][1],taro\[Lambda][2],taro\[Lambda][3],taro\[Lambda][4],taro\[Lambda][5],taro\[Lambda][6]},{tarot\[Lambda][1],tarot\[Lambda][2],tarot\[Lambda][3],tarot\[Lambda][4],tarot\[Lambda][5],tarot\[Lambda][6]}};
s2[{i_,j_}]:=s[i,j]//.NSpinHel;
mandel = Append[mandel,Table[s2[list2[[i]]],{i,Length[list2]}]];
A = Append[A,Table[Aym6[{1,5},list3[[i]]],{i,Length[list3]}]//Flatten];
check = Append[check,Chop[Aym6[{1,5},{1,2,3,4,5,6}]+Aym6[{1,5},{1,3,2,4,5,6}]+Aym6[{1,5},{1,3,4,2,5,6}]+Aym6[{1,5},{1,3,4,5,2,6}]+Aym6[{1,5},{1,3,4,5,6,2}]]];
Mat = Append[Mat,Table[mandel[[n]][[j]]mandel[[n]][[k]]mandel[[n]][[r]]Aym6[{1,5},list3[[i]]],{i,Length[list3]},{j,Length[list2]},{k,j,Length[list2]},{r,k,Length[list2]}]//Flatten],
{n,990}]
Print["Dimensions of MHV Matrix is: ",Dimensions[Mat]]
Print["Rank of MHV Matrix is: ",MatrixRank[Mat,Tolerance->10^-30]]


Mat = {};
mandel = {};
check = {};
Do[
n;
DefNumSH[6];
taro\[Lambda][i_]:={lam[i,1],lam[i,2]};
tarot\[Lambda][i_]:={lambar[i,1],lambar[i,2]};
referenceSpinors={{taro\[Lambda][1],taro\[Lambda][2],taro\[Lambda][3],taro\[Lambda][4],taro\[Lambda][5],taro\[Lambda][6]},{tarot\[Lambda][1],tarot\[Lambda][2],tarot\[Lambda][3],tarot\[Lambda][4],tarot\[Lambda][5],tarot\[Lambda][6]}};
s2[{i_,j_}]:=s[i,j]//.NSpinHel;
AMHV[{i_,j_},{k_,l_,m_,r_,t_,p_}] := Spaa[i,j]^4/(Spaa[k,l]Spaa[l,m]Spaa[m,r]Spaa[r,t]Spaa[t,p]Spaa[p,k])//.NSpinHel;
mandel = Append[mandel,Table[s2[list2[[i]]],{i,Length[list2]}]];
Mat = Append[Mat,Table[mandel[[n]][[j]]mandel[[n]][[k]]mandel[[n]][[r]]AMHV[{1,2},list3[[i]]],{i,Length[list3]},{j,Length[list2]},{k,j,Length[list2]},{r,k,Length[list2]}]//Flatten],
{n,990}]
Print["Dimensions of NMHV Matrix is: ", Dimensions[Mat]]


Export["matrix-s3-mhv.h5", {"Data" -> N[Mat, 100]}, "Datasets"]
Export["matrix-s3-mhv.csv",N[Mat,100]]


(* ::Subsubsection::Closed:: *)
(*O((s^4))*)


Mat = {};
mandel = {};
check = {};
Do[
n;
DefNumSH[6];
taro\[Lambda][i_]:=N[{lam[i,1],lam[i,2]},100];
tarot\[Lambda][i_]:=N[{lambar[i,1],lambar[i,2]},100];
referenceSpinors={{taro\[Lambda][1],taro\[Lambda][2],taro\[Lambda][3],taro\[Lambda][4],taro\[Lambda][5],taro\[Lambda][6]},{tarot\[Lambda][1],tarot\[Lambda][2],tarot\[Lambda][3],tarot\[Lambda][4],tarot\[Lambda][5],tarot\[Lambda][6]}};
s2[{i_,j_}]:=N[s[i,j]//.NSpinHel,100];
mandel = Append[mandel,Table[s2[list2[[i]]],{i,Length[list2]}]];
Mat = Append[Mat,Table[mandel[[n]][[j]]mandel[[n]][[k]]mandel[[n]][[r]]mandel[[n]][[l]]Aym62[{1,2,3},list3[[i]]],{i,Length[list3]},{j,Length[list2]},{k,j,Length[list2]},{r,k,Length[list2]},{l,r,Length[list2]}]//Flatten],
{n,1980}]
Dimensions[Mat]
MatrixRank[Mat]


Mat = {};
mandel = {};
check = {};
Do[
n;
DefNumSH[6];
taro\[Lambda][i_]:=N[{lam[i,1],lam[i,2]},100];
tarot\[Lambda][i_]:=N[{lambar[i,1],lambar[i,2]},100];
referenceSpinors={{taro\[Lambda][1],taro\[Lambda][2],taro\[Lambda][3],taro\[Lambda][4],taro\[Lambda][5],taro\[Lambda][6]},{tarot\[Lambda][1],tarot\[Lambda][2],tarot\[Lambda][3],tarot\[Lambda][4],tarot\[Lambda][5],tarot\[Lambda][6]}};
s2[{i_,j_}]:=N[s[i,j]//.NSpinHel,100];
mandel = Append[mandel,Table[s2[list2[[i]]],{i,Length[list2]}]];
Mat = Append[Mat,Table[mandel[[n]][[j]]mandel[[n]][[k]]mandel[[n]][[r]]mandel[[n]][[l]]Aym6[{1,2},list3[[i]]],{i,Length[list3]},{j,Length[list2]},{k,j,Length[list2]},{r,k,Length[list2]},{l,r,Length[list2]}]//Flatten],
{n,1980}]
Dimensions[Mat]
Export["matrix-s4-mhv.csv",Mat]


(* ::Subsubsection::Closed:: *)
(*O((s^5))*)


Mat = {};
mandel = {};
check = {};
Do[
n;
DefNumSH[6];
taro\[Lambda][i_]:=N[{lam[i,1],lam[i,2]},100];
tarot\[Lambda][i_]:=N[{lambar[i,1],lambar[i,2]},100];
referenceSpinors={{taro\[Lambda][1],taro\[Lambda][2],taro\[Lambda][3],taro\[Lambda][4],taro\[Lambda][5],taro\[Lambda][6]},{tarot\[Lambda][1],tarot\[Lambda][2],tarot\[Lambda][3],tarot\[Lambda][4],tarot\[Lambda][5],tarot\[Lambda][6]}};
s2[{i_,j_}]:=N[s[i,j]//.NSpinHel,100];
mandel = Append[mandel,Table[s2[list2[[i]]],{i,Length[list2]}]];
Mat = Append[Mat,Table[mandel[[n]][[j]]mandel[[n]][[k]]mandel[[n]][[r]]mandel[[n]][[l]]mandel[[n]][[v]]Aym62[{1,2,3},list3[[i]]],{i,Length[list3]},{j,Length[list2]},{k,j,Length[list2]},{r,k,Length[list2]},{l,r,Length[list2]},{v,l,Length[list2]}]//Flatten],
{n,4752}]
Dimensions[Mat]



Mat = {};
mandel = {};
check = {};
Do[
n;
DefNumSH[6];
taro\[Lambda][i_]:=N[{lam[i,1],lam[i,2]},100];
tarot\[Lambda][i_]:=N[{lambar[i,1],lambar[i,2]},100];
referenceSpinors={{taro\[Lambda][1],taro\[Lambda][2],taro\[Lambda][3],taro\[Lambda][4],taro\[Lambda][5],taro\[Lambda][6]},{tarot\[Lambda][1],tarot\[Lambda][2],tarot\[Lambda][3],tarot\[Lambda][4],tarot\[Lambda][5],tarot\[Lambda][6]}};
s2[{i_,j_}]:=N[s[i,j]//.NSpinHel,100];
mandel = Append[mandel,Table[s2[list2[[i]]],{i,Length[list2]}]];
Mat = Append[Mat,Table[mandel[[n]][[j]]mandel[[n]][[k]]mandel[[n]][[r]]mandel[[n]][[l]]mandel[[n]][[v]]Aym6[{1,2},list3[[i]]],{i,Length[list3]},{j,Length[list2]},{k,j,Length[list2]},{r,k,Length[list2]},{l,r,Length[list2]},{v,l,Length[list2]}]//Flatten],
{n,4752}]
Dimensions[Mat]
Export["matrix-s5-mhv.csv",Mat]


Mat = {};
mandel = {};
check = {};
Do[
n;
DefNumSH[6];
taro\[Lambda][i_]:={lam[i,1],lam[i,2]};
tarot\[Lambda][i_]:={lambar[i,1],lambar[i,2]};
referenceSpinors={{taro\[Lambda][1],taro\[Lambda][2],taro\[Lambda][3],taro\[Lambda][4],taro\[Lambda][5],taro\[Lambda][6]},{tarot\[Lambda][1],tarot\[Lambda][2],tarot\[Lambda][3],tarot\[Lambda][4],tarot\[Lambda][5],tarot\[Lambda][6]}};
s2[{i_,j_}]:=s[i,j]//.NSpinHel;
AMHV[{i_,j_},{k_,l_,m_,r_,t_,p_}] := Spaa[i,j]^4/(Spaa[k,l]Spaa[l,m]Spaa[m,r]Spaa[r,t]Spaa[t,p]Spaa[p,k])//.NSpinHel;
mandel = Append[mandel,Table[s2[list2[[i]]],{i,Length[list2]}]];
Mat = Append[Mat,Table[mandel[[n]][[j]]mandel[[n]][[k]]mandel[[n]][[r]]mandel[[n]][[l]]mandel[[n]][[v]]AMHV[{1,2},list3[[i]]],{i,Length[list3]},{j,Length[list2]},{k,j,Length[list2]},{r,k,Length[list2]},{l,r,Length[list2]},{v,l,Length[list2]}]//Flatten],
{n,7722}]
Print["Dimensions of NMHV Matrix is: ", Dimensions[Mat]]


Export["matrix-s5-mhv.h5", {"Data" -> N[Mat, 100]}, "Datasets"]


(* ::Subsubsection::Closed:: *)
(*O((s^6))*)


Mat = {};
mandel = {};
check = {};
Do[
n;
DefNumSH[6];
taro\[Lambda][i_]:=N[{lam[i,1],lam[i,2]},100];
tarot\[Lambda][i_]:=N[{lambar[i,1],lambar[i,2]},100];
referenceSpinors={{taro\[Lambda][1],taro\[Lambda][2],taro\[Lambda][3],taro\[Lambda][4],taro\[Lambda][5],taro\[Lambda][6]},{tarot\[Lambda][1],tarot\[Lambda][2],tarot\[Lambda][3],tarot\[Lambda][4],tarot\[Lambda][5],tarot\[Lambda][6]}};
s2[{i_,j_}]:=N[s[i,j]//.NSpinHel,100];
mandel = Append[mandel,Table[s2[list2[[i]]],{i,Length[list2]}]];
Mat = Append[Mat,Table[mandel[[n]][[j]]mandel[[n]][[k]]mandel[[n]][[r]]mandel[[n]][[l]]mandel[[n]][[v]]mandel[[n]][[a]]Aym6[{1,2},list3[[i]]],{i,Length[list3]},{j,Length[list2]},{k,j,Length[list2]},{r,k,Length[list2]},{l,r,Length[list2]},{v,l,Length[list2]},{a,v,Length[list2]}]//Flatten],
{n,10296}]
Dimensions[Mat]



Export["matrix-s6-mhv.csv",Mat]


Mat = {};
mandel = {};
check = {};
Do[
n;
DefNumSH[6];
taro\[Lambda][i_]:={lam[i,1],lam[i,2]};
tarot\[Lambda][i_]:={lambar[i,1],lambar[i,2]};
referenceSpinors={{taro\[Lambda][1],taro\[Lambda][2],taro\[Lambda][3],taro\[Lambda][4],taro\[Lambda][5],taro\[Lambda][6]},{tarot\[Lambda][1],tarot\[Lambda][2],tarot\[Lambda][3],tarot\[Lambda][4],tarot\[Lambda][5],tarot\[Lambda][6]}};
s2[{i_,j_}]:=s[i,j]//.NSpinHel;
AMHV[{i_,j_},{k_,l_,m_,r_,t_,p_}] := Spaa[i,j]^4/(Spaa[k,l]Spaa[l,m]Spaa[m,r]Spaa[r,t]Spaa[t,p]Spaa[p,k])//.NSpinHel;
mandel = Append[mandel,Table[s2[list2[[i]]],{i,Length[list2]}]];
Mat = Append[Mat,Table[mandel[[n]][[j]]mandel[[n]][[k]]mandel[[n]][[r]]mandel[[n]][[l]]mandel[[n]][[v]]mandel[[n]][[a]]AMHV[{1,2},list3[[i]]],{i,Length[list3]},{j,Length[list2]},{k,j,Length[list2]},{r,k,Length[list2]},{l,r,Length[list2]},{v,l,Length[list2]},{a,v,Length[list2]}]//Flatten],
{n,18018}]
Print["Dimensions of NMHV Matrix is: ", Dimensions[Mat]]


Export["matrix-s6-mhv.h5", {"Data" -> N[Mat, 100]}, "Datasets"]


(* ::Subsubsection:: *)
(*O((s^7))*)


Mat = {};
mandel = {};
check = {};
Do[
n;
DefNumSH[6];
taro\[Lambda][i_]:=N[{lam[i,1],lam[i,2]},100];
tarot\[Lambda][i_]:=N[{lambar[i,1],lambar[i,2]},100];
referenceSpinors={{taro\[Lambda][1],taro\[Lambda][2],taro\[Lambda][3],taro\[Lambda][4],taro\[Lambda][5],taro\[Lambda][6]},{tarot\[Lambda][1],tarot\[Lambda][2],tarot\[Lambda][3],tarot\[Lambda][4],tarot\[Lambda][5],tarot\[Lambda][6]}};
s2[{i_,j_}]:=N[s[i,j]//.NSpinHel,100];
mandel = Append[mandel,Table[s2[list2[[i]]],{i,Length[list2]}]];
Mat = Append[Mat,Table[mandel[[n]][[j]]mandel[[n]][[k]]mandel[[n]][[r]]mandel[[n]][[l]]mandel[[n]][[v]]mandel[[n]][[a]]mandel[[n]][[b]]Aym6[{1,2},list3[[i]]],{i,Length[list3]},{j,Length[list2]},{k,j,Length[list2]},{r,k,Length[list2]},{l,r,Length[list2]},{v,l,Length[list2]},{a,v,Length[list2]},{b,a,Length[list2]}]//Flatten],
{n,10}]
Dimensions[Mat]


Export["matrix-s6-mhv.csv",N[Mat,1000]]


Mat = {};
mandel = {};
check = {};
Do[
n;
DefNumSH[6];
taro\[Lambda][i_]:={lam[i,1],lam[i,2]};
tarot\[Lambda][i_]:={lambar[i,1],lambar[i,2]};
referenceSpinors={{taro\[Lambda][1],taro\[Lambda][2],taro\[Lambda][3],taro\[Lambda][4],taro\[Lambda][5],taro\[Lambda][6]},{tarot\[Lambda][1],tarot\[Lambda][2],tarot\[Lambda][3],tarot\[Lambda][4],tarot\[Lambda][5],tarot\[Lambda][6]}};
s2[{i_,j_}]:=s[i,j]//.NSpinHel;
AMHV[{i_,j_},{k_,l_,m_,r_,t_,p_}] := Spaa[i,j]^4/(Spaa[k,l]Spaa[l,m]Spaa[m,r]Spaa[r,t]Spaa[t,p]Spaa[p,k])//.NSpinHel;
mandel = Append[mandel,Table[s2[list2[[i]]],{i,Length[list2]}]];
Mat = Append[Mat,Table[mandel[[n]][[j]]mandel[[n]][[k]]mandel[[n]][[r]]mandel[[n]][[l]]mandel[[n]][[v]]mandel[[n]][[a]]mandel[[n]][[b]]AMHV[{1,2},list3[[i]]],{i,Length[list3]},{j,Length[list2]},{k,j,Length[list2]},{r,k,Length[list2]},{l,r,Length[list2]},{v,l,Length[list2]},{a,v,Length[list2]},{b,a,Length[list2]}]//Flatten],
{n,7722}]
Print["Dimensions of NMHV Matrix is: ", Dimensions[Mat]]


5


Export["matrix-s7-mhv-5.h5", {"Data" -> N[Mat, 100]}, "Datasets"]


6


38610/5*2

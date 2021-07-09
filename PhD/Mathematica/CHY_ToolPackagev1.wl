(* ::Package:: *)

(* ::Title:: *)
(*CHY Tool Package*)
(*-By Johannes Agerskov & Taro V. Brown*)


(* ::Section::Closed:: *)
(*Function definitions*)


$CHYfunctions=Sort[{"pt","chyGraph","chyint","id","momentumcon","Pf","rempol","redPsi","red","Psi","chyexp","chygravexp","chyGraphTex","chytolatex"}];
pt::usage="pt[1,2,...,n]=1/((z_1-z_2)(z_2-z_3)...(z_n-z_1)) generates a Parke-Taylor factor with the order specified by the argument.";
chyGraph::usage="chyGraph[exp,N] generates a CHY graph with N points based on the expression given. This is often a Parke-Taylor factor to some power.";
chyint::usage="chyint[exp,N] calculates a CHY integral with N points based on the expression given. This is often a Parke-Taylor factor to some power.";
id::usage="id[{1,...,k},exp,N] applies the monodromy relation on the pole in the set {1,...,k} given an integrand expression and a number of particles.";
momentumcon::usage="momentumcon[N] gives N point momentum conservation replacement rules in a list. Apply to expression by writing exp//.momentumcon[N].";
Pf::usage="Pf[A] gives the pfaffian of the skew symmetric matrix A.";
rempol::usage="rempol[exp,N] removes the pole of the N point amplitude by repeadly using monodromy relations";
Psi::usage="Psi[N] defines the (non-reduced) Psi to be used in the pfaffian for N particles";
red::usage="red[M,i,j] gives the reduced matrix by removing rows and coloumns i and j from M";
redPsi::usage="redPsi[N,i,j] gives the reduced N-point psi by removing rows and coloumns i and j from psi";
chyexp::usage="chyexp[N,i,j] gives the expanded tree-level N-point YM amplitude obtained by removing rows and coloumns i and j from psi";
chygravexp::usage="chyexp[N,i,j,k,l] gives the expanded tree-level N-point graviton amplitude obtained by removing rows and coloumns i and j from psi1 and k and l from psi2";
chyGraphTex::usage="chyGraphTex[exp,N] converts an expression with poles to a diagram in latex";
chytolatex::usage="chytolatex[exp,N] converts expression to latex code with diagrams. The output is of the form graph[1]*momentumfactor[1]...graph[n]*momentumfactor[n], so
plusses between terms have to be inserted by hand";
SpinHel::usage="SpinHel[exp,{i,j,k},{l,m,n},N] rewrites to spinor helicity variables given i,j,k negative and l,m,n positive helicity for N points.";
schoutenA::usage="Replacement-rules for schoten <> identites";
schoutenB::usage="Replacement-rules for schoten [] identites";


(* ::Section::Closed:: *)
(*Useful functions*)


consecutiveQ=Most[#]==Rest[#]-1&; (*returns "True" of the argument is a consequtive set,
 and "False" otherwise*)


(* ::Section::Closed:: *)
(*Momentum conservation*)


(*First the proporties of the momentum variables are defined*)
s[a_,a_]:=0;
s[i_,j_]:=s @@ Sort[{i,j}] /;  !OrderedQ[{i,j}] &&
      FreeQ[{i,j}, Pattern];
ek[a_,a_]:=0;
kk[a_,a_]:=0;
kk[i_,j_]:=kk @@ Sort[{i,j}] /;  !OrderedQ[{i,j}] &&
      FreeQ[{i,j}, Pattern];
      
replacementrules:={a___==-b___-c___-> b+c==-a,a___==-b___-c___-d___-> b+c+d==-a,a___==-b___-c___-d___-e___-> b+c+d+e==-a,a___==-b___-c___-d___-e___-f___-> b+c+d+e+f==-a,a___==b___+c___+d___-> b+c+d==a};
(*Momentumconservation is found for the different types of variables in the next 3 lines*)
momentumcon1[x_]:=ToRules[Reduce[{Sum[s[i,#],{i,Range[x]}]}&/@Range[x]==0]//.replacementrules];
momentumcon11[x_]:=ToRules[Reduce[{Sum[kk[i,#],{i,Range[x]}]}&/@Range[x]==0]//.replacementrules];
momentumcon2[x_]:=ToRules[Reduce[{Sum[ek[#,i],{i,Range[x]}]}&/@Range[x]==0]//.replacementrules];
(*momentumcon[n] yields the n-point replacement rules for momentum conservation by joining the previous 3 results*)
momentumcon[x_]:=Join[momentumcon1[x],momentumcon11[x],momentumcon2[x]];


(* ::Section::Closed:: *)
(*Notation*)


(*express result in more usual notation with subscrips and so on*)
dotprod:={s[a_,b_]->Subscript[k, a]\[CenterDot]Subscript[k, b],
	kk[a_,b_]->Subscript[k, a]\[CenterDot]Subscript[k, b],ek[a_,b_]->Subscript[\[Epsilon]k, a,b],
	ee[a_,b_]->Subscript[\[Epsilon], a,b]};
sxpand:={s[a_,b_,c_]->s[a,b]+s[a,c]+s[b,c],
	s[a_,b_,c_,d_]->s[a,b]+s[a,c]+s[a,d]+s[b,c]+s[b,d]+s[c,d]};


(* ::Section:: *)
(*Pfaffian definition (PSI) and its reduction.*)


(*Define Pfaffian*)
Pf[A_] := 
  Switch[Length[A], 0, 1, _?OddQ, 0, _?EvenQ, xPf[A, 1]];
xPf[A_, p0_] := Module[{A0, n, pivot, sign = 1, A1, p1},
   n = Length[A]/2;
   If[n != 1, A0 = A;
    pivot = First[Ordering[Normal[Abs[A0[[2 n - 1, All]]]], -1]];
    If[pivot != 2 n, A0[[{pivot, 2 n}, All]] = A0[[{2 n, pivot}, All]];
     A0[[All, {pivot, 2 n}]] = A0[[All, {2 n, pivot}]];
     sign = -1;];
    p1 = A0[[2 n - 1, 2 n]];
    A1 = p1 A0[[1 ;; 2 n - 2, 1 ;; 2 n - 2]];
    A1 += (# - Transpose[#]) &@
     Outer[Times, A0[[1 ;; 2 n - 2, 2 n]], 
      A0[[1 ;; 2 n - 2, 2 n - 1]]];
    A1 /= p0;
    sign xPf[A1, p1], A[[1, 2]]]];
(*Define Partition of sets function https://mathematica.stackexchange.com/questions/88085/find-all-the-possible-ways-of-partitioning-a-list-into-a-set-of-pairs-of-element*)
idx[{a_, b_}] := {{a, b}}
idx[list_List] := 
 Flatten[Function[{row}, Join[First@row, #] & /@ Last@row] /@
   (({#, idx[Complement[list, #]]} &) /@ (list[[{1, #}]] & /@ 
       Range[2, Length@list])), 1]
idx[n_?EvenQ] := idx[Range@n]
part[list_List /; EvenQ[Length@list]] := 
 Fold[Partition, 
  list[[Flatten[idx[Length@list]]]], {2, Length@list/2}]
  
(*Define Psi matrix*)
(*Attributes[ee]={Orderless};Attributes[s]={Orderless};*)
ee[i_,j_]:=ee @@ Sort[{i,j}] /;  !OrderedQ[{i,j}] &&
      FreeQ[{i,j}, Pattern];
kk[i_,j_]:=kk @@ Sort[{i,j}] /;  !OrderedQ[{i,j}] &&
      FreeQ[{i,j}, Pattern];
s[i_,j_]:=s @@ Sort[{i,j}] /;  !OrderedQ[{i,j}] &&
      FreeQ[{i,j}, Pattern];
ss[i_,j_]:=ss @@ Sort[{i,j}] /;  !OrderedQ[{i,j}] &&
      FreeQ[{i,j}, Pattern];
z[i_,j_]:=Signature@{i,j}z @@ Sort[{i,j}] /;  !OrderedQ[{i,j}] &&
      FreeQ[{i,j}, Pattern];
z[i_,i_]:=0;

(*Define matrices ABC*)
matA[N_]:=Table[If[i!= j,s[i,j]/z[i,j],0],{i,N},{j,N}];
matB[N_]:=Table[If[i!= j,ee[i,j]/z[i,j],0],{i,N},{j,N}];

matC[N_]:=Table[If[i!= j,Sqrt[2]*ek[i,j]/z[i,j],1]If[i==j&&i==1,Sqrt[2]*Sum[(ek[i,l]z[l,2])/(z[2,1]z[1,l]),{l,3,N}],1]If[i==j&&i>1,Sqrt[2]*Sum[(ek[i,l]z[l,1])/(z[1,i]z[i,l]),{l,DeleteCases[Range[2,N],i]}],1],{i,N},{j,N}];

Psi[N_]:=matPsi[N]=ArrayFlatten[{{matA[N],-Transpose@matC[N]},{matC[N],matB[N]}}];
red[mat_,a_,b_]:=red[mat,a,b]=
Module[{app},
	app=mat;
	app=Delete[app,{{a},{b}}];
	app=Transpose[app];
	app=Delete[app,{{a},{b}}];
	app=Transpose[app];
	Return[app];
	];
redPsi[N_,a_,b_]:=red[Psi[N],a,b];


(* ::Section::Closed:: *)
(*CHY graph TEX*)


chyGraphTex[expr_,N_]:=Module[{app,den,num},
app=expr;
nof[l_,k_,x_]:=Total[Exponent[x, {z[l,k]}]]; (*Total number of factors for a set (lines connecting)*)
list=ConstantArray[{},4];
Do[
Do[
Do[
If[nof[j,k,app]==-i,list[[i]]=Append[list[[i]],{j,k}]]
,{k,j,N}];
,{j,N}];
,{i,4}];
Print[StringForm["\\begin{chy}[``]",N]];
Do[Do[
If[i==1&&Length[list[[i]][[j]]]==2,Print[StringForm["\\chyline{``}{``};",list[[i]][[j]][[1]],list[[i]][[j]][[2]]]]];
If[i==2&&Length[list[[i]][[j]]]==2,Print[StringForm["\\chydoubleline{``}{``};",list[[i]][[j]][[1]],list[[i]][[j]][[2]]]]];
If[i==3&&Length[list[[i]][[j]]]==2,Print[StringForm["\\chytripleline{``}{``};",list[[i]][[j]][[1]],list[[i]][[j]][[2]]]]];
If[i==4&&Length[list[[i]][[j]]]==2,Print[StringForm["\\chyquadrupleline{``}{``};",list[[i]][[j]][[1]],list[[i]][[j]][[2]]]]];
,{j,Length[list[[i]]]}];
,{i,Length[list]}];
Print["\\end{chy}"];
];

(*This converts the momentum and polarization variables to latex readable code*)
tolatex1 :={ek[a_,b_]-> StringForm["\\epsk_{````}",a,b],s[a_,b_]-> StringForm["\\s_{````}",a,b],z[a_,b_] -> 1};
tolatex2 :={ek[a_,b_]-> StringForm["\\epsk_{````}",a,b],s[a_,b_]-> StringForm["\\s_{````}",a,b],a_/b_->StringForm["\\frac{``}{``}",a,b]};
(*Here we convert an expression to latex code with diagrams*)
chytolatex[expr_,N_]:=Module[{app,L,out,n},
app=expr+x; (*The "+x" is to make sure the length of an object with just one diagram is 1. Don't worry about this since we iterate from 2 in the loop below*)
n=N;
L=Length[app];
Do[Print[chyGraphTex[app[[i]],n];(app[[i]]//.tolatex1)],{i,2,L}]
];


(* ::Section::Closed:: *)
(*Graphics (Draw CHY Graphs)*)


show5pt[pm_,pm2_,pm3_,pm4_,pm5_,pm13_,pm12_,pm11_,ll_]:=Block[{n=ll,vList},{vList={1 Cos[-(#-1) (2 \[Pi]/n)+\[Pi]/2],1 Sin[-(#-1) (2 \[Pi]/n)+\[Pi]/2]}&/@Range[n]};
Graphics[Join[{Black,Thickness[0.02],Line[(#/.Thread[Rule[Range[n],vList]])]}&/@pm,
{Black,Thickness[0.06],Line[(#/.Thread[Rule[Range[n],vList]])]}&/@pm2,{White,Thickness[0.02],Line[(#/.Thread[Rule[Range[n],vList]])]}&/@pm2,
{Black,Thickness[0.10],Line[(#/.Thread[Rule[Range[n],vList]])]}&/@pm3,{White,Thickness[0.06],Line[(#/.Thread[Rule[Range[n],vList]])]}&/@pm3,
{Black,Thickness[0.02],Line[(#/.Thread[Rule[Range[n],vList]])]}&/@pm3,{Black,Thickness[0.14],Line[(#/.Thread[Rule[Range[n],vList]])]}&/@pm4,
{White,Thickness[0.10],Line[(#/.Thread[Rule[Range[n],vList]])]}&/@pm4,{Black,Thickness[0.06],Line[(#/.Thread[Rule[Range[n],vList]])]}&/@pm4,
{White,Thickness[0.02],Line[(#/.Thread[Rule[Range[n],vList]])]}&/@pm4,
{Black,Thickness[0.18],Line[(#/.Thread[Rule[Range[n],vList]])]}&/@pm5,
{White,Thickness[0.14],Line[(#/.Thread[Rule[Range[n],vList]])]}&/@pm5,{Black,Thickness[0.10],Line[(#/.Thread[Rule[Range[n],vList]])]}&/@pm5,
{White,Thickness[0.06],Line[(#/.Thread[Rule[Range[n],vList]])]}&/@pm5,{Black,Thickness[0.02],Line[(#/.Thread[Rule[Range[n],vList]])]}&/@pm5,

{Thickness[0.02],Dashing[{0.01,0.1,-0.01}],Line[(#/.Thread[Rule[Range[n],vList]])]}&/@pm11,({Black,Disk[#,0.18]}&/@vList),
{Thickness[0.06],Dashing[{0.01,0.1,-0.01}],Line[(#/.Thread[Rule[Range[n],vList]])]}&/@pm12,({Black,Disk[#,0.18]}&/@vList),
{White,Thickness[0.02],Line[(#/.Thread[Rule[Range[n],vList]])]}&/@pm12,
{Thickness[0.10],Dashing[{0.01,0.15,-0.01}],Line[(#/.Thread[Rule[Range[n],vList]])]}&/@pm13,{White,Thickness[0.06],Line[(#/.Thread[Rule[Range[n],vList]])]}&/@pm13,
{Thickness[0.02],Dashing[{0.01,0.15,-0.01}],Line[(#/.Thread[Rule[Range[n],vList]])]}&/@pm13,
Text[Style[#,FontSize->16,FontFamily->"Times"],1.2 vList[[#]],-vList[[#]]]&/@Range[n]]]];
chyGraph[a_+b_,c_]:=chyGraph[a,c]+chyGraph[b,c];
chyGraph[c_*a_,b_]:=c*chyGraph[a,b]/;FreeQ[c,z];

chyGraph[expr_,N_]:=chyGraph[expr,N]=Module[{app,den,num,f,a,b,i},
app=expr;
nof[l_,k_,x_]:=-Total[Exponent[x, {z[l,k],z[k,l]}]];  (*Total number of factors for a set (lines connecting)*)
list=ConstantArray[{},8];
Do[
	Do[
		Do[
		If[nof[j,k,app]==i,list[[i]]=Append[list[[i]],{j,k}]]
		,{k,j,N}];
	,{j,N}];
,{i,{-3,-2,-1,1,2,3,4,5}}];
show5pt[Sequence@@list,N]
];

(*makes diagrammatic expansion with (s,l)-reduced Phaffian*)
chydiagexpLoop[n_,l_,s_]:=Module[{app,app2,app3,app4,a,b,c,d,a1,b1,c1}, 
zz[c_,d_]:=(z[c,d]);

(*res=(-1)^(l+s)*z[1,3]^2/((z[l,s])*Times@@zz@@@Partition[Prepend[Range[1,n-2],n],2,1])Pf[red[defPsi[n],s,l]];
res=res//Apart;*)

a=red[matPsi[n],l,s];
res=0;
(*res=(-1)^(l+s)(**(z[1,4])^2*)/((z[l,s])*Times@@zz@@@Partition[Prepend[Range[1,n],n],2,1])*Pf[red[defPsi[5],l,s]]//Expand;*)
(*We define n-1=l and n=-l*)
Do[
	i=Flatten[i1];
	app3=(-1)^(l+s)(**(z[1,4])^2*)/((z[l,s])*Times@@zz@@@Partition[Prepend[Range[1,n],n],2,1])*
	Product[a[[i[[2*j-1]],i[[2*j]]]],{j,Length[a]/2}]//Expand;
	res=(res+Signature[i]*app3);
	, {i1, #}] &@ part[Range[1,Length[a]]];
	res=res(*//.{z[a_,4]\[Rule]1}*)(*//.{a1_*b1_+c1_*b1_\[RuleDelayed] (a1+c1)*b1/;FreeQ[a1,z]&&FreeQ[c1,z]};*);

	diag=chyGraph[res,n]//.{a1_*b1_+c1_*b1_:> (a1+c1)*b1/;!FreeQ[b1,Graphics]};
	Return[diag];

];




(* ::Section::Closed:: *)
(*CHY expansion*)


(*n is number of particles, (l,s) is gauge fixing (reduced legs)*)
chyexp[n_,l_,s_]:=Module[{app,app2,app3,app4,a,b,c,d,a1,b1,c1}, (*makes diagrammatic expansion with (s,l)-reduced Phaffian*)
zz[c_,d_]:=(z[c,d]);
a=red[Psi[n],l,s];
res=0;
(*We define n-1=l and n=-l*)
Do[
	i=Flatten[i1];
	app3=(-1)^(l+s)(**(z[1,4])^2*)/((z[l,s])*Times@@zz@@@Partition[Prepend[Range[1,n],n],2,1])*
	Product[a[[i[[2*j-1]],i[[2*j]]]],{j,Length[a]/2}]//Expand;
	res=(res+Signature[i]*app3);
	, {i1, #}] &@ part[Range[1,Length[a]]];
	res=res;
	preintexpr:=res;

	Return[res];
];
chygravexp[N_,l_,s_,k_,r_]:=Expand[(-1)^(l+s+k+r)*Pf[redPsi[N,l,s]]*Pf[redPsi[N,k,r]]/(z[l,s]*z[k,r])]


(* ::Section::Closed:: *)
(*Remove Poles (Monodromy relations)*)


pt[s__]:=1/Times@@z@@@Partition[Append[{s},{s}[[1]]],2,1]
hamcycle[s__]:=1/pt[s]
(*Define shuffle porduct https://mathematica.stackexchange.com/questions/41614/shuffle-product-of-two-lists*)
shuffleW[s1_,s2_]:=Module[{p,tp,ord},p=Permutations@Join[1&/@s1,0&/@s2]\[Transpose];
tp=BitXor[p,1];
ord=Accumulate[p] p+(Accumulate[tp]+Length[s1]) tp;
Outer[Part,{Join[s1,s2]},ord,1][[1]]\[Transpose]];

(*Define general monodromy relations*)
id[{a__},expr_,N_]:=id[{a},expr,N]=Module[{app,k},
k=Length[{a}];
app=expr;
pnof[l1_,l2_]:=Exponent[app, z[l1,l2]];
Do[
	If[AllTrue[-pnof@@@Map[Sort, Partition[i,2,1]],GreaterEqualThan[1]], (*GreaterEqualThan[1]]*)
	app=app*((-1)/(pt[Sequence@@i]*s[a]))*Sum[pt[i[[1]],Sequence@@m,i[[N]]]
	*(s[a]+Sum[Sum[If[n>j&&!FreeQ[{a},m[[n]]]&&FreeQ[{a},m[[j]]],s[m[[n]],m[[j]]],0],{j,N-2}]
				,{n,N-2}]),{m,#}]&@Complement[shuffleW[i[[Range[2,k]]],i[[Range[k+1,N-1]]]],
				{i[[Range[2,N-1]]]}];
	Break[];
		]
,{i,#}] &@(Join[{a},#]&/@Permutations[Complement[Range[1,N],{a}],{N-Length[{a}]}]);
app=Expand[app];
Return[app];

];

(*Remove higher order poles*)
rempol[a_+b_,c_]:=rempol[a,c]+rempol[b,c];
rempol[c_*a_,b_]:=c*rempol[a,b]/;FreeQ[c,z]
rempol[expr_,N_]:=rempol[expr,N]=Module[{app,a,b},
app=expr;
nof[l_,k_,x_]:=Total[Exponent[x, {z[l,k],z[k,l]}]];
tnof[{s__},x_]:=1/2*Sum[Sum[nof[l,k,x],{l,Complement[{s},{k}]}],{k,{s}}];
subsets1=Subsets[Range[1,N],{1,Floor[N/2]}];
For[i=1,i<= Length[subsets1],i++,
test1=-tnof[subsets1[[i]],app]>(2*Length[subsets1[[i]]]-2);
a=0;
	If[TrueQ[test1],
		app=id[subsets1[[i]],app,N];
		a=a+1;
		Break[]]
		];
If[a!=0,app=rempol[app,N]];
Return[app];
];



(*For quadruple lines*)
idq[{a__},expr_,N_]:=idq[{a},expr,N]=Module[{app,k},
k=Length[{a}];
app=expr;
pnof[l1_,l2_]:=Exponent[app, z[l1,l2]];
Do[
	If[AllTrue[-pnof@@@Map[Sort, Partition[i,2,1]],GreaterEqualThan[0]], (*GreaterEqualThan[1]]*)
	app=app*((-1)/(pt[Sequence@@i]*s[a]))*Sum[pt[i[[1]],Sequence@@m,i[[N]]]
	*(s[a]+Sum[Sum[If[n>j&&!FreeQ[{a},m[[n]]]&&FreeQ[{a},m[[j]]],s[m[[n]],m[[j]]],0],{j,N-2}]
				,{n,N-2}]),{m,#}]&@Complement[shuffleW[i[[Range[2,k]]],i[[Range[k+1,N-1]]]],
				{i[[Range[2,N-1]]]}];
	Break[];
		]
,{i,#}] &@(Join[{a},#]&/@Permutations[Complement[Range[1,N],{a}],{N-Length[{a}]}]);
app=Expand[app];
Return[app];

];

(*Remove higher order poles*)
rempolq[a_+b_,c_]:=rempolq[a,c]+rempol[b,c];
rempolq[c_*a_,b_]:=c*rempolq[a,b]/;FreeQ[c,z]
rempolq[expr_,N_]:=rempolq[expr,N]=Module[{app,a,b},
app=expr;
nof[l_,k_,x_]:=Total[Exponent[x, {z[l,k],z[k,l]}]];
tnof[{s__},x_]:=1/2*Sum[Sum[nof[l,k,x],{l,Complement[{s},{k}]}],{k,{s}}];
subsets1=Subsets[Range[1,N],{1,Floor[N/2]}];
For[i=1,i<= Length[subsets1],i++,
test1=-tnof[subsets1[[i]],app]>(2*Length[subsets1[[i]]]-2);
a=0;
	If[TrueQ[test1],
		app=idq[subsets1[[i]],app,N];
		a=a+1;
		Break[]]
		];
If[a!=0,app=rempol[app,N]];
Return[app];
];



(* ::Section::Closed:: *)
(*CHY Integration rules*)


(*We find all subsets in the CHY diagrams which have n points connected by 2n-2 lines*)
subs[expr_,N_,c_]:=subs[expr,N,c]=Module[{app,den, num,a,b},
app=expr;
(*den=Denominator[expr];num=Numerator[expr];
nofd[l_,k_]:=Total[Exponent[den, {z[l]-z[k],z[k]-z[l]}]]; (*Number of factor in denominator*)
tnofd[{s__}]:=1/2*Sum[Sum[nofd[l,k],{l,Complement[{s},{k}]}],{k,{s}}];(*-||- numerator*)
nofn[l_,k_]:=Total[Exponent[num, {z[l]-z[k],z[k]-z[l]}]]; (*Total number of factors for a set (lines connecting) in denominatot*)
tnofn[{s__}]:=1/2*Sum[Sum[nofn[l,k],{l,Complement[{s},{k}]}],{k,{s}}]; (*Total number of factors for a set (lines connecting) in numerator*)*)
nof[l_,k_]:=Total[Exponent[app, {z[l,k],z[k,l]}]];
tnof[{s__}]:=1/2*Sum[Sum[nof[l,k],{l,Complement[{s},{k}]}],{k,{s}}];
list={};
subsets=Subsets[Range[1,N],{2,Floor[N/2]}];
(*Test if for a given subset, of n points, there are 2n-2 connecting lines*)
For[i=1,i<= Length[subsets],i++,
test=-tnof[subsets[[i]]]==(2*Length[subsets[[i]]]-2);
	If[TrueQ[test]
		,list=Append[list, subsets[[i]]]]
		];
compl[{a__}]:=Complement[Range[1,N],{a}];
For[i=1,i<Length[list]+1,i++,
While[Length[list]>=i&&((!MemberQ[list[[i]],c]) )&&(MemberQ[list,compl[list[[i]]]]), list=Delete[list,i]]];

(*For[i=1,i<Length[list]+1,i++,
While[Length[list]>=i&&( Length[list[[i]]]\[Equal]N-1||Length[list[[i]]]\[Equal]N||Length[list[[i]]]\[Equal]1), list=Delete[list,i]]];*)
list=DeleteDuplicates[list];
Return[list];
]

(*We find n-3 nested sets*)
nest[expr_,N_]:=nest[expr,N]=Module[{app,k,s,q},
app=expr;
k=N;
subs1=subs[app,k,1];
nests={};
subs3=ConstantArray[{},Length[subs1]];
For[s=1,s<= Length[subs1],s++,
(*Find subsets of the already found sets with length n-3*)
subs3[[s]]=Subsets[subs1,{N-3}];
];
For[z1=1,z1<=Length[subs3],z1++,
	For[q=1,q<= Length[subs3[[z1]]],q++,
(*Test if these n-3 subsets are pairwise nested or disjoint*)
		test3={};
		For[h1=1,h1<= Length[subs3[[z1]][[q]]],h1++,
			For[d1=h1+1,d1<=Length[subs3[[z1]][[q]]],d1++,
				test3=Append[test3,(DisjointQ[subs3[[z1]][[q]][[h1]],
				subs3[[z1]][[q]][[d1]]]||DisjointQ[subs3[[z1]][[q]][[h1]],
				Complement[Range[1,N],subs3[[z1]][[q]][[d1]]]]||DisjointQ[subs3[[z1]][[q]][[d1]],
				Complement[Range[1,N],subs3[[z1]][[q]][[h1]]]]||DisjointQ[Complement[Range[1,N],
				subs3[[z1]][[q]][[d1]]],Complement[Range[1,N],subs3[[z1]][[q]][[h1]]]])];
				];
			];
		If[AllTrue[test3,TrueQ],
		nests=Append[nests, subs3[[z1]][[q]]];
			] 
		];
	];
							
nests=DeleteDuplicates[nests];
Return[nests];
];
(*We now flip all momentum subsets to the shortest possible*)
c[{a__},N_]:=c[{a},N]=Module[{app},
app={a};
If[Length[Complement[Range[1,N],app]]<Length[app],
	app=Complement[Range[1,N],app]
	];
Return[app];
];
flip[expr_,N_]:=flip[expr,N]=Module[{app},
app=nest[expr,N];
For[i=1,i<=  Length[app],i++,
	For[j=1,j<= Length[app[[i]]],j++,
	app[[i]][[j]]=c[app[[i]][[j]],N];
		]
	];
Return[app];
];

(*Determine inversion factors*)
inv2[expr_,sets_,N_]:=inv2[expr,sets,N]=Module[{app,i,m,ninv,subss},
app=expr;
nof[l_,k_,x_]:=Total[Exponent[x, {z[l,k]}]];
subss=sets;
Do[
	Do[
		Do[
			ninv[j,i,k]=nof[j,i,app];
			app=app//.{z[j,i]->z[First[k],j],z[i,j]->z[First[k],j]};
		,{i,k}
			],
		{j,Complement[Range[First[k],N],k]}
		],
	{k,subss}
	];
ninv=Sum[Sum[Sum[ninv[j,i,k],{i,k}],{j,Complement[Range[First[k],N],k]}],{k,subss}];
Return[ninv]

];

(*Now perform the integration by implementing the integration rules*)
chyint[expr1_+expr2_,N_]:=chyint[expr1,N]+chyint[expr2,N];
chyint[c_*expr_,N_]:=c*chyint[expr,N]/;FreeQ[c,z];
chyint[expr_,N_]:=chyint[expr,N]=Module[{app,app1,res},
app=flip[expr,N];
invfunc[x_,N]:=If[(MemberQ[#,1]&&!MemberQ[#,N])||(!MemberQ[#,N]&&!MemberQ[#,1]),#,Complement[Range[N],#]]&/@x;
(*If[Length[app]\[GreaterEqual]1,Print[inv2[expr,invfunc[#,N]&@(Pick[app[[1]],(!consecutiveQ[#]&&!consecutiveQ[Complement[Range[N],#]])&/@app[[1]]]),N]];,Print["non"];];
Print[If[Length[app]\[GreaterEqual]1,invfunc[#,N]&@(Pick[app[[1]],(!consecutiveQ[#]&&!consecutiveQ[Complement[Range[N],#]])&/@app[[1]]]),0]];*)
(*Print[(Pick[app[[1]],!consecutiveQ[#]&/@app[[1]]])];*)
res=(*(-1)^(N+inv[expr,N]+1)*)Sum[((-1)^(If[Length[app]>=1,inv2[expr,invfunc[#,N]&@
(Pick[app[[i]],(!consecutiveQ[#]&&!consecutiveQ[Complement[Range[N],#]])&/@app[[i]]]),N],0]+1+N))*
Product[1/s[Sequence@@app[[i]][[j]]],{j,Length[app[[i]]]}],
							{i,Length[app]}];
(*res=Simplify[res];*)
Return[res];
]
(*((-1)^(N+inv1[expr,If[MemberQ[app[[i]][[j]],1],app[[i]][[j]],Complement[Range[N],app[[i]][[j]]]],N]+1))*)


(* ::Section::Closed:: *)
(*Parke-Taylor expansion*)


ptdual[a__]:=Module[{NN,N1,N2,app,app1,k},
k={a};
NN=Length[k];
N1=First[k];
N2=k[[NN-1]];
app1=Sum[(s[k[[b]],k[[2]]]*z[k[[b]],NN]/(z[k[[b]],k[[2]]]*z[k[[2]],k[[NN]]])),{b,1,1}];
app=1/(z[N1,N2]z[N2,NN]z[NN,N1])*Product[(Sum[(s[k[[b]],k[[l]]]*z[k[[b]],NN]/(z[k[[b]],k[[l]]]*
		z[k[[l]],k[[NN]]])),{b,1,l-1}]),{l,2,NN-2}];
Return[app//Expand];
];

ptexpand[a_+b_,c_]:=ptexpand[a,c]+ptexpand[b,c];
ptexpand[c_*a_,b_]:=c*ptexpand[a,b]/;FreeQ[c,z];
ptexpand[expr_,N_]:=Module[{app,app1},
app=Sum[(chyint[rempol[expr*ptdual[1,Sequence@@l,N-1,N]//Expand,N],N])*pt[1,Sequence@@l,N-1,N],{l,#}]&@Permutations[Range[2,N-2]];
Return[app];

]


(* ::Section::Closed:: *)
(*BCJ numerators*)


(* ::Subsection::Closed:: *)
(*Main algorithm*)


Needs["Combinatorica`"]
(*OrdGauge  --  ordered gauge choice *)
(*ColOrd=  --  colour ordering to be calculated *)
OG[OrdGaugelist_][x_,y_]:=x<=y/.(#->Position[OrdGaugelist,#][[1,1]]&/@OrdGaugelist) (* defines ordered gauge/reference ordering relation, output TRUE/FALSE *)
CO[ColOrdlist_,x_,y_]:=x<y/.(#->Position[ColOrdlist,#][[1,1]]&/@ColOrdlist) (* defines CO relation, output TRUE/FALSE *)
n=4; (* number of external particles -2 *)
RemPart={a5,a6}; (* Removed particles (gauge choice) *)

(* Calculate ordered splittings *)
posPart[Ilist_,a_]:=Flatten[Position[Table[Length[SetPartitions[Ilist][[i]]],{i,1,Length[SetPartitions[Ilist]]}],a]] (* finds partitions in SetPartitions of length a (maintains ordering of Ilist) *)
OS1[OrdGaugelist_,Ilist_]:=(* 1 subset OS *)
DeleteCases[{If[And@@(OG[OrdGaugelist][Last[SetPartitions[Ilist][[1,1]]],#]&/@SetPartitions[Ilist][[1,1]]),SetPartitions[Ilist][[1]],{}]},{}] (* If SetPartition respects OG (last smallest in OG), keep *) 
OS2[OrdGaugelist_,Ilist_]:=(* 2 subsets OS *)
DeleteCases[Table[If[And@@(Table[And@@(OG[OrdGaugelist][Last[SetPartitions[Ilist][[i,j]]],#]&/@SetPartitions[Ilist][[i,j]]),{j,1,2}]), Sort[SetPartitions[Ilist][[i]],Position[OrdGaugelist,Last[#1]][[1,1]]<Position[OrdGaugelist,Last[#2]][[1,1]]&],{}],{i,First[posPart[Ilist,2]],Last[posPart[Ilist,2]]}],{}]
        (* Outer If: SetPartition respects OG for all subsets (last smallest in OG), keep, else {} *)
        (* Sort: sort by ordering of last elements of the subsets *)
        (* Outermost table: sum over all SetPartitions of length 2 *)
OS3[OrdGaugelist_,Ilist_]:=(* 3 subsets OS *)
DeleteCases[Table[If[And@@(Table[And@@(OG[OrdGaugelist][Last[SetPartitions[Ilist][[i,j]]],#]&/@SetPartitions[Ilist][[i,j]]),{j,1,3}]),Sort[SetPartitions[Ilist][[i]],Position[OrdGaugelist,Last[#1]][[1,1]]<Position[OrdGaugelist,Last[#2]][[1,1]]&],{}],{i,First[posPart[Ilist,3]],Last[posPart[Ilist,3]]}],{}]
OS4[OrdGaugelist_,Ilist_]:=(* 4 subsets *)
DeleteCases[Table[If[And@@(Table[And@@(OG[OrdGaugelist][Last[SetPartitions[Ilist][[i,j]]],#]&/@SetPartitions[Ilist][[i,j]]),{j,1,4}]),Sort[SetPartitions[Ilist][[i]],Position[OrdGaugelist,Last[#1]][[1,1]]<Position[OrdGaugelist,Last[#2]][[1,1]]&],{}],{i,First[posPart[Ilist,4]],Last[posPart[Ilist,4]]}],{}]
OS5[OrdGaugelist_,Ilist_]:=(* 5 subsets *)
DeleteCases[Table[If[And@@(Table[And@@(OG[OrdGaugelist][Last[SetPartitions[Ilist][[i,j]]],#]&/@SetPartitions[Ilist][[i,j]]),{j,1,5}]),Sort[SetPartitions[Ilist][[i]],Position[OrdGaugelist,Last[#1]][[1,1]]<Position[OrdGaugelist,Last[#2]][[1,1]]&],{}],{i,First[posPart[Ilist,5]],Last[posPart[Ilist,5]]}],{}]
OS6[OrdGaugelist_,Ilist_]:=(* 6 subsets *)
DeleteCases[Table[If[And@@(Table[And@@(OG[OrdGaugelist][Last[SetPartitions[Ilist][[i,j]]],#]&/@SetPartitions[Ilist][[i,j]]),{j,1,6}]),Sort[SetPartitions[Ilist][[i]],Position[OrdGaugelist,Last[#1]][[1,1]]<Position[OrdGaugelist,Last[#2]][[1,1]]&],{}],{i,First[posPart[Ilist,6]],Last[posPart[Ilist,6]]}],{}]
OS7[OrdGaugelist_,Ilist_]:=(* 7 subsets *)
{{OrdGaugelist[[#]]}&/@{1,2,3,4,5,6,7}}
OS[OrdGaugelist_,Ilist_]:=Which[Length[Ilist]==0,{{{}}},Length[Ilist]==1,OS1[OrdGaugelist,Ilist],Length[Ilist]==2,Join[OS1[OrdGaugelist,Ilist],OS2[OrdGaugelist,Ilist]],Length[Ilist]==3,Join[OS1[OrdGaugelist,Ilist],OS2[OrdGaugelist,Ilist],OS3[OrdGaugelist,Ilist]],Length[Ilist]==4,Join[OS1[OrdGaugelist,Ilist],OS2[OrdGaugelist,Ilist],OS3[OrdGaugelist,Ilist],OS4[OrdGaugelist,Ilist]],Length[Ilist]==5,Join[OS1[OrdGaugelist,Ilist],OS2[OrdGaugelist,Ilist],OS3[OrdGaugelist,Ilist],OS4[OrdGaugelist,Ilist],OS5[OrdGaugelist,Ilist]],Length[Ilist]==6,Join[OS1[OrdGaugelist,Ilist],OS2[OrdGaugelist,Ilist],OS3[OrdGaugelist,Ilist],OS4[OrdGaugelist,Ilist],OS5[OrdGaugelist,Ilist],OS6[OrdGaugelist,Ilist]],Length[Ilist]==7,Join[OS1[OrdGaugelist,Ilist],OS2[OrdGaugelist,Ilist],OS3[OrdGaugelist,Ilist],OS4[OrdGaugelist,Ilist],OS5[OrdGaugelist,Ilist],OS6[OrdGaugelist,Ilist],OS7[OrdGaugelist,Ilist]]]

(* define ordered splitting relation and Z_a *)
(*OSrel[x_,y_,Ilist_,a_]:=x<y/.(#\[Rule]Position[Flatten[OS[Ilist][[a]]],#][[1,1]]&/@Flatten[OS[Ilist][[a]]]) *)
setZa[b_,Ilist_,ColOrdlist_,n_,RemPart_]:=Join[{RemPart[[1]]},Drop[#,-(n+1-(Position[#,b])[[1,1]])]&[Flatten[Ilist]]\[Intersection]Drop[#,-(n+1-(Position[#,b])[[1,1]])]&[Flatten[ColOrdlist]]](* use with Ilist=OS[Ibar][[pos]] *)

(* numerator ingredients *)
Wpm[Ilist_]:=eFFe@Ilist
Wch[Ilist_,Ipartlist_,ColOrdlist_,n_,RemPart_]:=If[Length[Flatten[Ipartlist]]==0,1,Total[eFFk@Append[Reverse[Ipartlist],#]&/@setZa[First[Ipartlist],Ilist,ColOrdlist,n,RemPart]]](* use with Ilist=OS[Ibar][[pos]] *)

(* Putting it together *)
splits[ColOrdlist_]:=Join[#,RotateLeft/@#]&[Join[Select[SetPartitions[ColOrdlist],Length[#]==2&],{{ColOrdlist,{}}}] ]
(* splits into {Ii, Iibar} *)
Ii[i_,ColOrdlist_]:=splits[ColOrdlist][[i,1]];
Iibar[i_,ColOrdlist_]:=splits[ColOrdlist][[i,2]];
num[OrdGaugelist_,ColOrdlist_,n_,RemPart_]:=Sum[(-1)^Length[Ii[i,ColOrdlist]] (Wpm[Prepend[Append[Ii[i,ColOrdlist],RemPart[[2]]],RemPart[[1]]]])(Sum[Product[Wch[Flatten[Join[Ii[i,ColOrdlist],OS[OrdGaugelist,Iibar[i,ColOrdlist]][[j]]]],OS[OrdGaugelist,Iibar[i,ColOrdlist]][[j,jj]],ColOrdlist,n,RemPart],{jj,1,Length[OS[OrdGaugelist,Iibar[i,ColOrdlist]][[j]]]}],{j,1,Length[OS[OrdGaugelist,Iibar[i,ColOrdlist]]]}]),{i,1,Length[splits[ColOrdlist]]}]


(* ::Subsection::Closed:: *)
(*Define Chain terms*)
(*eFFe[{1,2,3,4}]=Subscript[e, 1].Subscript[F, 2].Subscript[F, 3].Subscript[e, 4] and eFFk[{1,2,3,4}]=Subscript[e, 1].Subscript[F, 2].Subscript[F, 3].Subscript[k, 4]*)


(* Chain definitions: ChainEK = e.F...F.k, ChainEE = e.F...F.e with same order as in list *)
(* still missing lengths 6,7,8 *)
ChainEK2[Alist_]:=Which[Length[Flatten[Alist]]<2,1,Length[Flatten[Alist]]==2,ek[#1,#2]& @@Alist,Length[Flatten[Alist]]==3,ek[#1,#2] ek[#2,#3]-ee[#1,#2]kk[#2,#3]&@@Alist,
Length[Flatten[Alist]]==4,ek[#1,#2] ek[#2,#3]ek[#3,#4]+ ee[#1,#2] ek[#3,#2]kk[#3,#4]- ee[#1,#2]kk[#2,#3] ek[#3,#4]- ek[#1,#2]ee[#2,#3] kk[#3,#4]&@@Alist,
 Length[Flatten[Alist]]==5,-kk[#3,#4] ee[#2,#3] ek[#1,#2] ek[#4,#5]+ek[#3,#4] ek[#1,#2] ek[#2,#3] ek[#4,#5]+kk[#3,#4] ee[#1,#2] ek[#3,#2] ek[#4,#5]-ek[#3,#4] ee[#1,#2] ek[#4,#5] kk[#2,#3]
 +ek[#4,#3] ee[#2,#3] ek[#1,#2] kk[#4,#5]-ee[#3,#4] ek[#1,#2] ek[#2,#3] kk[#4,#5]-ek[#4,#3] ee[#1,#2] ek[#3,#2] kk[#4,#5]+ee[#3,#4] ee[#1,#2] kk[#2,#3] kk[#4,#5]&@@Alist]  
           (* chain starting with e and ending in k/Z *)
ChainEE2[Alist_]:=Which[Length[Flatten[Alist]]==2,ee@@Alist,Length[Flatten[Alist]]==3,ek[#1,#2] ee[#2,#3]-ee[#1,#2]ek[#3,#2]&@@Alist,
Length[Flatten[Alist]]==4,ek[#1,#2] ek[#2,#3]ee[#3,#4]+ ee[#1,#2] ek[#3,#2]ek[#4,#3]- ek[#1,#2]ee[#2,#3] ek[#4,#3]- ee[#1,#2]kk[#2,#3] ee[#4,#3]&@@Alist,
  Length[Flatten[Alist]]==5,-kk[#3,#4] ee[#2,#3] ek[#1,#2] ee[#4,#5]+ek[#3,#4] ek[#1,#2] ek[#2,#3] ee[#4,#5]+kk[#3,#4] ee[#1,#2] ek[#3,#2] ee[#4,#5]-ek[#3,#4] ee[#1,#2] ee[#4,#5] kk[#2,#3]
  +ek[#4,#3] ee[#2,#3] ek[#1,#2] ek[#5,#4]-ee[#3,#4] ek[#1,#2] ek[#2,#3]ek[#5,#4]-ek[#4,#3] ee[#1,#2] ek[#3,#2] ek[#5,#4]+ee[#3,#4] ee[#1,#2] kk[#2,#3] ek[#5,#4]&@@Alist]
(* chain starting with e and ending in e *)

(*Define the chains for abitrary length by expanding them out*)
ff[a_][i_,j_]:=-eps[a,i]k[a,j]+eps[a,j]k[a,i];  (*eps[a,i] is polarisation vector a with vector(dummy) index i, same for k[a,i]*)

ChainKK[a_]:=Module[{q},k[a[[1]],q[1]]Product[ff[a[[i]]][q[i-1],q[i]],
					{i,Range[2,Length[a]-1]}]k[a[[Length[a]]],q[Length[a]-1]]];

ChainEE[a_]:=Module[{q},eps[a[[1]],q[1]]Product[ff[a[[i]]][q[i-1],q[i]],
					{i,Range[2,Length[a]-1]}]eps[a[[Length[a]]],q[Length[a]-1]]];

ChainEK[a_]:=Module[{q},eps[a[[1]],q[1]]Product[ff[a[[i]]][q[i-1],q[i]],
						{i,Range[2,Length[a]-1]}]k[a[[Length[a]]],q[Length[a]-1]]];

(*Dummy-index summation*)
dummyindicies:={eps[a_,q_[b_]]eps[c_,q_[b_]]->ee[a,c],eps[a_,q_[b_]]k[c_,q_[b_]]->ek[a,c],
				k[a_,q_[b_]]k[c_,q_[b_]]->kk[a,c],k[a_,b_]^2->0};

Attributes[eta]={Orderless};

K1=0;K2=0; (*comment out to use other completeness relation*)
(*Remember that (a1,a2,a3,a4,a5,a6)=(2,3,4,5,1,6)*)
(*Define double forward limit completeness relations, as well as the relations of the metric: eta.*)
completeness={eps["a5",a_]eps["a6",b_]->eta[a,b]-K1*(k["a5",a]k[q1,b]+k[q1,a]k["a5",b])/kk[q1,"a5"],eps["a1",a_]eps["a4",b_]->eta[a,b]-K2*(k[q2,a]k["a1",b]+k["a1",a]k[q2,b])/kk[q2,"a1"]};

(*Remember that (a1,a2,a3,a4,a5,a6,a7)=(2,3,4,5,6,1,7)*)
(*Define double forward limit completeness relations, as well as the relations of the metric: eta.*)
completeness7={eps["a6",a_]eps["a7",b_]->eta[a,b]-K1*(k["a6",a]k[q1,b]+k[q1,a]k["a6",b])/kk[q1,"a6"],eps["a1",a_]eps["a5",b_]->eta[a,b]-K2*(k[q2,a]k["a1",b]+k["a1",a]k[q2,b])/kk[q2,"a1"]};
dummyindicies2:={eta[a_,b_]eps[c_,a_]->eps[c,b],eta[a_,b_]k[c_,a_]->k[c,b],eta[a_,a_]->D-2,eta[a_,b_]^2->D-2,eta[a_,b_]q1[a_]->q1[b],eta[a_,b_]q2[a_]->q2[b]};
dummyindicies2A:={eta[1,a_,b_]eps[c_,a_]->eps[c,b],eta[1,a_,b_]k[c_,a_]->k[c,b],eta[1,a_,a_]->D-2,eta[1,a_,b_]^2->D-2,eta[1,a_,b_]q1[a_]->q1[b],eta[1,a_,b_]q2[a_]->q2[b]};
dummyindicies3:={eta[2,a_,b_]eps[c_,a_]->eps[c,b],eta[2,a_,b_]k[c_,a_]->k[c,b],eta[2,a_,a_]->D-2,eta[2,a_,b_]^2->D-2,eta[2,a_,b_]q1[a_]->q1[b],eta[2,a_,b_]q2[a_]->q2[b]};


(* ::Subsection::Closed:: *)
(*Calculate numerator*)


bcjnum[colorOrder_]:=Module[{n,RemPart,RefOrder,ColOrder,sym,val,app},
n=Length[colorOrder];
sym=StringJoin["a",#]&/@ToString/@Range[n+2];
val=Append[Append[Range[2,n+1],1],n+2];
ColOrder=StringJoin["a",#]&/@ToString/@(colorOrder-1);(*Set color ordering according to argument*)
RefOrder=StringJoin["a",#]&/@ToString/@Range[n]; (*Standard reference ordering*)
RemPart=StringJoin["a",#]&/@ToString/@{n+1,n+2}; (*Remove particle a(n+1) and a(n+2) which are 1 and n*)
app=num[RefOrder,ColOrder,n,RemPart];
app=app/.eFFk->ChainEK;
app=app/.eFFe->ChainEE;
app=app/.kFFk->ChainKK;
app=(app//Expand)//.dummyindicies2;
app=(app//Expand)//.dummyindicies;
(*app=app/.eFFe->ChainEE;*)
app=app/.Thread[sym->val]; (*Replace (a1,a2,...,a(n+1),a(n+2))=(2,3,...,n-1,1,n)*)
Return[app];
];




(*Same as above but with explicit reference ordering*)
bcjnumRef[refOrder_,colorOrder_]:=Module[{n,RemPart,RefOrder,ColOrder,sym,val,app},
n=Length[colorOrder];
sym=StringJoin["a",#]&/@ToString/@Range[n+2];
val=Append[Append[Range[2,n+1],1],n+2];
ColOrder=StringJoin["a",#]&/@ToString/@(colorOrder-1);(*Set color ordering according to argument*)
RefOrder=StringJoin["a",#]&/@ToString/@(refOrder-1); (*Standard reference ordering*)
RemPart=StringJoin["a",#]&/@ToString/@{n+1,n+2}; (*Remove particle a(n+1) and a(n+2) which are 1 and n*)
app=num[RefOrder,ColOrder,n,RemPart];
(*app=app/.eFFk->ChainEK;*)
app=app/.eFFk->ChainEK;
app=app/.eFFe->ChainEE;
app=app/.kFFk->ChainKK;
app=(app//Expand)//.dummyindicies2;
app=(app//Expand)//.dummyindicies;
(*app=app/.eFFe->ChainEE;*)
app=app/.Thread[sym->val]; (*Replace (a1,a2,...,a(n+1),a(n+2))=(2,3,...,n-1,1,n)*)
Return[app];
];



(* ::Subsubsection:: *)
(*Single foward limit*)


bcjnumFL[colorOrder_]:=Module[{n,RemPart,RefOrder,ColOrder,sym,val,app},
n=Length[colorOrder];
sym=StringJoin["a",#]&/@ToString/@Range[n+2];
val=Append[Append[Range[2,n+1],1],n+2];
ColOrder=StringJoin["a",#]&/@ToString/@(colorOrder-1);(*Set color ordering according to argument*)
RefOrder=StringJoin["a",#]&/@ToString/@Range[n]; (*Standard reference ordering*)
RemPart=StringJoin["a",#]&/@ToString/@{n+1,n+2}; (*Remove particle a(n+1) and a(n+2) which are 1 and n*)
app=num[RefOrder,ColOrder,n,RemPart];
app=app/.eFFk->ChainEK;
app=app/.eFFe->ChainEE;
app=app/.kFFk->ChainKK;
app=(app//Expand)//.{eps[sym[[n+1]],a_]eps[sym[[n+2]],b_]->eta[a,b]};
app=(app//Expand)//.dummyindicies2;
app=(app//Expand)//.dummyindicies;
(*app=app/.eFFe->ChainEE;*)
app=app/.Thread[sym->val]; (*Replace (a1,a2,...,a(n+1),a(n+2))=(2,3,...,n-1,1,n)*)
app=app/.{ek[a_,1]->ek[a,l],ek[a_,n+2]->-ek[a,l],kk[1,a_]->kk[a,l],kk[a_,n+2]->-kk[a,l]};
Return[app];
];



bcjnumFLA[colorOrder_,{\[Alpha]_,\[Beta]_}]:=Module[{n,RemPart,RefOrder,ColOrder,sym,val,app},
n=Length[colorOrder];
sym=StringJoin["a",#]&/@ToString/@Range[n+2];
val=Append[Append[Range[2,n+1],1],n+2];
ColOrder=StringJoin["a",#]&/@ToString/@(colorOrder-1);(*Set color ordering according to argument*)
RefOrder=StringJoin["a",#]&/@ToString/@Range[n]; (*Standard reference ordering*)
RemPart=StringJoin["a",#]&/@ToString/@{n+1,n+2}; (*Remove particle a(n+1) and a(n+2) which are 1 and n*)
app=num[RefOrder,ColOrder,n,RemPart];
app=app/.eFFk->ChainEK;
app=app/.eFFe->ChainEE;
app=app/.kFFk->ChainKK;
app=(app//Expand)//.{eps[sym[[Position[val,\[Alpha]][[1,1]]]],a_]eps[sym[[Position[val,\[Beta]][[1,1]]]],b_]->eta[a,b]};
app=(app//Expand)//.dummyindicies2;
app=(app//Expand)//.dummyindicies;
(*app=app/.eFFe->ChainEE;*)
app=app/.Thread[sym->val]; (*Replace (a1,a2,...,a(n+1),a(n+2))=(2,3,...,n-1,1,n)*)
app=app/.{ek[a_,\[Alpha]]->ek[a,l],ek[a_,\[Beta]]->-ek[a,l],kk[\[Alpha],a_]->kk[a,l],kk[a_,\[Beta]]->-kk[a,l]};
Return[app];
];


bcjnumFLRef[refOrder_,colorOrder_]:=Module[{n,RemPart,RefOrder,ColOrder,sym,val,app},
n=Length[colorOrder];
sym=StringJoin["a",#]&/@ToString/@Range[n+2];
val=Append[Append[Range[2,n+1],1],n+2];
ColOrder=StringJoin["a",#]&/@ToString/@(colorOrder-1);(*Set color ordering according to argument*)
RefOrder=StringJoin["a",#]&/@ToString/@(refOrder-1); (*Standard reference ordering*)
RemPart=StringJoin["a",#]&/@ToString/@{n+1,n+2}; (*Remove particle a(n+1) and a(n+2) which are 1 and n*)
app=num[RefOrder,ColOrder,n,RemPart];
app=app/.eFFk->ChainEK;
app=app/.eFFe->ChainEE;
app=app/.kFFk->ChainKK;
(*app=(app//Expand)//.{eps[sym[[n+1]],a_]eps[sym[[n+2]],b_]->eta[a,b]-(k[sym[[n+1]],a]k[Q1,b]+k[Q1,a]k[sym[[n+1]],b])/kk[sym[[n+1]],Q1]};
app=(app//Expand)//.{eta[a_,a_]\[Rule]D,eta[a_,b_]^2->D};*)
app=(app//Expand)//.{eps[sym[[n+1]],a_]eps[sym[[n+2]],b_]->eta[a,b]};
app=(app//Expand)//.dummyindicies2;
app=(app//Expand)//.dummyindicies;
(*app=app/.eFFe->ChainEE;*)
app=app/.Thread[sym->val]; (*Replace (a1,a2,...,a(n+1),a(n+2))=(2,3,...,n-1,1,n)*)
app=app/.{ek[a_,1]->ek[a,l],ek[a_,n+2]->-ek[a,l],kk[1,a_]->kk[a,l],kk[a_,n+2]->-kk[a,l]};
Return[app];
];



(* ::Subsubsection:: *)
(*double forward limit*)


lAndlbarexpansion[x_]:={kk[x[[1]],x[[2]]]->l^2/2,kk[x[[Length[x]-1]],x[[Length[x]]]]->l^2/2,kk[x[[1]],x[[Length[x]-1]]]->-l^2/2,kk[x[[2]],x[[Length[x]]]]->-l^2/2,kk[x[[1]],x[[Length[x]]]]->0,kk[x[[2]],x[[Length[x]-1]]]->0,
					kk[x[[1]],a_]->1/2(kk[a,lbar]+kk[a,l]),kk[x[[2]],a_]->(kk[a,l]-kk[a,lbar])/2,
					kk[a_,x[[Length[x]]]]->-1/2(kk[a,lbar]+kk[a,l]),kk[a_,x[[Length[x]-1]]]->-(kk[a,l]-kk[a,lbar])/2,
					kk[x[[2]],x[[1]]]->l^2/2,kk[x[[Length[x]]],x[[Length[x]-1]]]->l^2/2,kk[x[[Length[x]-1]],x[[1]]]->-l^2/2,kk[x[[Length[x]]],x[[2]]]->-l^2/2,kk[x[[Length[x]]],x[[1]]]->0,kk[x[[Length[x]-1]],x[[2]]]->0,
					kk[a_,x[[1]]]->1/2(kk[a,lbar]+kk[a,l]),kk[a_,x[[2]]]->(kk[a,l]-kk[a,lbar])/2,
					kk[x[[Length[x]]],a_]->-1/2(kk[a,lbar]+kk[a,l]),kk[x[[Length[x]-1]],a_]->-(kk[a,l]-kk[a,lbar])/2,
					ek[a_,x[[1]]]->1/2(ek[a,lbar]+ek[a,l]),ek[a_,x[[2]]]->(ek[a,l]-ek[a,lbar])/2,
					ek[a_,x[[Length[x]]]]->-1/2(ek[a,lbar]+ek[a,l]),ek[a_,x[[Length[x]-1]]]->-(ek[a,l]-ek[a,lbar])/2};
					
bcjnumDFLRef[refOrder_,colorOrder_]:=Module[{n,RemPart,RefOrder,ColOrder,sym,val,app},
n=Length[colorOrder];
sym=StringJoin["a",#]&/@ToString/@Range[n+2];
val=Append[Append[Range[2,n+1],1],n+2];
ColOrder=StringJoin["a",#]&/@ToString/@(colorOrder-1);(*Set color ordering according to argument*)
RefOrder=StringJoin["a",#]&/@ToString/@(refOrder-1); (*Standard reference ordering*)
RemPart=StringJoin["a",#]&/@ToString/@{n+1,n+2}; (*Remove particle a(n+1) and a(n+2) which are 1 and n*)
app=num[RefOrder,ColOrder,n,RemPart];
app=app/.eFFk->ChainEK;
app=app/.eFFe->ChainEE;
app=app/.kFFk->ChainKK;
(*app=(app//Expand)//.{eps[sym[[n+1]],a_]eps[sym[[n+2]],b_]->eta[a,b]-(k[sym[[n+1]],a]k[Q1,b]+k[Q1,a]k[sym[[n+1]],b])/kk[sym[[n+1]],Q1]};
app=(app//Expand)//.{eta[a_,a_]\[Rule]D,eta[a_,b_]^2->D};*)
app=(app//Expand)//.{eps[sym[[n+1]],a_]eps[sym[[n+2]],b_]->eta[1,a,b],eps[sym[[1]],a_]eps[sym[[n]],b_]->eta[2,a,b]};
app=(app//Expand)//.dummyindicies2A;
app=(app//Expand)//.dummyindicies;
app=(app//Expand)//.dummyindicies3;
app=(app//Expand)//.dummyindicies;
app=(app//Expand)//.{eta[1,a_,b_]eta[2,a_,b_]->D-2,eta[1,a_,b_]eta[2,b_,a_]->D-2};
(*app=app/.eFFe->ChainEE;*)
app=app/.Thread[sym->val]; (*Replace (a1,a2,...,a(n+1),a(n+2))=(2,3,...,n-1,1,n)*)
app=app/.momentumrel[Range[n+2]];
app=app/.{kk[1,2]->l^2/2,kk[n+1,n+2]->l^2/2,kk[1,n+1]->-l^2/2,kk[2,n+2]->-l^2/2,kk[1,n+2]->0,kk[2,n+1]->0};
app=app/.lAndlbarexpansion[Range[n+2]];
Return[app];
];

bcjnumDFLRefA[refOrder_,colorOrder_]:=Module[{n,RemPart,RefOrder,ColOrder,sym,val,app},
n=Length[colorOrder];
sym=StringJoin["a",#]&/@ToString/@Range[n+2];
val=Append[Append[Range[2,n+1],1],n+2];
ColOrder=StringJoin["a",#]&/@ToString/@(colorOrder-1);(*Set color ordering according to argument*)
RefOrder=StringJoin["a",#]&/@ToString/@(refOrder-1); (*Standard reference ordering*)
RemPart=StringJoin["a",#]&/@ToString/@{n+1,n+2}; (*Remove particle a(n+1) and a(n+2) which are 1 and n*)
app=num[RefOrder,ColOrder,n,RemPart];
app=app/.eFFk->ChainEK;
app=app/.eFFe->ChainEE;
app=app/.kFFk->ChainKK;
(*app=(app//Expand)//.{eps[sym[[n+1]],a_]eps[sym[[n+2]],b_]->eta[a,b]-(k[sym[[n+1]],a]k[Q1,b]+k[Q1,a]k[sym[[n+1]],b])/kk[sym[[n+1]],Q1]};
app=(app//Expand)//.{eta[a_,a_]\[Rule]D,eta[a_,b_]^2->D};*)
app=(app//Expand)//.{eps[sym[[n+1]],a_]eps[sym[[n+2]],b_]->eta[sym[[n+1]],a,b],eps[sym[[1]],a_]eps[sym[[n]],b_]->eta[sym[[1]],a,b]};
app=(app//Expand)//.{eta[sym[[n+1]],a_,b_]k[sym[[1]],a_]k[sym[[1]],b_]->-2kk[sym[[n+1]],sym[[1]]],
eta[sym[[n+1]],a_,b_]k[sym[[1]],a_]k[sym[[n]],b_]->2kk[sym[[n+1]],sym[[1]]],
eta[sym[[n+1]],a_,b_]k[sym[[n]],a_]k[sym[[n]],b_]->-2kk[sym[[n+1]],sym[[1]]],
eta[sym[[1]],a_,b_]k[sym[[n+1]],a_]k[sym[[n+1]],b_]->-2kk[sym[[n+1]],sym[[1]]],
eta[sym[[1]],a_,b_]k[sym[[n+2]],a_]k[sym[[n+2]],b_]->-2kk[sym[[n+1]],sym[[1]]],
eta[sym[[1]],a_,b_]k[sym[[n+1]],a_]k[sym[[n+2]],b_]->2kk[sym[[n+1]],sym[[1]]],
eta[sym[[n+1]],a_,b_]eta[sym[[1]],b_,c_]k[sym[[1]],a_]k[sym[[n+1]],c_]->-2kk[sym[[n+1]],sym[[1]]],
eta[sym[[n+1]],a_,b_]eta[sym[[1]],b_,c_]k[sym[[n]],a_]k[sym[[n+2]],c_]->-2kk[sym[[n+1]],sym[[1]]],
eta[sym[[n+1]],a_,b_]eta[sym[[1]],b_,c_]k[sym[[1]],a_]k[sym[[n+2]],c_]->2kk[sym[[n+1]],sym[[1]]],
eta[sym[[n+1]],a_,b_]eta[sym[[1]],b_,c_]k[sym[[n]],a_]k[sym[[n+1]],c_]->2kk[sym[[n+1]],sym[[1]]]};
app=(app//Expand)//.{eta[sym[[n+1]],a_,b_]k[sym[[1]],a_]k[c_,b_]->kk[sym[[1]],c]-kk[sym[[n+1]],c],
eta[sym[[n+1]],b_,a_]k[sym[[1]],a_]k[c_,b_]->kk[sym[[1]],c]-kk[sym[[n+1]],c],
eta[sym[[n+1]],a_,b_]k[sym[[n]],a_]k[c_,b_]->-kk[sym[[1]],c]+kk[sym[[n+1]],c],
eta[sym[[n+1]],b_,a_]k[sym[[n]],a_]k[c_,b_]->-kk[sym[[1]],c]+kk[sym[[n+1]],c],
eta[sym[[n+1]],a_,b_]k[sym[[1]],a_]eps[c_,b_]->ek[c,sym[[1]]]-ek[c,sym[[n+1]]],
eta[sym[[n+1]],b_,a_]k[sym[[1]],a_]eps[c_,b_]->ek[c,sym[[1]]]-ek[c,sym[[n+1]]],
eta[sym[[n+1]],a_,b_]k[sym[[n]],a_]eps[c_,b_]->-ek[c,sym[[1]]]+ek[c,sym[[n+1]]],
eta[sym[[n+1]],b_,a_]k[sym[[n]],a_]eps[c_,b_]->-ek[c,sym[[1]]]+ek[c,sym[[n+1]]],
eta[sym[[1]],a_,b_]k[sym[[n+1]],a_]k[c_,b_]->kk[sym[[n+1]],c]-kk[sym[[1]],c],
eta[sym[[1]],b_,a_]k[sym[[n+1]],a_]k[c_,b_]->kk[sym[[n+1]],c]-kk[sym[[1]],c],
eta[sym[[1]],a_,b_]k[sym[[n+2]],a_]k[c_,b_]->-kk[sym[[n+1]],c]+kk[sym[[1]],c],
eta[sym[[1]],b_,a_]k[sym[[n+2]],a_]k[c_,b_]->-kk[sym[[n+1]],c]+kk[sym[[1]],c],
eta[sym[[1]],a_,b_]k[sym[[n+1]],a_]eps[c_,b_]->ek[c,sym[[n+1]]]-ek[c,sym[[1]]],
eta[sym[[1]],b_,a_]k[sym[[n+1]],a_]eps[c_,b_]->ek[c,sym[[n+1]]]-ek[c,sym[[1]]],
eta[sym[[1]],a_,b_]k[sym[[n+2]],a_]eps[c_,b_]->-ek[c,sym[[n+1]]]+ek[c,sym[[1]]],
eta[sym[[1]],b_,a_]k[sym[[n+2]],a_]eps[c_,b_]->-ek[c,sym[[n+1]]]+ek[c,sym[[1]]],
eta[sym[[n+1]],a_,b_]eta[sym[[1]],b_,c_]k[sym[[1]],a]k[sym[[n+1]],c]->2kk[sym[[n+1]],sym[[1]]],
eta[sym[[n+1]],a_,b_]eta[sym[[1]],b_,c_]k[sym[[n]],a]k[sym[[n+1]],c]->-2kk[sym[[n+1]],sym[[1]]],
eta[sym[[n+1]],a_,b_]eta[sym[[1]],b_,c_]k[sym[[1]],a]k[sym[[n+2]],c]->-2kk[sym[[n+1]],sym[[1]]],
eta[sym[[n+1]],a_,b_]eta[sym[[1]],b_,c_]k[sym[[n]],a]k[sym[[n+2]],c]->2kk[sym[[n+1]],sym[[1]]]
};
app=(app//Expand)//.{eta[k_,a_,a_]->(D-2),eta[sym[[n+1]],a_,b_]eta[sym[[1]],b_,a_]->(D-2),
eta[sym[[n+1]],a_,b_]eta[sym[[1]],a_,b_]->(D-2)};
app=(app//Expand)//.{eta[d_,a_,b_]k[x_,a_]k[y_,b_]->kk[x,y],
eta[d1_,a_,b_]eta[d2_,b_,c_]k[x_,a_]k[y_,c_]->kk[x,y],
eta[d_,a_,b_]eps[x_,a_]eps[y_,b_]->ee[x,y],
eta[d1_,a_,b_]eta[d2_,b_,c_]eps[x_,a_]eps[y_,c_]->ee[x,y],
eta[d_,a_,b_]eps[x_,a_]k[y_,b_]->ek[x,y],
eta[d1_,a_,b_]eta[d2_,b_,c_]eps[x_,a_]k[y_,c_]->ek[x,y],
eta[d_,a_,b_]k[x_,a_]eps[y_,b_]->ek[y,x],
eta[d1_,a_,b_]eta[d2_,b_,c_]k[x_,a_]eps[y_,c_]->kk[y,x]};
app=(app//Expand)//.dummyindicies;
(*app=app/.eFFe->ChainEE;*)
app=app/.Thread[sym->val]; (*Replace (a1,a2,...,a(n+1),a(n+2))=(2,3,...,n-1,1,n)*)
app=app/.momentumrel[Range[n+2]];
app=app/.{kk[1,2]->l^2/2,kk[n+1,n+2]->l^2/2,kk[1,n+1]->-l^2/2,kk[2,n+2]->-l^2/2,kk[1,n+2]->0,kk[2,n+1]->0};
app=app/.lAndlbarexpansion[Range[n+2]];
Return[app];
];



bcjnumDFLRefAA[refOrder_,colorOrder_]:=Module[{n,RemPart,RefOrder,ColOrder,sym,val,app},
Clear[c];
n=Length[colorOrder];
sym=StringJoin["a",#]&/@ToString/@Range[n+2];
val=Append[Append[Range[2,n+1],1],n+2];
ColOrder=StringJoin["a",#]&/@ToString/@(colorOrder-1);(*Set color ordering according to argument*)
RefOrder=StringJoin["a",#]&/@ToString/@(refOrder-1); (*Standard reference ordering*)
RemPart=StringJoin["a",#]&/@ToString/@{n+1,n+2}; (*Remove particle a(n+1) and a(n+2) which are 1 and n*)
app=num[RefOrder,ColOrder,n,RemPart];
app=app/.eFFk->ChainEK;
app=app/.eFFe->ChainEE;
app=app/.kFFk->ChainKK;
(*app=(app//Expand)//.{eps[sym[[n+1]],a_]eps[sym[[n+2]],b_]->eta[a,b]-(k[sym[[n+1]],a]k[Q1,b]+k[Q1,a]k[sym[[n+1]],b])/kk[sym[[n+1]],Q1]};
app=(app//Expand)//.{eta[a_,a_]\[Rule]D,eta[a_,b_]^2->D};*)
app=(app//Expand)//.{eps[sym[[n+1]],a_]eps[sym[[n+2]],b_]->eta[sym[[n+1]],a,b],eps[sym[[1]],a_]eps[sym[[n]],b_]->eta[sym[[1]],a,b]};
app=(app//Expand)//.{eta[sym[[n+1]],a_,b_]k[sym[[1]],a_]k[sym[[1]],b_]->0,
eta[sym[[n+1]],a_,b_]k[sym[[1]],a_]k[sym[[n]],b_]->0,
eta[sym[[n+1]],a_,b_]k[sym[[n]],a_]k[sym[[n]],b_]->0,
eta[sym[[1]],a_,b_]k[sym[[n+1]],a_]k[sym[[n+1]],b_]->0,
eta[sym[[1]],a_,b_]k[sym[[n+2]],a_]k[sym[[n+2]],b_]->0,
eta[sym[[1]],a_,b_]k[sym[[n+1]],a_]k[sym[[n+2]],b_]->0,
eta[sym[[n+1]],a_,b_]eta[sym[[1]],b_,c_]k[sym[[1]],a_]k[sym[[n+1]],c_]->0,
eta[sym[[n+1]],a_,b_]eta[sym[[1]],b_,c_]k[sym[[n]],a_]k[sym[[n+2]],c_]->0,
eta[sym[[n+1]],a_,b_]eta[sym[[1]],b_,c_]k[sym[[1]],a_]k[sym[[n+2]],c_]->0,
eta[sym[[n+1]],a_,b_]eta[sym[[1]],b_,c_]k[sym[[n]],a_]k[sym[[n+1]],c_]->0,
eta[sym[[n+1]],a_,b_]eta[sym[[1]],b_,c_]k[sym[[1]],a]k[sym[[n+1]],c]->0,
eta[sym[[n+1]],a_,b_]eta[sym[[1]],b_,c_]k[sym[[n]],a]k[sym[[n+1]],c]->0,
eta[sym[[n+1]],a_,b_]eta[sym[[1]],b_,c_]k[sym[[1]],a]k[sym[[n+2]],c]->0,
eta[sym[[n+1]],a_,b_]eta[sym[[1]],b_,c_]k[sym[[n]],a]k[sym[[n+2]],c]->0};
app=(app//Expand)//.{eta[sym[[n+1]],a_,b_]k[sym[[1]],a_]k[c_,b_]->kk[sym[[1]],c],
eta[sym[[n+1]],b_,a_]k[sym[[1]],a_]k[c_,b_]->kk[sym[[1]],c],
eta[sym[[n+1]],a_,b_]k[sym[[n]],a_]k[c_,b_]->-kk[sym[[1]],c],
eta[sym[[n+1]],b_,a_]k[sym[[n]],a_]k[c_,b_]->-kk[sym[[1]],c],
eta[sym[[n+1]],a_,b_]k[sym[[1]],a_]eps[c_,b_]->ek[c,sym[[1]]],
eta[sym[[n+1]],b_,a_]k[sym[[1]],a_]eps[c_,b_]->ek[c,sym[[1]]],
eta[sym[[n+1]],a_,b_]k[sym[[n]],a_]eps[c_,b_]->-ek[c,sym[[1]]],
eta[sym[[n+1]],b_,a_]k[sym[[n]],a_]eps[c_,b_]->-ek[c,sym[[1]]],
eta[sym[[1]],a_,b_]k[sym[[n+1]],a_]k[c_,b_]->kk[sym[[n+1]],c],
eta[sym[[1]],b_,a_]k[sym[[n+1]],a_]k[c_,b_]->kk[sym[[n+1]],c],
eta[sym[[1]],a_,b_]k[sym[[n+2]],a_]k[c_,b_]->-kk[sym[[n+1]],c],
eta[sym[[1]],b_,a_]k[sym[[n+2]],a_]k[c_,b_]->-kk[sym[[n+1]],c],
eta[sym[[1]],a_,b_]k[sym[[n+1]],a_]eps[c_,b_]->ek[c,sym[[n+1]]],
eta[sym[[1]],b_,a_]k[sym[[n+1]],a_]eps[c_,b_]->ek[c,sym[[n+1]]],
eta[sym[[1]],a_,b_]k[sym[[n+2]],a_]eps[c_,b_]->-ek[c,sym[[n+1]]],
eta[sym[[1]],b_,a_]k[sym[[n+2]],a_]eps[c_,b_]->-ek[c,sym[[n+1]]]
};
app=(app//Expand)//.{eta[k_,a_,a_]->(D-2),eta[sym[[n+1]],a_,b_]eta[sym[[1]],b_,a_]->(D-2),
eta[sym[[n+1]],a_,b_]eta[sym[[1]],a_,b_]->(D-2)};
app=(app//Expand)//.{eta[d_,a_,b_]k[x_,a_]k[y_,b_]->kk[x,y],
eta[d1_,a_,b_]eta[d2_,b_,c_]k[x_,a_]k[y_,c_]->kk[x,y],
eta[d_,a_,b_]eps[x_,a_]eps[y_,b_]->ee[x,y],
eta[d1_,a_,b_]eta[d2_,b_,c_]eps[x_,a_]eps[y_,c_]->ee[x,y],
eta[d_,a_,b_]eps[x_,a_]k[y_,b_]->ek[x,y],
eta[d1_,a_,b_]eta[d2_,b_,c_]eps[x_,a_]k[y_,c_]->ek[x,y],
eta[d_,a_,b_]k[x_,a_]eps[y_,b_]->ek[y,x],
eta[d1_,a_,b_]eta[d2_,b_,c_]k[x_,a_]eps[y_,c_]->kk[y,x]};
app=(app//Expand)//.dummyindicies;
(*app=app/.eFFe->ChainEE;*)
app=app/.Thread[sym->val]; (*Replace (a1,a2,...,a(n+1),a(n+2))=(2,3,...,n-1,1,n)*)
app=app/.momentumrel[Range[n+2]];
app=app/.{kk[1,2]->l^2/2,kk[n+1,n+2]->l^2/2,kk[1,n+1]->-l^2/2,kk[2,n+2]->-l^2/2,kk[1,n+2]->0,kk[2,n+1]->0};
app=app/.lAndlbarexpansion[Range[n+2]];
Return[app];
];


bcjnumDFLRefAAA[refOrder_,colorOrder_]:=Module[{n,RemPart,RefOrder,ColOrder,sym,val,app},
n=Length[colorOrder];
sym=StringJoin["a",#]&/@ToString/@Range[n+2];
val=Append[Append[Range[2,n+1],1],n+2];
ColOrder=StringJoin["a",#]&/@ToString/@(colorOrder-1);(*Set color ordering according to argument*)
RefOrder=StringJoin["a",#]&/@ToString/@(refOrder-1); (*Standard reference ordering*)
RemPart=StringJoin["a",#]&/@ToString/@{n+1,n+2}; (*Remove particle a(n+1) and a(n+2) which are 1 and n*)
app=num[RefOrder,ColOrder,n,RemPart];
app=app/.eFFk->ChainEK;
app=app/.eFFe->ChainEE;
app=app/.kFFk->ChainKK;
(*app=(app//Expand)//.{eps[sym[[n+1]],a_]eps[sym[[n+2]],b_]->eta[a,b]-(k[sym[[n+1]],a]k[Q1,b]+k[Q1,a]k[sym[[n+1]],b])/kk[sym[[n+1]],Q1]};
app=(app//Expand)//.{eta[a_,a_]\[Rule]D,eta[a_,b_]^2->D};*)
app=(app//Expand)//.{eps[sym[[n+1]],a_]eps[sym[[n+2]],b_]->eta[a,b],eps[sym[[1]],a_]eps[sym[[n]],b_]->eta[a,b]};
app=(app//Expand)//.dummyindicies2;
app=(app//Expand)//.dummyindicies;
app=(app//Expand)//.{eta[a_,b_]eta[a_,b_]->D-2,eta[a_,b_]eta[b_,a_]->D-2};
(*app=app/.eFFe->ChainEE;*)
app=app/.Thread[sym->val]; (*Replace (a1,a2,...,a(n+1),a(n+2))=(2,3,...,n-1,1,n)*)
app=app/.momentumrel[Range[n+2]];
app=app/.{kk[1,2]->l^2/2,kk[n+1,n+2]->l^2/2,kk[1,n+1]->-l^2/2,kk[2,n+2]->-l^2/2,kk[1,n+2]->0,kk[2,n+1]->0};
app=app/.lAndlbarexpansion[Range[n+2]];
Return[app];
];


momconDFL[a_,{l1p_,l1m_},{l2p_,l2m_}]:=Solve[Join[{kk[l1p,l1m],kk[l2p,l2m],kk[l1p,l2p]-l^2/2,kk[l1m,l2m]-l^2/2,kk[l1p,l2m]+l^2/2,kk[l1m,l2p]+l^2/2,
kk[l1m,l1p],kk[l2m,l2p],kk[l1m,l2m]-l^2/2,kk[l1p,l2p]-l^2/2,kk[l1m,l2p]+l^2/2,kk[l1p,l2m]+l^2/2},
Table[ek[i,l1p]+ek[i,l1m],{i,a}],Table[ek[i,l2p]+ek[i,l2m],{i,a}],Table[Sum[kk[i,j],{i,a}],{j,a}],Table[Sum[ek[i,j],{j,a}],{i,a}]]==0]; 

bcjnumDFLRefA[refOrder_,colorOrder_,{l1p_,l1m_},{l2p_,l2m_}]:=Module[{n,RemPart,RefOrder,ColOrder,sym,val,app},
n=Length[colorOrder];
sym=StringJoin["a",#]&/@ToString/@Range[n+2];
val=Append[Append[Range[2,n+1],1],n+2];
ColOrder=StringJoin["a",#]&/@ToString/@(colorOrder-1);(*Set color ordering according to argument*)
RefOrder=StringJoin["a",#]&/@ToString/@(refOrder-1); (*Standard reference ordering*)
RemPart=StringJoin["a",#]&/@ToString/@{n+1,n+2}; (*Remove particle a(n+1) and a(n+2) which are 1 and n*)
app=num[RefOrder,ColOrder,n,RemPart];
app=app/.eFFk->ChainEK;
app=app/.eFFe->ChainEE;
app=app/.kFFk->ChainKK;
(*app=(app//Expand)//.{eps[sym[[n+1]],a_]eps[sym[[n+2]],b_]->eta[a,b]-(k[sym[[n+1]],a]k[Q1,b]+k[Q1,a]k[sym[[n+1]],b])/kk[sym[[n+1]],Q1]};
app=(app//Expand)//.{eta[a_,a_]\[Rule]D,eta[a_,b_]^2->D};*)
app=(app//Expand)//.{eps[sym[[Position[val,l1p][[1,1]]]],a_]eps[sym[[Position[val,l1m][[1,1]]]],b_]->eta[a,b],eps[sym[[Position[val,l2p][[1,1]]]],a_]eps[sym[[Position[val,l2m][[1,1]]]],b_]->eta[a,b]};
app=(app//Expand)//.dummyindicies2;
app=(app//Expand)//.dummyindicies;
(*app=app/.eFFe->ChainEE;*)
app=app/.Thread[sym->val]; (*Replace (a1,a2,...,a(n+1),a(n+2))=(2,3,...,n-1,1,n)*)
app=app//.momconDFL[Range[n+2],{l1p,l1m},{l2p,l2m}][[1]];
app=app//.lAndlbarexpansion[{l1p,l2p,l2m,l1m}];
Return[app];
];




(* ::Subsubsection::Closed:: *)
(*With dummy-indices and completeness relation (6-point).*)


bcjnum3[colorOrder_]:=Module[{n,RemPart,RefOrder,ColOrder,sym,val,app},
n=Length[colorOrder];
sym=StringJoin["a",#]&/@ToString/@Range[n+2];
val=Append[Append[Range[2,n+1],1],n+2];
ColOrder=StringJoin["a",#]&/@ToString/@(colorOrder-1);
RefOrder=StringJoin["a",#]&/@ToString/@Range[n];
RemPart=StringJoin["a",#]&/@ToString/@{n+1,n+2};
app=num[RefOrder,ColOrder,n,RemPart];
app=app/.eFFk->ChainEK;
app=app/.eFFe->ChainEE;
app=app/.kFFk->ChainKK;
app=(app//Expand)//.completeness;
app=(app//Expand)//.dummyindicies2;
app=(app//Expand)//.dummyindicies;
(*app=app/.eFFe->ChainEE;*)
app=app/.Thread[sym->val];
Return[app];
];


(* ::Subsubsection::Closed:: *)
(*With dummy-indices completeness relation (7-point)*)


bcjnum7[colorOrder_]:=Module[{n,RemPart,RefOrder,ColOrder,sym,val,app},
n=Length[colorOrder];
sym=StringJoin["a",#]&/@ToString/@Range[n+2];
val=Append[Append[Range[2,n+1],1],n+2];
ColOrder=StringJoin["a",#]&/@ToString/@(colorOrder-1);
RefOrder=StringJoin["a",#]&/@ToString/@Range[n];
RemPart=StringJoin["a",#]&/@ToString/@{n+1,n+2};
app=num[RefOrder,ColOrder,n,RemPart];
app=app/.eFFk->ChainEK;
app=app/.eFFe->ChainEE;
app=app/.kFFk->ChainKK;
app=(app//Expand)//.completeness7;
app=(app//Expand)//.dummyindicies2;
app=(app//Expand)//.dummyindicies;
(*app=app/.eFFe->ChainEE;*)
app=app/.Thread[sym->val];
Return[app];
];


(*Same as above but with explicit reference ordering*)
bcjnum7Ref[refOrder_,colorOrder_]:=Module[{n,RemPart,RefOrder,ColOrder,sym,val,app},
n=Length[colorOrder];
sym=StringJoin["a",#]&/@ToString/@Range[n+2];
val=Append[Append[Range[2,n+1],1],n+2];
ColOrder=StringJoin["a",#]&/@ToString/@(colorOrder-1);
RefOrder=StringJoin["a",#]&/@ToString/@(refOrder-1);
RemPart=StringJoin["a",#]&/@ToString/@{n+1,n+2};
app=num[RefOrder,ColOrder,n,RemPart];
app=app/.eFFk->ChainEK;
app=app/.eFFe->ChainEE;
app=app/.kFFk->ChainKK;
app=(app//Expand)//.completeness7;
app=(app//Expand)//.dummyindicies2;
app=(app//Expand)//.dummyindicies;
(*app=app/.eFFe->ChainEE;*)
app=app/.Thread[sym->val];
Return[app];
];



(* ::Subsubsection::Closed:: *)
(*With dummy-indices completeness relation (8-point)*)


completeness8={eps["a7",a_]eps["a8",b_]->eta[a,b],eps["a1",a_]eps["a6",b_]->eta[a,b]};

bcjnum8[colorOrder_]:=Module[{n,RemPart,RefOrder,ColOrder,sym,val,app},
n=Length[colorOrder];
sym=StringJoin["a",#]&/@ToString/@Range[n+2];
val=Append[Append[Range[2,n+1],1],n+2];
ColOrder=StringJoin["a",#]&/@ToString/@(colorOrder-1);
RefOrder=StringJoin["a",#]&/@ToString/@Range[n];
RemPart=StringJoin["a",#]&/@ToString/@{n+1,n+2};
app=num[RefOrder,ColOrder,n,RemPart];
app=app/.eFFk->ChainEK;
app=app/.eFFe->ChainEE;
app=app/.kFFk->ChainKK;
app=(app//Expand)//.completeness8;
app=(app//Expand)//.dummyindicies2;
app=(app//Expand)//.dummyindicies;
(*app=app/.eFFe->ChainEE;*)
app=app/.Thread[sym->val];
Return[app];
];


(* ::Subsubsection:: *)
(*Original code*)


bcjnum2[colorOrder_]:=Module[{n,RemPart,RefOrder,ColOrder,sym,val,app},
n=Length[colorOrder];
sym=StringJoin["a",#]&/@ToString/@Range[n+2];
val=Append[Append[Range[2,n+1],1],n+2];
ColOrder=StringJoin["a",#]&/@ToString/@(colorOrder-1);
RefOrder=StringJoin["a",#]&/@ToString/@Range[n];
RemPart=StringJoin["a",#]&/@ToString/@{n+1,n+2};
app=num[RefOrder,ColOrder,n,RemPart];
app=app/.eFFk->ChainEK2;
(*app=app/.eFFe->ChainEE;*)
app=app/.Thread[sym->val];
Return[app];
];



(* ::Subsubsection::Closed:: *)
(*With dummy-indices and completeness relations (4-point)*)


bcjnum4[colorOrder_]:=Module[{n,RemPart,RefOrder,ColOrder,sym,val,app},
n=Length[colorOrder];
sym=StringJoin["a",#]&/@ToString/@Range[n+2];
val=Append[Append[Range[2,n+1],1],n+2];
ColOrder=StringJoin["a",#]&/@ToString/@(colorOrder-1);
RefOrder=StringJoin["a",#]&/@ToString/@Range[n];
RemPart=StringJoin["a",#]&/@ToString/@{n+1,n+2};
app=num[RefOrder,ColOrder,n,RemPart];
app=app/.eFFk->ChainEK;
app=app/.eFFe->ChainEE;
app=app/.kFFk->ChainKK;
app=(app//Expand)//.{eps["a3",a_]eps["a4",b_]->
					eta[a,b]-K*(k["a3",a]k[q,b]+k[q,a]k["a3",b])/kk[q,"a3"]};
app=(app//Expand)//.dummyindicies2;
app=(app//Expand)//.dummyindicies;
(*app=app/.eFFe->ChainEE;*)
app=app/.Thread[sym->val];
Return[app];
];


(* ::Section::Closed:: *)
(*Feynman rules*)


(*define metric \[Eta] ("Esc"eta"Esc") and contraction of dummy-indices*)
Attributes[\[Eta]]={Orderless};

minusrelation:={p[i_,a_]:> -p[-i,a]/;i<0};

dummyindexrelations1:={\[Eta][a_,b_]\[Eta][a_,c_]->\[Eta][b,c],\[Eta][a_,b_]eps[c_,a_]->eps[c,b],
\[Eta][a_,b_]p[c_,a_]->p[c,b],
\[Eta][a_,a_]->D,\[Eta][a_,b_]^2->D};

dumindexrelations2:={eps[a_,b_]eps[c_,b_]->ee[a,c],
eps[a_,b_]p[c_,b_]->ek[a,c],p[a_,b_]p[c_,b_]->kk[a,c]};

linearmomentum:={p[i_+j_,a_]->p[i,a]+p[j,a],p[-i_-j_,a_]->-p[i,a]-p[j,a]};

(*Define gluon vertices according to the color ordered rules [See https://arxiv.org/pdf/hep-ph/9601359.pdf]*)
(*ordering is clockwise*)
(*
V3gluon[{i_,a_},{j_,b_},{k_,c_}]:=(I/Sqrt[2])*((p[i,c]-p[j,c])\[Eta][a,b]
+(p[j,a]-p[k,a])\[Eta][b,c]
+(p[k,b]-p[i,b])\[Eta][a,c]);
*)
V3gluon[{i_,a_},{j_,b_},{k_,c_}]:=(I/Sqrt[2])*((2p[i,c]+p[k,c])\[Eta][a,b]
+(-p[i,a]-2p[k,a])\[Eta][b,c]
+(p[k,b]-p[i,b])\[Eta][a,c]);

V4gluon[{i_,a_},{j_,b_},{k_,c_},{l_,d_}]:=I(\[Eta][a,c]\[Eta][b,d]-1/2(\[Eta][a,b]\[Eta][c,d]+\[Eta][a,d]\[Eta][b,c]));
(*Define ghost vertex*)
(*V3ghost[{{gluon}},{ghost},{ghost}]*)
V3ghost[{{i_,a_}},{j_,b_},{k_,c_}]:=(I/Sqrt[2])*(p[j,a]);

(*Define gluon propagator*)
(*\[CapitalDelta][\[Mu],\[Nu],i_] where i_ is the one the particles connecting to the propagator*)
\[CapitalDelta][\[Mu],\[Nu],i_]:=-I \[Eta][\[Mu],\[Nu]]/p[i,\[Mu]]^2;

(*\[CapitalDelta]N[\[Mu],\[Nu]] propagtor without denominatior*)
\[CapitalDelta]N[\[Mu],\[Nu]]:=-I \[Eta][\[Mu],\[Nu]];

FeynDiagCalc[expr_]:=Module[{app},
app=expr//Expand;
app=app//.linearmomentum//Expand;
app=app//.minusrelation;
app=app//.dummyindexrelations1;
app=app//.dumindexrelations2;

Return[app];
];


(* ::Section::Closed:: *)
(*Double Forward limit*)


(*Define momentum conservation and l in the double foward limit*)
momentumrel11[x_]:=Solve[{Sum[kk[i,#],
{i,x[[Range[3,Length[x]-2]]]}]}&/@x==0][[1]];

momentumrel12[x_]:=Solve[{s[x[[1]],#]+s[x[[Length[x]]],#]}&/@x==0][[1]];
momentumrel13[x_]:=Solve[{s[x[[2]],#]+s[x[[Length[x]-1]],#]}&/@x==0][[1]];
momentumrel21[x_]:=Solve[{Sum[ek[#,i],
{i,x[[Range[3,Length[x]-2]]]}]}&/@x==0][[1]];

momentumrel22[x_]:=Solve[{ek[#,x[[1]]]+ek[#,x[[Length[x]]]]}&/@
					DeleteCases[#,x[[Length[x]]]]&@(DeleteCases[#,x[[1]]]&@x)==0][[1]];
momentumrel23[x_]:=Solve[{ek[#,x[[2]]]+ek[#,x[[Length[x]-1]]]}&/@
					DeleteCases[#,x[[Length[x]-1]]]&@(DeleteCases[#,x[[2]]]&@x)==0][[1]];

momentumrel31[x_]:={kk[x[[1]],x[[2]]]->l^2/2,kk[x[[Length[x]-1]],x[[Length[x]]]]->l^2/2,
kk[x[[2]],x[[Length[x]]]]->-l^2/2,kk[x[[1]],x[[Length[x]-1]]]->-l^2/2,kk[x[[1]],x[[Length[x]]]]->0,
kk[x[[2]],x[[Length[x]-1]]]->0};

momentumrel[x_]:=Join[momentumrel11[x],momentumrel12[x],momentumrel13[x],momentumrel21[x]
					,momentumrel22[x],momentumrel23[x],momentumrel31[x]];
(*lAndlbarexpansion[x_]:={kk[x[[1]],a_]->1/2(kk[a,lbar]+kk[a,l]),kk[x[[2]],a_]->(kk[a,l]-kk[a,lbar])/2,
					kk[a_,x[[Length[x]]]]->-1/2(kk[a,lbar]+kk[a,l]),kk[a_,x[[Length[x]-1]]]->-(kk[a,l]-kk[a,lbar])/2,
					ek[a_,x[[1]]]->1/2(ek[a,lbar]+ek[a,l]),ek[a_,x[[2]]]->(ek[a,l]-ek[a,lbar])/2,
					ek[a_,x[[Length[x]]]]->-1/2(ek[a,lbar]+ek[a,l]),ek[a_,x[[Length[x]-1]]]->-(ek[a,l]-ek[a,lbar])/2};*)
(*Define the double forward limit in D=4*)
dfl4D[expr_,cOrder_]:=Module[{app,x},
app=expr;
app=app//.momentumrel[cOrder];
app=app//Expand;
app=(app//.lAndlbarexpansion[cOrder])//Expand;
app=app//Simplify;
app=app/.{D->4};

Return[app];
];



(* ::Section::Closed:: *)
(*Shifts*)


(*lShift[expr,{a,b}], shifts a in expr by b*)
lShift[expr_,shift_]:=Module[{app,a1,b1},
app=expr;
a1=shift[[1]];b1=shift[[2]];
app=app/.{a1->a1+b1};
app=app/.{ek[a_,a1+b1]-> ek[a,a1]+ek[a,b1],kk[a_,a1+b1]->kk[a,a1]+kk[a,b1],s[a_,a1+b1]->s[a,a1]+s[a,b1]};
app=app//.{ek[a_,b_] :> -ek[a,-b]/;b<0,kk[a_,b_]:> -kk[a,-b]/;b<0,kk[a_,b_]:> -kk[-a,b]/;a<0};
Return[app];
]


(* ::Section:: *)
(*Spinor-Helicity*)


 (*Definition and conventions from: https://arxiv.org/pdf/1310.5353.pdf*)
 (*Define spinor products*)
Spaa[i_,j_]:=Signature[{i,j}]*Spaa @@ Sort[{i,j}] /;  !OrderedQ[{i,j}] &&
      FreeQ[{i,j}, Pattern];
Spaa[i_,i_]:=0;
Spbb[i_,j_]:=Signature[{i,j}]*Spbb @@ Sort[{i,j}] /;  !OrderedQ[{i,j}] &&
      FreeQ[{i,j}, Pattern];
Spbb[i_,i_]:=0;

(*Define MHV ampltiude*)
MHV[{a_,b_},c_]:=I*Spaa[a,b]^4/Times@@Spaa@@@Partition[Append[#,First[c]]&@c,2,1];

(*Define AMHV ampltiude*)
AMHV[{a_,b_},c_]:=-I*Spbb[a,b]^4/Times@@Spbb@@@Partition[Append[#,First[c]]&@c,2,1];

(*Numerical spinors*)
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
					
					];
					
NSpinHel:={Spaa[a_,b_]:> (lam[a,1]*lam[b,2]-lam[a,2]*lam[b,1]),
			Spbb[a_,b_]:> lambar[a,1]*lambar[b,2]-lambar[a,2]*lambar[b,1],
			s[a_,b_]:> (lam[a,1]lam[b,2]-lam[a,2]lam[b,1])(lambar[b,1]lambar[a,2]-lambar[b,2]lambar[a,1])};
SignRule=Rule[Times[-1,x_],y_]:> Rule[x,Times[-1,y]];

spMomCon[l_,N_]:=spMomCon[l,N]=Table[Solve[Sum[Spakb[a,i,b],{i,N}]==0,Spakb[a,l,b]][[1]],{a,N},{b,N}];
spMomConTab[l_,N_]:=spMomConTab[l,N]=(Drop[spMomCon[l,N]/.{Spakb[a_,c_,b_]->Spaa[a,c]Spbb[c,b]},{l},{l}])/.SignRule;
SpinHel[expr_,neghel_,poshel_,N_]:=
		Module[{app},					
				app=expr;
				app=app/.{s[a_,b_]:> Spaa[a,b]Spbb[b,a]/;NumberQ[a]&&NumberQ[b]};
				app=app/.{kk[a_,b_]:> 1/2 Spaa[a,b]Spbb[b,a]/;NumberQ[a]&&NumberQ[b]};
				app=app/.{ek[a_,b_]:> (Spaa[q[a],b]Spbb[b,a])/(Sqrt[2]Spaa[q[a],a])/;MemberQ[poshel,a]&&NumberQ[b]};
				app=app/.{ek[a_,b_]:> ((Spbb[q[a],b]Spaa[b,a])/(Sqrt[2]Spbb[q[a],a]))/;MemberQ[neghel,a]&&NumberQ[b]};
				app=app/.{ee[a_,b_]:> (Spaa[q[a],q[b]]Spbb[b,a])/(Spaa[q[a],a]Spaa[q[b],b])/;MemberQ[poshel,a]&&MemberQ[poshel,b]};
				app=app/.{ee[a_,b_]:> (Spbb[q[a],q[b]]Spaa[b,a])/(Spbb[q[a],a]Spbb[q[b],b])/;MemberQ[neghel,a]&&MemberQ[neghel,b]};
				app=app/.{ee[a_,b_]:> (Spbb[q[a],b]Spaa[q[b],a])/(Spbb[q[a],a]Spaa[q[b],b])/;MemberQ[neghel,a]&&MemberQ[poshel,b]};
				app=app/.{ee[a_,b_]:> (Spbb[a,q[b]]Spaa[b,q[a]])/(Spaa[q[a],a]Spbb[q[b],b])/;MemberQ[poshel,a]&&MemberQ[neghel,b]};
				
				Return[app];

									];
									
lSpinHel[expr_,neghel_,poshel_,N_]:=
		Module[{app},					
				app=expr;
				app=app/.{s[a_,b_]:> Spaa[a,b]Spbb[b,a]/;NumberQ[a]&&NumberQ[b]};
				app=app/.{kk[a_,b_]:> 1/2 Spaa[a,b]Spbb[b,a]/;NumberQ[a]};
				app=app/.{ek[a_,b_]:> (Spaa[q[a],b]Spbb[b,a])/(Sqrt[2]Spaa[q[a],a])/;MemberQ[poshel,a]};
				app=app/.{ek[a_,b_]:> ((Spbb[q[a],b]Spaa[b,a])/(Sqrt[2]Spbb[q[a],a]))/;MemberQ[neghel,a]};
				app=app/.{ee[a_,b_]:> (Spaa[q[a],q[b]]Spbb[b,a])/(Spaa[q[a],a]Spaa[q[b],b])/;MemberQ[poshel,a]&&MemberQ[poshel,b]};
				app=app/.{ee[a_,b_]:> (Spbb[q[a],q[b]]Spaa[b,a])/(Spbb[q[a],a]Spbb[q[b],b])/;MemberQ[neghel,a]&&MemberQ[neghel,b]};
				app=app/.{ee[a_,b_]:> (Spbb[q[a],b]Spaa[q[b],a])/(Spbb[q[a],a]Spaa[q[b],b])/;MemberQ[neghel,a]&&MemberQ[poshel,b]};
				app=app/.{ee[a_,b_]:> (Spbb[a,q[b]]Spaa[b,q[a]])/(Spaa[q[a],a]Spbb[q[b],b])/;MemberQ[poshel,a]&&MemberQ[neghel,b]};
				
				Return[app];
				];
									
momconSH[expr_,N_]:=Module[{app,test,n},
								app=expr;
								n=Ceiling[N/2];
							Do[
								Do[
									Do[test=(app/.spMomConTab[l,N][[i,j]])//Expand;
									If[ByteCount[test]<ByteCount[app],
											app=test],
									{j,N-1}],
								{i,N-1}];
							,{l,N}];
								Return[app];

								];

(*Schouten identities*)
schoutenA:={
Spaa[i_,k_]Spaa[j_,l_]+Spaa[i_,l_]Spaa[k_,j_]:> Spaa[i,j]Spaa[k,l],
-Spaa[i_,k_]Spaa[j_,l_]-Spaa[i_,l_]Spaa[k_,j_]:> -Spaa[i,j]Spaa[k,l],

Spaa[i_,k_]Spaa[j_,l_]-Spaa[i_,j_]Spaa[k_,l_]:>-Spaa[i,l]Spaa[k,j], 
Spaa[i_,j_]Spaa[k_,l_]-Spaa[i_,k_]Spaa[j_,l_]:>Spaa[i,l]Spaa[k,j], 

Spaa[i_,j_]Spaa[k_,l_]-Spaa[i_,l_]Spaa[k_,j_]:> Spaa[i,k]Spaa[j,l],
-Spaa[i_,j_]Spaa[k_,l_]+Spaa[i_,l_]Spaa[k_,j_]:> -Spaa[i,k]Spaa[j,l]
};

schoutenB:={
Spbb[i_,k_]Spbb[j_,l_]+Spbb[i_,l_]Spbb[k_,j_]:> Spbb[i,j]Spbb[k,l],
-Spbb[i_,k_]Spbb[j_,l_]-Spbb[i_,l_]Spbb[k_,j_]:> -Spbb[i,j]Spbb[k,l],

Spbb[i_,k_]Spbb[j_,l_]-Spbb[i_,j_]Spbb[k_,l_]:> -Spbb[i,l]Spbb[k,j], 
Spbb[i_,j_]Spbb[k_,l_]-Spbb[i_,k_]Spbb[j_,l_]:> Spbb[i,l]Spbb[k,j], 

Spbb[i_,j_]Spbb[k_,l_]-Spbb[i_,l_]Spbb[k_,j_]:> Spbb[i,k]Spbb[j,l],
-Spbb[i_,j_]Spbb[k_,l_]+Spbb[i_,l_]Spbb[k_,j_]:> -Spbb[i,k]Spbb[j,l]
};

(* ::Package:: *)

BeginPackage["GGT`"];


$GGTfunctions=Sort[{"GGTmhv","GGTnumeric","GGTgenvar","GGTmhvbar","GGTsuperamp","GGTtoSpinors","GGTgluon","GGTfermion","GGTfermionS","GGTnmhvgluon","GGTnmhv2ferm","GGTnmhv4ferm","GGTnmhv4fermS","GGTnmhv6ferm","GGTnmhv6fermS","GGTnnmhvgluon","GGTnnmhv2ferm","GGTnnmhv4ferm","GGTnnmhv4fermS","GGTnnmhv6ferm","GGTnnmhv6fermS"}]


GGTgenvar::usage="GGTgenvar[P] generates the spinors and region momenta for a numerical evaluation of an amplitude at the  phase-space point P={\!\(\*SubscriptBox[\"p\", \"1\"]\),\!\(\*SubscriptBox[\"p\", \"2\"]\),...,\!\(\*SubscriptBox[\"p\", \"n\"]\)}. Does not work for momenta p={E,0,0,-E}!";


GGTnumeric::usage="GGTnumeric[expression] gives a numerical value for the GGT expression if GGTgenvar[P] has been applied.";


GGTmhv::usage="GGTmhv[n,a,b] gives the n-gluon MHV amplitude with negative helicity gluons at positions a and b";


GGTmhvbar::usage="GGTmhvbar[n,a,b] gives the n-gluon \!\(\*OverscriptBox[\"MHV\", \"_\"]\) amplitude with positve helicity gluons at positions a and b";


GGTspaa::usage="GGTspaa[a,\!\(\*SubscriptBox[\"p\", \"1\"]\),...,\!\(\*SubscriptBox[\"p\", \"m\"]\),b] denotes spinor products <a|\!\(\*SubscriptBox[\"p\", \"1\"]\)|...|\!\(\*SubscriptBox[\"p\", \"m\"]\)|b>, with m even.";


GGTspbb::usage="GGTspbb[a,\!\(\*SubscriptBox[\"p\", \"1\"]\),...,\!\(\*SubscriptBox[\"p\", \"m\"]\),b] denotes spinor products [a|\!\(\*SubscriptBox[\"p\", \"1\"]\)|...|\!\(\*SubscriptBox[\"p\", \"m\"]\)|b], with m even.";


GGTx::usage="GGTx[i,j]=\!\(\*SubscriptBox[\"x\", \"i\"]\)-\!\(\*SubscriptBox[\"x\", \"j\"]\) are differences between dual coordinates (or region momenta), defined by \!\(\*SubscriptBox[\"x\", 
RowBox[{\"i\", \"+\", \"1\"}]]\)-\!\(\*SubscriptBox[\"x\", \"i\"]\)=\!\(\*SubscriptBox[\"p\", \"i\"]\). ";


GGTs::usage="Mandelstam invariants. GGTs[i,j]=(\!\(\*SubscriptBox[\"x\", RowBox[{\"i\", \",\", \"j\"}]]\)\!\(\*SuperscriptBox[\")\", \"2\"]\)=(\!\(\*SubscriptBox[\"p\", \"i\"]\)+\!\(\*SubscriptBox[\"p\", 
RowBox[{\"i\", \"+\", \"1\"}]]\)+...+\!\(\*SubscriptBox[\"p\", \"j-1\"]\)\!\(\*SuperscriptBox[\")\", \"2\"]\)";


GGTsuperamp::usage="GGTsuperamp[n,k] is the \!\(\*FormBox[SuperscriptBox[\"N\", \"k\"],TraditionalForm]\)MHV superamplitude of n superfields, with the MHV superamplitude factored out, in terms of the R invariants.";


GGTr::usage="R invariants. \!\(\*FormBox[RowBox[{SubsuperscriptBox[\"R\",RowBox[{\"n\", \";\", \"v\", \";\", RowBox[{\"a\", \" \", \"b\"}]}], RowBox[{\"L\", \";\", \"U\"}]], \"=\",RowBox[{\"GGTr\", \"[\", RowBox[{\"n\", \",\", \"L\", \",\", \"U\", \",\", \"v\", \",\", \"a\", \",\", \"b\"}], \"]\"}]}],TraditionalForm]\)  with \!\(\*FormBox[RowBox[{\"L\", \"=\", RowBox[{\"{\", RowBox[{SubscriptBox[\"L\", \"1\"], \",\", SubscriptBox[\"L\", \"2\"], \",\", \"...\"}]}]}],TraditionalForm]\)}, \!\(\*FormBox[RowBox[{\"U\", \"=\", RowBox[{\"{\", RowBox[{SubscriptBox[\"U\", \"1\"], \",\", SubscriptBox[\"U\", \"2\"], \",\", \" \", \"...\"}]}]}],TraditionalForm]\)}, \!\(\*FormBox[RowBox[{\"v\", \" \", \"=\", \" \", RowBox[{\"{\", RowBox[{RowBox[{\"{\", RowBox[{SubscriptBox[\"v\", \"1\"], \",\", \" \", SubscriptBox[\"u\", \"1\"]}], \"}\"}], \",\", \" \", RowBox[{\"{\", RowBox[{SubscriptBox[\"v\", \"2\"], \",\", SubscriptBox[\"u\", \"2\"]}]}]}]}]}],TraditionalForm]\)}, ...}";


GGTtoSpinors::usage="GGTtoSpinors[GGTexpression] translates GGT expressions into a form compatible with the S@M package.";


GGTgluon::usage="GGTgluon[n,H] is the n-gluon amplitude with negative helicity gluons at positions \!\(\*FormBox[RowBox[{\"H\", \"=\",RowBox[{\"{\",RowBox[{SubscriptBox[\"c\", \"1\"], \",\", SubscriptBox[\"c\", \"2\"], \",\", SubscriptBox[\"c\", \"3\"], \",\", \" \", \"...\"}]}]}],TraditionalForm]\)}.
H does not need to be ordered. For compact expressions one should use cyclic symmetry to put one gluon at position n.";


GGTfermion::usage="GGTfermion\!\(\*
StyleBox[\"[\", \"Text\"]\)\!\(\*
StyleBox[\"n\", \"Text\"]\)\!\(\*
StyleBox[\",\", \"Text\"]\)\!\(\*
StyleBox[\"G\", \"Text\"]\)\!\(\*
StyleBox[\",\", \"Text\"]\)\!\(\*
StyleBox[\"F\", \"Text\"]\)\!\(\*
StyleBox[\",\", \"Text\"]\)\!\(\*
StyleBox[\"aF\", \"Text\"]\)\!\(\*
StyleBox[\"]\", \"Text\"]\)\!\(\*
StyleBox[\" \", \"Text\"]\)\!\(\*
StyleBox[\"is\", \"Text\"]\)\!\(\*
StyleBox[\" \", \"Text\"]\)\!\(\*
StyleBox[\"the\", \"Text\"]\)\!\(\*
StyleBox[\" \", \"Text\"]\)\!\(\*
StyleBox[\"n\", \"Text\"]\)\!\(\*
StyleBox[\"-\", \"Text\"]\)\!\(\*
StyleBox[\"parton\", \"Text\"]\)\!\(\*
StyleBox[\" \", \"Text\"]\)\!\(\*
StyleBox[\"amplitude\", \"Text\"]\)\!\(\*
StyleBox[\" \", \"Text\"]\)\!\(\*
StyleBox[\"with\", \"Text\"]\)\!\(\*
StyleBox[\" \", \"Text\"]\)\!\(\*
StyleBox[\"negative\", \"Text\"]\)\!\(\*
StyleBox[\" \", \"Text\"]\)\!\(\*
StyleBox[\"helicity\", \"Text\"]\)\!\(\*
StyleBox[\" \", \"Text\"]\)\!\(\*
StyleBox[\"gluons\", \"Text\"]\)\!\(\*
StyleBox[\" \", \"Text\"]\)\!\(\*
StyleBox[\"at\", \"Text\"]\)\!\(\*
StyleBox[\" \", \"Text\"]\)\!\(\*
StyleBox[\"positions\", \"Text\"]\)\!\(\*
StyleBox[\" \", \"Text\"]\)\!\(\*
StyleBox[FormBox[
RowBox[{\"G\", \"=\", 
RowBox[{\"{\", 
RowBox[{SubscriptBox[\"c\", \"1\"], \",\", SubscriptBox[\"c\", \"2\"], \",\", \"...\", \",\", SubscriptBox[\"c\", \"m\"]}]}]}],
TraditionalForm], \"Text\"]\)}\!\(\*
StyleBox[\",\", \"Text\"]\)\!\(\*
StyleBox[\" \", \"Text\"]\)\!\(\*
StyleBox[\"positve\", \"Text\"]\)\!\(\*
StyleBox[\" \", \"Text\"]\)\!\(\*
StyleBox[\"and\", \"Text\"]\)\!\(\*
StyleBox[\" \", \"Text\"]\)\!\(\*
StyleBox[\"negative\", \"Text\"]\)\!\(\*
StyleBox[\" \", \"Text\"]\)\!\(\*
StyleBox[\"helicity\", \"Text\"]\)\!\(\*
StyleBox[\" \", \"Text\"]\)\!\(\*
StyleBox[\"gluinos\", \"Text\"]\)\!\(\*
StyleBox[\" \", \"Text\"]\)\!\(\*
StyleBox[\"of\", \"Text\"]\)\!\(\*
StyleBox[\" \", \"Text\"]\)\!\(\*
StyleBox[\"flavor\", \"Text\"]\)\!\(\*
StyleBox[\" \", \"Text\"]\)\!\(\*SubscriptBox[
StyleBox[\"A\", \"Text\"], \"i\"]\),\!\(\*SubscriptBox[\"B\", \"i\"]\) at positions \!\(\*SubscriptBox[
StyleBox[\"q\", \"Text\"], \"i\"]\),\!\(\*SubscriptBox[OverscriptBox[
StyleBox[\"q\", \"Text\"], \"-\"], \"i\"]\)\!\(\*
StyleBox[\"   \", \"Text\"]\)\!\(\*
StyleBox[\"F\", \"Text\"]\)\!\(\*
StyleBox[\"=\", \"Text\"]\)\!\(\*
StyleBox[\"{\", \"Text\"]\)\!\(\*
StyleBox[\"{\", \"Text\"]\)\!\(\*SubscriptBox[
StyleBox[\"q\", \"Text\"], \"1\"]\),\!\(\*SubscriptBox[\"A\", \"1\"]\)\!\(\*
StyleBox[\"}\", \"Text\"]\)\!\(\*
StyleBox[\",\", \"Text\"]\)\!\(\*
StyleBox[\"...\", \"Text\"]\)\!\(\*
StyleBox[\",\", \"Text\"]\)\!\(\*
StyleBox[\"{\", \"Text\"]\)\!\(\*SubscriptBox[
StyleBox[\"q\", \"Text\"], \"k\"]\),\!\(\*SubscriptBox[\"A\", \"k\"]\)\!\(\*
StyleBox[\"}\", \"Text\"]\)\!\(\*
StyleBox[\"}\", \"Text\"]\)\!\(\*
StyleBox[\",\", \"Text\"]\)\!\(\*
StyleBox[\" \", \"Text\"]\)\!\(\*
StyleBox[\"aF\", \"Text\"]\)\!\(\*
StyleBox[\"=\", \"Text\"]\)\!\(\*
StyleBox[\"{\", \"Text\"]\)\!\(\*
StyleBox[\"{\", \"Text\"]\)\!\(\*SubscriptBox[OverscriptBox[
StyleBox[\"q\", \"Text\"], \"-\"], \"1\"]\),\!\(\*SubscriptBox[\"B\", \"1\"]\)},...,\!\(\*
StyleBox[\"{\", \"Text\"]\)\!\(\*SubscriptBox[OverscriptBox[
StyleBox[\"q\", \"Text\"], \"-\"], \"k\"]\),\!\(\*SubscriptBox[\"B\", \"k\"]\)}\!\(\*
StyleBox[\"}\", \"Text\"]\)\!\(\*
StyleBox[\".\", \"Text\"]\)";


GGTfermionS::usage="\*StyleBox[\(GGTf\!\(\*StyleBox[\"ermS\", \"Text\"]\)\)]\!\(\*StyleBox[\"[\", \"Text\"]\)\!\(\*StyleBox[\"n\", \"Text\"]\)\!\(\*StyleBox[\",\", \"Text\"]\)\!\(\*StyleBox[\"G\", \"Text\"]\)\!\(\*StyleBox[\",\", \"Text\"]\)\!\(\*StyleBox[\"F\", \"Text\"]\)\!\(\*StyleBox[\",\", \"Text\"]\)\!\(\*StyleBox[\"aF\", \"Text\"]\)\!\(\*StyleBox[\"]\", \"Text\"]\)\!\(\*StyleBox[\" \", \"Text\"]\)\!\(\*StyleBox[\"is\", \"Text\"]\)\!\(\*StyleBox[\" \", \"Text\"]\)\!\(\*StyleBox[\"the\", \"Text\"]\)\!\(\*StyleBox[\" \", \"Text\"]\)\!\(\*StyleBox[\"n\", \"Text\"]\)\!\(\*StyleBox[\"-\", \"Text\"]\)\!\(\*StyleBox[\"parton\", \"Text\"]\)\!\(\*StyleBox[\" \", \"Text\"]\)\!\(\*StyleBox[\"amplitude\", \"Text\"]\)\!\(\*StyleBox[\" \", \"Text\"]\)\!\(\*StyleBox[\"with\", \"Text\"]\)\!\(\*StyleBox[\" \", \"Text\"]\)\!\(\*StyleBox[\"negative\", \"Text\"]\)\!\(\*StyleBox[\"-\", \"Text\"]\)\!\(\*StyleBox[\"helicity\", \"Text\"]\)\!\(\*StyleBox[\" \", \"Text\"]\)\!\(\*StyleBox[\"gluons\", \"Text\"]\)\!\(\*StyleBox[\" \", \"Text\"]\)\!\(\*StyleBox[\"at\", \"Text\"]\)\!\(\*StyleBox[\" \", \"Text\"]\)\!\(\*StyleBox[\"positions\", \"Text\"]\)\!\(\*StyleBox[\" \", \"Text\"]\)\!\(\*StyleBox[FormBox[RowBox[{\"G\", \"=\", RowBox[{\"{\", RowBox[{SubscriptBox[\"c\", \"1\"], \",\", SubscriptBox[\"c\", \"2\"], \",\", SubscriptBox[\"c\", \"3\"], \",\", \" \", \"...\"}]}]}],TraditionalForm], \"Text\"]\)\!\(\*StyleBox[\"}\", \"Text\"]\)\!\(\*StyleBox[\",\", \"Text\"]\)\!\(\*StyleBox[\" \", \"Text\"]\)\!\(\*StyleBox[\"positve\", \"Text\"]\)\!\(\*StyleBox[\" \", \"Text\"]\)\!\(\*StyleBox[\"and\", \"Text\"]\)\!\(\*StyleBox[\" \", \"Text\"]\)\!\(\*StyleBox[\"negative\", \"Text\"]\)\!\(\*StyleBox[\" \", \"Text\"]\)\!\(\*StyleBox[\"helicity\", \"Text\"]\)\!\(\*StyleBox[\" \", \"Text\"]\)\!\(\*StyleBox[\"fermions\", \"Text\"]\)\!\(\*StyleBox[\" \", \"Text\"]\)\!\(\*StyleBox[\"of\", \"Text\"]\)\!\(\*StyleBox[\" \", \"Text\"]\)\!\(\*StyleBox[\"equal\", \"Text\"]\)\!\(\*StyleBox[\" \", \"Text\"]\)\!\(\*StyleBox[\"flavor\", \"Text\"]\) at positions  \!\(\*SubscriptBox[StyleBox[\"q\", \"Text\"], \"i\"]\),\!\(\*SubscriptBox[OverscriptBox[StyleBox[\"q\", \"Text\"], \"-\"], \"i\"]\)\!\(\*StyleBox[\"  \", \"Text\"]\)\!\(\*StyleBox[\"F\", \"Text\"]\)\!\(\*StyleBox[\"=\", \"Text\"]\)\!\(\*StyleBox[\"{\", \"Text\"]\)\!\(\*SubscriptBox[StyleBox[\"q\", \"Text\"], \"1\"]\)\!\(\*StyleBox[\",\", \"Text\"]\)\!\(\*StyleBox[\" \", \"Text\"]\)\!\(\*StyleBox[\"...\", \"Text\"]\)\!\(\*StyleBox[\"}\", \"Text\"]\)\!\(\*StyleBox[\",\", \"Text\"]\)\!\(\*StyleBox[\" \", \"Text\"]\)\!\(\*StyleBox[\"aF\", \"Text\"]\)\!\(\*StyleBox[\"=\", \"Text\"]\)\!\(\*StyleBox[\"{\", \"Text\"]\)\!\(\*SubscriptBox[OverscriptBox[StyleBox[\"q\", \"Text\"], \"-\"], \"1\"]\),...\!\(\*StyleBox[\"}\", \"Text\"]\)\!\(\*StyleBox[\".\", \"Text\"]\)";


GGTnmhvgluon::usage="GGTnmhvgluon[n,a,b] is the simplified n-parton NMHV gluon amplitude
with negative-helicity gluons at positions a,b and n.";


GGTnmhv2ferm::usage="GGTnmhv2ferm[n,c,a,\!\(\*OverscriptBox[\"b\", \"_\"]\)] is the simplified n-parton NMHV two-fermion amplitude with negative-helicity gluons at positions c, n and a fermion/anti-fermion at positions a and \!\(\*OverscriptBox[\"b\", \"_\"]\).";


GGTnmhv4ferm::usage="GGTnmhv4ferm[n,{{\!\(\*SubscriptBox[\"a\", \"1\"]\),\!\(\*SubscriptBox[\"A\", \"1\"]\)},{\!\(\*SubscriptBox[\"a\", \"2\"]\),\!\(\*SubscriptBox[\"A\", \"2\"]\)}},{{\!\(\*SubscriptBox[OverscriptBox[\"b\", \"_\"], \"1\"]\),\!\(\*SubscriptBox[\"B\", \"1\"]\)},{\!\(\*SubscriptBox[OverscriptBox[\"b\", \"_\"], \"2\"]\),\!\(\*SubscriptBox[\"B\", \"2\"]\)}}] is the simplified n-parton NMHV four-fermion amplitude
with a negative-helicity gluon at position n, two gluinos of flavors \!\(\*SubscriptBox[\"A\", \"i\"]\) at positions \!\(\*SubscriptBox[\"a\", \"i\"]\) and two anti-gluinos of flavors \!\(\*SubscriptBox[\"B\", \"i\"]\) at positions \!\(\*SubscriptBox[OverscriptBox[\"b\", \"_\"], \"i\"]\).";


GGTnmhv4fermS::usage="GGTnmhv4fermS[n,{\!\(\*SubscriptBox[\"a\", \"1\"]\),\!\(\*SubscriptBox[\"a\", \"2\"]\)}},{\!\(\*SubscriptBox[OverscriptBox[\"b\", \"_\"], \"1\"]\),\!\(\*SubscriptBox[OverscriptBox[\"b\", \"_\"], \"2\"]\)}] is the simplified n-parton NMHV four-fermion amplitude 
with a negative-helicity gluon at position n and equally flavored fermions/anti-fermions positions \!\(\*SubscriptBox[\"a\", \"i\"]\) / \!\(\*SubscriptBox[OverscriptBox[\"b\", \"_\"], \"i\"]\).";


GGTnmhv6ferm::usage=\
"GGTnmhv6ferm[n,\!\(\*SubscriptBox[\"B\", \"3\"]\),{{\!\(\*SubscriptBox[\"a\", \"1\"]\),\!\(\*SubscriptBox[\"A\", \"1\"]\)},{\!\(\*SubscriptBox[\"a\", \"2\"]\),\!\(\*SubscriptBox[\"A\", \"2\"]\)},{\!\(\*SubscriptBox[\"a\", \"3\"]\),\!\(\*SubscriptBox[\"A\", \"3\"]\)}},{{\!\(\*SubscriptBox[OverscriptBox[\"b\", \"_\"], \"1\"]\),\!\(\*SubscriptBox[\"B\", \"1\"]\)},{\!\(\*SubscriptBox[OverscriptBox[\"b\", \"_\"], \"2\"]\),\!\(\*SubscriptBox[\"B\", \"2\"]\)}}] is the simplified n-parton NMHV six-fermion amplitude with three gluinos of flavors \!\(\*SubscriptBox[\"A\", \"i\"]\) at positions \!\(\*SubscriptBox[\"a\", \"i\"]\) and three anti-gluinos of flavors \!\(\*SubscriptBox[\"B\", \"i\"]\) at positions \!\(\*SubscriptBox[OverscriptBox[\"b\", \"_\"], \"i\"]\). Note that \!\(\*SubscriptBox[OverscriptBox[\"b\", \"_\"], \"3\"]\)=n."


GGTnmhv6fermS::usage="GGTnmhv6fermS[n,{\!\(\*SubscriptBox[\"a\", \"1\"]\),\!\(\*SubscriptBox[\"a\", \"2\"]\),\!\(\*SubscriptBox[\"a\", \"3\"]\)},{\!\(\*SubscriptBox[OverscriptBox[\"b\", \"_\"], \"1\"]\),\!\(\*SubscriptBox[OverscriptBox[\"b\", \"_\"], \"2\"]\)}] is the simplified n-parton NMHV six-fermion amplitude
with equally flavored fermions/anti-fermions at positions \!\(\*SubscriptBox[\"a\", \"i\"]\) / \!\(\*SubscriptBox[OverscriptBox[\"b\", \"_\"], \"i\"]\). Note that \!\(\*SubscriptBox[OverscriptBox[\"b\", \"_\"], \"3\"]\)=n";


GGTnnmhvgluon::usage="GGTnnmhvgluon[n,a,b,c] is the simplified n-parton NNMHV gluon amplitude
with negative-helicity gluons at positions a,b,c and n.";


GGTnnmhv2ferm::usage="GGTnnmhv2ferm[n,\!\(\*SubscriptBox[\"c\", \"1\"]\),\!\(\*SubscriptBox[\"c\", \"2\"]\),a,\!\(\*OverscriptBox[\"b\", \"_\"]\)] is the simplified n-parton NNMHV two-fermion amplitude with negative-helicity gluons at positions \!\(\*SubscriptBox[\"c\", \"1\"]\),\!\(\*SubscriptBox[\"c\", \"2\"]\),n and a fermion/anti-fermion at position a / \!\(\*OverscriptBox[\"b\", \"_\"]\).";


GGTnnmhv4ferm::usage="GGTnnmhv4ferm[n,c,{{\!\(\*SubscriptBox[\"a\", \"1\"]\),\!\(\*SubscriptBox[\"A\", \"1\"]\)},{\!\(\*SubscriptBox[\"a\", \"2\"]\),\!\(\*SubscriptBox[\"A\", \"2\"]\)}},{{\!\(\*SubscriptBox[OverscriptBox[\"b\", \"_\"], \"1\"]\),\!\(\*SubscriptBox[\"B\", \"1\"]\)},{\!\(\*SubscriptBox[OverscriptBox[\"b\", \"_\"], \"2\"]\),\!\(\*SubscriptBox[\"B\", \"2\"]\)}}] is the simplified n-parton NNMHV four-fermion amplitude
with two negative-helicity gluons at positions c,n, two gluinos of flavors \!\(\*SubscriptBox[\"A\", \"i\"]\) at positions \!\(\*SubscriptBox[\"a\", \"i\"]\) and two anti-gluinos of flavors \!\(\*SubscriptBox[\"B\", \"i\"]\) at positions \!\(\*SubscriptBox[OverscriptBox[\"b\", \"_\"], \"i\"]\).";


GGTnnmhv4fermS::usage="GGTnnmhv4fermS[n,c,{\!\(\*SubscriptBox[\"a\", \"1\"]\),\!\(\*SubscriptBox[\"a\", \"2\"]\)}},{\!\(\*SubscriptBox[OverscriptBox[\"b\", \"_\"], \"1\"]\),\!\(\*SubscriptBox[OverscriptBox[\"b\", \"_\"], \"2\"]\)}] is the simplified n-parton NNMHV four-fermion amplitude 
with two negative-helicity gluons at positions c,n and equally flavored fermions/anti-fermions at positions \!\(\*SubscriptBox[\"a\", \"i\"]\) / \!\(\*SubscriptBox[OverscriptBox[\"b\", \"_\"], \"i\"]\).";


GGTnnmhv6ferm::usage="GGTnnmhv6ferm[n,{{\!\(\*SubscriptBox[\"a\", \"1\"]\),\!\(\*SubscriptBox[\"A\", \"1\"]\)},{\!\(\*SubscriptBox[\"a\", \"2\"]\),\!\(\*SubscriptBox[\"A\", \"2\"]\),{\!\(\*SubscriptBox[\"a\", \"3\"]\),\!\(\*SubscriptBox[\"A\", \"3\"]\)},{\!\(\*SubscriptBox[\"a\", \"3\"]\),\!\(\*SubscriptBox[\"A\", \"3\"]\)}},{{\!\(\*SubscriptBox[OverscriptBox[\"b\", \"_\"], \"1\"]\),\!\(\*SubscriptBox[\"B\", \"1\"]\)},{\!\(\*SubscriptBox[OverscriptBox[\"b\", \"_\"], \"2\"]\),\!\(\*SubscriptBox[\"B\", \"2\"]\)}}] is the simplified n-parton NNMHV six-fermion amplitude with one negative-helicity gluon at position n and three gluinos of flavors \!\(\*SubscriptBox[\"A\", \"i\"]\) at positions \!\(\*SubscriptBox[\"a\", \"i\"]\) and three anti-gluinos of flavors \!\(\*SubscriptBox[\"B\", \"i\"]\) at positions \!\(\*SubscriptBox[OverscriptBox[\"b\", \"_\"], \"i\"]\).";


GGTnnmhv6fermS::usage="GGTnnmhv6fermS[n,{\!\(\*SubscriptBox[\"a\", \"1\"]\),\!\(\*SubscriptBox[\"a\", \"2\"]\),\!\(\*SubscriptBox[\"a\", \"3\"]\)},{\!\(\*SubscriptBox[OverscriptBox[\"b\", \"_\"], \"1\"]\),\!\(\*SubscriptBox[OverscriptBox[\"b\", \"_\"], \"2\"]\),\!\(\*SubscriptBox[OverscriptBox[\"b\", \"_\"], \"3\"]\)}] is the simplified n-parton NNMHV six-fermion amplitude
with one negative-helicity gluon at position n and equally flavored fermions/anti-fermions at positions \!\(\*SubscriptBox[\"a\", \"i\"]\) / \!\(\*SubscriptBox[OverscriptBox[\"b\", \"_\"], \"i\"]\).";


Begin["Global`"];


GGTgenvar[P_List]:=Module[{N=Length[P],Psigma=P.{{{1,0},{0,1}},{{0,1},{1,0}},{{0,-I},{I,0}},{{1,0},{0,-1}}},Psigmabar=P.{{{1,0},{0,1}},{{0,-1},{-1,0}},{{0,I},{-I,0}},{{-1,0},{0,1}}}},
Weyl=Module[{Pplus=Sqrt[P[[#,1]]+P[[#,4]]]},{Pplus,(P[[#,2]]+I P[[#,3]])/Pplus}]&/@Range[N];
WeylC=Weyl.{{0,-1},{1,0}};
rM=Table[If[i<=j,Total[Psigma[[Range[i,j-1]]]],-Total[Psigma[[Range[j,i-1]]]]],{i,N},{j,N}];
rMb=Table[If[i<=j,Total[Psigmabar[[Range[i,j-1]]]],-Total[Psigmabar[[Range[j,i-1]]]]],{i,N},{j,N}];]


SigmaProd[x_List]:=If[x=={},{{1,0},{0,1}},rM[[Sequence@@x[[1]]]].rMb[[Sequence@@x[[2]]]].SigmaProd[x[[3;;]]]]


GGTnumeric[expression_]:=expression/.{GGTs[i_,j_]:>Chop[Det[rM[[i,j]]]],GGTspaa[i_,j_]:>WeylC[[i]].Weyl[[j]],GGTspaa[i_,GGTx[a1_,b1_],GGTx[a2_,b2_],j_]:>WeylC[[i]].rM[[a1,b1]].rMb[[a2,b2]].Weyl[[j]],GGTx[i_,j_]->{i,j}}/.GGTspaa[i_,x__,j_]:>WeylC[[i]].SigmaProd[{x}].Weyl[[j]]


End[];


Begin["`Private`"];


Format[GGTx[q_,w_]]:=Subscript["x",q,w]
Format[GGTs[q_,w_]]:=Subscript["s",q,w]
Format[GGTspaa[a_,b_]]:=DisplayForm[RowBox[{"\[LeftAngleBracket]",MakeBoxes[a],MakeBoxes["|"],MakeBoxes[b],"\[RightAngleBracket]"}]]
Format[GGTspaa[a_,X__,b_]]:=DisplayForm[RowBox[{"\[LeftAngleBracket]",Sequence@@Riffle[{MakeBoxes[a],X,MakeBoxes[b]},MakeBoxes["|"]],"\[RightAngleBracket]"}]]
Format[GGTspbb[a_,b_]]:=DisplayForm[RowBox[{"[",MakeBoxes[a],MakeBoxes["|"],MakeBoxes[b],"]"}]]
Format[GGTspbb[a_,X__,b_]]:=DisplayForm[RowBox[{"[",Sequence@@Riffle[{MakeBoxes[a],X,MakeBoxes[b]},MakeBoxes["|"]],"]"}]]
Format[GGTr[n_,x_List,y_List,v_List,a_,b_]]:=Subsuperscript["R",RowBox[{MakeBoxes[n],";",Sequence@@Riffle[MakeBoxes/@Flatten[{v,a,b}],","]}],RowBox[{Sequence@@Riffle[MakeBoxes/@x,","],If[x=={}&&y=={},"",";"],Sequence@@Riffle[MakeBoxes/@y,","]}]]//DisplayForm


GGTspAA[i_,j_]:=If[i==j,0,GGTspaa[i,j]]


GGTmhv[n_Integer,a_Integer,b_Integer]:=GGTspaa[a,b]^4/Times@@GGTspaa@@@Partition[Append[Range[n],1],2,1]

GGTmhvbar[n_Integer,a_Integer,b_Integer]:=(-1)^n GGTspbb[a,b]^4/Times@@GGTspbb@@@Partition[Append[Range[n],1],2,1]

InvProd[n_Integer]:=1/Times@@GGTspaa@@@Partition[Append[Range[n],1],2,1]


D1abc[n_Integer,a1_Integer,b1_Integer,a2_Integer,b2_Integer,a_Integer,b_Integer,c_Integer]:=If[a<b<c,If[a<a1<=b&&c<b1&&b<a2<=c<b2,GGTspaa[a,n] GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],b] GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],GGTx[a1,b2],GGTx[b2,a2],c],0]+If[a<a1<=b&&c<b1&&b<a2&&b2<=c,GGTspaa[n,a] GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],b] GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],c] GGTs[a2,b2],0]+If[a<a1<=b&&c<b1&&a2<=b&&c<b2,GGTspaa[a,n] GGTspaa[b,c] GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],GGTx[a1,a2],GGTx[a2,b2],GGTx[b1,a1],GGTx[n,b1],n],0]+If[a<a1<=b&&c<b1&&a2<=b<b2<=c,GGTspaa[a,n] GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],c] GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],GGTx[a1,a2],GGTx[a2,b2],b],0]+If[a<a1<=b<b1<=c&&b<a2&&b2<=c,GGTspaa[n,a] GGTspaa[c,n] GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],b] GGTs[a1,b1] GGTs[a2,b2],0]+If[a<a1<=b<b1<=c&&a2<=b<b2<=c,GGTspaa[n,a] GGTspaa[n,c] GGTs[a1,b1] GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],GGTx[a1,a2],GGTx[a2,b2],b],0]+If[a1<=a&&c<b1&&b<a2<=c<b2,GGTspaa[a,b] GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],n] GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],GGTx[a1,b2],GGTx[b2,a2],c],0]+If[a1<=a&&c<b1&&a<a2<=b&&c<b2,GGTspaa[c,b] GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],n] GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],GGTx[a1,b2],GGTx[b2,a2],a],0]+If[a1<=a&&c<b1&&b<a2&&b2<=c,GGTspaa[b,a] GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],n] GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],c] GGTs[a2,b2],0]+If[a1<=a&&c<b1&&a<a2<=b<b2<=c,GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],n] (GGTspaa[b,c] GGTs[a2,b2] GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],a]+GGTspaa[a,c] GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],GGTx[a1,a2],GGTx[a2,b2],b]),0]+If[a1<=a&&c<b1&&a2<=a&&b<b2<=c,GGTspaa[a,b] GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],n] GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],GGTx[a1,a2],GGTx[a2,b2],c],0]+If[a1<=a&&c<b1&&a2<=a<b2<=b,GGTspaa[c,b] GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],n] GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],GGTx[a1,a2],GGTx[a2,b2],a],0]+If[a1<=a&&c<b1&&a<a2&&b2<=b,GGTspaa[b,c] GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],n] GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],a] GGTs[a2,b2],0]+If[a1<=a&&b<b1<=c&&b<a2,GGTspaa[c,n] GGTspaa[a,b] GGTspaa[n,GGTx[n,a1],GGTx[n,b1],n] GGTs[a1,b1] GGTs[a2,b2],0]+If[a1<=a&&b<b1<=c&&a<a2<=b<b2,GGTspaa[c,n] (GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],a] GGTspaa[n,GGTx[n,a1],GGTx[a1,b1],b] GGTs[a2,b2]+GGTspaa[n,GGTx[n,a1],GGTx[a1,b1],a] GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],GGTx[a1,a2],GGTx[a2,b2],b]),0]+If[a1<=a&&b<b1<=c&&a2<=a&&b<b2,GGTspaa[n,c] GGTspaa[a,b] GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],GGTx[a1,a2],GGTx[a2,b2],GGTx[a1,b1],GGTx[n,a1],n],0]+If[a1<=a&&b<b1<=c&&a<a2&&b2<=b,GGTspaa[c,n] GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],a] GGTspaa[n,GGTx[n,a1],GGTx[a1,b1],b] GGTs[a2,b2],0]+If[a1<=a&&b<b1<=c&&a2<=a<b2<=b,GGTspaa[n,c] GGTspaa[n,GGTx[n,a1],GGTx[a1,b1],b] GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],GGTx[a1,a2],GGTx[a2,b2],a],0],Module[{abc=Sort[{a,b,c}]},Signature[{a,b,c}] D1abc[n,a1,b1,a2,b2,abc[[1]],abc[[2]],abc[[3]]]]]

D2abc[n_Integer,a1_Integer,b1_Integer,a2_Integer,b2_Integer,a_Integer,b_Integer,c_Integer]:=If[a<b<c,If[a<a1<=b<b1<=c&&a2<=c<b2,GGTspaa[n,a] GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],b] GGTspaa[n,GGTx[n,b2],GGTx[b2,a2],c],0]+If[a<a1<=b<b1<=c&&b2<=c,GGTspaa[n,a] GGTspaa[c,n] GGTspaa[n,GGTx[n,b1],GGTx[b1,a1],b] GGTs[a2,b2],0]+If[a<a1&&b1<=b&&b<a2&&b2<=c,GGTspaa[n,a] GGTspaa[b,n] GGTspaa[c,n] GGTs[a2,b2] GGTs[a1,b1],0]+If[a<a1&&b1<=b&&b<a2<=c<b2,GGTspaa[n,a] GGTspaa[b,n] GGTspaa[n,GGTx[n,b2],GGTx[b2,a2],c] GGTs[a1,b1],0]+If[a<a1&&b1<=b&&a2<=b&&c<b2,GGTspaa[n,a] GGTspaa[b,c] GGTspaa[n,GGTx[n,b2],GGTx[b2,a2],n] GGTs[a1,b1],0]+If[a<a1&&b1<=b&&a2<=b<b2<=c,GGTspaa[n,a] GGTspaa[c,n] GGTspaa[n,GGTx[n,a2],GGTx[a2,b2],b] GGTs[a1,b1],0]+If[a1<=a&&b<b1<=c&&a2<=c<b2,GGTspaa[a,b] GGTspaa[n,GGTx[n,a1],GGTx[a1,b1],n] GGTspaa[n,GGTx[n,b2],GGTx[b2,a2],c],0]+If[a1<=a&&b<b1<=c&&b2<=c,GGTspaa[a,b] GGTspaa[n,GGTx[n,a1],GGTx[a1,b1],n] GGTspaa[c,n] GGTs[a2,b2],0]+If[a1<=a<b1<=b&&b<a2<=c<b2,GGTspaa[n,b] GGTspaa[n,GGTx[n,a1],GGTx[a1,b1],a] GGTspaa[n,GGTx[n,b2],GGTx[b2,a2],c],0]+If[a1<=a<b1<=b&&b<a2&&b2<=c,GGTspaa[n,b] GGTspaa[c,n] GGTspaa[n,GGTx[n,a1],GGTx[a1,b1],a] GGTs[a2,b2],0]+If[a1<=a<b1<=b&&a2<=b&&c<b2,GGTspaa[c,b] GGTspaa[n,GGTx[n,a1],GGTx[a1,b1],a] GGTspaa[n,GGTx[n,b2],GGTx[b2,a2],n],0]+If[a1<=a<b1<=b&&a2<=b<b2<=c,GGTspaa[n,c] GGTspaa[n,GGTx[n,a1],GGTx[a1,b1],a] GGTspaa[n,GGTx[n,a2],GGTx[a2,b2],b],0],Module[{abc=Sort[{a,b,c}]},Signature[{a,b,c}] D2abc[n,a1,b1,a2,b2,abc[[1]],abc[[2]],abc[[3]]]]]


GGTtoSpinors[expression_]:=expression/.GGTx[i_,j_]:>If[i<j,Plus@@Spinors`Sp/@Range[i,j-1],-Plus@@Spinors`Sp/@Range[j,i-1]]/.{GGTspaa[a__]->Spinors`Spaa[a],GGTspbb[a__]->Spinors`Spbb[a],GGTs[i_,j_]:>If[i<j,If[j==i+1,0,Spinors`s@@Range[i,j-1]],If[i==j,0,If[i==j+1,0,Spinors`s@@Range[j,i-1]]]]}


GGTsuperamp[n_Integer,k_Integer]:=If[k==0,1,Module[{X=Sum[Sum[Rh[n,1,{},{},{},a,b],{a,2,b-2}],{b,4,n-1}]},Do[X=X/.Rh[n,p,x_,y_,v_,a_,b_]:>GGTr[n,x,y,v,a,b]If[Length[v]==0,Sum[Sum[Rh[n,p+1,{},{},{},a1,b1],{a1,b+1,b1-2}],{b1,b+3,n-1}]+Sum[Rh[n,p+1,{a,b},{},{},b,b1],{b1,b+2,n-1}]+Sum[Sum[Rh[n,p+1,{},{},{{b,a}},a1,b1],{a1,a+1,b1-2}],{b1,a+3,b-1}]+Sum[Rh[n,p+1,{},{a,b},{{b,a}},a1,b],{a1,a+1,b-2}],Sum[Sum[Sum[Rh[n,p+1,If[a1==v[[m+1,1]],Flatten[Append[v[[1;;m]],{v[[m+1,2]],v[[m+1,1]]}]],{}],If[b1==v[[m,1]],Flatten[Append[v[[1;;m-1]],{v[[m,2]],v[[m,1]]}]],{}],v[[1;;m]],a1,b1],{a1,v[[m+1,1]],b1-2}],{b1,v[[m+1,1]]+2,v[[m,1]]}],{m,1,Length[v]-1}]+Sum[Sum[Rh[n,p+1,If[a1==b,Flatten[Append[v,{a,b}]],{}],If[b1==v[[-1,1]],Flatten[Append[v[[1;;-2]],{v[[-1,2]],v[[-1,1]]}]],{}],v,a1,b1],{a1,b,b1-2}],{b1,b+2,v[[-1,1]]}]+Sum[Sum[Rh[n,p+1,If[a1==v[[1,1]],{v[[1,2]],v[[1,1]]},{}],{},{},a1,b1],{a1,v[[1,1]],b1-2}],{b1,v[[1,1]]+2,n-1}]+Sum[Sum[Rh[n,p+1,{},If[b1==b,Flatten[Append[v,{a,b}]],{}],Append[v,{b,a}],a1,b1],{a1,a+1,b1-2}],{b1,a+3,b}]],{p,k-1}];X=X/.Rh[n,k,z__]-> GGTr[n,z];X]]


M0[n_,i_,vu_List,a_,b_]:=If[Length[vu]==0,If[a-1<i<n,If[i<b,GGTspaa[n,GGTx[n,b],GGTx[b,a],i],-GGTs[a,b]GGTspaa[n,i]],0],Module[{Xij={n,GGTx[n,vu[[1,1]]],GGTx@@@Partition[Flatten[vu],2,1]}},If[vu[[-1,2]]-1<i<b,If[i<a,-GGTs[a,b]GGTspaa@@Flatten[{Xij,i}],GGTspaa@@Flatten[{Xij,GGTx[vu[[-1,2]],a],GGTx[a,b],i}]],0]]]


GGTtildeR[n_Integer,x_List,y_List,v_List,a_Integer,b_Integer]:=If[Length[v]==0,(If[Length[x]==0,GGTspaa[a,a-1],GGTspaa@@Flatten[{a,GGTx[x[[1]],x[[2]]],GGTx[n,x[[1]]],n}]]GGTspaa[b,b-1])/(GGTs[a,b]GGTspaa[n,GGTx[n,a],GGTx[a,b],b]GGTspaa[n,GGTx[n,a],GGTx[a,b],b-1]GGTspaa[n,GGTx[n,b],GGTx[b,a],a]If[Length[x]==0,GGTspaa[n,GGTx[n,b],GGTx[b,a],a-1],GGTspaa[n,GGTx[n,b],GGTx[b,a],GGTx[x[[1]],x[[2]]],GGTx[n,x[[1]]],n]]),Module[{Xij={n,GGTx[n,v[[1,1]]],GGTx@@@Partition[Flatten[v],2,1]}},1/(GGTs[a,b]GGTspaa@@Flatten[{Xij,GGTx[v[[-1,2]],a],GGTx[a,b],b-1}]GGTspaa@@Flatten[{Xij,GGTx[v[[-1,2]],b],GGTx[b,a],a}])If[Length[x]==0,If[Length[y]==0,(GGTspaa[a,a-1]GGTspaa[b,b-1])/(GGTspaa@@Flatten[{Xij,GGTx[v[[-1,2]],a],GGTx[a,b],b}]GGTspaa@@Flatten[{Xij,GGTx[v[[-1,2]],b],GGTx[b,a],a-1}]),Module[{U=GGTx@@@Partition[y,2,1]},(GGTspaa[a,a-1]GGTspaa@@Flatten[{n,GGTx[n,y[[1]]],U,b-1}])/(GGTspaa@@Flatten[{Xij,GGTx[v[[-1,2]],a],GGTx[a,b],Reverse[U],GGTx[n,y[[1]]],n}]GGTspaa@@Flatten[{Xij,GGTx[v[[-1,2]],b],GGTx[b,a],a-1}])]],If[Length[y]==0,Module[{L={Reverse[GGTx@@@Partition[x,2,1]],GGTx[n,x[[1]]],n}},(GGTspaa@@Flatten[{a,L}]GGTspaa[b,b-1])/(GGTspaa@@Flatten[{Xij,GGTx[v[[-1,2]],a],GGTx[a,b],b}]GGTspaa@@Flatten[{Xij,GGTx[v[[-1,2]],b],GGTx[b,a],L}])],Module[{L={Reverse[GGTx@@@Partition[x,2,1]],GGTx[n,x[[1]]],n},U=GGTx@@@Partition[y,2,1]},(GGTspaa@@Flatten[{a,L}]GGTspaa@@Flatten[{n,GGTx[n,y[[1]]],U,b-1}])/(GGTspaa@@Flatten[{Xij,GGTx[v[[-1,2]],a],GGTx[a,b],Reverse[U],GGTx[n,y[[1]]],n}]GGTspaa@@Flatten[{Xij,GGTx[v[[-1,2]],b],GGTx[b,a],L}])]]]]]


GGTgluon[n_Integer,H_List]:=Module[{k=Length[H]-2,ll=Sort[H][[-2;;]]},InvProd[n]If[k==0,GGTspaa[H[[1]],H[[2]]]^4,Module[{X=GGTsuperamp[n,k]},X=Expand[X/.GGTr[n,x_,y_,z__]->GGTtildeR[n,x,y,z]Delta[z]]//.Delta[x__]Delta[y__]->Delta[x,y]/.Delta[y__]->Delta[{y}];X=X/.Delta[y_]:> Det[Append[Append[Table[M0[n,H[[j]],y[[3i-2]],y[[3i-1]],y[[3i]]],{i,k},{j,k+2}],Table[GGTspAA[ll[[2]],H[[i]]],{i,k+2}]],Table[GGTspAA[ll[[1]],H[[i]]]/GGTspaa[ll[[1]],ll[[2]]],{i,k+2}]]]^4]]]


GGTfermion[n_Integer,gluon_List,ferm_List,aferm_List]:=Module[{k=Length[gluon]+2Length[ferm],p=Length[gluon]+Length[ferm]-2,m=Length[ferm],H=Flatten[Append[gluon,{aferm[[All,1]],ferm[[All,1]]}]]},InvProd[n](-1)^(m (m+1)/2) Signature[H[[-2m;;]]]Module[{X=GGTsuperamp[n,p],ll=Sort[H][[-2;;]],P=Permutations[Range[m]]},X=Expand[X/.GGTr[n,x_,y_,z__]->GGTtildeR[n,x,y,z]Delta[z]]//.Delta[x__]Delta[y__]->Delta[x,y]/.Delta[y__]->Delta[{y}]/.Delta[y_]:> Delta[Append[Append[Table[M0[n,H[[j]],y[[3i-2]],y[[3i-1]],y[[3i]]],{i,p},{j,k}],Table[GGTspAA[ll[[2]],H[[i]]],{i,k}]],Table[GGTspAA[ll[[1]],H[[i]]]/GGTspaa[ll[[1]],ll[[2]]],{i,k}]]];If[p==0,X=X Delta[Append[{Table[GGTspAA[ll[[2]],H[[i]]],{i,k}]},Table[GGTspAA[ll[[1]],H[[i]]]/GGTspaa[ll[[1]],ll[[2]]],{i,k}]]]];X=X/.Delta[M_]:>Det[M[[All,;;p+2]]]^(4-m) Sum[Signature[P[[i]]]Product[KroneckerDelta[ferm[[j,2]],aferm[[P[[i,j]],2]]]Det[ReplacePart[Transpose[M],{k-2m+P[[i,j]]}-> M[[All,p+2+j]]][[;;p+2]]],{j,m}],{i,m!}]]]

GGTfermionS[n_Integer,gluon_List,ferm_List,aferm_List]:=Module[{k=Length[gluon]+2Length[ferm],p=Length[gluon]+Length[ferm]-2,m=Length[ferm],H=Flatten[Append[gluon,{aferm,ferm}]]},InvProd[n](-1)^(m (m+1)/2) Signature[H[[-2m;;]]]Module[{X=GGTsuperamp[n,p],ll=Sort[H][[-2;;]]},X=Expand[X/.GGTr[n,x_,y_,z__]->GGTtildeR[n,x,y,z]Delta[z]]//.Delta[x__]Delta[y__]->Delta[x,y]/.Delta[y__]->Delta[{y}]/.Delta[y_]:> Delta[Append[Append[Table[M0[n,H[[j]],y[[3i-2]],y[[3i-1]],y[[3i]]],{i,p},{j,k}],Table[GGTspAA[ll[[2]],H[[i]]],{i,k}]],Table[GGTspAA[ll[[1]],H[[i]]]/GGTspaa[ll[[1]],ll[[2]]],{i,k}]]];If[p==0,X=X Delta[Append[{Table[GGTspAA[ll[[2]],H[[i]]],{i,k}]},Table[GGTspAA[ll[[1]],H[[i]]]/GGTspaa[ll[[1]],ll[[2]]],{i,k}]]]];X=X/.Delta[M_]:>Det[M[[All,;;p+2]]]^3 Det[Drop[Transpose[M],{k-2m+1,k-m}]]]]


Dab[n_Integer,s_Integer,t_Integer,a_Integer,b_Integer]:=If[a<=b,If[a<s,If[s<=b,If[b<t,GGTspaa[n,a]GGTspaa[n,GGTx[n,t],GGTx[t,s],b],GGTspaa[a,n]GGTspaa[n,b] GGTs[s,t]],0],If[a<t,If[b<t,GGTspaa[n,GGTx[n,t],GGTx[t,s],n]GGTspaa[b,a],GGTspaa[n,GGTx[n,s],GGTx[s,t],a]GGTspaa[n,b]],0]],-Dab[n,s,t,b,a]]

Dabc[n_Integer,s_Integer,t_Integer,a_Integer,b_Integer,c_Integer]:=If[a<b<c,If[a<s,If[b<s,If[s<=c,If[c<t,GGTspaa[a,b]GGTspaa[n,GGTx[n,t],GGTx[t,s],c],GGTspaa[n,c]GGTspaa[b,a] GGTs[s,t]],0],If[b<t,If[c<t,GGTspaa[c,b]GGTspaa[n,GGTx[n,t],GGTx[t,s],a],GGTspaa[c,a]GGTspaa[n,GGTx[n,t],GGTx[t,s],b]-GGTspaa[n,c]GGTspaa[a,b] GGTs[s,t]],GGTspaa[n,a]GGTspaa[b,c] GGTs[s,t]]],If[a<t,If[b<t,If[c<t,0,-GGTspaa[b,a]GGTspaa[n,GGTx[n,s],GGTx[s,t],c]],GGTspaa[c,b]GGTspaa[n,GGTx[n,s],GGTx[s,t],a]],0]],Module[{abc=Sort[{a,b,c}]},Signature[{a,b,c}]Dabc[n,s,t,abc[[1]],abc[[2]],abc[[3]]]]]


GGTnmhvgluon[n_Integer,a_Integer,b_Integer]:=1/Times@@GGTspaa@@@Partition[Append[Range[n],1],2,1]Sum[Sum[GGTtildeR[n,{},{},{},s,t](Dab[n,s,t,a,b])^4,{s,2,t-2}],{t,4,n-1}]


GGTnmhv2ferm[n_Integer,c_Integer,a_Integer,b_Integer]:=Sign[b-a]/Times@@GGTspaa@@@Partition[Append[Range[n],1],2,1]Sum[Sum[GGTtildeR[n,{},{},{},s,t]Dab[n,s,t,a,c] (Dab[n,s,t,b,c])^3,{s,2,t-2}],{t,4,n-1}]


GGTnmhv4ferm[n_Integer,a_List,b_List]:=Signature[{a[[1,1]],b[[1,1]],a[[2,1]],b[[2,1]]}]/Times@@GGTspaa@@@Partition[Append[Range[n],1],2,1]Sum[Sum[GGTtildeR[n,{},{},{},s,t](Dab[n,s,t,b[[1,1]],b[[2,1]]])^2(KroneckerDelta[a[[1,2]],b[[1,2]]]KroneckerDelta[a[[2,2]],b[[2,2]]]Dab[n,s,t,a[[1,1]],b[[2,1]]]Dab[n,s,t,b[[1,1]],a[[2,1]]]-KroneckerDelta[a[[1,2]],b[[2,2]]]KroneckerDelta[a[[2,2]],b[[1,2]]]Dab[n,s,t,a[[2,1]],b[[2,1]]]Dab[n,s,t,b[[1,1]],a[[1,1]]]),{s,2,t-2}],{t,4,n-1}]

GGTnmhv4fermS[n_Integer,a_List,b_List]:=Signature[{a[[1]],b[[1]],a[[2]],b[[2]]}]/Times@@GGTspaa@@@Partition[Append[Range[n],1],2,1]Sum[Sum[GGTtildeR[n,{},{},{},s,t](Dab[n,s,t,b[[1]],b[[2]]])^3 Dab[n,s,t,a[[1]],a[[2]]],{s,2,t-2}],{t,4,n-1}]


GGTnmhv6ferm[n_Integer,B_,a_List,b_List]:=Signature[{a[[1,1]],b[[1,1]],a[[2,1]],b[[2,1]],a[[3,1]],n}]/Times@@GGTspaa@@@Partition[Append[Range[n],1],2,1]Sum[Sum[GGTtildeR[n,{},{},{},s,t]Dab[n,s,t,b[[1,1]],b[[2,1]]]Module[{P=Permutations[Range[3]]},Sum[Signature[P[[i]]]KroneckerDelta[a[[P[[i,1]],2]],b[[1,2]]]KroneckerDelta[a[[P[[i,2]],2]],b[[2,2]]]KroneckerDelta[a[[P[[i,3]],2]],B]Dab[n,s,t,a[[P[[i,1]],1]],b[[2,1]]]Dab[n,s,t,b[[1,1]],a[[P[[i,2]],1]]]Dabc[n,s,t,b[[1,1]],b[[2,1]],a[[P[[i,3]],1]]],{i,6}]],{s,2,t-2}],{t,4,n-1}]

GGTnmhv6fermS[n_Integer,a_List,b_List]:=Signature[{a[[1]],b[[1]],a[[2]],b[[2]],a[[3]],n}]/Times@@GGTspaa@@@Partition[Append[Range[n],1],2,1]Sum[Sum[GGTtildeR[n,{},{},{},s,t](Dab[n,s,t,b[[1]],b[[2]]])^3Dabc[n,s,t,a[[1]],a[[2]],a[[3]]],{s,2,t-2}],{t,4,n-1}]


GGTnnmhvgluon[n_Integer,a_Integer,b_Integer,c_Integer]:=Sum[Sum[GGTtildeR[n,{},{},{},a1,b1](Sum[Sum[D1abc[n,a1,b1,a2,b2,a,b,c]^4GGTtildeR[n,{},If[b2==b1,{a1,b1},{}],{{b1,a1}},a2,b2],{a2,a1+1,b2-2}],{b2,a1+3,b1}]+Sum[Sum[D2abc[n,a1,b1,a2,b2,a,b,c]^4GGTtildeR[n,If[a2==b1,{a1,b1},{}],{},{},a2,b2],{a2,b1,b2-2}],{b2,b1+2,n-1}]),{a1,2,b1-2}],{b1,4,n-1}]InvProd[n]


GGTnnmhv2ferm[n_Integer,a_Integer,b_Integer,p_Integer,q_Integer]:=Sign[q-p]Sum[Sum[GGTtildeR[n,{},{},{},a1,b1](Sum[Sum[D1abc[n,a1,b1,a2,b2,a,b,p]D1abc[n,a1,b1,a2,b2,a,b,q]^3GGTtildeR[n,{},If[b2==b1,{a1,b1},{}],{{b1,a1}},a2,b2],{a2,a1+1,b2-2}],{b2,a1+3,b1}]+Sum[Sum[D2abc[n,a1,b1,a2,b2,a,b,p]D2abc[n,a1,b1,a2,b2,a,b,q]^3GGTtildeR[n,If[a2==b1,{a1,b1},{}],{},{},a2,b2],{a2,b1,b2-2}],{b2,b1+2,n-1}]),{a1,2,b1-2}],{b1,4,n-1}]InvProd[n]


GGTnnmhv4ferm[n_Integer,c_Integer,a_List,b_List]:=Signature[{a[[1,1]],b[[1,1]],a[[2,1]],b[[2,1]]}]Sum[Sum[GGTtildeR[n,{},{},{},a1,b1](Sum[Sum[D1abc[n,a1,b1,a2,b2,c,b[[1,1]],b[[2,1]]]^2(KroneckerDelta[a[[1,2]],b[[1,2]]]KroneckerDelta[a[[2,2]],b[[2,2]]]D1abc[n,a1,b1,a2,b2,c,a[[1,1]],b[[2,1]]]D1abc[n,a1,b1,a2,b2,c,b[[1,1]],a[[2,1]]]-KroneckerDelta[a[[2,2]],b[[1,2]]]KroneckerDelta[a[[1,2]],b[[2,2]]]D1abc[n,a1,b1,a2,b2,c,a[[2,1]],b[[2,1]]]D1abc[n,a1,b1,a2,b2,c,b[[1,1]],a[[1,1]]])GGTtildeR[n,{},If[b2==b1,{a1,b1},{}],{{b1,a1}},a2,b2],{a2,a1+1,b2-2}],{b2,a1+3,b1}]+Sum[Sum[D2abc[n,a1,b1,a2,b2,c,b[[1,1]],b[[2,1]]]^2(KroneckerDelta[a[[1,2]],b[[1,2]]]KroneckerDelta[a[[2,2]],b[[2,2]]]D2abc[n,a1,b1,a2,b2,c,a[[1,1]],b[[2,1]]]D2abc[n,a1,b1,a2,b2,c,b[[1,1]],a[[2,1]]]-KroneckerDelta[a[[2,2]],b[[1,2]]]KroneckerDelta[a[[1,2]],b[[2,2]]]D2abc[n,a1,b1,a2,b2,c,a[[2,1]],b[[2,1]]]D2abc[n,a1,b1,a2,b2,c,b[[1,1]],a[[1,1]]])GGTtildeR[n,If[a2==b1,{a1,b1},{}],{},{},a2,b2],{a2,b1,b2-2}],{b2,b1+2,n-1}]),{a1,2,b1-2}],{b1,4,n-1}]InvProd[n]

GGTnnmhv4fermS[n_Integer,c_Integer,a_List,b_List]:=Signature[{a[[1]],b[[1]],a[[2]],b[[2]]}]Sum[Sum[GGTtildeR[n,{},{},{},a1,b1](Sum[Sum[D1abc[n,a1,b1,a2,b2,c,a[[1]],a[[2]]]D1abc[n,a1,b1,a2,b2,c,b[[1]],b[[2]]]^3GGTtildeR[n,{},If[b2==b1,{a1,b1},{}],{{b1,a1}},a2,b2],{a2,a1+1,b2-2}],{b2,a1+3,b1}]+Sum[Sum[D2abc[n,a1,b1,a2,b2,c,a[[1]],a[[2]]]D2abc[n,a1,b1,a2,b2,c,b[[1]],b[[2]]]^3GGTtildeR[n,If[a2==b1,{a1,b1},{}],{},{},a2,b2],{a2,b1,b2-2}],{b2,b1+2,n-1}]),{a1,2,b1-2}],{b1,4,n-1}]InvProd[n]


GGTnnmhv6ferm[n_Integer,a_List,b_List]:=Signature[{a[[1,1]],b[[1,1]],a[[2,1]],b[[2,1]],a[[3,1]],b[[3,1]]}]Sum[Sum[GGTtildeR[n,{},{},{},a1,b1](Sum[Sum[D1abc[n,a1,b1,a2,b2,b[[1,1]],b[[2,1]],b[[3,1]]]Module[{P=Permutations[Range[3]]},Sum[Signature[P[[i]]]KroneckerDelta[a[[P[[i,1]],2]],b[[1,2]]]KroneckerDelta[a[[P[[i,2]],2]],b[[2,2]]]KroneckerDelta[a[[P[[i,3]],2]],b[[3,2]]]D1abc[n,a1,b1,a2,b2,a[[P[[i,1]],1]],b[[2,1]],b[[3,1]]]D1abc[n,a1,b1,a2,b2,b[[1,1]],a[[P[[i,2]],1]],b[[3,1]]]D1abc[n,a1,b1,a2,b2,b[[1,1]],b[[2,1]],a[[P[[i,3]],1]]],{i,6}]]GGTtildeR[n,{},If[b2==b1,{a1,b1},{}],{{b1,a1}},a2,b2],{a2,a1+1,b2-2}],{b2,a1+3,b1}]+Sum[Sum[D2abc[n,a1,b1,a2,b2,b[[1,1]],b[[2,1]],b[[3,1]]]Module[{P=Permutations[Range[3]]},Sum[Signature[P[[i]]]KroneckerDelta[a[[P[[i,1]],2]],b[[1,2]]]KroneckerDelta[a[[P[[i,2]],2]],b[[2,2]]]KroneckerDelta[a[[P[[i,3]],2]],b[[3,2]]]D2abc[n,a1,b1,a2,b2,a[[P[[i,1]],1]],b[[2,1]],b[[3,1]]]D2abc[n,a1,b1,a2,b2,b[[1,1]],a[[P[[i,2]],1]],b[[3,1]]]D2abc[n,a1,b1,a2,b2,b[[1,1]],b[[2,1]],a[[P[[i,3]],1]]],{i,6}]]GGTtildeR[n,If[a2==b1,{a1,b1},{}],{},{},a2,b2],{a2,b1,b2-2}],{b2,b1+2,n-1}]),{a1,2,b1-2}],{b1,4,n-1}]InvProd[n]

GGTnnmhv6fermS[n_Integer,a_List,b_List]:=Signature[{a[[1]],b[[1]],a[[2]],b[[2]],a[[3]],b[[3]]}]Sum[Sum[GGTtildeR[n,{},{},{},a1,b1](Sum[Sum[D1abc[n,a1,b1,a2,b2,a[[1]],a[[2]],a[[3]]]D1abc[n,a1,b1,a2,b2,b[[1]],b[[2]],b[[3]]]^3GGTtildeR[n,{},If[b2==b1,{a1,b1},{}],{{b1,a1}},a2,b2],{a2,a1+1,b2-2}],{b2,a1+3,b1}]+Sum[Sum[D2abc[n,a1,b1,a2,b2,a[[1]],a[[2]],a[[3]]]D2abc[n,a1,b1,a2,b2,b[[1]],b[[2]],b[[3]]]^3GGTtildeR[n,If[a2==b1,{a1,b1},{}],{},{},a2,b2],{a2,b1,b2-2}],{b2,b1+2,n-1}]),{a1,2,b1-2}],{b1,4,n-1}]InvProd[n]


End[];
EndPackage[];


Print["\n-----  Gluon-Gluino-Trees  -----\n
Version:\t GGT 1.1\t (3-Nov-2010)\n
Authors: Lance Dixon, Johannes Henn, Jan Plefka, Theodor Schuster\n\nA list of all provided functions is stored in the variable $GGTfunctions"];

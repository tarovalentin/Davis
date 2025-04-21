(* ::Package:: *)

Format[zc]:=OverBar[z];
Format[\[Sigma][n_]]:=Subscript[\[Sigma],n]
Format[\[Sigma]c[n_]]:=Subscript[OverBar[\[Sigma]],n]


TranscendentalWeight[f_Plus]:=Block[{ll},
	ll=Union[TranscendentalWeight/@(List@@f)];
	Assert[Length[ll]==1,"Not uniform weight"];
	ll[[1]]
]


GiveSecond[cop_,first_]:=Block[{ll},
	ll=Cases[List@@Expand[cop+$dummy],q_. CT[first,_]];
	Total[ll]/.CT[a_,b_]:>b
];
PeriodMatrix[ex_]:=Block[{firsts},
	firsts=Union[First/@((List@@Expand[Delta[ex]])/.f_ CT[a_,b_]:>{a,b})];
	Table[(2Pi I)^(TranscendentalWeight[ex]-TranscendentalWeight[GiveSecond[Delta[j],i]])GiveSecond[Delta[j],i],{i,firsts},{j,firsts}]
]
MakeSv[ex_,conjRep_List:{z->zc,\[Sigma]->\[Sigma]c}]:= Block[{pm,ipm,tmp},
	pm = PeriodMatrix[ex];
	ipm =ShuffleG@Inverse[pm/.Complex[a_,b_]:>Complex[a,-b]//.conjRep];
	tmp = Simplify[ipm.pm];
	(-2Pi I)^(TranscendentalWeight[ex])Last[First[tmp]]
]

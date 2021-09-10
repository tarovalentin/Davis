(* ::Package:: *)

(* ::Title:: *)
(*Num-hel*)
(*Taro V. Brown*)


(* ::Section:: *)
(*Spinor-Helicity*)


 (*Definition and conventions from: https://arxiv.org/pdf/1310.5353.pdf*)

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

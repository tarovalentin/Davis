#!/usr/bin/env wolframscript
(* ::Package:: *)

ClearAll["Global`*"]
SetDirectory["C:\\Users\\tarob\\OneDrive\\Dokumenter\\Taro PC\\Documents\\Davis\\PhD\\Mathematica"];
Off[Part::pkspec1]
Off[SetDelayed::write]
Off[General::compat]
<<CHY_ToolPackagev1.wl
SPAB = {-Spaa[j_,i_] Spbb[j_,r_]-Spaa[i_,k_] Spbb[r_,k_]-Spaa[i_,l_] Spbb[r_,l_]-Spaa[i_,nn_] Spbb[r_,nn_]->Spab[i,P[j]+P[k]+P[l]+P[nn],r],Spaa[j_,i_] Spbb[j_,r_]+Spaa[k_,i_] Spbb[k_,r_]->-Spab[i,P[j]+P[k],r],Spaa[i_,j_] Spbb[r_,j_]+Spaa[i_,k_] Spbb[r_,k_]->-Spab[i,P[j]+P[k],r],Spaa[j_,i_] Spbb[j_,r_]+Spaa[i_,k_] Spbb[r_,k_]->-Spab[i,P[j]+P[k],r],Spaa[j_,i_] Spbb[r_,j_]+Spaa[k_,i_] Spbb[r_,k_]->Spab[i,P[j]+P[k],r],-Spaa[i_,j_] Spbb[k_,j_]-Spaa[i_,l_] Spbb[k_,l_]->-Spab[i,P[j]+P[l],k],Spaa[i_,j_] Spbb[j_,l_]+Spaa[i_,k_] Spbb[k_,l_]->Spab[i,P[j]+P[k],l],Spaa[j_,i_] Spbb[j_,l_]+Spaa[k_,i_] Spbb[k_,l_]->Spab[i,P[j]+P[k],l],Spaa[j_,i_] Spbb[l_,j_]-Spaa[i_,k_] Spbb[l_,k_]->Spab[i,P[j]+P[k],l],-Spaa[k_,i_] Spbb[k_,j_]+Spaa[i_,l_] Spbb[l_,j_]->Spab[i,P[k]+P[l],j],-Spaa[k_,i_] Spbb[k_,j_]-Spaa[i_,l_] Spbb[j_,l_]->Spab[i,P[k]+P[l],j],Spaa[k_,i_] Spbb[k_,j_]-Spaa[i_,l_] Spbb[l_,j_]->-Spab[i,P[k]+P[l],j],-Spaa[k_,i_] Spbb[j_,k_]+Spaa[i_,l_] Spbb[j_,l_]->-Spab[i,P[k]+P[l],j]};



 B = Expand[pt[1,2,3,4,5,6]*pt[1,2,3,4,5,6]]
 amp4=FullSimplify[chyint[rempol[B,6],6]]//Expand:
 amp4=FullSimplify[chyint[rempol[B,6],6]]


ListA = Permutations[{2,3,4}]


Integrand[a_]:=pt[ListA[[a]][[1]],ListA[[a]][[2]],ListA[[a]][[3]]]
Int[a_,b_]:=Integrand[a]Integrand[b]
m[a_,b_]:=chyint[rempol[Int[a,b],4],4]
Mat = Table[m[i,j],{i,1,6},{j,1,6}]//FullSimplify;
Kernel = Inverse[Mat]





LA = Permutations[{2,3}]


AL[a_] := A[{1,LA[[a]][[1]],LA[[a]][[2]],4,5}]
AR[a_] := A[{4,5,LA[[a]][[1]],LA[[a]][[2]],1}]
AL[1]AR[1]
AL[2]AR[2]


A[{1,2,3,4,5}] A[{1,2,3,5,4}]
A[{1,3,2,4,5}] A[{1,3,2,5,4}]





Mat1 = chyint[pt[1,2,3,4,5]pt[4,5,2,3,1],5];

Mat2 = chyint[pt[1,3,2,4,5]pt[4,5,3,2,1],5];

Mat3 = chyint[pt[1,3,2,4,5]pt[4,5,2,3,1],5];

Mat4 = chyint[pt[1,2,3,4,5]pt[4,5,3,2,1],5];
Mat = {{Mat1,Mat4},{Mat3,Mat2}};
Mat//MatrixForm;
FullSimplify[Inverse[Mat]]//.{(s[1,2]+s[1,3]+s[2,3])->s[4,5]}//MatrixForm


(*4pt risager shift*)
LA = Permutations[{2}];
AL[a_] := pt[1,LA[[a]][[1]],3,4]
AR[a_] := pt[3,4,LA[[a]][[1]],1]
A4[{a_,b_,x_,d_}]:=Spbb[3,4]^4/(Spbb[a,b]Spbb[b,x]Spbb[x,d]Spbb[d,a]);
M4[{a_,b_,x_,d_}]:=Spbb[3,4]^4Spaa[1,2]^4/(s[1,2]s[2,3]s[1,3]);
Mat = Table[chyint[AL[i]AR[j],4],{i,1,1},{j,1,1}];
Kernel4 = FullSimplify[Inverse[Mat]];
Kernel4 = Kernel4[[1]][[1]]
Amp = A4[{1,2,3,4}]A4[{3,4,2,1}]Kernel4

shiftS = {Spbb[1,i_]->Spbb[7,i]+z Spaa[2,3] Spbb[4,i],Spbb[i_,1]->Spbb[i,7]+z Spaa[2,3]Spbb[i,4],Spbb[2,i_]->Spbb[8,i]+z Spaa[3,1] Spbb[4,i],Spbb[i_,2]->Spbb[i,8]+z Spaa[3,1]Spbb[i,4],Spbb[3,i_]->Spbb[9,i]+z Spaa[1,2] Spbb[4,i],Spbb[i_,3]->Spbb[i,9]+z Spaa[1,2]Spbb[i,4]};
shiftback = {Spbb[7,i_]->Spbb[1,i],Spbb[i_,7]->Spbb[i,1],Spbb[i_,8]->Spbb[i,2],Spbb[8,i_]->Spbb[2,i],Spbb[i_,9]->Spbb[i,3],Spbb[9,i_]->Spbb[3,i]};
Amp1 = Expand[Amp//.s[1,2]->Spaa[1,2]Spbb[2,1]//.shiftS//.shiftback//FullSimplify];
DefNumSH[4]

Asymptotic[(Amp1//.s[1,2]->Spaa[1,2]Spbb[2,1]//.shiftS//.shiftback//.NSpinHel),z->0]

(*Asymptotic[(M4//.shiftA//.shiftS//.shiftback//.NSpinHel),z\[Rule]\[Infinity]]*)


(*5 pt kernels*)
LA = Permutations[{2,3}];
AL[a_] := pt[1,LA[[a]][[1]],LA[[a]][[2]],4,5]
AR[a_] := pt[4,5,LA[[a]][[1]],LA[[a]][[2]],1]
AymL[a_] := Aym[{1,LA[[a]][[1]],LA[[a]][[2]],4,5}]
AymR[a_] := Aym[{4,5,LA[[a]][[1]],LA[[a]][[2]],1}]

Mat = Table[chyint[AL[i]AR[j],5],{i,1,2},{j,1,2}];
Mat//MatrixForm;
Kernel5 = FullSimplify[Inverse[Mat]]//.{(s[1,2]+s[1,3]+s[2,3])->s[4,5]};
AmpL = Table[AymL[i],{i,1,2}];
AmpR = Table[AymR[i],{i,1,2}];
Ma = Sum[Sum[AmpL[[i]]Kernel5[[i]][[j]]AmpR[[j]],{i,1,2}],{j,1,2}]
A5[{a_,b_,x_,d_,r_}]:=Spaa[3,4]^4/(Spaa[a,b]Spaa[b,x]Spaa[x,d]Spaa[d,r]Spaa[r,a]);
Mgrav = FullSimplify[FullSimplify[Ma//.{Aym[{x___}]-> A5[{x}],s[i_,j_]->Spaa[i,j]Spbb[j,i]}]//.schoutenA]
shiftA = {Spaa[2,i_]->Spaa[7,i]+z Spaa[3,i],Spaa[i_,2]->Spaa[i,7]+z Spaa[i,3]};
shiftS = {Spbb[3,i_]->Spbb[8,i]+z Spbb[2,i],Spbb[i_,3]->Spbb[i,8]+z Spbb[i,2]};
shiftback = {Spaa[7,i_]->Spaa[2,i],Spaa[i_,7]->Spaa[i,2],Spbb[i_,8]->Spbb[i,3],Spbb[8,i_]->Spbb[3,i]};


(*4 pt kernels*)
LA = Permutations[{2,3}];
AL[a_] := pt[1,LA[[a]][[1]],LA[[a]][[2]],4];
AR[a_] := pt[4,LA[[a]][[1]],LA[[a]][[2]],1];
AymL[a_] := Aym[{1,LA[[a]][[1]],LA[[a]][[2]],4,5}];
AymR[a_] := Aym[{4,5,LA[[a]][[1]],LA[[a]][[2]],1}];

Mat = Table[chyint[AL[i]AR[j],4],{i,1,2},{j,1,2}];
Mat//MatrixForm
Kernel5 = FullSimplify[Inverse[Mat]]





Asymptotic[(A5[{1,2,3,4,5}]s[1,2] s[1,3]A5[{4,5,2,3,1}]+A5[{1,3,2,4,5}] A5[{4,5,3,2,1}] s[1,2] s[1,3]+A5[{1,3,2,4,5}] A5[{4,5,2,3,1}] s[1,2] (s[1,3]+s[2,3])//.{s[i_,j_]->Spaa[i,j]Spbb[j,i]}//.shiftA//.shiftS//.shiftback//.NSpinHel),z->\[Infinity]]
Asymptotic[(s[1,2] (s[1,3]+s[2,3])//.{s[i_,j_]->Spaa[i,j]Spbb[j,i]}//.shiftA//.shiftS//.shiftback//.NSpinHel//FullSimplify),z->\[Infinity]]
Asymptotic[(A5[{1,2,3,4,5}]//.{s[i_,j_]->Spaa[i,j]Spbb[j,i]}//.shiftA//.shiftS//.shiftback//.NSpinHel//FullSimplify),z->\[Infinity]]
Asymptotic[(A5[{4,5,2,3,1}]//.{s[i_,j_]->Spaa[i,j]Spbb[j,i]}//.shiftA//.shiftS//.shiftback//.NSpinHel//FullSimplify),z->\[Infinity]]



(*5 pt kernels*)
LA = Permutations[{2,3,4}]
AL[a_] := pt[1,LA[[a]][[1]],LA[[a]][[2]],LA[[a]][[3]],5,6]
AR[a_] := pt[5,6,LA[[a]][[1]],LA[[a]][[2]],LA[[a]][[3]],1]

Mat = Table[chyint[AL[i]AR[j],6],{i,1,6},{j,1,6}]/.s[i_,j_]->s[i,j]-m^2/.s[i_,j_,k_]->s[i,j,k]-m^2;
Mat//MatrixForm//FullSimplify
Kernel6 = Inverse[Mat]//MatrixForm


Kernel6//Simplify


Mat = {{Mat1,Mat4},{Mat3,Mat2}};
Mat//MatrixForm;
FullSimplify[Inverse[Mat]]//.{(s[1,2]+s[1,3]+s[2,3])->s[4,5]}//MatrixForm


{{2,3,4},{2,4,3},{3,2,4},{3,4,2},{4,2,3},{4,3,2}}


DefNumSH[5]
(s[1,2] (s[1,3]+s[2,3]) s[4,5])/(s[1,2]-s[1,3])//.NSpinHel
s[1,2] s[1,3]//.NSpinHel


DefNumSH[5]
A1 = (s[1,2]+s[2,3])s[1,3]//.NSpinHel//N
A2 = (s[1,3] s[2,3] s[4,5])/(s[1,3]+s[2,3])//.NSpinHel//N
A3 = (s[1,2] s[2,3] s[4,5])/(s[1,2]+s[2,3])//.NSpinHel//N


DefNumSH[5]
(s[1,2]+s[2,3])//.NSpinHel//N
s[3,4]+s[4,5]//.NSpinHel//N


A5[{1,2,3,4,5}]A5[{4,5,2,3,1}]Mat1+A5[{1,3,2,4,5}]A5[{4,5,3,2,1}]Mat2+A5[{1,3,2,4,5}]A5[{4,5,2,3,1}]Mat3-A5[{1,2,3,4,5}]A5[{4,5,3,2,1}]Mat4//.NSpinHel


DefNumSH[5]


A5[{a_,b_,x_,d_,r_}]:=1/(Spaa[a,b]Spaa[b,x]Spaa[x,d]Spaa[d,r]Spaa[r,a]);
s[1,2]s[4,5]A5[{1,2,3,4,5}]A5[{1,3,5,4,2}]+s[1,4]s[2,5]A5[{1,4,3,2,5}]A5[{1,3,5,2,4}]//.NSpinHel


(* ::InheritFromParent:: *)
(*(s[1,3] s[2,3] s[4,5])/(s[1,3]+s[2,3])*)


(s[1,2]/(s[1,2]+s[2,3])-s[1,3]/(s[1,3]+s[2,3]))//.NSpinHel


AL[a_] := A[{1,LA[[a]][[1]],LA[[a]][[2]],4,5}]
AR[a_] := A[{1,LA[[a]][[1]],LA[[a]][[2]],5,4}]
Mat = chyint[pt[1,2,3,4,5]pt[1,3,2,5,4],5];
Kernel = Mat^(-1);
AL[1]*Kernel*AR[2]

Mat2 = chyint[pt[1,2,3,5,4]pt[1,3,2,4,5],5];
Kernel2 = Mat2^(-1);
AL[2]*Kernel2*AR[1]


Mat = chyint[pt[1,2,3,4]pt[1,3,4,2],4];
Kernel = Mat^(-1)
A4[{a_,b_,x_,d_}]:=1/(Spaa[a,b]Spaa[b,x]Spaa[x,d]Spaa[d,a]);
A5[{a_,b_,x_,d_,r_}]:=1/(Spaa[a,b]Spaa[b,x]Spaa[x,d]Spaa[d,r]Spaa[r,a]);
M4 = A4[1,2,3,4]*Kernel*A4[1,3,4,2]//FullSimplify


Kernel6 = ({
 {s[1,2]s[1,3]s[1,4], s[1,2]s[1,4](s[1,3]+s[3,4]), s[1,3]s[1,4](s[1,2]+s[2,3]), s[1,3]s[1,4](s[1,2]+s[2,3]+s[2,4]), s[1,4](s[1,2]+s[2,4])(s[1,3]+s[3,4]), s[1,4](s[1,2]+s[2,3]+s[2,4])(s[1,3]+s[3,4])},
 {s[1,2]s[1,3](s[1,4]+s[3,4]), s[1,2]s[1,3]s[1,4], s[1,3](s[1,2]+s[2,3])(s[1,4]+s[3,4]), s[1,3](s[1,2]+s[2,3]+s[2,4])(s[1,4]+s[3,4]), s[1,3]s[1,4](s[1,2]+s[2,4]), s[1,3]s[1,4](s[1,2]+s[2,3]+s[2,4])},
 {s[1,2]s[1,4](s[1,3]+s[2,3]), s[1,2]s[1,4](s[1,3]+s[2,3]+s[3,4]), s[1,2]s[1,3]s[1,4], s[1,3]s[1,4](s[1,2]+s[2,4]), s[1,4](s[1,2]+s[2,4])(s[1,3]+s[2,3]+s[3,4]), s[1,4](s[1,2]+s[2,4])(s[1,3]+s[3,4])},
 {s[1,2](s[1,3]+s[2,3])(s[1,4]+s[2,4]), s[1,2](s[1,3]+s[2,3]+s[3,4])(s[1,4]+s[2,4]), s[1,2]s[1,3](s[1,4]+s[2,4]), s[1,2]s[1,3]s[1,4], s[1,2]s[1,4](s[1,3]+s[2,3]+s[3,4]), s[1,2]s[1,4](s[1,3]+s[3,4])},
 {s[1,2]s[1,3](s[1,4]+s[2,4]+s[3,4]), s[1,2]s[1,3](s[1,4]+s[2,4]), s[1,3](s[1,2]+s[2,3])(s[1,4]+s[2,4]+s[3,4]), s[1,3](s[1,2]+s[2,3])(s[1,4]+s[3,4]), s[1,2]s[1,3]s[1,4], s[1,3]s[1,4](s[1,2]+s[2,3])},
 {s[1,2](s[1,3]+s[2,3])(s[1,4]+s[2,4]+s[3,4]), s[1,2](s[1,3]+s[2,3])(s[1,4]+s[2,4]), s[1,2]s[1,3](s[1,4]+s[2,4]+s[3,4]), s[1,2]s[1,3](s[1,4]+s[3,4]), s[1,2]s[1,4](s[1,3]+s[2,3]), s[1,2]s[1,3]s[1,4]}
});


mandel = s[i_,j_]->Spaa[i,j]Spbb[j,i];
Shift1 = {Spaa[i_,1]->\[Epsilon] Spaa[i,7],Spaa[1,i_]->\[Epsilon] Spaa[7,i]};
Shift2 = {Spbb[i_,5]->Spbb[i,8]-\[Epsilon] Spaa[9,8]/Spaa[9,7] Spbb[i,7],Spbb[5,i_]->Spbb[8,i]-\[Epsilon] Spaa[9,8]/Spaa[9,7] Spbb[7,i]};
Shift3 = {Spbb[i_,6]->Spbb[i,9]-\[Epsilon] Spaa[8,9]/Spaa[8,7] Spbb[i,7],Spbb[6,i_]->Spbb[9,i]-\[Epsilon] Spaa[8,9]/Spaa[8,7] Spbb[7,i]};
Shiftback = {Spaa[i_,7]->Spaa[i,1],Spaa[7,i_]->Spaa[1,i],Spbb[i_,8]->Spbb[i,5],Spbb[8,i_]->Spbb[5,i],Spbb[i_,9]->Spbb[i,6],Spbb[9,i_]->Spbb[6,i]};


(*Double shift*)
mandel = s[i_,j_]->Spaa[i,j]Spbb[j,i];
Shift12 = {Spaa[i_,4]->\[Epsilon] Spaa[i,7],Spaa[2,i_]->\[Epsilon] Spaa[7,i]};
(*Shift22 = {Spbb[i_,2]\[Rule]Spbb[i,8]-\[Epsilon] Spaa[9,8]/Spaa[9,7]Spbb[i,7],Spbb[2,i_]\[Rule]Spbb[8,i]-\[Epsilon] Spaa[9,8]/Spaa[9,7]Spbb[7,i]};
Shift32 = {Spbb[i_,3]\[Rule]Spbb[i,9]-\[Epsilon] Spaa[8,9]/Spaa[8,7]Spbb[i,7],Spbb[3,i_]\[Rule]Spbb[9,i]-\[Epsilon] Spaa[8,9]/Spaa[8,7]Spbb[7,i]};*)
Shiftback2 = {Spaa[i_,7]->Spaa[i,4],Spaa[7,i_]->Spaa[4,i],Spbb[i_,8]->Spbb[i,2],Spbb[8,i_]->Spbb[2,i],Spbb[i_,9]->Spbb[i,3],Spbb[9,i_]->Spbb[3,i],Spaa[i_,8]->Spaa[i,2],Spaa[8,i_]->Spaa[2,i],Spaa[i_,9]->Spaa[i,3],Spaa[9,i_]->Spaa[3,i],Spbb[i_,7]->Spbb[i,4],Spbb[7,i_]->Spbb[4,i]};


SoftKernel = FullSimplify[Kernel6//.mandel//.Shift1//.Shift2//.Shift3//.Shiftback]//.schoutenA//.schoutenB//.Spaa[i_,j_]Spbb[i_,j_]->s[i,j]


 DefNumSH[6]
 DSoftKernel = FullSimplify[SoftKernel//.mandel//.Shift12//.Shiftback2]//.schoutenA//.schoutenB//.Spaa[i_,j_]Spbb[i_,j_]->s[i,j]


SoftKernel//MatrixForm;
Asymptotic[SoftKernel,\[Epsilon]->0]//MatrixForm
Asymptotic[DSoftKernel,\[Epsilon]->0]//MatrixForm


(* ::Package:: *)

(******************************************************************************
 *                                                                            *
 *    General Tree-Level BCFW Recursions in the Grassmannian  v0              *
 *                                                                            *
 *    J. Bourjaily, October 2010                                              *
 *                                                                            *
 *                                                                            *
 ******************************************************************************)

Print[\!\(\*
TagBox[
StyleBox[
RowBox[{"Panel", "[", 
RowBox[{
RowBox[{"Column", "[", 
RowBox[{
RowBox[{"List", "[", 
RowBox[{
RowBox[{"Panel", "[", 
RowBox[{
RowBox[{"Graphics", "[", 
RowBox[{
RowBox[{"List", "[", 
RowBox[{
RowBox[{"AbsoluteThickness", "[", "1.75`", "]"}], ",", 
RowBox[{"Line", "[", 
RowBox[{"List", "[", 
RowBox[{
RowBox[{"List", "[", 
RowBox[{"1.9817627457812106`", ",", "0.2867076127786349`"}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{"1.75`", ",", "1"}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{"0", ",", "1"}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{
RowBox[{"-", "0.2317627457812106`"}], ",", "0.2867076127786349`"}], "]"}]}], "]"}], "]"}], ",", 
RowBox[{"Line", "[", 
RowBox[{"List", "[", 
RowBox[{
RowBox[{"List", "[", 
RowBox[{"1.75`", ",", "1"}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{"2.377851787087894`", ",", "0.8317676206833615`"}], "]"}]}], "]"}], "]"}], ",", 
RowBox[{"Line", "[", 
RowBox[{"List", "[", 
RowBox[{
RowBox[{"List", "[", 
RowBox[{"1.75`", ",", "1"}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{"2.377851787087894`", ",", "1.1682323793166385`"}], "]"}]}], "]"}], "]"}], ",", 
RowBox[{"Line", "[", 
RowBox[{"List", "[", 
RowBox[{
RowBox[{"List", "[", 
RowBox[{"1.75`", ",", "1"}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{"1.9182323793166385`", ",", "1.6278517870878944`"}], "]"}]}], "]"}], "]"}], ",", 
RowBox[{"Line", "[", 
RowBox[{"List", "[", 
RowBox[{
RowBox[{"List", "[", 
RowBox[{"1.75`", ",", "1"}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{"1.5817676206833615`", ",", "1.6278517870878944`"}], "]"}]}], "]"}], "]"}], ",", 
RowBox[{"Line", "[", 
RowBox[{"List", "[", 
RowBox[{
RowBox[{"List", "[", 
RowBox[{"0", ",", "1"}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{"0.16823237931663845`", ",", "1.6278517870878944`"}], "]"}]}], "]"}], "]"}], ",", 
RowBox[{"Line", "[", 
RowBox[{"List", "[", 
RowBox[{
RowBox[{"List", "[", 
RowBox[{"0", ",", "1"}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{
RowBox[{"-", "0.16823237931663845`"}], ",", "1.6278517870878944`"}], "]"}]}], "]"}], "]"}], ",", 
RowBox[{"Line", "[", 
RowBox[{"List", "[", 
RowBox[{
RowBox[{"List", "[", 
RowBox[{"0", ",", "1"}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{
RowBox[{"-", "0.6278517870878944`"}], ",", "1.1682323793166385`"}], "]"}]}], "]"}], "]"}], ",", 
RowBox[{"Line", "[", 
RowBox[{"List", "[", 
RowBox[{
RowBox[{"List", "[", 
RowBox[{"0", ",", "1"}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{
RowBox[{"-", "0.6278517870878944`"}], ",", "0.8317676206833615`"}], "]"}]}], "]"}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{
RowBox[{"PointSize", "[", "0.0125`", "]"}], ",", 
RowBox[{"Point", "[", 
RowBox[{"List", "[", 
RowBox[{
RowBox[{"-", "0.3146625176280136`"}], ",", "1.3146625176280136`"}], "]"}], "]"}], ",", 
RowBox[{"Point", "[", 
RowBox[{"List", "[", 
RowBox[{
RowBox[{"-", "0.3680607966083864`"}], ",", "1.2125`"}], "]"}], "]"}], ",", 
RowBox[{"Point", "[", 
RowBox[{"List", "[", 
RowBox[{
RowBox[{"-", "0.2125`"}], ",", "1.3680607966083864`"}], "]"}], "]"}], ",", 
RowBox[{"Point", "[", 
RowBox[{"List", "[", 
RowBox[{"2.0646625176280136`", ",", "1.3146625176280136`"}], "]"}], "]"}], ",", 
RowBox[{"Point", "[", 
RowBox[{"List", "[", 
RowBox[{"1.9625`", ",", "1.3680607966083864`"}], "]"}], "]"}], ",", 
RowBox[{"Point", "[", 
RowBox[{"List", "[", 
RowBox[{"2.118060796608386`", ",", "1.2125`"}], "]"}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{
RowBox[{"RGBColor", "[", 
RowBox[{"1", ",", 
RowBox[{"Rational", "[", 
RowBox[{"5", ",", "9"}], "]"}], ",", 
RowBox[{"Rational", "[", 
RowBox[{"5", ",", "9"}], "]"}]}], "]"}], ",", 
RowBox[{"EdgeForm", "[", 
RowBox[{"List", "[", 
RowBox[{
RowBox[{"GrayLevel", "[", "0", "]"}], ",", 
RowBox[{"AbsoluteThickness", "[", "1.75`", "]"}]}], "]"}], "]"}], ",", 
RowBox[{"Disk", "[", 
RowBox[{
RowBox[{"List", "[", 
RowBox[{"1.75`", ",", "1"}], "]"}], ",", "0.24`"}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{
RowBox[{"EdgeForm", "[", 
RowBox[{"GrayLevel", "[", "1", "]"}], "]"}], ",", 
RowBox[{"RGBColor", "[", 
RowBox[{"1", ",", "1", ",", "1"}], "]"}], ",", 
RowBox[{"Disk", "[", 
RowBox[{
RowBox[{"List", "[", 
RowBox[{"0.875`", ",", "1"}], "]"}], ",", "0.125`"}], "]"}]}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{
RowBox[{"RGBColor", "[", 
RowBox[{"0", ",", "0", ",", "0"}], "]"}], ",", 
RowBox[{"Text", "[", 
RowBox[{
RowBox[{"Style", "[", 
RowBox[{"\"\<\\[CircleTimes]\>\"", ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontSize", ",", "39.5`"}], "]"}]}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{"0.875`", ",", "1"}], "]"}]}], "]"}]}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{
RowBox[{"RGBColor", "[", 
RowBox[{"0", ",", "0", ",", "0"}], "]"}], ",", 
RowBox[{"Text", "[", 
RowBox[{
RowBox[{"Style", "[", 
RowBox[{"\"\<BCFW\>\"", ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontSize", ",", "14"}], "]"}]}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{"0.875`", ",", "0.7`"}], "]"}]}], "]"}]}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{
RowBox[{"RGBColor", "[", 
RowBox[{
RowBox[{"Rational", "[", 
RowBox[{"19", ",", "27"}], "]"}], ",", 
RowBox[{"Rational", "[", 
RowBox[{"19", ",", "27"}], "]"}], ",", "1"}], "]"}], ",", 
RowBox[{"Disk", "[", 
RowBox[{
RowBox[{"List", "[", 
RowBox[{"0", ",", "1"}], "]"}], ",", "0.24`"}], "]"}]}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{
RowBox[{"GrayLevel", "[", "0", "]"}], ",", 
RowBox[{"Inset", "[", 
RowBox[{
RowBox[{"Style", "[", 
RowBox[{"\"\<L\>\"", ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontFamily", ",", "\"\<Times\>\""}], "]"}], ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontSize", ",", "18"}], "]"}]}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{"0", ",", "1"}], "]"}]}], "]"}], ",", 
RowBox[{"Inset", "[", 
RowBox[{
RowBox[{"Style", "[", 
RowBox[{"\"\<R\>\"", ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontFamily", ",", "\"\<Times\>\""}], "]"}], ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontSize", ",", "18"}], "]"}]}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{"1.75`", ",", "1"}], "]"}]}], "]"}], ",", 
RowBox[{"Inset", "[", 
RowBox[{
RowBox[{"Style", "[", 
RowBox[{"n", ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontFamily", ",", "\"\<Times\>\""}], "]"}], ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontSize", ",", "18"}], "]"}], ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontSlant", ",", "Italic"}], "]"}]}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{"2.0126644452187055`", ",", "0.14160196114911955`"}], "]"}]}], "]"}], ",", 
RowBox[{"Inset", "[", 
RowBox[{
RowBox[{"Style", "[", 
RowBox[{"1", ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontFamily", ",", "\"\<Times\>\""}], "]"}], ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontSize", ",", "18"}], "]"}]}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{
RowBox[{"-", "0.2626644452187053`"}], ",", "0.14160196114911955`"}], "]"}]}], "]"}], ",", 
RowBox[{"Inset", "[", 
RowBox[{
RowBox[{"Style", "[", 
RowBox[{"j", ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontFamily", ",", "\"\<Times\>\""}], "]"}], ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontSize", ",", "18"}], "]"}], ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontSlant", ",", "Italic"}], "]"}]}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{"0.2199961883371426`", ",", "1.821036952345708`"}], "]"}]}], "]"}], ",", 
RowBox[{"Inset", "[", 
RowBox[{
RowBox[{"Style", "[", 
RowBox[{
RowBox[{"HoldForm", "[", 
RowBox[{"Plus", "[", 
RowBox[{"j", ",", "1"}], "]"}], "]"}], ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontFamily", ",", "\"\<Times\>\""}], "]"}], ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontSize", ",", "18"}], "]"}]}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{"1.625168360566421`", ",", "1.8046934119326015`"}], "]"}]}], "]"}], ",", 
RowBox[{"Inset", "[", 
RowBox[{
RowBox[{"Style", "[", 
RowBox[{"\"\<\>\"", ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontFamily", ",", "\"\<Times\>\""}], "]"}], ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontSize", ",", "14"}], "]"}]}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{"1.0482163874911592`", ",", "0.6533370801811904`"}], "]"}]}], "]"}], ",", 
RowBox[{"Inset", "[", 
RowBox[{
RowBox[{"Style", "[", 
RowBox[{"\"\<\>\"", ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontFamily", ",", "\"\<Times\>\""}], "]"}], ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontSize", ",", "14"}], "]"}]}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{"0.6355884545011986`", ",", "0.9115170891800287`"}], "]"}]}], "]"}], ",", 
RowBox[{"Inset", "[", 
RowBox[{
RowBox[{"Style", "[", 
RowBox[{"\"\<\>\"", ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontFamily", ",", "\"\<Times\>\""}], "]"}], ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontSize", ",", "14"}], "]"}]}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{"0.3158233394322946`", ",", "1.0766851893773084`"}], "]"}]}], "]"}], ",", 
RowBox[{"Inset", "[", 
RowBox[{
RowBox[{"Style", "[", 
RowBox[{"\"\<\>\"", ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontFamily", ",", "\"\<Times\>\""}], "]"}], ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontSize", ",", "14"}], "]"}]}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{
RowBox[{"-", "0.24713925908609138`"}], ",", "0.6854810234367761`"}], "]"}]}], "]"}]}], "]"}]}], "]"}]}], "]"}]}], "]"}], ",", 
RowBox[{"Rule", "[", 
RowBox[{"ImageSize", ",", 
RowBox[{"List", "[", 
RowBox[{"311.375`", ",", "176.25`"}], "]"}]}], "]"}], ",", 
RowBox[{"Rule", "[", 
RowBox[{"PlotRange", ",", 
RowBox[{"List", "[", 
RowBox[{
RowBox[{"List", "[", 
RowBox[{
RowBox[{"-", "0.75`"}], ",", "2.5`"}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{"0.`", ",", "1.95`"}], "]"}]}], "]"}]}], "]"}]}], "]"}], ",", 
RowBox[{"Rule", "[", 
RowBox[{"Background", ",", 
RowBox[{"RGBColor", "[", 
RowBox[{"1", ",", "20", ",", "20"}], "]"}]}], "]"}], ",", 
RowBox[{"Rule", "[", 
RowBox[{"FrameMargins", ",", "0"}], "]"}]}], "]"}], ",", 
RowBox[{"Row", "[", 
RowBox[{"List", "[", 
RowBox[{
RowBox[{"Style", "[", 
RowBox[{"\"\<Efficient Tree-Amplitudes in \>\"", ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontFamily", ",", "\"\<Times\>\""}], "]"}], ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontSize", ",", "18"}], "]"}]}], "]"}], ",", 
RowBox[{"Style", "[", 
RowBox[{"\"\<N=\>\"", ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontFamily", ",", "\"\<Lucida Calligraphy\>\""}], "]"}], ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontSize", ",", "18"}], "]"}]}], "]"}], ",", 
RowBox[{"Style", "[", 
RowBox[{"\"\<4 SYM\>\"", ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontFamily", ",", "\"\<Times\>\""}], "]"}], ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontSize", ",", "18"}], "]"}]}], "]"}]}], "]"}], "]"}], ",", 
RowBox[{"Style", "[", 
RowBox[{"\"\<via BCFW in the Momentum-Twistor Grassmannian\>\"", ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontFamily", ",", "Times"}], "]"}], ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontSize", ",", "14"}], "]"}]}], "]"}], ",", 
RowBox[{"Style", "[", 
RowBox[{"\"\<Jacob L. Bourjaily, 2010\>\"", ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontFamily", ",", "Times"}], "]"}], ",", 
RowBox[{"Rule", "[", 
RowBox[{"FontSize", ",", "15"}], "]"}]}], "]"}]}], "]"}], ",", 
RowBox[{"Rule", "[", 
RowBox[{"Alignment", ",", "Center"}], "]"}]}], "]"}], ",", 
RowBox[{"Rule", "[", 
RowBox[{"Background", ",", 
RowBox[{"RGBColor", "[", 
RowBox[{
RowBox[{"Rational", "[", 
RowBox[{"3", ",", "4"}], "]"}], ",", 
RowBox[{"Rational", "[", 
RowBox[{"3", ",", "4"}], "]"}], ",", 
RowBox[{"Rational", "[", 
RowBox[{"9", ",", "10"}], "]"}]}], "]"}]}], "]"}], ",", 
RowBox[{"Rule", "[", 
RowBox[{"FrameMargins", ",", 
RowBox[{"List", "[", 
RowBox[{
RowBox[{"List", "[", 
RowBox[{"15", ",", "15"}], "]"}], ",", 
RowBox[{"List", "[", 
RowBox[{"0", ",", "12.5`"}], "]"}]}], "]"}]}], "]"}]}], "]"}],
ShowSpecialCharacters->False,
ShowStringCharacters->True,
NumberMarks->True],
FullForm]\)];


BeginPackage["BCFW`"]
Begin["Global`"]


(*Generalized BCFW recursion "schemes" *)
bcfwPartitions[n_,k_]:=DeleteCases[Select[Transpose/@Tuples[List[Function[y,y[[Select[Range[Length[y]],Count[y[[Range[1,#-1]]],y[[#]]]==0&]]]][Join[#,Reverse[Reverse/@#]]]&@Select[IntegerPartitions[n+2,{2}],Min[#]>=3&],Function[y,y[[Select[Range[Length[y]],Count[y[[Range[1,#-1]]],y[[#]]]==0&]]]][Join[#,Reverse[Reverse/@#]]]&@Select[IntegerPartitions[k+1,{2}],Min[#]>=1&]]],Count[Count[Range@@(Sort@{2,#-2}&@#1),#2]==1&@@##&/@#,False]==0&],{{3,1},___}|{___,{3,2}}];

generalBCFWbridge[a_:0,b_:0,c_:0][{nL_,kL_},{nR_,kR_}]:=Block[{leftTerms,rightTerms,jHatL,jHatR,nHat,leftShift,rightShiftJ,eph1,rightShiftN,bridgeTerms},leftTerms=If[kL==2,{{1,0}},{#1,Normal[SparseArray[{i_,i_}:>1,{kL+kR-3,kL-2}]].RotateLeft[#2,{0,a}].Normal[SparseArray[List[{i_,i_}:>1,{nL,nL-1}->leftShift],{nL,nL}]].Normal[SparseArray[{i_,i_}:>1,{nL,nL+nR-2}]]}&@@@((generalTreeContour[a,b,c][nL,kL]/.{ab[x__]:>ab@@({x}/.(Rule@@@Transpose[List[Range[nL],RotateRight[Range[nL],a]]]))})/.{ab[x__]:>If[Mod[Count[{x},nL|nL-1],2]==0||Count[{x},nL]==0||kR==1,ab[x],If[Length[Intersection[{nL+nR-2,nL+nR-3},{x}]]==2,(-ab@@({x}/.{nL->(1)})ab[nL,nL-1,nL+nR-3,nL+nR-2]/ab[nL-1,nL+nR-3,nL+nR-2,1]),(ab[x]+leftShift (ab@@({x}/.{nL->(nL-1)})))]]})]/.If[kR==1,leftShift->0,leftShift->(ab[nL,nL+nR-3,nL+nR-2,1]/ab[nL+nR-3,nL+nR-2,1,nL-1])];rightTerms=If[kR<=2,{{1,0}},{#1,RotateLeft[Normal[SparseArray[{i_,i_}:>1,{kL+kR-3,kR-2}]],{kR-2,0}].RotateLeft[#2,{0,b}].Normal[SparseArray[List[{i_,i_}:>1,{1,2}->rightShiftJ,{nR,nR-1}->rightShiftN],{nR,nR}]].RotateLeft[Normal[SparseArray[{i_,i_}:>1,{nR,nL+nR-2}]],{0,nR}]}&@@@(((generalTreeContour[a,b,c][nR,kR]/.{ab[x__]:>ab@@({x}/.(Rule@@@Transpose[List[Range[nR],RotateRight[Range[nR],b]]]))})/.{ab[x__]:>If[Mod[Count[{x},1|2],2]==0||Count[{x},1]==0,ab[x],If[Length[Intersection[{x},{nR-1,nR}]]==2,(-ab@@({x}/.{1->eph1})ab[1,2,nR-1,nR]/ab[2,nR-1,nR,eph1]),(ab[x]+rightShiftJ (ab@@({x}/.{1->2})))]]}/.{ab[x__]:>If[Mod[Count[{x},nR|nR-1],2]==0||Count[{x},nR]==0,ab[x],If[Length[Intersection[{1,2},{x}]]==2,(-(ab@@({x}/.{nR->eph1}))ab[1,2,nR,nR-1]/ab[nR-1,eph1,1,2]),(ab[x]+rightShiftN (ab@@({x}/.{nR->(nR-1)})))]]})/.{ab[x__]:>ab@@({x}/.(Rule@@@Transpose[List[Range[nR],Range[nL-1,nL+nR-2]]]))})/.{ab[x__]:>ab@@({x}/.{eph1->1})}]/.{rightShiftJ->ab[nL+nR-3,nL+nR-2,1,nL-1]/ab[nL,nL+nR-3,nL+nR-2,1],rightShiftN->ab[nL+nR-2,1,nL-1,nL]/ab[1,nL-1,nL,nL+nR-3]};bridgeTerms=If[kR==1,{{1,0}},{{Power[Times@@(ab@@@Partition[{nL+nR-3,nL+nR-2,1,nL-1,nL},4,1,1]),-1],Normal[SparseArray[(Rule@@@Transpose[List[{kL-1,#}&/@#,ab@@@Partition[RotateLeft[#],4,1,1]]])&@{nL+nR-3,nL+nR-2,1,nL-1,nL},{kL+kR-3,nL+nR-2}]]}}];{#1,cleanDelta[#2]}&@@@(({Times@@#1,RotateLeft[Plus@@#2,{0,-c}]}&@@@Transpose/@Tuples[{leftTerms,bridgeTerms,rightTerms}])/.{ab[x__]:>ab@@({x}/.(Rule@@@Transpose[List[Range[nL+nR-2],RotateRight[Range[nL+nR-2],-c]]]))})];

generalTreeContour[x__][3,1]=generalTreeContour[x__][n_,2]={{1,{}}};
generalTreeContour[a_:0,b_:0,c_:0][n_,k_]:=generalTreeContour[a,b,c][n,k]=Flatten[generalBCFWbridge[a,b,c]@@@bcfwPartitions[n,k],1];

treeContour[n_,k_]:=generalTreeContour[0,0,0][n,k];


(*Component ampliutude generation (not to be used numerically!: too slow)*)
parseInput[x__]:=(If[Count[{x},m/2|p/2,\[Infinity]]>2,(Print[" Amplitudes involving more than one pair of fermions must be specified in more detail. Please specify the R-charges of each particle in question, referring to the manual if necessary."];-1),Block[{output,kCharge,gaugeList,signature,wList={x}/.{m/2->fm,p/2->fp,m->{1,2,3,4},p->{}}},If[Count[{x},m/2|p/2,\[Infinity]]>0,wList=(wList/.{(fm)->{1,2,3},(fp)->{4}});];If[Mod[Length[Cases[Flatten[wList],_Integer]],4]!=0,(Print["  Please recheck the R-charge assignments requested (they appear ill-formed)."];-1),(kCharge=Length[Cases[Flatten[wList],_Integer]]/4;If[(kCharge<2||kCharge>(Length[{x}]-2))&&Length[{x}]!=3,(Print["  The amplitude you requested vanishes because it is worse than MHV (or MHV-bar)."];-1),(gaugeList=Position[wList,#][[All,1]]&/@Range[4];If[Length[Intersection[Length/@gaugeList,Length/@gaugeList]]>1,(Print["  Please recheck the R-charge assignments requested (they appear ill-formed)."];-1),(signature=Signature[Flatten[Transpose[Position[Flatten[wList],#]&/@Range[4]]]];If[signature<=0,ReplacePart[gaugeList,{1->gaugeList[[1,Join[{2,1},Range[3,Length[gaugeList[[1]]]]]]]}],gaugeList])])])]]]);

AmpTerms[a_Integer:0,b_Integer:0,c_Integer:0][x__]:=AmpTerms[a,b,c][x]=Block[{detList=parseInput[x]},If[Not[detList===-1],Block[{ephN=Length[{x}],contour,qInverse,MHVprefactor,resList,cHatList,ephK=Length[detList[[1]]],partitionList,signatureList},MHVprefactor=(mhvPrefactor[ephN]);qInverse=(QabInverse[ephN]);partitionList=({#,Delete[Range[ephK],Partition[#,1]]}&/@Subsets[Range[ephK],{2}]);signatureList=Signature[Flatten[#]]&/@partitionList;contour=(generalTreeContour[a,b,c][ephN,ephK]);{resList,cHatList}=Transpose[{#1,Join[{},If[ephK==2,{},#2.qInverse]]}&@@@contour];MHVprefactor ((resList)*(Function[{y},Times@@Table[If[ephK>2&&Count[Sort/@Partition[Range[ephN],ephK,1,1],Sort@j]==1,(Block[{ephMinor=Select[Partition[Range[ephN],ephK,1,1],Length[Union[#,j]]==Length[j]&][[1]]},Signature[j]Signature[ephMinor](Times@@(ab@@@Partition[ephMinor,2,1]))*Det[contour[[y,2]][[All,ephMinor[[2;;-2]]]]]]),(signatureList.(((ab@@j[[#1]])*If[j[[#2]]==={},1,Det[cHatList[[y]][[All,j[[#2]]]]]])&@@@partitionList))],{j,detList}]]/@Range[Length[cHatList]]))],{0}]];
AmpTerms[x__]/;Length[{x}]>3:=AmpTerms[x]=AmpTerms[0,0,0][x];
Amp[x__]:=Amp[x]=Total[AmpTerms[0,0,0][x]];


(*faster numerical implementation of exactly the same formulae as above*)
nAmpTerms[a_Integer:0,b_Integer:0,c_Integer:0][x__]:=If[Length[{x}]!=Length[Zs]&&ValueQ[nQinverse]&&ValueQ[nMHVprefactor],Print["  Amplitudes can only be evaluated numerically if the global variables Zs (momentum-twistors) have been defined. Please run one of:\n     useReferences[], useRandomKinematics[],\n     setupUsingTwistors[], setupUsingSpinors[], or setupUsingFourMomenta[]."];{0},Block[{ephContour,parsedInput=parseInput[x]},If[Not[parsedInput===-1],Block[{ephN=Length[{x}],ephK=Length[parsedInput[[1]]]},If[Depth[nContour[a,b,c][ephN,ephK]]==2||Depth[cMatrixList[a,b,c][ephN,ephK]]==2,(nContour[a,b,c][ephN,ephK]=(ephContour=generalTreeContour[a,b,c][ephN,ephK];ab[q__]:=ab[q]=If[Not[OrderedQ[{q}]],(Signature[{q}]*(ab@@Sort[{q}])),Det[Zs[[{q}]]]];ephContour);cMatrixList[a,b,c][ephN,ephK]=Join[If[ephK==2,{},#.nQinverse],Transpose[Ls]]&/@(nContour[a,b,c][ephN,ephK][[All,2]]);cMatrixDetList[a,b,c][ephN,ephK][y_]:=cMatrixDetList[a,b,c][ephN,ephK][y]=Det[#[[All,y]]]&/@(cMatrixList[a,b,c][ephN,ephK]);ClearAll[ab]);];nMHVprefactor*((nContour[a,b,c][ephN,ephK][[All,1]])*(Times@@(cMatrixDetList[a,b,c][ephN,ephK][#]&/@parsedInput)))],{0}]]];
nAmp[x__]:=Total[nAmpTerms[0,0,0][x]/.(If[Length[#]>0,#,{}]&@rootSrule)];

mhvPrefactor[n_]:=1/Times@@(ab@@@Partition[Range[n],2,1,1]);


toN={ab[x__Integer]:>If[Not[Depth[Zs]>=3&&Length[Intersection[{x},Range[Length[Zs]]]]==Length[Intersection[{x},{x}]]],ab[x],If[Length[{x}]==4,(Det[Zs[[{x}]]]),If[Length[{x}]==2,Det[Zs[[{x},1;;2]]],ab[x]]]],s[x__]:>If[Not[Depth[xMomenta]>=3&&Length[Intersection[{x},Range[Length[Zs]]]]==Length[Intersection[{x},{x}]]],s[x],Det[Total[xMomenta[[{x}]]]]],ab[x_,X[y__],X[z__],w_]:>If[Not[Depth[regionMomenta]>=3&&Length[Intersection[{x,y,z,w},Range[Length[Zs]]]]==Length[Intersection[{x,y,z,w},{x,y,z,w}]]],ab[x,X[y],X[z],w],({{0,1},{-1,0}}.Zs[[x,1;;2]].({-1,1}.(regionMomenta[[{y}]])).{{0,1},{-1,0}}.({{0,1},{-1,0}}.Zs[[w,1;;2]].({-1,1}.(regionMomenta[[{z}]]))))]};


(*Conversions between momentum twistors and spinors and momenta and back and Interfacing with external data*)

Qab[n_]:=Normal[SparseArray[Flatten[Table[Rule@@@Transpose[List[{Mod[i,n,1],Mod[#,n,1]}&/@{i-1,i,i+1},{1/ab[i-1,i],ab[i+1,i-1]/(ab[i-1,i]ab[i,i+1]),1/ab[i,i+1]}]],{i,n}],1]]]/.{ab[x__]:>ab@@(Mod[{x},n,1])};
QabInverse[nP_]:=Normal[SparseArray[{i_,j_}:>If[j>1&&i>j,ab[j,i],0],{nP,nP}]];
pauliMatrices=List[{{1,0},{0,1}},{{0,1},{1,0}},{{0,-I},{I,0}},{{1,0},{0,-1}}];


setupUsingSpinors[ls_List,lbs_List]:=Block[{\[Mu]s},ClearAll[nContour,cMatrixList,cMatrixDetList];Ls=ls;Lbs=lbs;(ab[x__]:=ab[x]=Det[Ls[[{x}]]];nQinverse=QabInverse[Length[Ls]];ClearAll[ab];);nMHVprefactor=1/Times@@(Det[#]&/@Partition[Ls,2,1,1]);\[Mu]s=(nQinverse).Lbs;Zs=Join@@@Transpose[{Ls,\[Mu]s}];];setupUsingSpinors[{ls_List,lbs_List}]:=setupUsingSpinors@@{ls,lbs};

setupUsingTwistors[zs_]:=(ClearAll[nContour,cMatrixList,cMatrixDetList];Zs=zs;Ls=Zs[[All,1;;2]];(ab[x__]:=ab[x]=Det[Ls[[{x}]]];nQinverse=QabInverse[Length[Ls]];ClearAll[ab];);nMHVprefactor=1/Times@@(Det[Zs[[#,1;;2]]]&/@Partition[Range[Length[zs]],2,1,1]););

setupUsingFourMomenta[fourMomentaList_]:=If[Not[Max[Abs/@Total[fourMomentaList]]<=Power[10,-Accuracy[fourMomentaList]+3]],Print["The input momenta do not add to zero."],Block[{ephN=Length[fourMomentaList]},xMomenta=fourMomentaList.pauliMatrices;fourMomenta=fourMomentaList;If[Max[Abs/@(Chop[#,Power[10,-Accuracy[fourMomentaList]+4]]&/@Det/@xMomenta)]>0,Print[" Some of the momenta are not light-like."],(regionMomenta=Chop/@((Total[xMomenta[[1;;#]]]-xMomenta[[1]])&/@Range[ephN]);{Ls,Lbs}=Transpose[Function[{y},Block[{\[Lambda],\[Lambda]b},Chop/@({{Power[y[[1,1]],1/2],\[Lambda][2]},{Power[y[[1,1]],1/2],\[Lambda]b[2]}}/.((If[Length[#]==0,Print["Please re-generate momenta."];{},#[[1]]])&@(Quiet[Solve[#==0&/@(Flatten[Outer[Times,{Power[y[[1,1]],1/2],\[Lambda][2]},{Power[y[[1,1]],1/2],\[Lambda]b[2]}]-y][[2;;3]]),{\[Lambda][2],\[Lambda]b[2]}]])))]]/@xMomenta];If[Count[{Ls,Lbs},_ \[Lambda],\[Infinity]]>0,Print["Please re-generate momenta."];,If[Length[Cases[{Ls,Lbs},_Power|_Sqrt,\[Infinity]]]>0,{Ls,Lbs}=N[{Ls,Lbs}];];setupUsingSpinors[Ls,Lbs]])]]];


(*Use pre-defined reference twistors or randomly-generated, (rational-valued) Minkowski-kinematics*)
useReferences[nP_]:=Block[{referenceList={{-3,5,3,-3},{2,6,-1,-3},{-2,5,-1,5},{3,3,5,-2},{0,-5,6,0},{-1,2,-5,-5},{2,0,-6,-1},{2,1,-5,-3},{4,-1,-6,1},{-2,-5,4,4},{-5,2,6,-1},{-1,6,1,-4},{5,-5,-5,3},{6,4,-5,-3},{4,6,-3,-4}}},Zs=If[nP<16,referenceList[[1;;nP]],Join[referenceList[[1;;15]],RandomInteger[{-50,50},{nP-15,4}]]];setupUsingTwistors[Zs];];

useRandomKinematics[n_,rationalQ_:0,precision_:0]:=Block[{seedLsLbs=Transpose[List[{#1,#2+I #3},{#1,#2-I #3}]&@@@({#1,2#2 #3,(#2^2-#3^2)}&@@@RandomInteger[{1,50},{n-2,3}])],netSeedMomenta,momentumRules,\[Alpha],\[Beta],\[Gamma],\[Delta],\[Mu]bars,p1,p2,p3,p0},netSeedMomenta=Total[(Outer[Times,##]&@@@Transpose[seedLsLbs])];momentumRules=Rule@@@Transpose[{{\[Alpha],\[Beta],\[Gamma],\[Delta]},{#1,Re[#2],Im[#3],#4}&@@Flatten[netSeedMomenta]}];{Ls,Lbs}=Reverse/@List[Join[seedLsLbs[[1]],({{-Sqrt[\[Beta]^2 + \[Gamma]^2], -(((\[Beta] + I*\[Gamma])*\[Delta])/Sqrt[\[Beta]^2 + \[Gamma]^2])},{-Sqrt[(\[Beta]^2 + \[Gamma]^2 - \[Alpha]*\[Delta])/\[Delta]], 0}})],Join[seedLsLbs[[2]],({{Sqrt[\[Beta]^2 + \[Gamma]^2]/\[Delta], (\[Beta] - I*\[Gamma])/Sqrt[\[Beta]^2 + \[Gamma]^2]},{-Sqrt[(\[Beta]^2 + \[Gamma]^2 - \[Alpha]*\[Delta])/\[Delta]], 0}})]]/.momentumRules;rootSrule={s1->Ls[[1,1]],s2->Sqrt[Ls[[2,1]]Lbs[[2,1]]]};{Ls,Lbs}=List[ReplacePart[Ls,{1->s1 Ls[[1]]/Ls[[1,1]],2-> s2 Ls[[2]]/Ls[[2,1]]}],ReplacePart[Lbs,{1->Lbs[[1]]Ls[[1,1]]/s1,2->Lbs[[2]]Ls[[2,1]]/s2}]];{Ls,Lbs}={Power[Total[Ls[[3;;-1,1]]],-1]Ls,Power[Total[Ls[[3;;-1,1]]],-1]Lbs};fourMomenta=Chop/@(({p0,p1,p2,p3}/.Solve[#==0&/@Flatten[(({p0,p1,p2,p3}.pauliMatrices)-#)]][[1]])&/@(Outer[Times,#1,#2]&@@@Transpose[{Ls,Lbs}/.rootSrule]));xMomenta=Outer[Times,##]&@@@Transpose[{Ls,Lbs}];regionMomenta=Chop/@((Total[xMomenta[[1;;#]]]-xMomenta[[1]])&/@Range[n]);If[rationalQ===0,{Ls,Lbs}=N[({Ls,Lbs}/.rootSrule)];If[Not[precision===0],{Ls,Lbs}=N[{Ls,Lbs}];];];Zs=Join@@@Transpose[List[Ls,(Transpose[#1].{{0,1},{-1,0}}.#2)&@@@Transpose[List[regionMomenta,Ls]]]];Ws=Join@@@Transpose[List[({{0,1},{-1,0}}.#1.{{0,1},{-1,0}}.#2)&@@@Transpose[List[regionMomenta,Lbs]],{{0,1},{-1,0}}.#&/@Lbs]];nMHVprefactor=1/Times@@(Det[Zs[[#,1;;2]]]&/@Partition[Range[n],2,1,1]);(ab[x__]:=ab[x]=Det[Ls[[{x}]]];nQinverse=QabInverse[Length[Ls]];ClearAll[ab];);ClearAll[nContour,cMatrixList,cMatrixDetList];];

useRandomTwistors[nP_]:=setupUsingTwistors[RandomInteger[{-75,75},{nP,4}]];

useRandomSpinors[n_,rationalQ_:0,precision_:0]:=Block[{seedLsLbs=Transpose[List[{#1,#2+I #3},{#1,#2-I #3}]&@@@({#1,2#2 #3,(#2^2-#3^2)}&@@@RandomInteger[{1,50},{n-2,3}])],netSeedMomenta,momentumRules,\[Alpha],\[Beta],\[Gamma],\[Delta],\[Mu]bars,p1,p2,p3,p0},netSeedMomenta=Total[(Outer[Times,##]&@@@Transpose[seedLsLbs])];momentumRules=Rule@@@Transpose[{{\[Alpha],\[Beta],\[Gamma],\[Delta]},{#1,Re[#2],Im[#3],#4}&@@Flatten[netSeedMomenta]}];{Ls,Lbs}=Reverse/@List[Join[seedLsLbs[[1]],({{-Sqrt[\[Beta]^2 + \[Gamma]^2], -(((\[Beta] + I*\[Gamma])*\[Delta])/Sqrt[\[Beta]^2 + \[Gamma]^2])},{-Sqrt[(\[Beta]^2 + \[Gamma]^2 - \[Alpha]*\[Delta])/\[Delta]], 0}})],Join[seedLsLbs[[2]],({{Sqrt[\[Beta]^2 + \[Gamma]^2]/\[Delta], (\[Beta] - I*\[Gamma])/Sqrt[\[Beta]^2 + \[Gamma]^2]},{-Sqrt[(\[Beta]^2 + \[Gamma]^2 - \[Alpha]*\[Delta])/\[Delta]], 0}})]]/.momentumRules;rootSrule={s1->Ls[[1,1]],s2->Sqrt[Ls[[2,1]]Lbs[[2,1]]]};{Ls,Lbs}=List[ReplacePart[Ls,{1->s1 Ls[[1]]/Ls[[1,1]],2-> s2 Ls[[2]]/Ls[[2,1]]}],ReplacePart[Lbs,{1->Lbs[[1]]Ls[[1,1]]/s1,2->Lbs[[2]]Ls[[2,1]]/s2}]];If[rationalQ===0,{Ls,Lbs}=N[{Power[Total[Ls[[3;;-1,1]]],-1]Ls,Power[Total[Ls[[3;;-1,1]]],-1]Lbs}/.rootSrule];If[Not[precision===0],{Ls,Lbs}=N[({Power[Total[Ls[[3;;-1,1]]],-1]Ls,Power[Total[Ls[[3;;-1,1]]],-1]Lbs}/.rootSrule)];];,{Ls,Lbs}={Power[Total[Ls[[3;;-1,1]]],-1]Ls,Power[Total[Ls[[3;;-1,1]]],-1]Lbs};];setupUsingSpinors[Ls,Lbs];];


(*aesthetics and human-readability*)
nice[exprn_]:=Block[{niceExprn=(exprn/.{ab[x_,X[y1__],X[y2__],z_]:>ab[x,Row[List["|",Subscript["x",Row[If[Max[{y1}]>9,Riffle[{y1},Style[" ",FontSize->4]],{y1}]]],Subscript["x",Row[If[Max[{y2}]>9,Riffle[{y2},Style[" ",FontSize->4]],{y2}]]],"|"]],z]}/.{ab[x__,y_Integer/;y>9,z__]:>ab[x,Row[List[Style[" ",FontSize->4],y,Style[" ",FontSize->4]]],z]}/.{ab[y_Integer/;y>9,z__]:>ab[Row[List[y,Style[" ",FontSize->4]]],z]}/.{ab[x__,y_Integer/;y>9]:>ab[x,Row[List[Style[" ",FontSize->4],y]]]}/.{ab[x__]:>Row[List["\[LeftAngleBracket]",x,"\[RightAngleBracket]"]]}/.{s[x__]:>Subscript[s,Row[{x}]]})},If[Head[exprn]===List,MatrixForm[niceExprn],niceExprn]];

order[exprn_,option_:1]:=If[option==0,(exprn/.{ab[x__]:>(Signature[{x}]ab@@Sort[{x}])}),Block[{nGuess=Max[Join[{0},Flatten[List@@@Cases[exprn,_ab,{0,\[Infinity]}]]]],consec,xLike},consec=Partition[Range[nGuess],2,1,1];xLike=If[Length[Range[#2,#3]]>Length[Range[#4,#1+nGuess]],{#3,#4,#1,#2},{##}]&@@@Select[Flatten/@Subsets[consec,{2}],Length[Intersection[#,#]]==4&];(exprn/.{ab[x__]:>If[Length[{x}]==2,(If[Length[#]==1,Signature[#[[1]]]*Signature[{x}](ab@@#[[1]]),Signature[{x}](ab@@(Sort[{x}]))]&@(Select[consec,Length[Intersection[{x},#]]==2&,1])),If[Length[#]==1,Signature[#[[1]]]Signature[{x}](ab@@#[[1]]),Block[{xLikeLines=Select[consec,Length[Intersection[#,{x}]]==2&],boundaries},If[Length[xLikeLines]==0,Signature[{x}]ab@@(Sort[{x}]),(boundaries=Complement[{x},xLikeLines[[1]]];If[(Length[Range[boundaries[[2]],If[xLikeLines[[1,1]]<boundaries[[2]],nGuess,0]+xLikeLines[[1,1]]]]+Length[Range[xLikeLines[[1,2]],If[boundaries[[1]]<xLikeLines[[1,2]],nGuess,0]+boundaries[[1]]]])>Length[Range[boundaries[[1]],If[xLikeLines[[1,1]]<boundaries[[1]],nGuess,0]+xLikeLines[[1,1]]]]+Length[Range[xLikeLines[[1,2]],If[boundaries[[2]]<xLikeLines[[1,2]],nGuess,0]+boundaries[[2]]]],boundaries=Reverse[boundaries];];- Signature[Join[boundaries,xLikeLines[[1]]]]Signature[{x}]ab@@RotateLeft[Join[boundaries,xLikeLines[[1]]]])]]]&@Select[xLike,Length[Intersection[#,{x}]]==4&]]})]];

twistorSchouten=#//. {ab[a___,x_,b___,y_,c___] ab[d___,x_,e___,y_,f___]:>Signature[Flatten[List[x,y,Sort[{a,b,c}]]]]*Signature[List[a,x,b,y,c]]*Signature[Flatten[List[x,y,Sort[{d,e,f}]]]]*Signature[List[d,x,e,y,f]]*ab@@Flatten[{x,y,Sort[{a,b,c}]}] ab@@Flatten[{x,y,Sort[{d,e,f}]}],ab[a___,x_,b___,y_,c___] ab[d___,y_,e___,x_,f___]:>Signature[Flatten[List[x,y,Sort[{a,b,c}]]]]*Signature[List[a,x,b,y,c]]*Signature[Flatten[List[x,y,Sort[{d,e,f}]]]]*Signature[List[d,y,e,x,f]]* ab@@Flatten[{x,y,Sort[{a,b,c}]}] ab@@Flatten[{x,y,Sort[{d,e,f}]}]}//. {ab[x_,y_,a_,b_] ab[x_,y_,c_,d_]-ab[x_,y_,a_,d_] ab[x_,y_,c_,b_]:>ab[x,y,a,c] ab[x,y,b,d],ab[x_,y_,a_,b_] ab[x_,y_,c_,d_]-ab[x_,y_,a_,c_] ab[x_,y_,b_,d_]:>ab[x,y,a,d] ab[x,y,c,b],ab[x_,y_,a_,b_] ab[x_,y_,c_,d_]+ab[x_,y_,a_,d_] ab[x_,y_,b_,c_]:>ab[x,y,a,c] ab[x,y,b,d],ab[x_,y_,a_,b_] ab[x_,y_,c_,d_]+ab[x_,y_,a_,c_] ab[x_,y_,d_,b_]:>ab[x,y,a,d] ab[x,y,c,b]}&;

twistorSimplify[exprn_,orderQ_:0]:=If[Count[exprn,ab[x_,y_],\[Infinity]]>0,Simplify[order[exprn]/.Rule@@@(({#,twistorSchouten[#]}&/@Cases[exprn,ab[x__]ab[y__]-ab[z__]ab[w__]|ab[x__]ab[y__]+ab[z__]ab[w__],{0,\[Infinity]}]))],order[FullSimplify[If[orderQ==1,order[FullSimplify[order[exprn,0],TransformationFunctions->{Automatic,twistorSchouten}],1],exprn],TransformationFunctions->{Automatic,twistorSchouten}],1]];

toSpinorHelicity[ephN_:0][exprn_]:=Block[{nGuess=If[ephN===0,Max[Join[{0},Flatten[List@@@Cases[exprn,_ab,{0,\[Infinity]}]]]],ephN],consec,xLike},consec=Partition[Range[nGuess],2,1,1];xLike=If[Length[Range[#2,#3]]>=Length[Range[#4,#1+If[#1<#4,nGuess,0]]],{#3,#4,#1,#2},{##}]&@@@Select[Flatten/@Subsets[consec,{2}],Length[Intersection[#,#]]==4&];(exprn/.{ab[x__]:>If[Length[{x}]==2,(If[Length[#]==1,Signature[#[[1]]]*Signature[{x}](ab@@#[[1]]),Signature[{x}](ab@@(Sort[{x}]))]&@(Select[consec,Length[Intersection[{x},#]]==2&,1])),If[Length[#]==1,Signature[#[[1]]]Signature[{x}](ab@@(#[[1,1;;2]]))(ab@@(#[[1,3;;4]]))(s@@Mod[Range[#[[1,2]],If[#[[1,3]]<#[[1,2]],nGuess,0]+#[[1,3]]],nGuess,1]),Block[{xLikeLines=Select[consec,Length[Intersection[#,{x}]]==2&],boundaries},If[Length[xLikeLines]==0,Signature[{x}]ab@@(Sort[{x}]),(boundaries=Complement[{x},xLikeLines[[1]]];If[(Length[Range[boundaries[[2]],If[xLikeLines[[1,1]]<boundaries[[2]],nGuess,0]+xLikeLines[[1,1]]]]+Length[Range[xLikeLines[[1,2]],If[boundaries[[1]]<xLikeLines[[1,2]],nGuess,0]+boundaries[[1]]]])>Length[Range[boundaries[[1]],If[xLikeLines[[1,1]]<boundaries[[1]],nGuess,0]+xLikeLines[[1,1]]]]+Length[Range[xLikeLines[[1,2]],If[boundaries[[2]]<xLikeLines[[1,2]],nGuess,0]+boundaries[[2]]]],boundaries=Reverse[boundaries];]; Signature[Join[boundaries,xLikeLines[[1]]]]Signature[{x}](ab@@xLikeLines[[1]])(ab[boundaries[[2]],X[Mod[boundaries[[2]]-1,nGuess,1],xLikeLines[[1,1]]],X[xLikeLines[[1,1]],Mod[boundaries[[1]]-1,nGuess,1]],boundaries[[1]]]))]]]&@Select[xLike,Length[Intersection[#,{x}]]==4&]]})];

cleanDelta[mat_]:=Block[{ephN=Length[mat[[1]]],ephK=Length[mat],ephZs,nMat,replaceRules},ephZs=RandomInteger[{-200,200},{ephN,4}];nMat=mat/.{ab[x__]:>Det[ephZs[[{x}]]]};replaceRules=Select[Rule@@@Transpose[{mat,Total[MapIndexed[Function[{y,z},If[Length[y]-Count[y,0]==5,Normal[SparseArray[Rule@@@Transpose[List[{z[[1]],#}&/@y,ab@@@Partition[RotateLeft[y],4,1,1]]],{ephK,ephN}]],Normal[SparseArray[Rule@@@Transpose[List[{z[[1]],#}&/@y,ab@@@Partition[Range[Length[y]],4,1,1]]],{ephK,ephN}]]]],(Flatten[Position[#,q_/;q!=0]]&/@nMat)]]}],((#[[1]])/.{ab[x__]:>Det[ephZs[[{x}]]]})==((#[[2]]/.{ab[x__]:>Det[ephZs[[{x}]]]}))&];mat/.replaceRules];

SetAttributes[withTiming,HoldFirst];withTiming[exprn_]:=Block[{t0=AbsoluteTime[],exprnHead=Unevaluated[exprn][[0]],ampName,ampArgs,exprnArgs=List@@Unevaluated[exprn],output,ephN,ephK,messageStart},ephN=If[Length[exprnArgs]==2,exprnArgs[[1]],Length[exprnArgs]];{ephK,ampArgs}=If[Length[exprnArgs]==2,{exprnArgs[[-1]]-2,-1},((If[Count[exprnArgs,m/2|p/2,\[Infinity]]>2,({-1,-1}),Block[{kCharge,gaugeList,signature,wList=exprnArgs/.{m/2->fm,p/2->fp,m->{1,2,3,4},p->{}}},If[Count[exprnArgs,m/2|p/2,\[Infinity]]>0,wList=(wList/.{(fm)->{1,2,3},(fp)->{4}});];If[Mod[Length[Cases[Flatten[wList],_Integer]],4]!=0,({-1,-1}),(kCharge=Length[Cases[Flatten[wList],_Integer]]/4;If[kCharge<2||kCharge>(Length[exprnArgs]-2),({-1,-1}),({kCharge-2,wList})])]]]))];ampName=If[ampArgs===-1,"",Function[{argList},Row[Prepend[Append[Riffle[argList/.{{}->Subscript[Style["g",FontFamily->Times,FontSize->16],Style["+",FontFamily->Times,FontSize->16]],{x_Integer}:>Subsuperscript[Style["\[Psi]",FontFamily->Times,FontSize->14],Style["+1/2",FontFamily->Times,FontSize->12],Row[Style[#,FontFamily->Times,FontSize->10]&/@List["(",x,")"]]],{x_Integer,y_}:>Subsuperscript[Style["s",FontFamily->Times,FontSize->16],Style["0",FontFamily->Times,FontSize->12],Row[Style[#,FontFamily->Times,FontSize->10]&/@List["(",x,y,")"]]],{x_Integer,y_,z_}:>Subsuperscript[Style["\[Psi]",FontFamily->Times,FontSize->14],Style["-1/2",FontFamily->Times,FontSize->12],Row[Style[#,FontFamily->Times,FontSize->10]&/@List["(",x,y,z,")"]]],{x_Integer,y_,z_,w_}:>Subscript[Style["g",FontFamily->Times,FontSize->16],Style["-",FontFamily->Times,FontSize->16]]},","],Style[")",FontSize->20,FontFamily->Times]],Row[List[Subsuperscript[Style["A",FontFamily->Times,FontSize->16,Italic],Style[ToString[Length[argList]],FontFamily->Times,FontSize->12],Style["("<>ToString[Count[Flatten[argList],4]]<>")",FontFamily->Times,FontSize->12]],Style["(",FontFamily->Times,FontSize->20]]]]]]@ampArgs];output=Evaluate[exprn];messageStart=Which[exprnHead===nAmp||exprnHead===nAmpTerms,Row[List["    Evaluation of the ",ToString[ephN],"-point ",If[ephK>0,Superscript["N",If[ephK>1,ephK,""]],""],"MHV amplitude required "]],exprnHead===Amp||exprnHead===generalTreeContour||exprnHead===treeContour||exprnHead===AmpTerms,Row[List["    Determination of the "<>ToString[ephN]<>"-point ",If[ephK>0,Superscript["N",If[ephK>1,ephK,""]],""],"MHV amplitude required "]],True,Row[List["    Evaluation of the function ",Style[ToString[exprnHead],FontFamily->Times,Italic]," required "]]];Print[messageStart,niceTime[AbsoluteTime[]-t0]," to complete.  ",If[ampArgs===-1,"","\n"],If[ampArgs===-1,"",Row[List["      ",ampName,": "]]]];output];
niceTime[timeInSec_]:=If[timeInSec<10^-18||Not[NumberQ[timeInSec]]||Precision[timeInSec]==0," ",Block[{timeUnitNames={" years"," days"," hours"," minutes"," seconds"," ms"," \[Mu]s"," ns"," ps"," fs"," as"},timeScales={31536000,86400,3600,60,1,10^-3,10^-6,10^-9,10^-12,10^-15,10^-18},humanTime},humanTime=Select[Transpose[{RealDigits[Ceiling[#,10^-18]]&/@(timeInSec/timeScales),timeUnitNames}],#[[1,-1]]>0&][[1]];If[Length[humanTime]==0,"",ToString[N[FromDigits[humanTime[[1]]],3]]<>humanTime[[2]]]]];


(*Documentation: *)
bcfwPartitions::usage="bcfPartitions[n_,m_] gives the partitions of (n+2) and (m+1) occuring in the tree-level BCFW recursion formula for the n-particle \!\(\*SuperscriptBox[\"N\", 
RowBox[{\"m\", \"-\", \"2\"}]]\)MHV tree-amplitude A(n,m)=\[CapitalSigma](A(\!\(\*SubscriptBox[\"n\", \"L\"]\),\!\(\*SubscriptBox[\"m\", \"L\"]\)) A(\!\(\*SubscriptBox[\"n\", \"R\"]\),\!\(\*SubscriptBox[\"m\", \"R\"]\)))."

treeContour::usage="A special case of the general tree amplitude contour: 
     treeContour[n_,m_]=generalTreeContour[0,0,0][n,m]."

order::usage="will canonically order the arguments of all angle-brackets. By default, `order' tries to do this with cyclic-ordering and dual-coordinates in mind, but if the optional second argument is chosen to be zero, it order all arguments lexicographically."

twistorSimplify::usage="a general mess-of-a function, which combines the function `order' and FullSimplify (endowed with `twistorSchouten') to simplify expressions."

withTiming::useage="an all-purpose timing-wrapper; withTiming will print-to-screen the time required to evaluate any expression using human-readable units of time. And further, if the Head of the function being wrapped by withTiming is one of `nAmp,' `Amp' etc, withTiming will print formatted output identifying the amplitude being computed."

niceTime::useage="converts a time (measured numerically in seconds) into a human-readable form."


End[]
EndPackage[]

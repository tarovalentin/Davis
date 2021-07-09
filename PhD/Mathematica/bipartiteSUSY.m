(* ::Package:: *)

(************************************************************************)
(* bipartiteSUSY package. Created by Daniele Galloni at the INFN        *)
(* Sezione di Torino. Documentation found on the arXiv preprint server. *)
(************************************************************************)


BeginPackage["bipartiteSUSY`"]

dimensionPolytope::usage="Takes a matrix as input, and outputs the dimension of a polytope with vertices given the columns of that matrix."
joinupKasteleyn::usage="Forms a single matrix from the four components of the Kasteleyn matrix."
getNumberFaces::usage="Gives the total number of faces in the graph. Assumes that edges are of the form X[i,j], where i and j are face labels and should be positive integers."
getNumberExternalFaces::usage="Gives the number of external faces in the graph. Assumes that edges are of the form X[i,j], where i and j are face labels and should be positive integers."
getNumberInternalFaces::usage="Gives the number of internal faces in the graph. Assumes that edges are of the form X[i,j], where i and j are face labels and should be positive integers."
getFaceLabels::usage="Gives the list of labels used for the faces of the graph. Assumes that edges are of the form X[i,j], where i and j are face labels and should be positive integers."
getExternalFaceLabels::usage="Gives the list of labels used for the external faces of the graph. Assumes that edges are of the form X[i,j], where i and j are face labels and should be positive integers."
getInternalFaceLabels::usage="Gives the list of labels used for the internal faces of the graph. Assumes that edges are of the form X[i,j], where i and j are face labels and should be positive integers."
turnIntoWeightedAdjacencyMatrix::usage="Gives the weighted adjacency matrix of the graph, which can be used for WeightedAdjacencyGraph."
turnIntoAdjacencyMatrix::usage="Gives the adjacency matrix of the graph, which can be used for AdjacencyGraph."
turnIntoOrientedAdjacencyMatrix::usage="Gives the adjacency matrix of the graph, directed according to a specified perfect orientation. The user specifies whether the output should be in terms of edge weights or not."
planarityQ::usage="Determines whether a given graph can be embedded with external nodes on the disk, without any edges crossing."
turnIntoGraph::usage="Gives the graph corresponding to the Kasteleyn."
getDuplicateEdges::usage="Returns a list of edges appearing in an incorrect way in the Kasteleyn."
getEdgesBFTformQ::usage="Determines whether edges are of the correct form _[_Integer,_Integer]."
getKasteleynConsistencyViolation::usage="Assuming that getEdgesBFTformQ returns True, this function will return the list of rows and columns whose index structure violates the rules for BFTs (clockwise around white nodes and counter-clockwise around black nodes)."
getKasteleynCheckQ::usage="Determines whether the Kasteleyn was inputted correctly."
perfectMatchings::usage="Returns the sorted list of perfect matchings."
matchingPolytope::usage="Returns the vertices of the matching polytope, or equivalently the P-matrix. Rows are ordered lexicographically w.r.t. edge labeling, columns are ordered according to the order given by the perfectMatchings function."
turnIntoPolytope::usage="Returns only distinct vertices of the polytope, with their multiplicity."
matroidPolytope::usage="Returns the coordinates of the matroid polytope (some of which may appear more than once). Each column is the coordinate of a perfect matching."
moduliSpaceBFT::usage="Gives the moduli space of the BFT given by the Kasteleyn. The user must specify whether to use gauging 1 or gauging 2."
lowNumberLoopsPMpos::usage="Returns the number of the perfect matching with lowest multiplicity, and hence the lowest number of loops in the corresponding perfect orientation. This number refers to the position in the list given by perfectMatchings."
getOrderingExternalEdgesDefault::usage="Gives the default ordering of external edges when constructing the path matrix. The ordering is given in the form {X[i,j]\[Rule]1,X[k,l]\[Rule]2,...}."
getOrderingExternalNodesDefault::usage="Gives the default ordering of external nodes when constructing the path matrix. Also contains external nodes with no external edge attached to it."
getK::usage="Gives the number k in a \!\(\*SuperscriptBox[\(N\), \(k - 2\)]\)MHV on-shell diagram."
getN::usage="Gives the number n of external particles of an on-shell diagram."
getSourceEdges::usage="Returns a list of edges which are sources in the perfect orientation corresponding to a given reference perfect matching."
getSinkEdges::usage="Returns a list of edges which are sinks in the perfect orientation corresponding to a given reference perfect matching."
getSourceNodes::usage="Returns a list of nodes which are sources in the perfect orientation corresponding to a given reference perfect matching."
getSinkNodes::usage="Returns a list of nodes which are sinks in the perfect orientation corresponding to a given reference perfect matching."
getExternalEdgeNodeNumbers::usage="Takes a list of external edges and gives the Kasteleyn node numbers of the edges."
connectivityMatrix::usage="Returns the connectivity matrix of the diagram, i.e. a matrix containing all paths between all nodes."
traditionalConnectivityMatrix::usage="Returns the connectivity matrix of the diagram, computed using the method described in arXiv:1310.3820, which involves the inverse of a particular adjacency matrix."
traditionalPathMatrix::usage="Gives the path matrix, i.e. the element of the Grassmannian without any additional signs placed by hand (e.g. without signs that ensure manifest positivity of planar diagrams), by using the traditionalConnectivityMatrix method, which involves the inverse of a matrix."
pathMatrix::usage="Gives the path matrix, i.e. the element of the Grassmannian without any additional signs placed by hand (e.g. without signs that ensure manifest positivity of planar diagrams)."
loopDenominator::usage="Returns the sum of loops contributing to terms in the denominator of terms in the path matrix. Is of the form (1-loops). The user may specify to have it in the form which includes an additional sign to each loop, as required for manifest positivity of planar diagrams."
minorsAsPerfectMatchings::usage="Returns the gauge-free version of minors of the path matrix, without manifest-positivity signs."
dimensionGrassmannian::usage="Returns the dimension of the Grassmannian, computed by the rank of the tangent space of its minors."
reducibilityBFTQ::usage="Gives the reducibility of a BFT based on its moduli space. When gauging 2 is used, this is the same as reducibility for planar scattering diagrams."
reducibilityBFTedges::usage="Gives those edges which may be removed without affecting the moduli space of a BFT."
reducibilityQ::usage="Determines whether the planar or non-planar on-shell diagram is reducible or not."
reducibilityEdges::usage="Returns a list of edges which may be removed without affecting the Grassmannian."
consistentEdgeRemoval::usage="Returns the full list of edges which should be consistently removed, given a choice of edge to be removed. A consistent edge removal removes all edges which do not participate in any perfect matchings."
survivingPerfectMatchings::usage="Gives a list of which perfect-matching numbers survive after removing a given set of edges. The numbers refer to the positions of the perfect matchings in the list given by perfectMatchings."
reductionGraphBFT::usage="Returns a list where each element is a set of edges which may be removed from the graph without affecting the moduli space, under a certain gauging"
reductionGraph::usage="Returns a list where each element is a set of edges which may be removed from the graph without affecting the Grassmannian."
nonPluckerPolesQ::usage="Determines whether a reduced diagram has non-standard poles which are not simple Plucker coordinates."
removableEdges::usage="Returns the list of removable edges. To be useful, this function should be used on reduced graphs."
cyclicEdgeOrderings::usage="Returns a list of edges where the edges have been ordered according to the cyclic order, i.e. where the edges are sequenced such that each subsequent edge's first index is equal to the previous edge's second index, e.g. {X[1,2],X[2,5],X[5,6],X[6,1]}."
zigZagNumeratorsDenominators::usage="Returns a list where each element corresponds to a zig-zag path. The information is given as a list of two elements, where the first element contains all variables in the numerator of the expression, and the second element contains the variables in the denominator. Assumes standard rules: turn left at white nodes and right at black nodes, and edges from white to black are in the numerator, and vice-versa."
zigZags::usage="Returns a list of zig-zag paths. Edges in the numerator are directed from white to black nodes, edges in the denominator are directed from black to white nodes. The standard rule is to turn left at white nodes and right at black nodes; it's possible to choose the opposite option by setting the (optional) final argument to True."
selfIntersectingZigZagsQ::usage="Determines whether the graph has self-intersecting zig-zag paths."
badDoubleCrossingZigZagPairs::usage="Returns a list of pairs of zig-zags that have 'bad double crossings'. Every element contains a pair of lists of edges representing two zig-zags that have a bad double crossing."
badDoubleCrossingZigZagQ::usage="Determines whether the graph has 'bad double crossings'."
zigZagsAsPerfectMatchings::usage="Returns a list where each element consists of pairs of perfect matchings. The first perfect matching divided by the second one equals a given zig-zag. Since there may be multiple alternatives to reach the same zig-zag, each element in the returned list may contain multiple pairs."
matroidQ::usage="Determines whether the given list of elements is a matroid or not."
matroidViolationCheck::usage="Returns a list of pairs of matroid elements that do not satisfy the exchange axiom."
pluckerRelations::usage="Returns a list of (generally not independent) Plucker relations. Each Plucker coordinate has the form HoldForm[minor][i,j,...], where the HoldForm does not appear on screen. It is necessary to act with ReleaseHold on the output of pluckerRelations to allow minor[i,j,...] to take on predefined values."
independentPluckerRelations::usage="Returns a list with two elements: the first contains a list of all independent Plucker relations, and the second contains the solution to these equations. Each Plucker coordinate has the form HoldForm[minor][i,j,...], where the HoldForm does not appear on screen. It is necessary to act with ReleaseHold on the output of pluckerRelations to allow minor[i,j,...] to take on predefined values."
grassmannianMatrix::usage="Gives the corresponding element of the Grassmannian with all signs placed correctly to ensure manifest positivity of minors in planar diagrams, including signs associated to the rotation number of paths in the diagram. It only works when the graph can be embedded on genus zero (though it may have any number of boundaries)."
pluckerCoordinates::usage="Returns the Plucker coordinates of the on-shell diagram, using pathMatrix or grassmannianMatrix depending on the preferences of the user."
loopVariablesBasis::usage="Returns a list of paths that form a basis with which it is possible to express any path in the graph. The output is of the form of two lists: the first one contains the internal faces, and if the optional input 'standardfacevariables' is False it also contains non-trivial cycles around surfaces with non-zero genus as well as products of external faces which circle around a boundary. The first list will generically be a linear combination of these paths. The second entry contains the remaining independent external faces, paths going between different boundaries, and if 'standardfacevariables' is True it also contains non-trivial cycles for non-zero genus."
moduliLoopVariablesBFT::usage="Returns a list of three items: the first is the master space of the given BFT, the second is the moduli space, and the third is the loop variable basis used to make these spaces."
getOrderingExternalEdgesGrassmannian::usage="Returns the ordering of external edges chosen by default by grassmannianMatrix."
getOrderingExternalNodesGrassmannian::usage="Returns the ordering of external nodes chosen by default by grassmannianMatrix."
stratificationBoundaries::usage="Returns a list of boundaries in the stratification on an on-shell diagram. The elements are ordered by dimensionality, with the first element containing the top-dimensional boundaries and the last containing the zero-dimensional boundaries. The boundaries in each element are expressed as lists, each list containing move-equivalent configurations. The configurations are expressed as a list of edges which are present in the graph."
stratificationNumbers::usage="Returns the number of boundaries of each dimensionality, beginning with the highest dimension and ending in the number of zero-dimensional boundaries."
stratificationEulerNumber::usage="Gives the Euler number of the stratification of the graph."
matchingPolytopeBoundaries::usage="Returns a list of boundaries of the matching polytope. The elements are ordered by dimensionality, with the first element containing the top-dimensional boundaries and the last containing the zero-dimensional boundaries. Each boundary is expressed as a list of edges which are present in the graph."
stratificationGraph::usage="Returns the graph containing the full stratification of the graph in question, with all the connectivity between the boundaries of various dimensionality. The best way to view it is by using the option GraphLayout\[Rule]\"LayeredDigraphEmbedding\" (the user must do this as a second step, with the graph that this function returns)."
matchingPolytopeBoundariesGraph::usage="Returns the graph containing the full face lattice of the graph in question, with all the connectivity between the boundaries of various dimensionality. The best way to view it is by using the option GraphLayout\[Rule]\"LayeredDigraphEmbedding\" (the user must do this as a second step, with the graph that this function returns)."
squareMove::usage="Gives the four components of the Kasteleyn matrix (the top-left, top-right, bottom-left, and bottom-right) after a square move performed on a user-specified choice of nodes. In the case of BFTs the user may choose to instead specify the face name to perform the square move on."
bubblesQ::usage="Determines whether there are bubbles in the diagram. The user may specify whether the diagram is a BFT under gauging 1 or not."
removeBubbles::usage="Takes the Kasteleyn of a diagram and returns the four components of the Kasteleyn (the top-left, top-right, bottom-left, and bottom-right), where all bubbles have been removed. The user may specify whether the diagram is a BFT under gauging 1 or not."
collapseBivalentNodes::usage="Takes the Kasteleyn of a diagram and returns the four components of the Kasteleyn (the top-left, top-right, bottom-left, and bottom-right), where all bivalent nodes have been collapsed."
simplifyGraph::usage="Removes bubbles and collapses bivalent nodes, until this is no longer possible. Returns the four components of the Kasteleyn (the top-left, top-right, bottom-left, and bottom-right) of the resulting object."
higgsEdgesBFT::usage="Consistently higgses a user-specified set of edges from a BFT, while making sure to maintain a correct index structure for all the edges."
drawGraph::usage="Initiates an interactive tool that allows the user to draw a bipartite graph, perform a variety of graphical operations and computations, and output the Kasteleyn components. It is possible to input into the function an already-existing Kasteleyn, which will then become editable."
functionMemory::usage="Determines whether certain frequently-used functions in the package store to memory their inputs and outputs, for faster execution."

Begin["Private`"]


functionMemory=True;


(*Basic functions that manipulate and extract information from the Kasteleyn*)


joinupKasteleyn[topleft_,topright_,bottomleft_,bottomright_]:=Block[{fullkast,leftpart},
leftpart=Join[topleft,bottomleft];
If[leftpart!={},
fullkast=Join[leftpart,Join[topright,bottomright],2];
,fullkast={};
];
If[functionMemory,joinupKasteleyn[topleft,topright,bottomleft,bottomright]=fullkast;];
fullkast
];

getNumberFaces[topleft_,topright_,bottomleft_,bottomright_]:=Block[{varlist,facelist,nf},
varlist=Variables[Join[topleft,topright,bottomleft,bottomright]];
(*If all variables are in the required format X[i,j], go ahead and count faces*)
If[Cases[varlist,_[_Integer,_Integer]]==varlist,
If[varlist=={},
nf=1;
,facelist=Union[Flatten[List@@@varlist]];
nf=Length[facelist];
];
,Print["Error! The edges must all have the form X[i,j] (where X may be any letter/letters)."];
nf=Null;
];
nf
];

getNumberExternalFaces[topleft_,topright_,bottomleft_,bottomright_]:=Block[{varlist,facelist,externalnf},
varlist=Variables[Join[topright,bottomleft]];
(*If all variables are in the required format X[i,j], go ahead and count faces*)
If[Cases[varlist,_[_Integer,_Integer]]==varlist,
facelist=Union[Flatten[List@@@varlist]];
externalnf=Length[facelist];
,Print["Error! The edges must all have the form X[i,j] (where X may be any letter/letters)."];
externalnf=Null;
];
(*If there are external nodes with no edges attached to them, assume they are all in the same face, and declare this face to be external*)
If[externalnf===0&&(Length[bottomleft]+Dimensions[Join[topright,bottomright]][[2]])>0,
externalnf=1;
];
externalnf
];

getNumberInternalFaces[topleft_,topright_,bottomleft_,bottomright_]:=getNumberFaces[topleft,topright,bottomleft,bottomright]-getNumberExternalFaces[topleft,topright,bottomleft,bottomright];

getFaceLabels[topleft_,topright_,bottomleft_,bottomright_]:=Block[{varlist,facelist,nf},
varlist=Variables[Join[topleft,topright,bottomleft,bottomright]];
(*If all variables are in the required format X[i,j], go ahead and count faces*)
If[Cases[varlist,_[_Integer,_Integer]]==varlist,
facelist=Union[Flatten[List@@@varlist]];
,Print["Error! The edges must all have the form X[i,j] (where X may be any letter/letters)."];
facelist=Null;
];
facelist
];

getExternalFaceLabels[topleft_,topright_,bottomleft_,bottomright_]:=Block[{varlist,facelist,externalnf},
varlist=Variables[Join[topright,bottomleft]];
(*If all variables are in the required format X[i,j], go ahead and count faces*)
If[Cases[varlist,_[_Integer,_Integer]]==varlist,
facelist=Union[Flatten[List@@@varlist]];
,Print["Error! The edges must all have the form X[i,j] (where X may be any letter/letters)."];
facelist=Null;
];
(*If there are external nodes with no edges attached to them, assume they are all in the same face, and declare this face to be external*)
If[facelist==={}&&(Length[bottomleft]+Dimensions[Join[topright,bottomright]][[2]])>0,
facelist={Last[Union[Flatten[List@@@Variables[joinupKasteleyn[topleft,topright,bottomleft,bottomright]]]]]};
];
facelist
];

getInternalFaceLabels[topleft_,topright_,bottomleft_,bottomright_]:=Complement[getFaceLabels[topleft,topright,bottomleft,bottomright],getExternalFaceLabels[topleft,topright,bottomleft,bottomright]];


(*Functions useful for graph drawing and manipulation*)


turnIntoWeightedAdjacencyMatrix[topleft_,topright_,bottomleft_,bottomright_]:=Block[{kasteleyn,adjacencymatrix},
kasteleyn=joinupKasteleyn[topleft,topright,bottomleft,bottomright];
(*We will now turn the Kasteleyn into a weighted adjacency matrix*)
adjacencymatrix=Join[Join[ConstantArray[0,{Length[kasteleyn],Length[kasteleyn]}],Transpose[kasteleyn]],Join[kasteleyn,ConstantArray[0,{Dimensions[kasteleyn][[2]],Dimensions[kasteleyn][[2]]}]],2]/.{0->\[Infinity]};
adjacencymatrix
];

turnIntoAdjacencyMatrix[topleft_,topright_,bottomleft_,bottomright_]:=Block[{kasteleyn,oneskasteleyn,adjacencymatrix},
kasteleyn=joinupKasteleyn[topleft,topright,bottomleft,bottomright];
(*We will now turn the Kasteleyn into an adjacency matrix*)
oneskasteleyn=kasteleyn/.Map[#->1&,Variables[kasteleyn]];
adjacencymatrix=Join[Join[ConstantArray[0,{Length[oneskasteleyn],Length[oneskasteleyn]}],Transpose[oneskasteleyn]],Join[oneskasteleyn,ConstantArray[0,{Dimensions[oneskasteleyn][[2]],Dimensions[oneskasteleyn][[2]]}]],2];
adjacencymatrix
];

turnIntoOrientedAdjacencyMatrix[topleft_,topright_,bottomleft_,bottomright_,referencematching_:Null,withedgeweights_:False]:=Block[{perfmatchings,referenceperfmatch,kasteleyn,turnoffreferencevars,turnoffothervars,adjacencymat},
If[referencematching===Null,
perfmatchings=perfectMatchings[topleft,topright,bottomleft,bottomright];
If[perfmatchings=!={},
referenceperfmatch=perfmatchings[[lowNumberLoopsPMpos[topleft,topright,bottomleft,bottomright]]];
,referenceperfmatch=0;
];
,referenceperfmatch=referencematching;
];
If[referenceperfmatch=!=0,
(*We'll make a graph oriented according to the perfect orientation associated to the perfect matching referencematching. Let's start with making all edges point from white to black.*)
kasteleyn=joinupKasteleyn[topleft,topright,bottomleft,bottomright];
turnoffreferencevars=Map[#->0&,Variables[referenceperfmatch]];
turnoffothervars=Map[#->0&,Complement[Variables[kasteleyn],Variables[referenceperfmatch]]];
(*Now we'll make the adjacency matrix, but which still contains the names of the edges. Those edges that are in the perfect matching should be oppositely oriented*)
adjacencymat=Join[Join[Table[0,{iii,Length[kasteleyn]},{jjj,Length[kasteleyn]}],Transpose[kasteleyn]/.turnoffothervars],Join[kasteleyn/.turnoffreferencevars,Table[0,{iii,Dimensions[kasteleyn][[2]]},{jjj,Dimensions[kasteleyn][[2]]}]],2];
If[withedgeweights==False,
adjacencymat=adjacencymat/.Map[#->1&,Variables[kasteleyn]];
];
,Print["This graph has no perfect matchings."];
adjacencymat=Null;
];
adjacencymat
];

turnIntoGraph[topleft_,topright_,bottomleft_,bottomright_,showedges_:True]:=Module[{badedges,adjacencymat,kasteleyn,colors,graph,edgelist,vars,edgelabels,tempedgelabels,finalgraph,edgeweightname},
(*This needs to be a Module rather than Block, because otherwise my graph drawing at the end doesn't have access to the variable tempedgelabels!*)
badedges=getDuplicateEdges[topleft,topright,bottomleft,bottomright];
If[badedges==={},
adjacencymat=turnIntoAdjacencyMatrix[topleft,topright,bottomleft,bottomright];
kasteleyn=joinupKasteleyn[topleft,topright,bottomleft,bottomright];
(*We'll now make the bipartite coloring for the nodes of the graph*)
colors=MapThread[Rule,{Range[Total[Dimensions[kasteleyn]]],Join[ConstantArray[White,Length[kasteleyn]],ConstantArray[Black,Dimensions[kasteleyn][[2]]]]}];
(*We'll now get the edge list (by making a temporary graph), and use this edge list to print names on all the edges of the graph. The difficulty is largely due to giving different names to multiple edges going between two nodes (i.e. bubbles).*)
If[showedges==True,
graph=AdjacencyGraph[adjacencymat];
edgelist=EdgeList[graph];
vars=Variables[kasteleyn];
edgelabels=Map[Sort[(UndirectedEdge@@(Flatten[Position[kasteleyn,#]][[{1,2}]]+{0,Length[kasteleyn]}))]->#&,vars];
(*Now that we associated edges to their names, we'll make a temporary list from which we'll remove elements as they get printed onto the graph*)
tempedgelabels=edgelabels;
finalgraph=Graph[graph,EdgeShapeFunction->Function[{edgepositions,edgename},
edgeweightname=tempedgelabels[[Position[tempedgelabels,Sort[edgename]][[1,1]],2]];
tempedgelabels=Delete[tempedgelabels,Position[tempedgelabels,Sort[edgename]][[1,1]]];
{Text[Style[edgeweightname,Medium,Bold,Blue],Mean[edgepositions]],{Black,Line[edgepositions]}}],VertexLabels->"Name",VertexLabelStyle->15,VertexSize->Medium,VertexStyle->colors,ImagePadding->20];
,finalgraph=AdjacencyGraph[adjacencymat,VertexLabels->"Name",VertexLabelStyle->15,VertexSize->Medium,VertexStyle->colors,ImagePadding->20];
];
finalgraph
,Print["The Kasteleyn has multiple fields with the same name - can't draw the graph."];
finalgraph=Null;
];
finalgraph
];


(*Functions for the drawGraph interactive drawing box*)


(*This function checks whether the graph is bipartite and has correct monovalent external nodes*)
graphBipartiteAndGoodExtNodesQ[inputpointcoordinatesandcolors_,inputedges_]:=Block[{bipartite,extnodetoextnode,monovalentextnodes,allOK},
(*First we check whether the graph is bipartite*)
(*Each edge selects which inputpointcoordinatesandcolors are joined up. If we strip away their coordinates and "I" or "E" labels, we get a list containing {"W","B"} or {"B","W"}. If this list contains {"W","W"} or {"B","B"}, it's not bipartite. Also, no external nodes should be connected to other external nodes.*)
bipartite=(Cases[Map[StringTrim[#,"I"|"E"]&,Map[inputpointcoordinatesandcolors[[#]][[All,2]]&,inputedges],{2}],Except[{"W","B"}|{"B","W"}]]==={});
(*Now we'll check if any external nodes connect to any other external nodes*)
extnodetoextnode=(Cases[Map[StringTrim[#,"B"|"W"]&,Cases[Map[inputpointcoordinatesandcolors[[#]][[All,2]]&,inputedges],{___,"WE",___}|{___,"BE",___}],{2}],{"E","E"}]==={});
monovalentextnodes=DuplicateFreeQ[Cases[Map[Sequence@@inputpointcoordinatesandcolors[[#]]&,inputedges],{_,"WE"|"BE"}]];
allOK=bipartite&&extnodetoextnode&&monovalentextnodes;
allOK
];

(*When we're finished drawing in drawGraph[] we will usually want to output the Kasteleyn components. This function takes the graphical information and makes the four components of the Kasteleyn matrix.*)
makeKasteleynComponents[inputpointcoordinatesandcolors_,inputedges_]:=Block[{graphOK,whiteinternals,whiteexternals,blackinternals,blackexternals,variablestochoosefrom,intwhitetointblackedges,intwhitetoextblackedges,extwhitetointblackedges,topleftmatrixentries,toprightmatrixentries,bottomleftmatrixentries,outputtopleft,outputtopright,outputbottomleft,outputbottomright},
(*We'll first check to make sure the graph is bipartite and well-behaved; if not, there's no point trying to make a Kasteleyn.*)
graphOK=graphBipartiteAndGoodExtNodesQ[inputpointcoordinatesandcolors,inputedges];
If[graphOK,
(*We'll begin by making a list of which numbers correspond to the different types of nodes. These numbers are not the final "node numbers"; they are in chronological order of when they were drawn. The final "node numbers" always start with "WI" and continue with "WE", "BI" and "BE".*)
whiteinternals=Flatten[Position[inputpointcoordinatesandcolors,{_,"WI"}]];
whiteexternals=Flatten[Position[inputpointcoordinatesandcolors,{_,"WE"}]];
blackinternals=Flatten[Position[inputpointcoordinatesandcolors,{_,"BI"}]];
blackexternals=Flatten[Position[inputpointcoordinatesandcolors,{_,"BE"}]];
(*Each edge will be given a name Z[i]. As we populate the Kasteleyn with edges, we'll remove these names from variablestochoosefrom*)
variablestochoosefrom=Table[bipartiteSUSY`Z[iii],{iii,Length[inputedges]}];
(*We'll now construct the top-left part of the matrix. We begin by taking edges {i,j} where "i" is an internal white node and "j" is an internal black node.*)
intwhitetointblackedges=Cases[inputedges,{Alternatives@@whiteinternals,Alternatives@@blackinternals}];
(*Associate each {i,j} in intwhitetointblackedges with an edge from variablestochoosefrom using MapThread. If a given {i,j} appears more than once, we have a bubble and the entry in the Kasteleyn should be the sum of the edges; hence, we use GatherBy[...,First], Transpose to get the edges all together, and finally turn this into {i,j}\[Rule]Z[1]+Z[2]+... etc.*)
topleftmatrixentries=Map[#[[1,1]]->Total[#[[2]]]&,Map[Transpose[#]&,GatherBy[MapThread[{#1,#2}&,{intwhitetointblackedges,variablestochoosefrom[[Range[Length[intwhitetointblackedges]]]]}],First]]];
(*Now we eliminate those edge names we just used up*)
variablestochoosefrom=variablestochoosefrom[[Length[intwhitetointblackedges]+1;;]];
(*We'll again get a list of {i,j}\[Rule]Z[3] etc., but this time with edges where the black node appears first in inputedges. We'll swap their position however, as we want "i" to be white and "j" to be black in {i,j}.*)
intwhitetointblackedges=Map[#[[{2,1}]]&,Cases[inputedges,{Alternatives@@blackinternals,Alternatives@@whiteinternals}]];
topleftmatrixentries=Join[topleftmatrixentries,Map[#[[1,1]]->Total[#[[2]]]&,Map[Transpose[#]&,GatherBy[MapThread[{#1,#2}&,{intwhitetointblackedges,variablestochoosefrom[[Range[Length[intwhitetointblackedges]]]]}],First]]]];
variablestochoosefrom=variablestochoosefrom[[Length[intwhitetointblackedges]+1;;]];
(*Now we have all edges, and we can make the top-left part of the matrix using SparseArray[{{i,j}\[Rule]...,{i,k}\[Rule]...}] etc. Since the numbers i and j refer to the chronological order in which they were put down, we'll make a square matrix the size of all nodes, and then select those rows corresponding to internal white nodes and those columns corresponding to internal black nodes.*)
If[topleftmatrixentries==={},
outputtopleft=ConstantArray[0,{Length[whiteinternals],Length[blackinternals]}];
,outputtopleft=Normal[SparseArray[topleftmatrixentries,{Length[inputpointcoordinatesandcolors],Length[inputpointcoordinatesandcolors]}]][[whiteinternals,blackinternals]];
];
(*The top-left part of the Kasteleyn is complete. Now we do the same but for the top-right part of the Kasteleyn.*)
intwhitetoextblackedges=Cases[inputedges,{Alternatives@@whiteinternals,Alternatives@@blackexternals}];
toprightmatrixentries=Map[#[[1,1]]->Total[#[[2]]]&,Map[Transpose[#]&,GatherBy[MapThread[{#1,#2}&,{intwhitetoextblackedges,variablestochoosefrom[[Range[Length[intwhitetoextblackedges]]]]}],First]]];
variablestochoosefrom=variablestochoosefrom[[Length[intwhitetoextblackedges]+1;;]];
intwhitetoextblackedges=Map[#[[{2,1}]]&,Cases[inputedges,{Alternatives@@blackexternals,Alternatives@@whiteinternals}]];
toprightmatrixentries=Join[toprightmatrixentries,Map[#[[1,1]]->Total[#[[2]]]&,Map[Transpose[#]&,GatherBy[MapThread[{#1,#2}&,{intwhitetoextblackedges,variablestochoosefrom[[Range[Length[intwhitetoextblackedges]]]]}],First]]]];
variablestochoosefrom=variablestochoosefrom[[Length[intwhitetoextblackedges]+1;;]];
If[toprightmatrixentries==={},
outputtopright=ConstantArray[0,{Length[whiteinternals],Length[blackexternals]}];
,outputtopright=Normal[SparseArray[toprightmatrixentries,{Length[inputpointcoordinatesandcolors],Length[inputpointcoordinatesandcolors]}]][[whiteinternals,blackexternals]];
];
(*The top-right part of the Kasteleyn is complete. Now we do the same but for the bottom-left part of the Kasteleyn.*)
extwhitetointblackedges=Cases[inputedges,{Alternatives@@whiteexternals,Alternatives@@blackinternals}];
bottomleftmatrixentries=Map[#[[1,1]]->Total[#[[2]]]&,Map[Transpose[#]&,GatherBy[MapThread[{#1,#2}&,{extwhitetointblackedges,variablestochoosefrom[[Range[Length[extwhitetointblackedges]]]]}],First]]];
variablestochoosefrom=variablestochoosefrom[[Length[extwhitetointblackedges]+1;;]];
extwhitetointblackedges=Map[#[[{2,1}]]&,Cases[inputedges,{Alternatives@@blackinternals,Alternatives@@whiteexternals}]];
bottomleftmatrixentries=Join[bottomleftmatrixentries,Map[#[[1,1]]->Total[#[[2]]]&,Map[Transpose[#]&,GatherBy[MapThread[{#1,#2}&,{extwhitetointblackedges,variablestochoosefrom[[Range[Length[extwhitetointblackedges]]]]}],First]]]];
variablestochoosefrom=variablestochoosefrom[[Length[extwhitetointblackedges]+1;;]];
If[bottomleftmatrixentries==={},
outputbottomleft=ConstantArray[0,{Length[whiteexternals],Length[blackinternals]}];
,outputbottomleft=Normal[SparseArray[bottomleftmatrixentries,{Length[inputpointcoordinatesandcolors],Length[inputpointcoordinatesandcolors]}]][[whiteexternals,blackinternals]];
];
(*The bottom-left part of the Kasteleyn is complete. The bottom-right part is always empty*)
outputbottomright=ConstantArray[0,{Length[whiteexternals],Length[blackexternals]}];
,Print["The graph is not bipartite, or external nodes are not monovalent!"];
{outputtopleft,outputtopright,outputbottomleft,outputbottomright}={Null,Null,Null,Null};
];
{outputtopleft,outputtopright,outputbottomleft,outputbottomright}];

(*This function translates an inputted Kasteleyn matrix into graph data that drawGraph can draw*)
makeGraphDatafromKasteleyn[topleft_,topright_,bottomleft_,bottomright_]:=Block[{graph,userspecifiednodes,nodenumbertotype,userspecifiededges,xaxisvalues,yaxisvalues,xscaling,xshift,yscaling,yshift,outputpointcoordinatesandcolors,outputedges,duplicatedcoordinates,freeslots},
(*Start by drawing the graph automatically.*)
graph=AdjacencyGraph[turnIntoAdjacencyMatrix[topleft,topright,bottomleft,bottomright]];
(*using GraphEmbedding, we make tuples containing {2Dcoordinateofnode,nodenumber}. The node numbering is the same as that chosen by turnIntoAdjacencyMatrix, which in turn begins by counting internal white nodes, and proceeds with ext white, int black, ext black.*)
userspecifiednodes=MapThread[{#1,#2}&,{GraphEmbedding[graph],Range[Length[GraphEmbedding[graph]]]}];
nodenumbertotype=Join[Map[#->"WI"&,Range[Length[topleft]]],Map[#->"WE"&,Range[Length[topleft]+1,Length[topleft]+Length[bottomleft]]],Map[#->"BI"&,Range[Length[topleft]+Length[bottomleft]+1,Total[Dimensions[Join[topleft,bottomleft]]]]],Map[#->"BE"&,Range[Total[Dimensions[Join[topleft,bottomleft]]]+1,Total[Dimensions[Join[topleft,bottomleft]]]+Dimensions[Join[topright,bottomright]][[2]]]]];
userspecifiednodes[[All,2]]=userspecifiednodes[[All,2]]/.nodenumbertotype;
(*Now we almost have the list pointcoordinatesandcolors. The coordinates still need rescaling to fit into our Graphics box.*)
(*These will be the final edgelist*)
userspecifiededges=EdgeList[graph]/.UndirectedEdge->List;
(*Now we'll center the coordinates in the box and rescale them so that they fit*)
xaxisvalues=userspecifiednodes[[All,1,1]];
yaxisvalues=userspecifiednodes[[All,1,2]];
If[Chop[(Max[xaxisvalues]-Min[xaxisvalues])]==0,
(*If we have a vertical line, the x-axis doesn't need rescaling*)
xscaling=1;
,xscaling=2.6/(Max[xaxisvalues]-Min[xaxisvalues]);
];
xshift=(Max[xaxisvalues]+Min[xaxisvalues])/2;
If[Chop[(Max[yaxisvalues]-Min[yaxisvalues])]==0,
yscaling=1;
,yscaling=2.6/(Max[yaxisvalues]-Min[yaxisvalues]);
];
yshift=(Max[yaxisvalues]+Min[yaxisvalues])/2;
(*We'll round off the values to make sure they all fit on a grid in the Graphics box. This might accidentally place some nodes on top of each other.*)
userspecifiednodes[[All,1,1]]=Map[Round[#,0.1]&,(userspecifiednodes[[All,1,1]]-xshift)xscaling];
userspecifiednodes[[All,1,2]]=Map[Round[#,0.1]&,(userspecifiednodes[[All,1,2]]-yshift)yscaling];
(*If all nodes are on different grid points, we are done.*)
If[DuplicateFreeQ[userspecifiednodes[[All,1]]],
outputpointcoordinatesandcolors=userspecifiednodes;
outputedges=userspecifiededges;
,(*if some nodes are on the same coordinate, check if the Graphics box is even large enough (841 grid points) to fit all nodes we want to draw*)
If[Total[Tally[userspecifiednodes[[All,1]]][[All,2]]]<=841,
(*we can fit them all. We'll go through each duplicate coordinate and move it to some randomly chosen free spot on the grid.*)
While[DuplicateFreeQ[userspecifiednodes[[All,1]]]=!=True,
duplicatedcoordinates=Cases[Tally[userspecifiednodes[[All,1]]],Except[{_,1}]][[All,1]];
freeslots=Complement[Sequence@@@Table[{iii,jjj},{iii,-1.4,1.4,0.1},{jjj,-1.4,1.4,0.1}],userspecifiednodes[[All,1]]];
userspecifiednodes[[All,1]]=ReplacePart[userspecifiednodes[[All,1]],MapThread[Rule,{Map[Position[userspecifiednodes[[All,1]],#][[1,1]]&,duplicatedcoordinates],Round[RandomChoice[freeslots,Length[duplicatedcoordinates]],0.1]}]];
];
outputpointcoordinatesandcolors=userspecifiednodes;
outputedges=userspecifiededges;
,Print["The grid is too small to fit all your nodes!"];
outputpointcoordinatesandcolors={};
outputedges={};
];
];
{outputpointcoordinatesandcolors,outputedges}
];

(*This function takes graph data and outputs the list of edges that correspond to removable edges. It will only output a non-empty list if the graph makes sense*)
findRemovableEdges[pointcoordinatesandcolors_,edges_]:=Block[{graphOK,kast,kasteleynremovableedges,positionsinthekasteleyn,turnKasteleynPositionsToEdges,removabledges,themultiedges},
graphOK=graphBipartiteAndGoodExtNodesQ[pointcoordinatesandcolors,edges];
If[graphOK===True,
kast=makeKasteleynComponents[pointcoordinatesandcolors,edges];
If[perfectMatchings@@kast=!={},
(*Note that some of these edges should be turned off together; their removal is not independent. This fact is not highlighted by the program*)
kasteleynremovableedges=DeleteDuplicates[Flatten[removableEdges@@makeKasteleynComponents[pointcoordinatesandcolors,edges]]];
positionsinthekasteleyn=DeleteDuplicates[Map[Position[kast,#][[1,Range[3]]]&,kasteleynremovableedges]];
turnKasteleynPositionsToEdges=Function[{posinkast},
Block[{relevantnodes,relevantedge},
relevantnodes=Map[Flatten[Position[pointcoordinatesandcolors,{_,#}]]&,posinkast[[1]]/.{1->{"WI","BI"},2->{"WI","BE"},3->{"WE","BI"},4->{"WE","BE"}}];
relevantedge=Sort[MapThread[#1[[#2]]&,{relevantnodes,posinkast[[{2,3}]]}]];
relevantedge]
];
removabledges=Map[turnKasteleynPositionsToEdges,positionsinthekasteleyn];
removabledges=Cases[Map[Sort,edges],Alternatives@@removabledges];
If[Length[removabledges]=!=Length[kasteleynremovableedges],
Print["There was a problem in drawing the removable edges - find them by hand by printing out the Kasteleyn and using removableEdges."];
removabledges={};
];
,removabledges={};
];
,removabledges={};
];
removabledges
];

(*This function takes two coordinates (belonging to nodes) and draws bubbles between them, according to the number of edges going between these nodes.*)
makeBsplineCurves[endpoint1_,endpoint2_,multiplicity_]:=Block[{transverseendpoint1,transverseendpoint2,listofbsplinecurves},
transverseendpoint1=Normalize[Cross[endpoint2-endpoint1]]/3+(endpoint1+endpoint2)/2;
transverseendpoint2=-Normalize[Cross[endpoint2-endpoint1]]/3+(endpoint1+endpoint2)/2;
listofbsplinecurves=Map[BSplineCurve[Join[{endpoint1},{transverseendpoint1+(transverseendpoint2-transverseendpoint1)#},{endpoint2}]]&,Range[0,1,1/(multiplicity-1)]];
listofbsplinecurves];

(*This function takes the graph data, along with various user-specified options, and renders the edges in the graph, decorated with various labels etc that depend on the user-chosen options.*)
drawLines[inputpointcoordinatesandcolors_,inputedges_,inputmultiedges_,showarrows_,edgenamesdisplayed_]:=Block[{graphOK,kast,perfectmatchings,referenceperfmatchedges,positionsinthekasteleyn,turnKasteleynPositionsToEdges,swappedeges,normaledges,straightedges,normalstraightdirectedlines,swappedstraightdirectedlines,themultiedges,positionsthatneedswapping,outputgraphics},
graphOK=graphBipartiteAndGoodExtNodesQ[inputpointcoordinatesandcolors,inputedges];
If[showarrows&&graphOK,
(*normaledges have the orientation from white node to black node. swappededges have the opposite orientation, and are the edges in the reference perfect matching. We have to find these edges and translate their Kasteleyn-edge-names into {i,j} names of the graph.*)
kast=makeKasteleynComponents[inputpointcoordinatesandcolors,inputedges];
perfectmatchings=perfectMatchings[Sequence@@kast];
If[perfectmatchings=!={},
referenceperfmatchedges=Variables[perfectmatchings[[lowNumberLoopsPMpos[Sequence@@kast]]]];
positionsinthekasteleyn=Map[Position[kast,#][[1,Range[3]]]&,referenceperfmatchedges];
turnKasteleynPositionsToEdges=Function[{posinkast},
Block[{relevantnodes,relevantedge},
relevantnodes=Map[Flatten[Position[inputpointcoordinatesandcolors,{_,#}]]&,posinkast[[1]]/.{1->{"WI","BI"},2->{"WI","BE"},3->{"WE","BI"},4->{"WE","BE"}}];
relevantedge=Sort[MapThread[#1[[#2]]&,{relevantnodes,posinkast[[{2,3}]]}]];
relevantedge]
];
swappedeges=Map[turnKasteleynPositionsToEdges,positionsinthekasteleyn];
(*Some of these edges may participate in bubbles. If we take Complement[inputedges,swappededges] we lose the other bubble-edges, so we have to do it more carefully.*)
normaledges=inputedges[[Complement[Range[Length[inputedges]],Flatten[Map[Position[inputedges,#,{1}][[1]]&,swappedeges]]]]];
(*We'll first draw the straight lines, i.e. those that are not bubbles*)
straightedges=Map[First,Cases[Tally[inputedges],{_,1}]];
normalstraightdirectedlines=(Map[{#[[1]],StringTake[#[[2]],1]}&,Map[inputpointcoordinatesandcolors[[#]]&,Cases[normaledges,Alternatives@@straightedges]],{2}]/.{{{coord1_List,"B"},{coord2_List,"W"}}:>{{coord2,"W"},{coord1,"B"}}})[[All,All,1]];
swappedstraightdirectedlines=(Map[{#[[1]],StringTake[#[[2]],1]}&,Map[inputpointcoordinatesandcolors[[#]]&,Cases[swappedeges,Alternatives@@straightedges]],{2}]/.{{{coord1_List,"W"},{coord2_List,"B"}}:>{{coord2,"B"},{coord1,"W"}}})[[All,All,1]];
(*Now we'll draw the bubbles*)
themultiedges=Cases[Tally[inputedges],Except[{_,1}]];
(*Each bubble can have at most one swapped edge, if any. We orient this one backwards and all the others from white to black.*)
(*We now find the position of the BSpline that we want to orient in the opposite way*)
positionsthatneedswapping=Map[Position[themultiedges,#][[1]]&,Cases[swappedeges,Alternatives@@themultiedges[[All,1]]]];
If[themultiedges=!={},(*we have multiple edges going between the same two nodes*)
(*We first orient themultiedges to all go from white node to black node. Then we make the BSpline*)
themultiedges=Map[makeBsplineCurves@@#&,(MapAt[{#[[1]],StringTake[#[[2]],1]}&,MapAt[(inputpointcoordinatesandcolors[[#]])&,themultiedges,{All,1}],{All,1,All}]/.{{{coord1_List,"B"},{coord2_List,"W"}}:>Sequence[coord2,coord1],{{coord3_List,"W"},{coord4_List,"B"}}:>Sequence[coord3,coord4]})];
];
(*Now all BSplines go from white node to black node. We need to orient in the opposite way those BSplines at positions given by positionsthatneedswapping*)
themultiedges=ReplacePart[themultiedges,Map[#->themultiedges[[Sequence@@#]][[All,{3,2,1}]]&,positionsthatneedswapping]];
If[edgenamesdisplayed,
outputgraphics={Arrowheads[{{0.04,0.4}}],Arrow[Join[normalstraightdirectedlines,swappedstraightdirectedlines]],Sequence@@Map[Arrow,themultiedges,{2}]};
,outputgraphics={Arrowheads[{{0.04,0.6}}],Arrow[Join[normalstraightdirectedlines,swappedstraightdirectedlines]],Sequence@@Map[Arrow,themultiedges,{2}]};
];
,outputgraphics={Line[Map[inputpointcoordinatesandcolors[[#,1]]&,Map[First,Cases[Tally[inputedges],{_,1}]]]],Sequence@@inputmultiedges};
];
,outputgraphics={Line[Map[inputpointcoordinatesandcolors[[#,1]]&,Map[First,Cases[Tally[inputedges],{_,1}]]]],Sequence@@inputmultiedges};
];
outputgraphics
];

(*This function takes the graphical information and prints out Graph data which, when drawn, shows the node numbers of the Kasteleyn next to each node in the graph*)
makeNodeNumbers[shownumbers_,inputpointcoordinatesandcolors_]:=Block[{recenterPositions,nodenumbersasstrings,nodenumberpositions,nodenumbersgraphics},
If[shownumbers,
(*This function makes sure that if the position of the node number ends up outside the drawing box, it will be moved to be inside the box*)
recenterPositions=Function[{input},
Block[{output},
If[input<=-1.5,
output=input+0.2;
,If[input>=1.5,
output=input-0.2;
,output=input;
];
];
output]
];
(*these are the node numbers written as strings*)
nodenumbersasstrings=Sort[MapThread[{#1,#2}&,{Join[Flatten[Position[inputpointcoordinatesandcolors,{_,"WI"}]],Flatten[Position[inputpointcoordinatesandcolors,{_,"WE"}]],Flatten[Position[inputpointcoordinatesandcolors,{_,"BI"}]],Flatten[Position[inputpointcoordinatesandcolors,{_,"BE"}]]],Map[ToString,Range[Length[inputpointcoordinatesandcolors]]]}]][[All,2]];
(*these are the positions of the node numbers. If they fall outside the drawing box, we move them back into the box*)
nodenumberpositions=Map[recenterPositions[#]&,inputpointcoordinatesandcolors[[All,1]]+0.1,{2}];
nodenumbersgraphics=MapThread[Text[Style[#1(*number to write*),Medium,FontColor->Blue,Background->RGBColor[1,1,1,0.8]],#2(*position of text*)]&,
{nodenumbersasstrings,nodenumberpositions}];
,(*if it is set to False, draw nothing*)
nodenumbersgraphics={};
];
nodenumbersgraphics
];

(*This function takes the graphical information and prints out Graph data which, when drawn, shows the external node numbers of the Grassmannian. This appears as a green number next to each external node in the graph*)
makeExternalNumbers[showexternalnumbers_,inputpointcoordinatesandcolors_]:=Block[{recenterPositions,nodenumbersasstrings,nodenumberpositions,nodenumbersgraphics},
If[showexternalnumbers,
(*This function makes sure that if the position of the node number ends up outside the drawing box, it will be moved to be inside the box*)
recenterPositions=Function[{input},
Block[{output},
output=input;
If[input[[1]]<=-1.5,
output[[1]]=input[[1]]+0.16;
,If[input[[1]]>=1.5,
output[[1]]=input[[1]]-0.16;
];
];
If[input[[2]]<=-1.5,
output[[2]]=input[[2]]+0.26;
,If[input[[2]]>=1.5,
output[[2]]=input[[2]]-0.26;
];
];
output]
];
(*these are the node numbers written as strings*)
nodenumbersasstrings=Sort[MapThread[{#1,#2}&,{(*first the external white nodes, then the external black ones. Their order in inputpointcoordinatesandcolors is the same as in the Kasteleyn (for each color)*)Join[Flatten[Position[inputpointcoordinatesandcolors,{_,"WE"}]],Flatten[Position[inputpointcoordinatesandcolors,{_,"BE"}]]],Map[ToString,Range[Length[Cases[inputpointcoordinatesandcolors,{_,"WE"}|{_,"BE"}]]]]}]][[All,2]];
(*these are the positions of the node numbers. They are placed to always be inside the drawing box and not conflict too much with nodenumberstext*)
nodenumberpositions=Map[recenterPositions[#+{0,0.13}]&,inputpointcoordinatesandcolors[[Flatten[Position[inputpointcoordinatesandcolors,{_,"WE"}|{_,"BE"}]],1]]];
nodenumbersgraphics=Join[{Thick},
MapThread[Text[Style[#1(*number to write*),FontColor->RGBColor[0.424,0.616,0.169],FontSize->18,FontWeight->Bold,Background->RGBColor[1,1,1,0.8]],#2(*position of text*)]&,
{nodenumbersasstrings,nodenumberpositions}]];
,(*if it is set to False, draw nothing*)
nodenumbersgraphics={};
];
nodenumbersgraphics
];

(*This function provides some consistency checks on the inputted Kasteleyn, so as to not attempt to draw something that doesn't make any sense.*)
checkinputKasteleyn[topleft_,topright_,bottomleft_,bottomright_]:=Block[{areyouOK},
areyouOK=(And@@Map[Equal@@#&,Map[Length,{topleft,topright,bottomleft,bottomright},{2}]])&&(Length[topleft]==Length[topright])&&(Length[bottomleft]==Length[bottomright])&&(Length[Dimensions[topleft]]==1||Length[Dimensions[bottomleft]]==1||Dimensions[topleft][[2]]==Dimensions[bottomleft][[2]])&&(Length[Dimensions[topright]]==1||Length[Dimensions[bottomright]]==1||Dimensions[topright][[2]]==Dimensions[bottomright][[2]])&&(getDuplicateEdges[topleft,topright,bottomleft,bottomright]=={})&&(Cases[Cases[Flatten[{topleft,topright,bottomleft,bottomright}],_Integer],Except[0]]=={});
areyouOK];

(*This function takes the outputted Kasteleyn, given by the function makeKasteleynComponents, and labels the edges in the graph with the corresponding Z[i] names. The function returns graph data to be drawn in the interactive box.*)
drawEdgeNames[inputpointcoordinatesandcolors_,inputedges_,showedges_]:=Block[{graphOK,kast,edgenames,positionsinthekasteleyn,turnKasteleynPositionsToEdges,graphedges,replacetographposition,graphmultiedges,perfmatchings,referencematchingedges,labelpositions,outputgraphics},
If[showedges,
graphOK=graphBipartiteAndGoodExtNodesQ[inputpointcoordinatesandcolors,inputedges];
If[graphOK,
kast=makeKasteleynComponents[inputpointcoordinatesandcolors,inputedges];
edgenames=Variables[kast];
(*Each Z[i] variables will now be translated into an edge name {i,j} in the graph*)
positionsinthekasteleyn=Map[Position[kast,#][[1,Range[3]]]&,edgenames];
turnKasteleynPositionsToEdges=Function[{posinkast},
Block[{relevantnodes,relevantedge},
relevantnodes=Map[Flatten[Position[inputpointcoordinatesandcolors,{_,#}]]&,posinkast[[1]]/.{1->{"WI","BI"},2->{"WI","BE"},3->{"WE","BI"},4->{"WE","BE"}}];
relevantedge=Sort[MapThread[#1[[#2]]&,{relevantnodes,posinkast[[{2,3}]]}]];
relevantedge]
];
graphedges=Map[turnKasteleynPositionsToEdges,positionsinthekasteleyn];
(*Now we have the edge names {i,j}. We will turn each of these into a position, which is on the midway point of the edge. We will use ReplacePart to turn each position in graphedges to its corresponding coordinate*)
(*first we turn the single edges into their graph positions*)
replacetographposition=Map[Position[graphedges,#][[1,1]]->Mean[inputpointcoordinatesandcolors[[#,1]]]&,Cases[Tally[graphedges],{_,1}][[All,1]]];
(*Now we do the same for the multiedges*)
graphmultiedges=Cases[Tally[graphedges],Except[{_,1}]];
If[graphmultiedges=!={},
perfmatchings=perfectMatchings[Sequence@@kast];
If[perfmatchings!={},
referencematchingedges=Variables[perfmatchings[[lowNumberLoopsPMpos[Sequence@@kast]]]];
,referencematchingedges={};
];
(*We order the list #1 such that edges which appear in the reference perfect matching come first. This is because these edges will flow the opposite way in bubbles, and it is always the first BSpline that is chosen to flow the opposite way*)
replacetographposition=Join[replacetographposition,MapThread[Sequence@@MapThread[Rule,{#1,#2}]&,{Map[Position[edgenames,#][[1,1]]&,Map[Join[Intersection[referencematchingedges,#],Complement[#,Intersection[referencematchingedges,#]]]&,Map[edgenames[[Flatten[Position[graphedges,#]]]]&,graphmultiedges[[All,1]]]],{2}],Map[(BSplineFunction@@#)[0.5]&,Map[makeBsplineCurves@@#&,(MapAt[{#[[1]],StringTake[#[[2]],1]}&,MapAt[(inputpointcoordinatesandcolors[[#]])&,graphmultiedges,{All,1}],{All,1,All}]/.{{{coord1_List,"B"},{coord2_List,"W"}}:>Sequence[coord2,coord1],{{coord3_List,"W"},{coord4_List,"B"}}:>Sequence[coord3,coord4]})],{2}]}]];
];
labelpositions=ReplacePart[graphedges,replacetographposition];
(*Now we have all the positions, and are ready to print out the graphics data for the edge labels*)
edgenames=Map[ToString,edgenames];
outputgraphics=MapThread[Text[Style[#1(*edge name*),FontColor->RGBColor[0.173,0.659,0.761],Medium,Background->RGBColor[1,1,1,0.8]],#2(*position of text*)]&,
{edgenames,labelpositions}];
,outputgraphics={};
];
,outputgraphics={};
];
outputgraphics
];

drawGraph[topleft_:{},topright_:{},bottomleft_:{},bottomright_:{}]/;(Head[topleft]===List&&Head[topright]===List&&Head[bottomleft]===List&&Head[bottomright]===List):=DynamicModule[{nodecolor="White",internalexternal="Internal",pointcoordinatesandcolors={},temppointcoordinatesandcolors={},temporarydottededge={},tempnormaledges={},edges={},removableedges={},tempremovableedges={},removablesuptodate=True,clickedposition,unclickedposition,addremove="Add",draggedposition,nodeinfo,nodenumber,introprinted=0,introprintedremovablewarning=0,multiedges={},tempmultiedges={},getRemovableEdges,drawRemovableLines,madeit,newposition,oldposition,nodenumberstext=False,externalnumberstext=False,showremovableedges=False,perfectorientation=False,edgenametext=False,enablebuttons=True,edgebuttonlist=Column[{}],areyoupressed={"DialogBox"}},
(*The drawn graph is a Dynamic object, it's redrawn any time the graph has changed. There are two main variables that specify what to draw: pointcoordinatesandcolors, which is the list of nodes, and edges, the list of edges. Each element in pointcoordinatesandcolors contains the coordinates of the nodes in the Graphics box (whose positions are always approximated to the nearest 0.1 value, effectively turning the box into a grid), and a string which specifies what type of node you have: "WI" for white internal, "BI", for black internal, "WE" and "BE" for the external nodes.*)
(*We make a function that takes a list of removable edges in the format {{i,j},...} and the coordinates of points, and gives the graphics data for the edges, to be used when drawing removable edges. If showthearrows is True, it will also draw arrows according to the perfect orientation*)
drawRemovableLines=Function[{inputremovabledges,newpointcoordinatesandcolors,newedges,showthearrows,showtheedgenames},
Block[{newmultiedges,todrawmultiedges,drawnlines,positiontodraw,objectstodraw,removablelines},
If[showthearrows,
newmultiedges=Cases[Tally[newedges],Except[{_,1}]];
If[newmultiedges=!={},(*we have multiple edges going between the same two nodes*)
newmultiedges=Map[makeBsplineCurves@@#&,MapAt[Sequence@@(newpointcoordinatesandcolors[[#,1]])&,newmultiedges,{All,1}]];
];
(*instead of recalculating the direction of the arrows, we can just copy that made from drawLines*)
drawnlines=drawLines[newpointcoordinatesandcolors,newedges,newmultiedges,showthearrows,edgenametext];
(*Our removable edges will be drawn somewhere in drawnlines. We list the positions, so as to fetch the relevant part of drawnlines that correspond to removable edges.*)
positiontodraw=Map[Sequence@@Position[drawnlines,#|Reverse[#]|BSplineCurve[{#[[1]],_,#[[2]]}]|BSplineCurve[{#[[2]],_,#[[1]]}]]&,Map[newpointcoordinatesandcolors[[#]][[All,1]]&,DeleteDuplicates[inputremovabledges]]];
objectstodraw=Map[Arrow[drawnlines[[Sequence@@#]]]&,positiontodraw];
If[showtheedgenames,
removablelines=Sequence@@{Thickness[0.01],Arrowheads[{{0.05,0.4}}],Orange,Sequence@@objectstodraw};
,removablelines=Sequence@@{Thickness[0.01],Arrowheads[{{0.05,0.6}}],Orange,Sequence@@objectstodraw};
];
,(*We first draw the bubbles, and then the normal lines.*)
todrawmultiedges=Cases[Tally[inputremovabledges],Except[{_,1}]];
If[todrawmultiedges=!={},(*we have multiple edges going between the same two nodes*)
todrawmultiedges=Map[makeBsplineCurves@@#&,MapAt[Sequence@@(newpointcoordinatesandcolors[[#,1]])&,todrawmultiedges,{All,1}]];
];
removablelines=Sequence@@{Thickness[0.01],Orange,Line[Map[newpointcoordinatesandcolors[[#,1]]&,Map[First,Cases[Tally[inputremovabledges],{_,1}]]]],Sequence@@todrawmultiedges};
];
removablelines]
];
(*This function returns the quantities that are printed in the interactive graphics box. It gets evaluated every time any of its arguments change. Since when we drag nodes around the arguments change very rapidly, this function needs to be fast. Therefore, it has several If statements that only force the computation of removable edges if the tickbox has been ticked, and if the list of removable edges is outdated. This function gets evaluated in the kernel when you tick the Tickbox, and in the FrontEnd when you change the graph. However, if the FrontEnd is going to take too long in evaluating it (more than 1 second), the box gets unticked and the FrontEnd does not evaluate this. If you then want to wait out the long computation, you can tick the box again, which will make the long computation happen in the kernel where it can take as long as it wants.*)
getRemovableEdges=Function[{showtheedges,theedgelist,newpointcoordinatesandcolors,newedges,witharrows,withnamededges},
Block[{returnededges},
If[showtheedges,
If[removablesuptodate,
returnededges=theedgelist;
,returnededges=findRemovableEdges[newpointcoordinatesandcolors,newedges];
removableedges=returnededges;
removablesuptodate=True;
];
,returnededges={};
];
returnededges=drawRemovableLines[returnededges,newpointcoordinatesandcolors,newedges,witharrows,withnamededges];
returnededges]
];
(*By default we begin with an empty graph, i.e. pointcoordinatesandcolors={} and edges={}. However, if the user specified a Kasteleyn to be drawn, we begin by automatically drawing the graph using Mathematica, then rescaling the coordinates of its graph so as to fit into our Graphics box. We then populate pointcoordinatesandcolors and edges accordingly.*)
If[{topleft,topright,bottomleft,bottomright}=!={{},{},{},{}},
If[checkinputKasteleyn[topleft,topright,bottomleft,bottomright],
(*The list of removable edges is not up to date (we only want to recompute the edges when removablesuptodate is False)*)
removablesuptodate=False;
{pointcoordinatesandcolors,edges}=makeGraphDatafromKasteleyn[topleft,topright,bottomleft,bottomright];
(*When we have multiple edges, we should draw bubbles*)
multiedges=Cases[Tally[edges],Except[{_,1}]];
If[multiedges=!={},(*we have multiple edges going between the same two nodes*)
multiedges=Map[makeBsplineCurves@@#&,MapAt[Sequence@@(pointcoordinatesandcolors[[#,1]])&,multiedges,{All,1}]];
];
,Print["The Kasteleyn in the input is not valid - please check."];
];
];
(*Now it's time to make the interactive drawing box. The entire thing is in a Panel[...,Background\[Rule]LightBlue]. Inside this panel, there's a single element: Grid[{row1,row2,...},Spacings\[Rule]{{...},{...}}]. There are 5 rows in the grid. The first row contains the RadioButtons for drawing the graph nodes and edges, and the Clear All button. The second row is empty; it gives a bit of vertical space. The third row contains Checkboxes to augment the graph drawing with node numbers, arrows, etc. The fourth row contains the interactive graph-drawing box and the scroll list to remove edges. The fifth row contains the buttons for computing quantities and printing out the Kasteleyn and the graph drawing.*)
Panel[Grid[{
(*Row1*)
{(*In this row there is a single Grid. It has 3 rows.*)
Grid[{
(*On this row we control the variable addremove, which takes the values "Add", "Remove", or "Move", and will control what a mouse-click does in Row4.*)
{Row[{RadioButton[Dynamic[addremove],"Add"]," Add nodes/lines  "}],Row[{RadioButton[Dynamic[addremove],"Remove"]," Remove nodes  "}],Row[{RadioButton[Dynamic[addremove],"Move"]," Move nodes  "}]},
{Null,Null,Null}(*this is bit of empty space*),
(*The final row contains two Grids separated by white space. The first Grid controls the node colors, and the second contains the "Clear all" button.*)
(*We control the variable nodecolor with Radiobuttons. These radiobuttons are only Enabled if addremove is set to "Add" and if the variable enablebuttons is set to True. enablebuttons is only set to False while we are dragging with the mouse in the drawing area in Row4. This is to emphasize the fact that if you are dragging a line from a node, the next node color is automatically bipartite; you only get to control the color of nodes if you are simply clicking around without dragging.*)
{Grid[{{" Node color: ","   Node type:   "},{RadioButtonBar[Dynamic[nodecolor],{"White","Black"},Appearance->"Vertical",Enabled->Dynamic[enablebuttons&&(addremove/.{"Add"->True,"Remove"->False,"Move"->False})]],RadioButtonBar[Dynamic[internalexternal],{"Internal","External"},Appearance->"Vertical",Enabled->Dynamic[enablebuttons&&(addremove/.{"Add"->True,"Remove"->False,"Move"->False})]]}}],
"","",
(*To make the "Clear all" button appear lower down we make a Grid with an empty row before placing the button there.*)
Grid[{{},
{Button["Clear all",
pointcoordinatesandcolors={};
temporarydottededge={};
edges={};
multiedges={};
removableedges={};
removablesuptodate=True;
temppointcoordinatesandcolors={};
temporarydottededge={};
tempnormaledges={};
tempremovableedges={};
tempmultiedges={};
,ImageSize->Large]}
}]
}
},Spacings->{{Automatic,Automatic,Automatic,Automatic},{Automatic,0,0,Automatic}
}]},
(*Row2*)
(*This row is there to add a little vertical space*)
{},
(*Row3*)
(*This row contains a single Grid with two rows in it. The first row has two Checkboxes in it, the second row has three. Here we control the variable nodenumberstext, which decides whether small blue node numbers should appear next to each node; externalnumberstext, which controls whether the external nodes (numbered according to their order in the path matrix) should appear; edgenametext, which controls whether to show the edge names given by the Kasteleyn matrix; perfectorientation, which controls whether the arrows of the default perfect orientation (chosen by pathMatrix) should be drawn out; and showremovableedges, which controls whether the removable edges should be drawn in a different color.*)
(*Each Checkbox appears as an object with structure Row[text,checkbox]*)
{Grid[{{Row[{"Kasteleyn node numbers: ",Checkbox[Dynamic[nodenumberstext]]}],"  ",
Row[{"Grassmannian external numbers: ",Checkbox[Dynamic[externalnumberstext]]}]},
{Row[{"Kasteleyn edge names:  ",Checkbox[Dynamic[edgenametext]]}],"  ",Row[{"Default perfect orientation: ",Checkbox[Dynamic[perfectorientation]]}],"  ",
(*Removable edges are evaluated in the kernel when clicking on the Checkbox. If they require a long time to compute, my program always forces the user to use this Checkbox to view removable edges.*)
Row[{"Removable edges: ",EventHandler[Checkbox[Dynamic[showremovableedges]],
{{"MouseClicked",1}:> (
(*If it's the first time we try and show the removable edges, warn the user that this can take a long time*)
If[introprintedremovablewarning==0,Print["The computation of removable edges may take a long time. If the time exceeds 1 second, the checkbox will automatically untick. To proceed with the computation of removable edges, it is necessary to retick the checkbox."];introprintedremovablewarning=1;];
(*If showremovableedges was True, simply turn it off. Otherwise, compute them now (if they are outdated).*)
If[showremovableedges,
showremovableedges=False;
,If[removablesuptodate==False,
tempremovableedges=findRemovableEdges[pointcoordinatesandcolors,edges];
removablesuptodate=True;
removableedges=tempremovableedges;
];
showremovableedges=True;];)}
,Method->"Queued"]}]}},Alignment->Right]},
(*Row4*)
(*This row contains a Grid, which in turn has a single row. This row has two elements: the dynamic graphics on which we draw the graph, and another Grid in which we have the bar for removing edges.*)
{Grid[{
(*The structure of the graphics is the following: it is a Dynamic[Graphics[{listofthingstobedrawn},PlotRange\[Rule]1.5,...,Background\[Rule]White].*)
(*The Dynamic Graphics is in turn wrapped by an EventHandler, which says that if you click in certain ways on the object wrapped by the EventHandler, it can perform actions you want. The structure is 
EventHandler[Dynamic[Graphics[...]],
{"MouseClicked"\[RuleDelayed](action if you clicked and released on the same spot),{"MouseClicked",2}\[RuleDelayed](action if you right-clicked),"MouseDown"\[RuleDelayed](action to do as soon as the mouse click is pressed down),"MouseDragged"\[RuleDelayed](action to do every time the mouse is moved while the click is pressed. This is recomputed a lot as you drag across the screen),"MouseUp"\[RuleDelayed](action to do as soon as the mouse click is released)} *)
{EventHandler[Dynamic[Graphics[{(*draw edges that are not bubbles*)
Thickness[0.005],
(*draw the normal edges (and bubbles), which may be endowed with perfect orientation*)
Sequence@@drawLines[pointcoordinatesandcolors,edges,multiedges,perfectorientation,edgenametext],
(*draw removable edges if showremovableedges is set to True. This will update if any of its input variables change*)
getRemovableEdges[showremovableedges,removableedges,pointcoordinatesandcolors,edges,perfectorientation,edgenametext],
(*draw dotted edge as you drag the mouse*)
Thickness[0.005],temporarydottededge,
(*draw the nodes; external ones get a red edge to distinguish them*)
{Black,EdgeForm[{Thick,Black}],Map[Disk[#,0.035]&,Cases[pointcoordinatesandcolors,{_,"BI"}][[All,1]]]},{Black,EdgeForm[{Thick,Red}],Map[Disk[#,0.035]&,Cases[pointcoordinatesandcolors,{_,"BE"}][[All,1]]]},{White,EdgeForm[{Thick,Black}],Map[Disk[#,0.035]&,Cases[pointcoordinatesandcolors,{_,"WI"}][[All,1]]]},{White,EdgeForm[{Thick,Red}],Map[Disk[#,0.035]&,Cases[pointcoordinatesandcolors,{_,"WE"}][[All,1]]]},
(*draw small blue node numbers next to each node, if nodenumberstext is set to True*)
makeNodeNumbers[nodenumberstext,pointcoordinatesandcolors],
(*draw green node numbers next to external nodes, if externalnumberstext is set to True*)
makeExternalNumbers[externalnumberstext,pointcoordinatesandcolors],
(*draw the edge names appearing in the outputted Kasteleyn on top of the edges*)
drawEdgeNames[pointcoordinatesandcolors,edges,edgenametext]
},(*finished drawing. Now we list the options of the Graphics[{thingstodraw},options].*)
PlotRange->1.5,Frame->True,FrameTicks->None,ImageSize->{400,400},Background->White]],
(*Now the Dynamic box is finished. Here we list the actions to perform in the EventHandler*)
(*Drawing new nodes and lines is only done with "MouseDown", "MouseDragged" and "MouseUp". "MouseClicked" is used to remove nodes and {"MouseClicked",2} is used to change them from internal to external.*)
(*In each case we approximate the mouse position so as to not need to click infinitely precisely.*)
{"MouseClicked":> (
clickedposition=Round[MousePosition["Graphics"],0.1];
(*if addremove is set to "Remove", find out which node you clicked on (if any) and remove it. Then also remove the edges connected to it*)
If[addremove==="Remove",
nodenumber=Flatten[Position[pointcoordinatesandcolors,{clickedposition,_}]];
If[nodenumber=!={},
temppointcoordinatesandcolors=Delete[pointcoordinatesandcolors,nodenumber[[1]]];
tempnormaledges=DeleteCases[edges,{nodenumber[[1]],_}|{_,nodenumber[[1]]}]/.{zz_/;(zz>nodenumber[[1]]):>zz-1};
(*if showremovableedges is True, we may be stuck waiting for the FrontEnd to compute the new removable edges, and if it takes more than 5 seconds it will time out and kill the whole graph. Therefore, we test if the computation time is longer than 1 second. If it is, we'll turn off showremovableedges, to avoid recomputing it. Otherwise it's OK. Once we turned it off, if the user goes and turns it back on again there is no problem with it taking longer than 5 seconds, as it is set to work in the kernel (using Method\[Rule]"Queued") instead of the FrontEnd.*)
If[showremovableedges,
madeit=TimeConstrained[{drawRemovableLines[findRemovableEdges[temppointcoordinatesandcolors,tempnormaledges],temppointcoordinatesandcolors,tempnormaledges,perfectorientation,edgenametext]},1,"fail"];
If[madeit==="fail",
showremovableedges=False;
];
];
removablesuptodate=False;
pointcoordinatesandcolors=temppointcoordinatesandcolors;
edges=tempnormaledges;
multiedges=Cases[Tally[edges],Except[{_,1}]];
If[multiedges=!={},(*we have multiple edges going between the same two nodes*)
multiedges=Map[makeBsplineCurves@@#&,MapAt[Sequence@@(pointcoordinatesandcolors[[#,1]])&,multiedges,{All,1}]];
];
];
];
)
,{"MouseClicked",2}:>(
clickedposition=Round[MousePosition["Graphics"],0.1];
(*if addremove is set to "Add", we are in drawing mode, so a right-click is interpreted as switching a node number from internal to external*)
If[addremove==="Add",
nodenumber=Flatten[Position[pointcoordinatesandcolors,{clickedposition,_}]];
If[nodenumber=!={},
temppointcoordinatesandcolors=pointcoordinatesandcolors;
temppointcoordinatesandcolors[[nodenumber[[1]],2]]=temppointcoordinatesandcolors[[nodenumber[[1]],2]]/.{"WI"->"WE","WE"->"WI","BI"->"BE","BE"->"BI"};
(*again, we only turn off showremovableedges if it takes a long time to compute the removable edges*)
If[showremovableedges,
madeit=TimeConstrained[{drawRemovableLines[findRemovableEdges[temppointcoordinatesandcolors,edges],temppointcoordinatesandcolors,edges,perfectorientation,edgenametext]},1,"fail"];
If[madeit==="fail",
showremovableedges=False;
];
];
removablesuptodate=False;
pointcoordinatesandcolors=temppointcoordinatesandcolors;
];
];
)
,"MouseDown":>(
(*if addremove is set to "Add", we are in drawing mode.*)
If[addremove==="Add",
clickedposition=Round[MousePosition["Graphics"],0.1];
(*if the position does not have a node already, add a new node of the specified color and type*)
If[FreeQ[pointcoordinatesandcolors,{clickedposition,_}],
pointcoordinatesandcolors=Append[pointcoordinatesandcolors,{clickedposition,StringJoin[StringTake[nodecolor,1],StringTake[internalexternal,1]]}];
];
];
(*if addremove is set to "Move", we record where we are now.*)
If[addremove==="Move",
oldposition=Round[MousePosition["Graphics"],0.1];
];
)
,"MouseDragged":>(
(*when we are finished dragging, we automatically choose the color of the node at the end-point. Therefore we set enablebuttons to False to emphasize that the user no longer can control this information.*)
enablebuttons=False;
(*if addremove is set to "Add", we are in drawing mode. We draw a dotted edge between the clickedposition and the current position to show where the new edge will be. If we move the mouse outside the box, we force the position back into the box.*)
If[addremove==="Add",
draggedposition=Round[MousePosition["Graphics"],0.1]/.{z1_/;(z1>1.5)->1.5,z2_/;(z2<-1.5)->-1.5};
temporarydottededge={Gray,Dashed,Line[{clickedposition,draggedposition}]};
];
(*if addremove is set to "Move", we need to relocate the node we clicked on*)
If[addremove==="Move",
newposition=Round[MousePosition["Graphics"],0.1]/.{z1_/;(z1>1.5)->1.5,z2_/;(z2<-1.5)->-1.5};
(*if the new position is not on another existing node, move the node we clicked on (if any) and redraw the bubbles*)
If[Cases[pointcoordinatesandcolors,{newposition,_}]==={},
pointcoordinatesandcolors=pointcoordinatesandcolors/.{oldposition->newposition};
multiedges=Cases[Tally[edges],Except[{_,1}]];
If[multiedges=!={},(*we have multiple edges going between the same two nodes*)
multiedges=Map[makeBsplineCurves@@#&,MapAt[Sequence@@(pointcoordinatesandcolors[[#,1]])&,multiedges,{All,1}]];
];
oldposition=newposition;
];
];
),
"MouseUp":>(
 (*now that we are finished dragging, we again enable the buttons to choose node color and type.*)
enablebuttons=True;
If[addremove==="Add",
temppointcoordinatesandcolors=pointcoordinatesandcolors;
tempnormaledges=edges;
unclickedposition=Round[MousePosition["Graphics"],0.1]/.{z1_/;(z1>1.5)->1.5,z2_/;(z2<-1.5)->-1.5};
(*if we were drawing new nodes and edges, and we released the click on a new position, we draw a node of the opposite color to the clicked position. We still haven't added new edges*)
If[FreeQ[temppointcoordinatesandcolors,{unclickedposition,_}],
temppointcoordinatesandcolors=Append[temppointcoordinatesandcolors,{unclickedposition,StringJoin[StringTake[Cases[temppointcoordinatesandcolors,{clickedposition,_}][[1,2]],1]/.{"B"->"W","W"->"B"},StringTake[internalexternal,1]]}];
];
(*if we released on a position different to the starting one, we need to add new edges*)
If[unclickedposition=!=clickedposition,
tempnormaledges=Append[tempnormaledges,Flatten[Position[temppointcoordinatesandcolors,{clickedposition,_}|{unclickedposition,_}]]];
tempmultiedges=Cases[Tally[tempnormaledges],Except[{_,1}]];
If[tempmultiedges=!={},(*we have multiple edges going between the same two nodes*)
tempmultiedges=Map[makeBsplineCurves@@#&,MapAt[Sequence@@(temppointcoordinatesandcolors[[#,1]])&,tempmultiedges,{All,1}]];
];
(*if we released in the same position we started in, we don't draw any new edges, but we swap the color of the node we clicked on. We want to make sure that we are swapping the color of the node only if it wasn't a node we just created.*)
,If[Last[temppointcoordinatesandcolors][[1]]=!=clickedposition||MemberQ[tempnormaledges,{_,Length[temppointcoordinatesandcolors]}|{Length[temppointcoordinatesandcolors],_}],
nodeinfo=Cases[temppointcoordinatesandcolors,{clickedposition,_}][[1]];
temppointcoordinatesandcolors=ReplacePart[temppointcoordinatesandcolors,Position[temppointcoordinatesandcolors,nodeinfo][[1,1]]->{clickedposition,StringJoin[StringTake[nodeinfo[[2]],{1}]/.{"B"->"W","W"->"B"},StringTake[nodeinfo[[2]],{2}]]}];
];
];
(*again, we only turn off showremovableedges if it takes a long time to compute the removable edges*)
If[showremovableedges,
madeit=TimeConstrained[{drawRemovableLines[findRemovableEdges[temppointcoordinatesandcolors,tempnormaledges],temppointcoordinatesandcolors,tempnormaledges,perfectorientation,edgenametext]},1,"fail"];
If[madeit==="fail",
showremovableedges=False;
];
];
removablesuptodate=False;
pointcoordinatesandcolors=temppointcoordinatesandcolors;
edges=tempnormaledges;
If[unclickedposition=!=clickedposition,multiedges=tempmultiedges;];
(*finally, we remove the dotted edge*)
temporarydottededge={};
];
(*if addremove is set to "Move", we need to make the final relocation of the node we clicked on*)
If[addremove==="Move",
unclickedposition=Round[MousePosition["Graphics"],0.1]/.{z1_/;(z1>1.5)->1.5,z2_/;(z2<-1.5)->-1.5};
If[Cases[pointcoordinatesandcolors,{unclickedposition,_}]==={},
pointcoordinatesandcolors=pointcoordinatesandcolors/.{oldposition->unclickedposition};
];
];
)
}],
(*The EventHandler[Dynamic[Graphic[...]],{actions}] is closed: we completely finished the interactive drawing box.*)
(*Now we make a column which allows the user to remove edges*)
Grid[{{Button["Remove edges:",
(*the Appearance of this button is given by the variable areyoupressed. If this variable is set to {"DialogBox"}, the button is "unpressed" and just looks like a normal DialogBox. In this case, clicking on it will set the variable edgebuttonlist to a column of buttons representing edges (which, when clicked, remove that edge). It will also set the variable areyoupressed to {"DialogBox","Pressed"}.
If areyoupressed was already {"DialogBox","Pressed"}, then we remove the edge buttons and set areyoupressed to {"DialogBox"}*)
If[areyoupressed==={"DialogBox"},
(*The column needs to by Dynamic because it needs to update if add or remove edges in the graph*)
edgebuttonlist=Dynamic[Column[
(*we make a Button for each element in edges*)
Map[Button[(*the button should be an UndirectedEdge[nodenumber1,nodenumber2]. These node numbers are those of the Kasteleyn matrix, NOT the chronological order in which they appear in pointcoordinatesandcolors. Since elements of edges describe the latter, we take this numbering and with MapThread[#1\[Rule]#2,{positions of nodes in pointcoordinatesandcolors,what the nodes are called in the Kasteleyn}] translate the numbers to their correct values. We use Sort to turn UndirectedEdge[2,1] into UndirectedEdge[1,2].*)
Sort[UndirectedEdge@@(#/.MapThread[#1->#2&,{
(*positions of nodes in pointcoordinatesandcolors*)
Join[Flatten[Position[pointcoordinatesandcolors,{_,"WI"}]],Flatten[Position[pointcoordinatesandcolors,{_,"WE"}]],Flatten[Position[pointcoordinatesandcolors,{_,"BI"}]],Flatten[Position[pointcoordinatesandcolors,{_,"BE"}]]],
(*what the nodes are called in the Kasteleyn*)
Range[Length[pointcoordinatesandcolors]]}]
)]
(*we are finished with the label of the button*)
,(*this is the action of the button. It simply removes the edge from the list of edges (and we then redrawn the bubbles accordingly)*)
tempnormaledges=Delete[edges,Position[edges,#][[1,1]]];
(*again, we only turn off showremovableedges if it takes a long time to compute the removable edges*)
If[showremovableedges,
madeit=TimeConstrained[{drawRemovableLines[findRemovableEdges[pointcoordinatesandcolors,tempnormaledges],pointcoordinatesandcolors,tempnormaledges,perfectorientation,edgenametext]},1,"fail"];
If[madeit==="fail",
showremovableedges=False;
];
];
removablesuptodate=False;
edges=tempnormaledges;multiedges=Cases[Tally[edges],Except[{_,1}]];If[multiedges=!={},(*we have multiple edges going between the same two nodes*)multiedges=Map[makeBsplineCurves@@#&,MapAt[Sequence@@(pointcoordinatesandcolors[[#,1]])&,multiedges,{All,1}]];];,
(*we are done with the action done by clicking on the button*)
ImageSize->Automatic]&,edges](*these buttons should be ordered lexicographically. We translate the node numbers again and find their Ordering*)[[Ordering[Map[Sort,edges/.MapThread[#1->#2&,{Join[Flatten[Position[pointcoordinatesandcolors,{_,"WI"}]],Flatten[Position[pointcoordinatesandcolors,{_,"WE"}]],Flatten[Position[pointcoordinatesandcolors,{_,"BI"}]],Flatten[Position[pointcoordinatesandcolors,{_,"BE"}]]],Range[Length[pointcoordinatesandcolors]]}]]]]]
]];
(*we are finished with the Column.*)
areyoupressed={"DialogBox","Pressed"};
,edgebuttonlist=Column[{}];
areyoupressed={"DialogBox"};
];,Appearance->Dynamic[areyoupressed]]},
(*we have only created a variable edgebuttonlist which is a column of buttons. But this column hasn't been drawn out anywhere. We do so in the second row of our Grid.*)
{Pane[Dynamic[edgebuttonlist],ImageSize->{80,368},Scrollbars->{False,True}(*this adds vertical scrollbars*),Alignment->{Left,Top}]}}]}}]},
(*Row5*)
(*This row contains a single object called Row, which in turn contains an ActionMenu that computes quantities related to the graph, a button that prints out the Kasteleyn, and a button that prints out the graph. There is also white space between each of these buttons*)
{Row[{(*some space*)"                                   ",
(*The "Compute" menu*)
ActionMenu["Compute",
{"Are you reducible? (True/False)":>(If[perfectMatchings@@makeKasteleynComponents[pointcoordinatesandcolors,edges]=!= {},Print[reducibilityQ@@makeKasteleynComponents[pointcoordinatesandcolors,edges]];,Print["This graph has no perfect matchings!"];];),
"Path Matrix":>(If[perfectMatchings@@makeKasteleynComponents[pointcoordinatesandcolors,edges]=!= {},Print[pathMatrix@@makeKasteleynComponents[pointcoordinatesandcolors,edges]];,Print["This graph has no perfect matchings!"];];),
"Dimension of Grassmannian":>(If[perfectMatchings@@makeKasteleynComponents[pointcoordinatesandcolors,edges]=!= {},Print[dimensionGrassmannian@@makeKasteleynComponents[pointcoordinatesandcolors,edges]];,Print["This graph has no perfect matchings!"];];),
"Stratification: Number of boundaries":>(If[perfectMatchings@@makeKasteleynComponents[pointcoordinatesandcolors,edges]=!= {},Print[stratificationNumbers@@makeKasteleynComponents[pointcoordinatesandcolors,edges]];,Print["This graph has no perfect matchings!"];];),
"Stratification: Euler number":>(If[perfectMatchings@@makeKasteleynComponents[pointcoordinatesandcolors,edges]=!= {},Print[stratificationEulerNumber@@makeKasteleynComponents[pointcoordinatesandcolors,edges]];,Print["This graph has no perfect matchings!"];];),
"Non-standard Poles (True/False)":>(If[perfectMatchings@@makeKasteleynComponents[pointcoordinatesandcolors,edges]=!= {},Print[nonPluckerPolesQ@@makeKasteleynComponents[pointcoordinatesandcolors,edges]];,Print["This graph has no perfect matchings!"];];),
"Minors of Path Matrix \[LeftRightArrow] Perfect Matchings":>(If[perfectMatchings@@makeKasteleynComponents[pointcoordinatesandcolors,edges]=!= {},Print[minorsAsPerfectMatchings@@makeKasteleynComponents[pointcoordinatesandcolors,edges]];,Print["This graph has no perfect matchings!"];];),
"Planarity (True/False)":>(If[perfectMatchings@@makeKasteleynComponents[pointcoordinatesandcolors,edges]=!= {},Print[planarityQ@@makeKasteleynComponents[pointcoordinatesandcolors,edges]];,Print["This graph has no perfect matchings!"];];),
"Helicity k":>(If[perfectMatchings@@makeKasteleynComponents[pointcoordinatesandcolors,edges]=!= {},Print[getK@@makeKasteleynComponents[pointcoordinatesandcolors,edges]];,Print["This graph has no perfect matchings!"];];),
"Perfect Matchings":>(Print[perfectMatchings@@makeKasteleynComponents[pointcoordinatesandcolors,edges]];)}
,Method->"Queued"],
(*some space*)
"                ",
Button["Print Kasteleyn components",
(*The first time we print out the Kasteleyn, write out what the print-out elements stand for.*)
If[introprinted==0,Print["The Kasteleyn components are: {\"top-left\",\"top-right\",\"bottom-left\",\"bottom-right\"}"];introprinted=1;];
Print[makeKasteleynComponents[pointcoordinatesandcolors,edges]];
,ImageSize->Large],
(*some space*)
"        ",
(*"Print graph" button*)
Button["Print graph",Print[Graph[Range[Length[pointcoordinatesandcolors]],edges,VertexCoordinates->pointcoordinatesandcolors[[All,1]],VertexSize->Medium,VertexStyle->MapThread[Rule,{Range[Length[pointcoordinatesandcolors]],pointcoordinatesandcolors[[All,2]]/.{"WI"->White,"WE"->White,"BI"->Black,"BE"->Black}}],EdgeStyle->Directive[Black,Thick]]];]}]}
},Spacings->{{Automatic,Automatic},{Automatic,0,0,Automatic,Automatic,Automatic}}],Background->LightBlue]
];


(*Functions to check the Kasteleyn*)


getDuplicateEdges[topleft_,topright_,bottomleft_,bottomright_]:=Block[{kasteleyn,doubleslist,kasteleynterms},
kasteleyn=joinupKasteleyn[topleft,topright,bottomleft,bottomright];
(*Make a list of edges that appear twice*)
doubleslist=Variables[kasteleyn][[Flatten[Position[Map[Length[Position[kasteleyn,#]]&,Variables[kasteleyn]],z_/;z>1]]]];
(*Also look for edges appearing with a minus, or with prefactors different from 1*)
kasteleynterms=Flatten[Map[MonomialList,DeleteCases[Flatten[kasteleyn],0]]];
Sort[Join[doubleslist,Variables[Complement[kasteleynterms,Variables[kasteleynterms]]]]]
];

getEdgesBFTformQ[topleft_,topright_,bottomleft_,bottomright_]:=Block[{kasteleyn},
kasteleyn=joinupKasteleyn[topleft,topright,bottomleft,bottomright];
Complement[Variables[kasteleyn],Cases[Variables[kasteleyn],_[_Integer,_Integer]]]==={}
];

getKasteleynConsistencyViolation[topleft_,topright_,bottomleft_,bottomright_]:=Block[{kasteleyn,tocheck,rowsOK,columnsOK,consistencyviolation},
If[getEdgesBFTformQ[topleft,topright,bottomleft,bottomright],
kasteleyn=joinupKasteleyn[topleft,topright,bottomleft,bottomright];
(*First check the rows of the Kasteleyn matrix corresponding to internal white nodes*)
tocheck=kasteleyn[[Range[Length[topleft]]]];
rowsOK=Map[(#[[1]]-#[[2]])===ConstantArray[0,Length[#[[1]]]]&,Map[Sort,Map[Transpose,DeleteCases[Map[{#[[1]],#[[2]]}&,Map[Variables,tocheck],{2}],{}]],{2}]];
(*Now check the columns of the Kasteleyn matrix corresponding to internal black nodes*)
tocheck=Transpose[kasteleyn[[All,Range[Dimensions[Join[topleft,bottomleft]][[2]]]]]];
columnsOK=Map[(#[[1]]-#[[2]])===ConstantArray[0,Length[#[[1]]]]&,Map[Sort,Map[Transpose,DeleteCases[Map[{#[[1]],#[[2]]}&,Map[Variables,tocheck],{2}],{}]],{2}]];
consistencyviolation={Flatten[Position[rowsOK,False]],Flatten[Position[columnsOK,False]]};
,consistencyviolation=Null;
];
consistencyviolation
];

getKasteleynCheckQ[topleft_,topright_,bottomleft_,bottomright_,BFTgraph_]:=Block[{return,badedges,indexmistakes},
return=True;
(*First check that the field hasn't been entered in twice*)
badedges=getDuplicateEdges[topleft,topright,bottomleft,bottomright];
If[badedges=!={},
(*if there are obvious mistakes, write them out*)
return=False;
Print["Check Kasteleyn: edges ",badedges," appear incorrectly."];
,If[BFTgraph,(*if there are no obvious mistakes, do more checks if we have a BFT graph*)
If[getEdgesBFTformQ[topleft,topright,bottomleft,bottomright],(*if the edges have the correct structure _[_Integer,_Integer] check for index mistakes*)
indexmistakes=getKasteleynConsistencyViolation[topleft,topright,bottomleft,bottomright];
If[indexmistakes=!={{},{}},(*if we have index mistakes, point them out*)
return=False;
Print["There appears to be a mistake in the index structure in rows ",indexmistakes[[1]]," of the Kasteleyn."];
Print["There appears to be a mistake in the index structure in columns ",indexmistakes[[2]]," of the Kasteleyn."];
];
,return=False;(*we have a BFT with no doubles, but whose fields are not all in the right form*)
Print["Some edges have not been inputted in the correct form of _[_Integer,_Integer]."];
];
];
];
return
];


(*General functions for bipartita analysis*)


perfectMatchings[topleft_,topright_,bottomleft_,bottomright_]:=perfectMatchings[topleft,topright,bottomleft,bottomright,False,False];
perfectMatchings[topleft_,topright_,bottomleft_,bottomright_,checkneeded_]:=perfectMatchings[topleft,topright,bottomleft,bottomright,checkneeded,False];
perfectMatchings[topleft_,topright_,bottomleft_,bottomright_,checkneeded_,BFTgraph_]:=Block[{checkOK,externalrows,externalcolumns,rowandcolumnnumbers,rowsmergedonleftandright,newtonpolynomial,perfectmatchigns,zz},
checkOK=True;
If[checkneeded==True,
checkOK=getKasteleynCheckQ[topleft,topright,bottomleft,bottomright,BFTgraph];
];
If[checkOK==True,
If[Length[topleft]+Length[bottomleft]==0,
perfectmatchigns={};
,(*get all subsets of rows in bottomleft, and columns in topright*)
externalrows=Subsets[Range[Length[bottomleft]]];
externalcolumns=Subsets[Range[Dimensions[Join[topright,bottomright]][[2]]]];
(*Put these choices together, and only include those combinations that, when joined with topleft, leave a square matrix*)
rowandcolumnnumbers=Cases[Tuples[{externalrows,externalcolumns}],z_/;Equal@@(Map[Length,z]+{Length[topleft],Dimensions[Join[topleft,bottomleft]][[2]]})];
(*For each case, merge topleft and the chosen rows of bottonleft. Also, merge the chosen columns of topright with the chosen columns and rows of bottomright.*)
rowsmergedonleftandright=Map[{Join[topleft,bottomleft[[#[[1]]]]],Join[topright[[All,#[[2]]]],bottomright[[#[[1]],#[[2]]]]]}&,rowandcolumnnumbers];
(*Now merge each case into a square matrix and compute its determinant. Then add up all the determinants.*)
rowsmergedonleftandright=DeleteCases[rowsmergedonleftandright,{{},{}}];
newtonpolynomial=Total[Map[Det[Join[#[[1]],#[[2]],2]]&,rowsmergedonleftandright]];
(*Tidy up the signs, since perfect matchings are positive*)
perfectmatchigns=Sort[MonomialList[newtonpolynomial]/.{Times[-1,zz_]->Times[zz]}];
If[perfectmatchigns==={0},(*in case there are no perfect matchings*)
perfectmatchigns={};
];
];
,perfectmatchigns=Null;
];
If[functionMemory,perfectMatchings[topleft,topright,bottomleft,bottomright,checkneeded,BFTgraph]=perfectmatchigns;];
perfectmatchigns
];

matchingPolytope[topleft_,topright_,bottomleft_,bottomright_]:=matchingPolytope[topleft,topright,bottomleft,bottomright,False,False];
matchingPolytope[topleft_,topright_,bottomleft_,bottomright_,checkneeded_]:=matchingPolytope[topleft,topright,bottomleft,bottomright,checkneeded,False];
matchingPolytope[topleft_,topright_,bottomleft_,bottomright_,checkneeded_,BFTgraph_]:=Block[{varlist,plist,pmatrix},
varlist=Variables[joinupKasteleyn[topleft,topright,bottomleft,bottomright]];
plist=perfectMatchings[topleft,topright,bottomleft,bottomright,checkneeded,BFTgraph];
If[plist=!=Null,
pmatrix=Table[MemberQ[Variables[plist[[jjj]]],varlist[[iii]]],{iii,Length[varlist]},{jjj,Length[plist]}]/.{True->1,False->0};
,pmatrix=Null;
];
If[functionMemory,matchingPolytope[topleft,topright,bottomleft,bottomright,checkneeded,BFTgraph]=pmatrix;];
pmatrix
];

survivingPerfectMatchings[topleft_,topright_,bottomleft_,bottomright_,edgelist_,checkneeded_:False,BFTgraph_:False]:=Block[{varlist,rowstokill,pmatrix,survivingcolums},
varlist=Variables[joinupKasteleyn[topleft,topright,bottomleft,bottomright]];
rowstokill=Flatten[Position[varlist,Alternatives@@edgelist]];
pmatrix=matchingPolytope[topleft,topright,bottomleft,bottomright,checkneeded,BFTgraph];
If[pmatrix=!=Null,
survivingcolums=Complement[Range[Dimensions[pmatrix][[2]]],Map[#[[2]]&,Position[pmatrix[[rowstokill]],1]]];
,survivingcolums=Null;
];
survivingcolums
];

matroidPolytope[topleft_,topright_,bottomleft_,bottomright_]:=matroidPolytope[topleft,topright,bottomleft,bottomright,False,False];
matroidPolytope[topleft_,topright_,bottomleft_,bottomright_,checkneeded_]:=matroidPolytope[topleft,topright,bottomleft,bottomright,checkneeded,False];
matroidPolytope[topleft_,topright_,bottomleft_,bottomright_,checkneeded_,BFTgraph_]:=Block[{pmatrix,externaledges,externalrows,matroidpoly},
pmatrix=matchingPolytope[topleft,topright,bottomleft,bottomright,checkneeded,BFTgraph];
If[pmatrix=!=Null,
(*Only select those rows corresponding to external edges in the graph*)
externaledges=Variables[Join[bottomleft,topright]];
externalrows=Flatten[Position[Variables[joinupKasteleyn[topleft,topright,bottomleft,bottomright]],Alternatives@@externaledges]];
matroidpoly=pmatrix[[externalrows]];
If[matroidpoly==={},
matroidpoly={ConstantArray[0,Dimensions[pmatrix][[2]]]};
];
,matroidpoly=Null;
];
If[functionMemory,matroidPolytope[topleft,topright,bottomleft,bottomright,checkneeded,BFTgraph]=matroidpoly;];
matroidpoly
];

moduliSpaceBFT[topleft_,topright_,bottomleft_,bottomright_,gauging_,checkneeded_:False,inputBFTgraph_:False]/;(gauging===1||gauging===2):=Block[{BFTgraph,modulispace,matrixP,chargesFterm,gaugeCharge,edges,intfaces,gaugechargematrix,chargesDterm},
If[gauging==1,
BFTgraph=True;
,BFTgraph=inputBFTgraph;
];
If[gauging==2,
modulispace=matroidPolytope[topleft,topright,bottomleft,bottomright,checkneeded,BFTgraph];
,If[gauging==1,
(*gauging 1 only works for graphs of BFT type, i.e. where the edges are labeled according to the faces they touch*)
matrixP=matchingPolytope[topleft,topright,bottomleft,bottomright,checkneeded,True];
If[matrixP=!=Null,
If[Dimensions[matrixP][[2]]>0,
chargesFterm=NullSpace[matrixP];
If[chargesFterm==={},
chargesFterm=ConstantArray[0,{1,Dimensions[matrixP][[2]]}];
];
gaugeCharge=Function[{edge,column},Block[{output=0},If[edge[[1]]==column,output=output+1;];If[edge[[2]]==column,output=output-1;];output]];
edges=Variables[joinupKasteleyn[topleft,topright,bottomleft,bottomright]];
intfaces=getInternalFaceLabels[topleft,topright,bottomleft,bottomright];
If[intfaces=!={},
gaugechargematrix=Table[gaugeCharge[edges[[iii]],intfaces[[jjj]]],{iii,Length[edges]},{jjj,Length[intfaces]}];
chargesDterm=Transpose[LinearSolve[matrixP,gaugechargematrix]];
,chargesDterm={};
];
modulispace=NullSpace[Join[chargesFterm,chargesDterm]];
If[modulispace==={},
modulispace={ConstantArray[0,Dimensions[matrixP][[2]]]};
];
,modulispace={{}};
];
,modulispace=Null;
];
];
];
modulispace
];

dimensionPolytope[mat_]:=Block[{dimension,newmat},
If[MemberQ[Dimensions[mat],0],
dimension=0;
,If[MemberQ[Transpose[mat],ConstantArray[0,Length[mat]]],
(*If the matrix has a column of zeros, the matrix rank gives you the dimension. Otherwise you need to shift the matrix so that a vertex is at the origin.*)
dimension=MatrixRank[mat];
,newmat=mat-mat[[All,1]];(*this operation automatically threads over all the columns of the matrix.*)
dimension=MatrixRank[newmat];
];
];
dimension
];

turnIntoPolytope[mat_]:=Block[{columnsandmultiplicity,polytope,multiplicity},
If[mat==={}||Dimensions[mat][[2]]==0,
polytope=mat;
multiplicity={};
,columnsandmultiplicity=Tally[Transpose[mat]];
polytope=Transpose[Map[#[[1]]&,columnsandmultiplicity]];
multiplicity=Map[#[[2]]&,columnsandmultiplicity];
];
{polytope,multiplicity}
];

lowNumberLoopsPMpos[topleft_,topright_,bottomleft_,bottomright_]:=Block[{matroidpoly,multiplicitypolytope,perfmatchnumber},
matroidpoly=matroidPolytope[topleft,topright,bottomleft,bottomright];
multiplicitypolytope=turnIntoPolytope[matroidpoly];
perfmatchnumber=Position[Transpose[matroidpoly],multiplicitypolytope[[1]][[All,Ordering[multiplicitypolytope[[2]]][[1]]]]][[1,1]];
perfmatchnumber
];

reducibilityBFTQ[topleft_,topright_,bottomleft_,bottomright_,gauging_:2,checkneeded_:False,inputBFTgraph_:False]/;(gauging===1||gauging===2):=Block[{BFTgraph,oktoproceed,pmatrix,modulispace,fullspacetranspose,modulitranspose,fullspaceshort,reducibility},
If[gauging==1,
BFTgraph=True;
,BFTgraph=inputBFTgraph;
];
oktoproceed=True;
If[checkneeded,
oktoproceed=getKasteleynCheckQ[topleft,topright,bottomleft,bottomright,BFTgraph];
];
If[oktoproceed,
If[bubblesQ[topleft,topright,bottomleft,bottomright,BFTgraph,gauging]===True,(*if there are bubbles, the graph is definitely reducible*)
reducibility=True;
,pmatrix=matchingPolytope[topleft,topright,bottomleft,bottomright,checkneeded,BFTgraph];
modulispace=moduliSpaceBFT[topleft,topright,bottomleft,bottomright,gauging,checkneeded,BFTgraph];
If[pmatrix=!=Null&&modulispace=!=Null,
If[Dimensions[pmatrix][[2]]==0&&Length[pmatrix]>0,
reducibility=True;
,fullspacetranspose=Transpose[pmatrix];
modulitranspose=Transpose[modulispace];
(*Now we must multiply together those columns of the pmatrix that project to the same coordinates in the moduli space*)
fullspaceshort=Transpose[Map[Times@@fullspacetranspose[[Flatten[Position[modulitranspose,#]]]]&,DeleteDuplicates[modulitranspose]]];
If[MemberQ[fullspaceshort,ConstantArray[0,Dimensions[fullspaceshort][[2]]]],reducibility=True;,reducibility=False;];
];
,reducibility=Null;
];
];
,reducibility=Null;
];
reducibility
];

reducibilityBFTedges[topleft_,topright_,bottomleft_,bottomright_,gauging_:2,checkneeded_:False,inputBFTgraph_:False]/;(gauging===1||gauging===2):=Block[{BFTgraph,pmatrix,modulispace,fullspacetranspose,modulitranspose,fullspaceshort,problemlines,reducibilityedges},
If[gauging==1,
BFTgraph=True;
,BFTgraph=inputBFTgraph;
];
pmatrix=matchingPolytope[topleft,topright,bottomleft,bottomright,checkneeded,BFTgraph];
modulispace=moduliSpaceBFT[topleft,topright,bottomleft,bottomright,gauging,checkneeded,BFTgraph];
If[pmatrix=!=Null&&modulispace=!=Null,
If[Dimensions[pmatrix][[2]]==0&&Length[pmatrix]>0,
reducibilityedges=Variables[joinupKasteleyn[topleft,topright,bottomleft,bottomright]];
,fullspacetranspose=Transpose[pmatrix];
modulitranspose=Transpose[modulispace];
(*Now we must multiply together those columns of the pmatrix that project to the same coordinates in the moduli space*)
fullspaceshort=Transpose[Map[Times@@fullspacetranspose[[Flatten[Position[modulitranspose,#]]]]&,DeleteDuplicates[modulitranspose]]];
problemlines=Flatten[Position[fullspaceshort,ConstantArray[0,Dimensions[fullspaceshort][[2]]]]];
reducibilityedges=Variables[joinupKasteleyn[topleft,topright,bottomleft,bottomright]][[problemlines]];
];
,reducibilityedges=Null;
];
reducibilityedges
];

consistentEdgeRemoval[topleft_,topright_,bottomleft_,bottomright_,edgelist_,checkneeded_:False,BFTgraph_:False]:=Block[{varlist,rowstokill,pmatrix,survivingcolums,reducedpmatrix,consistentedgelist},
varlist=Variables[joinupKasteleyn[topleft,topright,bottomleft,bottomright]];
rowstokill=Flatten[Position[varlist,Alternatives@@edgelist]];
pmatrix=matchingPolytope[topleft,topright,bottomleft,bottomright,checkneeded,BFTgraph];
If[pmatrix=!=Null,
survivingcolums=Complement[Range[Dimensions[pmatrix][[2]]],Map[#[[2]]&,Position[pmatrix[[rowstokill]],1]]];
reducedpmatrix=pmatrix[[All,survivingcolums]];
consistentedgelist=varlist[[Flatten[Position[reducedpmatrix,ConstantArray[0,Dimensions[reducedpmatrix][[2]]]]]]];
,consistentedgelist=Null;
];
consistentedgelist
];

reductionGraphBFT[topleft_,topright_,bottomleft_,bottomright_,gauging_,checkneeded_:False,inputBFTgraph_:False]/;(gauging===1||gauging===2):=Block[{BFTgraph,edges,modulispace,numpointsmodulispace,comboremove,edgereductions,comboremovnextlevel,ii},
If[gauging==1,
BFTgraph=True;
,BFTgraph=inputBFTgraph;
];
(*First check which edges can be removed without affecting the moduli space*)
edges=reducibilityBFTedges[topleft,topright,bottomleft,bottomright,gauging,checkneeded,BFTgraph];
If[edges=!=Null,
(*We will want to find those sets of edges which, when removed, do not change the number of points in the moduli space*)
modulispace=moduliSpaceBFT[topleft,topright,bottomleft,bottomright,gauging,False,BFTgraph];
numpointsmodulispace=Length[Tally[Transpose[modulispace]]];
comboremove=Subsets[edges,{1}];
edgereductions=comboremove;
(*Try and remove pairs of edges. In each case, we might need to remove additional edges for a consistent edge removal (this won't affect anything)*)
comboremovnextlevel=Subsets[edges,{2}];
(*In each case check whether the number of points in the moduli space is the same*)
comboremovnextlevel=Cases[comboremovnextlevel,zz_/;Length[Tally[Transpose[modulispace[[All,survivingPerfectMatchings[topleft,topright,bottomleft,bottomright,zz,False,BFTgraph]]]]]]==numpointsmodulispace];
(*If it's possible to remove pairs of edges without changing the moduli space, it might be possible to remove 3 edges at a time, and so on*)
If[comboremovnextlevel=!={},
For[ii=3,ii<=Length[edges]+1,ii++,
edgereductions=Join[edgereductions,comboremovnextlevel];
comboremovnextlevel=Subsets[edges,{ii}];
comboremovnextlevel=Cases[comboremovnextlevel,zz_/;Length[Tally[Transpose[modulispace[[All,survivingPerfectMatchings[topleft,topright,bottomleft,bottomright,zz,False,BFTgraph]]]]]]==numpointsmodulispace];
(*If no cases managed to preserve the number of points in the matroid polytope, stop here. comboremove contains the last viable choices for edge removals*)
If[comboremovnextlevel==={},
Break[];
];
];
];
edgereductions=Map[consistentEdgeRemoval[topleft,topright,bottomleft,bottomright,#,False,BFTgraph]&,edgereductions];
,edgereductions=Null;(*there was some problem with the Kasteleyn*)
];
edgereductions
];

edgeOrderings[edges_,currentedge_]:=Module[{orderings,ii},
(*Start with our current edge.*)
orderings={{edges[[1]]}};
(*The next edge should have the structure _[currentedge[[2]],_]. There may however be multiple alternatives of this type, and not all of them are viable edge orderings that all match up. For each alternative, try it out by adding this alternative onto {currentedge}. Ultimately we only want to keep those alternatives that match up.*)
For[ii=1,ii<Length[edges],ii++,
(*orderings contains a list of orderings. In each case, try and tag on another edge that makes sense. If there are none that make sense, this chain of edges wasn't a viable option for edge orderings, and this thread will get killed (because the MapThread function will take an empty list, and it will Map a Join function on each element of the empty list, which returns an empty list. "Sequence" then destroys it).*)
orderings=MapThread[Sequence@@Function[{input1,input2},Map[Join[input1,{#}]&,input2]][#1,#2]&,{orderings,Map[Cases[Complement[edges,#],_[Last[#][[2]],_]]&,orderings]}];
];
orderings=Map[RotateLeft[#,Position[#,currentedge][[1,1]]]&,orderings];
orderings
];

cyclicEdgeOrderings[edges_,currentedge_]:=Module[{listSubtraction,orderings,remainingedges,ii},
(*Make a function that takes a list and subtracts away the elements from a second list*)
listSubtraction=Function[{listtoremovefrom,listofremoveditems},
Block[{newlist,newremovelist,jj},
newlist=listtoremovefrom;
newremovelist=listofremoveditems;
For[jj=1,jj<=Length[listofremoveditems],jj++,
newlist=Delete[newlist,Position[newlist,newremovelist[[1]]][[1]]];
newremovelist=Delete[newremovelist,{1}]
];
newlist]
];
(*Start with our current edge.*)
orderings={{currentedge}};
(*In each ordering, we have used up a certain set of edges, so we'll also keep track of which edges remain available to us*)
remainingedges=Map[listSubtraction[edges,#]&,orderings];
(*The next edge should have the structure _[currentedge[[2]],_]. There may however be multiple alternatives of this type, and not all of them are viable edge orderings that all match up. For each alternative, try it out by adding this alternative onto {currentedge}. Ultimately we only want to keep those alternatives that match up.*)
For[ii=1,ii<Length[edges],ii++,
orderings=MapThread[Sequence@@Function[{input1,input2},Map[Join[input1,{#}]&,input2]][#1,Cases[#2,_[Last[#1][[2]],_]]]&,{orderings,remainingedges}];
remainingedges=Map[listSubtraction[edges,#]&,orderings];
];
orderings
];

nextStepBlackToWhite[topleftbottomleft_,currentedge_,currentposition_,notallowededges_]:=Block[{nextedges,nextedge,nextedgepos},
nextedges=edgeOrderings[Variables[topleftbottomleft[[All,currentposition[[2]]]]],currentedge][[1]];
nextedges=DeleteCases[nextedges,Alternatives@@notallowededges];
nextedge=nextedges[[1]];
nextedgepos=Position[topleftbottomleft,nextedge][[1]];
{nextedge,nextedgepos}
];

nextStepWhiteToBlack[toplefttopright_,currentedge_,currentposition_,notallowededges_]:=Block[{nextedges,nextedge,nextedgepos},
nextedges=edgeOrderings[Variables[toplefttopright[[currentposition[[1]]]]],currentedge][[1]];
nextedges=DeleteCases[nextedges,Alternatives@@notallowededges];
nextedge=nextedges[[1]];
nextedgepos=Position[toplefttopright,nextedge][[1]];
{nextedge,nextedgepos}
];

nextStepBlackToWhiteInternalZigzag[topleftbottomleft_,currentedge_,currentposition_,notallowededges_,startingedge_]:=Block[{nextedges,nextedge,nextedgepos},
nextedges=edgeOrderings[Variables[topleftbottomleft[[All,currentposition[[2]]]]],currentedge][[1]];
If[nextedges[[1]]=!=startingedge,
nextedges=DeleteCases[nextedges,Alternatives@@notallowededges]
];
nextedge=nextedges[[1]];
nextedgepos=Position[topleftbottomleft,nextedge][[1]];
{nextedge,nextedgepos}
];

nextStepWhiteToBlackInternalZigzag[toplefttopright_,currentedge_,currentposition_,notallowededges_,startingedge_]:=Block[{nextedges,nextedge,nextedgepos},
nextedges=edgeOrderings[Variables[toplefttopright[[currentposition[[1]]]]],currentedge][[1]];
If[nextedges[[1]]=!=startingedge,
nextedges=DeleteCases[nextedges,Alternatives@@notallowededges]
];
nextedge=nextedges[[1]];
nextedgepos=Position[toplefttopright,nextedge][[1]];
{nextedge,nextedgepos}
];

internalZigZagNumeratorDenominator[topleft_,topright_,bottomleft_,bottomright_,startingedge_,numeratorstart_:True,alreadytakenedges_:{{},{}}]:=Block[{blacktowhitematrix,whitetoblackmatrix,kasteleyn,allnumeratoredges,alldenominatoredges,numeratoredges,denominatoredges,currentedge,currentposition},
blacktowhitematrix=Join[topleft,bottomleft];
If[Length[topleft]>0,
whitetoblackmatrix=Join[topleft,topright,2];
,whitetoblackmatrix={};
];
kasteleyn=joinupKasteleyn[topleft,topright,bottomleft,bottomright];
{allnumeratoredges,alldenominatoredges}=alreadytakenedges;
If[numeratorstart,
numeratoredges={startingedge};
allnumeratoredges=Append[allnumeratoredges,startingedge];
denominatoredges={};
,numeratoredges={};
denominatoredges={startingedge};
alldenominatoredges=Append[alldenominatoredges,startingedge];
];
currentedge=startingedge;
currentposition=Position[kasteleyn,currentedge][[1]];

If[numeratorstart,
(*We will first need to go from a black vertex to a white vertex, then from black to white, and so on, until reaching the starting point*)
While[True,
(*Now run along the column to find another edge whose first index is our currentedge's second index*)
{currentedge,currentposition}=nextStepBlackToWhiteInternalZigzag[blacktowhitematrix,currentedge,currentposition,alldenominatoredges,startingedge];
(*This new edge should be placed in the denominator in the zig-zag expression*)
denominatoredges=Append[denominatoredges,currentedge];
alldenominatoredges=Append[alldenominatoredges,startingedge];
(*Now run along the row to find another edge whose first index is our currentedge's second index*)
{currentedge,currentposition}=nextStepWhiteToBlackInternalZigzag[whitetoblackmatrix,currentedge,currentposition,allnumeratoredges,startingedge];
If[currentedge===startingedge,
Break[];
];
(*This new edge should be placed in the numerator in the zig-zag expression*)
numeratoredges=Append[numeratoredges,currentedge];
allnumeratoredges=Append[allnumeratoredges,startingedge];
];
,(*We will first need to go from a white vertex to a black vertex, then from white to black, and so on, until reaching the starting point*)
While[True,
(*Now run along the row to find another edge whose first index is our currentedge's second index*)
{currentedge,currentposition}=nextStepWhiteToBlackInternalZigzag[whitetoblackmatrix,currentedge,currentposition,allnumeratoredges,startingedge];
(*This new edge should be placed in the numerator in the zig-zag expression*)
numeratoredges=Append[numeratoredges,currentedge];
allnumeratoredges=Append[allnumeratoredges,startingedge];
(*Now run along the column to find another edge whose first index is our currentedge's second index*)
{currentedge,currentposition}=nextStepBlackToWhiteInternalZigzag[blacktowhitematrix,currentedge,currentposition,alldenominatoredges,startingedge];
If[currentedge===startingedge,
Break[];
];
(*This new edge should be placed in the denominator in the zig-zag expression*)
denominatoredges=Append[denominatoredges,currentedge];
alldenominatoredges=Append[alldenominatoredges,startingedge];
];
];
{numeratoredges,denominatoredges}
];

zigZagNumeratorsDenominators[topleft_,topright_,bottomleft_,bottomright_]:=Module[{kasteleyn,bottomleftvars,toprightvars,blacktowhitematrix,whitetoblackmatrix,zigZagFromExternalWhiteNode,zigZagFromExternalBlackNode,bottomleftzigzags,toprightzigzags,allnumeratoredges,alldenominatoredges,internalzigzagedges,internalzigzags,internalzigzag,allzigzags},
kasteleyn=joinupKasteleyn[topleft,topright,bottomleft,bottomright];
bottomleftvars=Variables[bottomleft];
toprightvars=Variables[topright];
blacktowhitematrix=Join[topleft,bottomleft];
If[Length[topleft]>0,
whitetoblackmatrix=Join[topleft,topright,2];
,whitetoblackmatrix={};
];
(*We will begin by making a function that can give a zig-zag which starts from an external white node.*)
allnumeratoredges={};
alldenominatoredges={};
zigZagFromExternalWhiteNode=Function[{startingedge},Block[{currentedge,currentposition,denominatoredges,numeratoredges},
numeratoredges={startingedge};
allnumeratoredges=Append[allnumeratoredges,startingedge];
denominatoredges={};
currentedge=startingedge;
currentposition=Position[kasteleyn,currentedge][[1]];
While[True,
(*Now run along the column to find another edge whose first index is our currentedge's second index*)
{currentedge,currentposition}=nextStepBlackToWhite[blacktowhitematrix,currentedge,currentposition,alldenominatoredges];
(*This new edge should be placed in the denominator in the zig-zag expression*)
denominatoredges=Append[denominatoredges,currentedge];
alldenominatoredges=Append[alldenominatoredges,currentedge];
(*If we've reached another external node, we've finished the zig-zag*)
If[MemberQ[Join[bottomleftvars,toprightvars],currentedge],
Break[];
];
(*Now run along the row to find another edge whose first index is our currentedge's second index*)
{currentedge,currentposition}=nextStepWhiteToBlack[whitetoblackmatrix,currentedge,currentposition,allnumeratoredges];
(*This new edge should be placed in the numerator in the zig-zag expression*)
numeratoredges=Append[numeratoredges,currentedge];
allnumeratoredges=Append[allnumeratoredges,currentedge];
If[MemberQ[Join[bottomleftvars,toprightvars],currentedge],
Break[];
];
];
{numeratoredges,denominatoredges}]
];
zigZagFromExternalBlackNode=Function[{startingedge},Block[{currentedge,currentposition,denominatoredges,numeratoredges},
numeratoredges={};
denominatoredges={startingedge};
alldenominatoredges=Append[alldenominatoredges,startingedge];
currentedge=startingedge;
currentposition=Position[kasteleyn,currentedge][[1]];
While[True,
{currentedge,currentposition}=nextStepWhiteToBlack[whitetoblackmatrix,currentedge,currentposition,allnumeratoredges];
numeratoredges=Append[numeratoredges,currentedge];
allnumeratoredges=Append[allnumeratoredges,currentedge];
If[MemberQ[Join[bottomleftvars,toprightvars],currentedge],
Break[];
];
{currentedge,currentposition}=nextStepBlackToWhite[blacktowhitematrix,currentedge,currentposition,alldenominatoredges];
denominatoredges=Append[denominatoredges,currentedge];
alldenominatoredges=Append[alldenominatoredges,currentedge];
If[MemberQ[Join[bottomleftvars,toprightvars],currentedge],
Break[];
];
];
{numeratoredges,denominatoredges}]
];
(*Start from each of the external nodes and make the zig-zags that begin there.*)
bottomleftzigzags=Map[zigZagFromExternalWhiteNode[#]&,bottomleftvars];
toprightzigzags=Map[zigZagFromExternalBlackNode[#]&,toprightvars];
allnumeratoredges=Sort[allnumeratoredges];
alldenominatoredges=Sort[alldenominatoredges];
(*If there are any edges that do not appear in any of the numerators, we must have a zig-zag path which is purely internal*)
(*Start from each of the edges that are missing a zig-zag, and create the internal zig-zags that run over this edge*)
internalzigzagedges=Complement[Variables[kasteleyn],allnumeratoredges];
internalzigzags={};
While[internalzigzagedges=!={},
internalzigzag=internalZigZagNumeratorDenominator[topleft,topright,bottomleft,bottomright,internalzigzagedges[[1]],True,{allnumeratoredges,alldenominatoredges}];
internalzigzags=Append[internalzigzags,internalzigzag];
allnumeratoredges=Join[allnumeratoredges,internalzigzag[[1]]];
alldenominatoredges=Join[alldenominatoredges,internalzigzag[[2]]];
internalzigzagedges=Complement[Variables[kasteleyn],allnumeratoredges];
];
(*There shouldn't be, but just in case also look at edge in the denominator in case there's some zig-zag we're missing*)
internalzigzagedges=Complement[Variables[kasteleyn],alldenominatoredges];
While[internalzigzagedges=!={},
internalzigzag=internalZigZagNumeratorDenominator[topleft,topright,bottomleft,bottomright,internalzigzagedges[[1]],False,{allnumeratoredges,alldenominatoredges}];
internalzigzags=Append[internalzigzags,internalzigzag];
allnumeratoredges=Join[allnumeratoredges,internalzigzag[[1]]];
alldenominatoredges=Join[alldenominatoredges,internalzigzag[[2]]];
internalzigzagedges=Complement[Variables[kasteleyn],alldenominatoredges];
];
(*Now all edges have appeared in the numerator of some zig-zag and the denominator of some (possibly the same) zig-zag*)
allzigzags=Join[bottomleftzigzags,toprightzigzags,internalzigzags];
(*If there are any edges that do not appear in the actual expressions for the zig-zags, it means we have a self-intersecting zig-zag*)
allzigzags
];

zigZags[topleft_,topright_,bottomleft_,bottomright_,invertedrule_:False]:=Block[{graphOK,allzigzags,zigzagexpressions},
graphOK=getKasteleynCheckQ[topleft,topright,bottomleft,bottomright,True];
If[graphOK,
allzigzags=zigZagNumeratorsDenominators[topleft,topright,bottomleft,bottomright];
zigzagexpressions=Map[(Times@@#[[1]])/(Times@@#[[2]])&,allzigzags];
(*If we want to turn right at white nodes and left at black nodes, all the zig-zags are inverted*)
If[invertedrule,
zigzagexpressions=Map[1/#&,zigzagexpressions];
];
,Print["The graph must be of BFT type for this function to work: edges must be of the form _[_Integer,_Integer] and be labeled according the numbering of faces."];
zigzagexpressions=Null;
];
zigzagexpressions
];

selfIntersectingZigZagsQ[topleft_,topright_,bottomleft_,bottomright_]:=Block[{graphOK,allzigzags,selfintersectingzigzags,selfintersections},
graphOK=getKasteleynCheckQ[topleft,topright,bottomleft,bottomright,True];
If[graphOK,
allzigzags=zigZagNumeratorsDenominators[topleft,topright,bottomleft,bottomright];
(*If an edge is both in the numerator and the denominator, we have a self-intersection*)
selfintersectingzigzags=Cases[allzigzags,zz_/;Length[Intersection[zz[[1]],zz[[2]]]]>0];
If[Length[selfintersectingzigzags]=!=0,
selfintersections=True;
,selfintersections=False;
];
,Print["The graph must be of BFT type for this function to work: edges must be of the form _[_Integer,_Integer] and be labeled according the numbering of faces."];
selfintersections=Null;
];
selfintersections
];

badDoubleCrossingZigZagPairs[topleft_,topright_,bottomleft_,bottomright_]:=Module[{graphOK,threadJointheLists,allzigzags,internalzigzags,allzigzagpairs,doubleCrossingQ,doublecrossings},
graphOK=getKasteleynCheckQ[topleft,topright,bottomleft,bottomright,True];
If[graphOK,
(*We begin by making all edges in the zig-zags appear in chronological order*)
(*Note for improvement - It may be that threadJointheLists can be replaced by the in-built Riffle function*)
threadJointheLists=Function[{numerator,denominator},
Block[{list1,list2},
If[Length[numerator]>=Length[denominator],
list1=Flatten[Transpose[{numerator,numerator}]];
list2=denominator;
,list1=Flatten[Transpose[{denominator,denominator}]];
list2=numerator;
];
(*Interweave the two lists*)
list1[[Range[2,2Length[list2],2]]]=list2;
list1=PadRight[list1,Length[numerator]+Length[denominator]];
(*If the numerator and the denominator had the same number of edges, we don't know which edge should come first, so we'll need to check that the index structure is all correct*)
If[Length[numerator]==Length[denominator],
If[(And@@Map[Equal@@#&,Partition[Drop[Drop[Flatten[Map[List@@#&,list1]],1],-1],2]])==False,
(*The index structure wasn't correct, and we should have started with the first edge in the denominator*)
list1=Flatten[Transpose[{numerator,numerator}]];
list2=denominator;
list1[[Range[1,2Length[list2],2]]]=list2;
list1=PadRight[list1,Length[numerator]+Length[list2]];
];
];If[(And@@Map[Equal@@#&,Partition[Drop[Drop[Flatten[Map[List@@#&,list1]],1],-1],2]])==False,Print["We somehow still messed up!"];];
list1]
];
allzigzags=zigZagNumeratorsDenominators[topleft,topright,bottomleft,bottomright];
allzigzags=Map[threadJointheLists[#[[1]],#[[2]]]&,allzigzags];
(*Now we have the chronological list of edges in each zig-zag. We need to now look at the pairwise intersections between them to determine whether we have "bad double crossings"*)
(*Since internal zig-zags are cyclic, we will write out two cycles of them, so that multiple intersections can be seen to occur chronologically correctly*)
internalzigzags=Cases[allzigzags,zz_/;Intersection[zz,Variables[Join[bottomleft,topright]]]==={}];
allzigzags=allzigzags/.Map[#->Join[#,#]&,internalzigzags];
allzigzagpairs=Subsets[allzigzags,{2}];
doubleCrossingQ=Function[{zigzag1,zigzag2},
Block[{intersectionvars,zig1intersectionpairs,zig2intersections,badcrossing},
intersectionvars=Alternatives@@Intersection[zigzag1,zigzag2];
(*Look at all pairs of variables in zigzag1 and see whether they appear in the same order*)
zig1intersectionpairs=Subsets[Cases[zigzag1,intersectionvars],{2}];
zig2intersections=Cases[zigzag2,intersectionvars];
badcrossing=Or@@Map[Cases[zig2intersections[[Range[Position[zig2intersections,#[[1]]][[1,1]],Length[zig2intersections]]]],#[[2]]]=!={}&,zig1intersectionpairs];
badcrossing]
];
doublecrossings=Cases[allzigzagpairs,zz_/;doubleCrossingQ@@zz];
,Print["The graph must be of BFT type for this function to work: edges must be of the form _[_Integer,_Integer] and be labeled according the numbering of faces."];
doublecrossings=Null;
];
doublecrossings
];

badDoubleCrossingZigZagQ[topleft_,topright_,bottomleft_,bottomright_]:=Block[{baddoublecrossings,return},
baddoublecrossings=badDoubleCrossingZigZagPairs[topleft,topright,bottomleft,bottomright];
If[baddoublecrossings=!=Null,
return=baddoublecrossings=!={};
,return=Null;];
return
];

zigZagsAsPerfectMatchings[topleft_,topright_,bottomleft_,bottomright_,invertedrule_:False]:=Block[{zigzags,perfmatchings,perfmatchzigzags,ii,jj,perfmatchratio,positions,tobereplacedwith,replacementrule},
zigzags=zigZags[topleft,topright,bottomleft,bottomright,invertedrule];
If[zigzags=!=Null,
perfmatchings=perfectMatchings[topleft,topright,bottomleft,bottomright,False,True];
perfmatchzigzags=Table[{},{iii,Length[zigzags]}];
For[ii=1,ii<=Length[perfmatchings],ii++,
For[jj=1,jj<=Length[perfmatchings],jj++,
perfmatchratio=perfmatchings[[ii]]/perfmatchings[[jj]];
positions=Flatten[Position[Map[#===perfmatchratio&,zigzags],True]];
tobereplacedwith=Map[Append[#,{perfmatchings[[ii]],perfmatchings[[jj]]}]&,perfmatchzigzags[[positions]]];
replacementrule=MapThread[Rule,{positions,tobereplacedwith}];
perfmatchzigzags=ReplacePart[perfmatchzigzags,replacementrule];
];
];
,perfmatchzigzags=Null;
];
perfmatchzigzags
];

loopVariablesBasis[topleft_,topright_,bottomleft_,bottomright_,standardfacevariables_:False]:=Module[{kasteleyn,alledges,externaledges,extnodenumbers,externaledgestonodenumbers,bpaths,adjacencymat,graph,bigkasteleyn,nameUndirectedEdges,bpathvectors,directedgraph,nameDirectedEdges,edgelist,internalpaths,internalpathvectors,facenames,facevariables,facevariablevectors,internalpos,internalfacevariables,internalfacevariablevectors,externalfacevariables,externalfacevariablevectors,accountedforvectors,newpathvectors,additionalpathvectors,tosolvefor,coef,coeflist,additionalpaths,loopvariablebasis},
(*We'll begin by making all possible paths between boundaries. Some of these will correspond to external faces (or combinations thereof), but some will be paths stretching between different boundaries*)
kasteleyn=joinupKasteleyn[topleft,topright,bottomleft,bottomright];
alledges=Variables[kasteleyn];
(*We need to extract the external edges*)
externaledges=Variables[Join[bottomleft,topright]];
extnodenumbers=Flatten[Map[getExternalEdgeNodeNumbers[topleft,topright,bottomleft,bottomright,{#}]&,externaledges]];
externaledgestonodenumbers=MapThread[Rule,{externaledges,extnodenumbers}];
bpaths=Subsets[externaledges,{2}];(*For now bpaths only contain the external edges. We'll now look for the shortest path between these edges, to complete the paths between boundaries*)
adjacencymat=turnIntoAdjacencyMatrix[topleft,topright,bottomleft,bottomright];
graph=AdjacencyGraph[adjacencymat];
bpaths=Map[Table[UndirectedEdge[#[[iii]],#[[iii+1]]],{iii,Length[#]-1}]&,Map[FindShortestPath[graph,Sequence@@#]&,bpaths/.externaledgestonodenumbers]];
(*Now each boundary path is expressed as a list of edges that go from one boundary to the next. We need to turn these edges into a product of edges*)
bigkasteleyn=Join[kasteleyn,Transpose[kasteleyn]];
nameUndirectedEdges=Function[{undirectededge},
Block[{edgename,edgeweight},
edgename=(Intersection@@Map[Variables[bigkasteleyn[[#]]]&,List@@undirectededge])[[1]];
If[undirectededge[[1]]<undirectededge[[2]],
edgeweight=edgename;
,edgeweight=1/edgename;
];
edgeweight]
];
bpaths=Map[Times@@#&,Map[nameUndirectedEdges,bpaths,{2}]];
(*Now we have the paths running between boundaries, expressed as products of edge variables*)
bpathvectors=Map[Table[D[#,alledges[[iii]]],{iii,Length[alledges]}]/.Map[#->1&,alledges]&,bpaths];
(*We shall now make all internal paths. These contain internal faces, non-trivial paths around higher-genus, and products of external faces around each boundary*)
(*We start from a direct graph, as this will allow us to understand the direction of our internal loops*)
directedgraph=DirectedGraph[AdjacencyGraph[UpperTriangularize[adjacencymat]]];
nameDirectedEdges=Function[{directededge},
Block[{edgename},
edgename=(Intersection@@Map[Variables[bigkasteleyn[[#]]]&,List@@directededge])[[1]];
bigkasteleyn=bigkasteleyn/.{edgename->0};
edgename]
];
edgelist=Map[nameDirectedEdges,EdgeList[directedgraph]];(*watch out, bigkasteleyn has now changed! If you need it again, you'll need to reset it*)
internalpaths=Map[Times@@Power[edgelist,#]&,Normal[EdgeCycleMatrix[directedgraph]]];
internalpathvectors=Map[Table[D[#,alledges[[iii]]],{iii,Length[alledges]}]/.Map[#->1&,alledges]&,internalpaths];
If[standardfacevariables,
(*The only paths that we still need to make are the face variables. Some of these are included in internalpathvectors, but we don't know which so we'll make all of them*)
facenames=getFaceLabels[topleft,topright,bottomleft,bottomright];
facevariables=Map[(Times@@Cases[alledges,_[_,#]])/(Times@@Cases[alledges,_[#,_]])&,facenames];
facevariablevectors=Map[Table[D[#,alledges[[iii]]],{iii,Length[alledges]}]/.Map[#->1&,alledges]&,facevariables];
If[getNumberInternalFaces[topleft,topright,bottomleft,bottomright]>0,
internalpos=Flatten[Position[facenames,Alternatives@@getInternalFaceLabels[topleft,topright,bottomleft,bottomright]]];
,internalpos=Flatten[Position[facenames,Alternatives@@{}]];
];
internalfacevariables=facevariables[[internalpos]];
internalfacevariablevectors=facevariablevectors[[internalpos]];
externalfacevariables=Complement[facevariables,internalfacevariables];
externalfacevariablevectors=Complement[facevariablevectors,internalfacevariablevectors];
(*Since the face variables are not all independent, we'll remove one*)
If[Length[internalfacevariables]==Length[facevariables],
internalfacevariables=internalfacevariables[[Range[Length[internalfacevariables]-1]]];
internalfacevariablevectors=internalfacevariablevectors[[Range[Length[internalfacevariablevectors]-1]]];
,externalfacevariables=externalfacevariables[[Range[Length[externalfacevariables]-1]]];
externalfacevariablevectors=externalfacevariablevectors[[Range[Length[externalfacevariablevectors]-1]]];
];
(*We'll now need to see which of all our paths are independent and forms a basis*)
(*We need to give priority to facevariables, and then form the remaining paths with internalpaths and bpaths*)
(*We will want to keep the internal faces separate as they can be gauged under gauging 1*)
accountedforvectors=Join[internalfacevariablevectors,externalfacevariablevectors];(*the faces aren't all independent*)
newpathvectors=Join[internalpathvectors,bpathvectors];
,(*We need to give priority to internalpaths, as they can be gauged under gauging 2. We'll then form the remaining paths with facevariables and bpaths*)
accountedforvectors=internalpathvectors;
newpathvectors=bpathvectors;
];
additionalpathvectors={};
tosolvefor=Total[Table[coef[iii]accountedforvectors[[iii]],{iii,Length[accountedforvectors]}]];
coeflist=Table[coef[iii],{iii,Length[accountedforvectors]}];
newpathvectors=Cases[newpathvectors,zz_/;Length[Solve[tosolvefor==zz,coeflist]]==0];
While[newpathvectors=!={},
additionalpathvectors=Append[additionalpathvectors,newpathvectors[[1]]];
accountedforvectors=Prepend[accountedforvectors,newpathvectors[[1]]];
tosolvefor=tosolvefor+accountedforvectors[[1]]coef[Length[accountedforvectors]];
coeflist=Append[coeflist,coef[Length[accountedforvectors]]];
newpathvectors=Cases[newpathvectors,zz_/;Length[Solve[tosolvefor==zz,coeflist]]==0];
];
additionalpaths=Map[Times@@Power[alledges,#]&,additionalpathvectors];
If[standardfacevariables,
loopvariablebasis=Join[{internalfacevariables},{Join[externalfacevariables,additionalpaths]}];
,loopvariablebasis=Join[{internalpaths},{additionalpaths}];
];
loopvariablebasis
];

moduliLoopVariablesBFT[topleft_,topright_,bottomleft_,bottomright_,gauging_,referencematching_:Null,loopvariablebasis_:Null]/;(gauging===1||gauging===2):=Block[{perfmatchings,referenceperfmatch,basispaths,basis,kasteleyn,allvariables,perfmatchingvectors,basisvectors,tosolvefor,coef,coeflist,perfmatchingsasloops,masterspace,modulispace,internalfacenames,internalfacevariables,internalfacevariablevectors,internalfacesasbasispaths,vectorMod,modspacetranspose},
If[getEdgesBFTformQ[topleft,topright,bottomleft,bottomright],
perfmatchings=perfectMatchings[topleft,topright,bottomleft,bottomright];
If[perfmatchings=!={},
If[referencematching===Null,
referenceperfmatch=perfmatchings[[1]];
,referenceperfmatch=referencematching;
];
If[loopvariablebasis===Null,
(*make my own basis*)
If[gauging==2,
basispaths=loopVariablesBasis[topleft,topright,bottomleft,bottomright];
,basispaths=loopVariablesBasis[topleft,topright,bottomleft,bottomright,True];
];
,basispaths=loopvariablebasis;
];
(*The first part contains what we'll gauge away (e.g. the internal loops), the second contains remaining paths (e.g. external faces, or those stretching between different boundaries)*)
basis=Flatten[basispaths];
(*We'll now express each perfect matching as a vector describing which edges are present (1: in numerator; -1: in denominator; 0: absent)*)
kasteleyn=joinupKasteleyn[topleft,topright,bottomleft,bottomright];
allvariables=Variables[kasteleyn];
perfmatchingvectors=Map[Table[D[#,allvariables[[iii]]],{iii,Length[allvariables]}]/.Map[#->1&,allvariables]&,perfmatchings/referenceperfmatch];
(*We'll also express the path basis in this vectorial way*)
basisvectors=Map[Table[D[#,allvariables[[iii]]],{iii,Length[allvariables]}]/.Map[#->1&,allvariables]&,basis];
(*We can now solve for which basis vectors are required to form a given expression*)
tosolvefor=Total[Table[coef[iii]basisvectors[[iii]],{iii,Length[basisvectors]}]];coeflist=Table[coef[iii],{iii,Length[basisvectors]}];
perfmatchingsasloops=Map[#[[2]]&,Map[Solve[tosolvefor==#,coeflist][[1]]&,perfmatchingvectors],{2}];
(*We now have the expression of each perfect matching in terms of the loop basis*)
masterspace=Transpose[perfmatchingsasloops];
If[masterspace==={},
masterspace=ConstantArray[0,{1,Length[perfmatchings]}];
];
(*We need to gauge away all internal faces, and if we use gauging 2 also all internal loops. This corresponds to the first rows of the masterspace*)
If[loopvariablebasis===Null,
(*if the function made its own basis, it arranged it such that the first entry is what we'll be gauging away. Otherwise, we'll need to find what to gauge away by hand*)
modulispace=masterspace[[Range[Length[basispaths[[1]]]+1,Length[basis]]]];
,(*We need to gauge away internal faces only. We'll find out how to express internal faces in terms of basispaths, and then mod out by these expressions*)
internalfacenames=getInternalFaceLabels[topleft,topright,bottomleft,bottomright];
internalfacevariables=Map[(Times@@Cases[allvariables,_[_,#]])/(Times@@Cases[allvariables,_[#,_]])&,internalfacenames];
internalfacevariablevectors=Map[Table[D[#,allvariables[[iii]]],{iii,Length[allvariables]}]/.Map[#->1&,allvariables]&,internalfacevariables];
tosolvefor=Total[Table[coef[iii]basisvectors[[iii]],{iii,Length[basisvectors]}]];
coeflist=Table[coef[iii],{iii,Length[basisvectors]}];
(*We'll now express the internal faces as a combination of basis paths*)
internalfacesasbasispaths=Map[#[[2]]&,Map[Solve[tosolvefor==#,coeflist][[1]]&,internalfacevariablevectors],{2}];
(*We'll need to mod out by these vectors, as they represent internal faces*)
vectorMod=Function[{vector,modoutbyvectors},
Total[Map[Projection[vector,#]&,NullSpace[modoutbyvectors]]]
];
modspacetranspose=Map[vectorMod[#,internalfacesasbasispaths]&,perfmatchingsasloops];
If[Length[Dimensions[modspacetranspose]]<2,
modulispace=ConstantArray[0,{1,Length[perfmatchings]}];
,modulispace=Transpose[Map[vectorMod[#,internalfacesasbasispaths]&,perfmatchingsasloops]];
];
];
If[modulispace==={},
modulispace={ConstantArray[0,Dimensions[masterspace][[2]]]};
];
,
If[loopvariablebasis===Null,
(*make my own basis*)
If[gauging==2,
basispaths=loopVariablesBasis[topleft,topright,bottomleft,bottomright];
,basispaths=loopVariablesBasis[topleft,topright,bottomleft,bottomright,True];
];
,basispaths=loopvariablebasis;
];
basis=Flatten[basispaths];
masterspace=Table[{},{iii,Length[basis]}];
modulispace=Table[{},{iii,Length[basispaths[[2]]]}];
];
,Print["The graph must be of BFT type for this function to work: edges must be of the form _[_Integer,_Integer] and be labeled according the numbering of faces."];
basis=Null;
masterspace=Null;
modulispace=Null;
];
{masterspace,modulispace,basis}
];

squareMove[topleft_,topright_,bottomleft_,bottomright_,fournodesorfacenum_,BFTgraph_:False,checkneeded_:True]/;(Head[fournodesorfacenum]===Integer&&BFTgraph===True||Head[fournodesorfacenum]===List&&Length[fournodesorfacenum]===4):=Block[{oktoproceed,newtopleft,fournodes,rows,columns,possiblefouredges,potentialfacelabels,edgestosettozero,facenum,positions,duplicateedge,thefacenumber,rowset,columnset,edge4by4,final4by4,whitenodestoadd,blacknodestoadd,newedgeW,newedgeB,ii,biggestindex,newedgesW,newedgesB,newbottomleft,newtopright,newbottomright,findDoubles,doubleedges,replacement,positioninwhichtoreplace,jj,fullkast,rowvariables,columnvariables,faceordersaroundwhitenode,faceordersaroundblacknode,openIndicesOfEdge4by4,newindicesonoldwhitenode,newindicesonoldblacknode,transedge4by4,transnewindicesonoldwhitenode,transnewindicesonoldblacknode},
oktoproceed=True;
If[checkneeded,
oktoproceed=getKasteleynCheckQ[topleft,topright,bottomleft,bottomright,BFTgraph];
];
If[oktoproceed,
newtopleft=topleft;
(*We only need to manipulate columns and rows in topleft. At the end, we'll also make sure the other parts of the Kasteleyn have the right dimensions*)
If[Head[fournodesorfacenum]===List,
(*the user specified four nodes*)
fournodes=Sort[fournodesorfacenum];
rows=Cases[fournodes,zz_/;zz<=Length[topleft]+Length[bottomleft]];
columns=DeleteCases[fournodes,Alternatives@@rows]-Length[topleft]-Length[bottomleft];
(*This is a list of the possible sets of four edges that link up the four nodes, and hence make a square face (there may be duplicates in this list, but this is irrelevant)*)
possiblefouredges=DeleteCases[Tuples[Map[Variables[topleft[[Sequence@@#]]]&,Tuples[{rows,columns}]]],{___,duplicateedge_,___,duplicateedge_,___}];
(*if we have a BFT graph, we can only choose four edges that all have the same face label*)
If[BFTgraph,
(*we will need to set to zero the four edges that form the square face*)
(*The only possible face labels are those which appear exactly twice in the Kasteleyn matrix*)
potentialfacelabels=Cases[Tally[Flatten[List@@@Variables[{topleft,topright,bottomleft,bottomright}]]],{_,4}][[All,1]];
edgestosettozero=Cases[possiblefouredges,{_[___,thefacenumber_Integer,___],_[___,thefacenumber_Integer,___],_[___,thefacenumber_Integer,___],_[___,thefacenumber_Integer,___]}/;MemberQ[potentialfacelabels,thefacenumber]][[1]];
facenum=Cases[Intersection@@Map[List@@#&,edgestosettozero],Alternatives@@potentialfacelabels][[1]];
positions=Position[topleft,Alternatives@@edgestosettozero];
,edgestosettozero=possiblefouredges[[1]];
];
,(*the user specified a face number*)
facenum=fournodesorfacenum;
positions=Position[topleft,_[facenum,_Integer]|_[_Integer,facenum]];
rows=Union[Map[#[[1]]&,positions]];
columns=Union[Map[#[[2]]&,positions]];
rows=PadRight[rows,2,rows[[1]]];
columns=PadRight[columns,2,columns[[1]]];
edgestosettozero=Map[topleft[[Sequence@@#]]&,positions];
];
If[Length[edgestosettozero]==4,(*we indeed have a 4-edge cycle going between the nodes, and we can do the square move*)
rowset=DeleteDuplicates[rows];
columnset=DeleteDuplicates[columns];
If[BFTgraph,
(*Now we'll kill the connectivity between the four nodes, and introduce four more nodes that are connected with edges bearing the correct index structure (since BFTgraph=True)*)
(*We may have four scenarios: either the connectivity of our square face is such that all variables are in different entries (the most common scenario), i.e. {{X,X},{X,X}}, or we have two rows and one column {{X+X},{X+X}}, or we have one row and two columns {{X+X,X+X}}, or we have one row and one column {{X+X+X+X}}. In each case we need to form a new square with four new nodes, so we'll need to break up the edges in these scenarios to always form a 4x4 matrix. This is easy in the first scenario, but a little trickier in the other scenarios.*)
If[Length[rowset]==2,
If[Length[columnset]==2,
edge4by4=newtopleft[[rowset,columnset]]/.Map[#->0&,Complement[Variables[newtopleft[[rowset,columnset]]],edgestosettozero]];
,edge4by4=Map[Variables,newtopleft[[rowset,columnset]]/.Map[#->0&,Complement[Variables[newtopleft[[rowset,columnset]]],edgestosettozero]]];
edge4by4=edge4by4/.{{{firstedge_[facenum,otherlabel1_Integer],secondedge_},{thirdedge_[facenum,otherlabel2_Integer],fourthedge_}}:>{{firstedge[facenum,otherlabel1],secondedge},{fourthedge,thirdedge[facenum,otherlabel2]}},{{firstedge_[otherlabel1_Integer,facenum],secondedge_},{thirdedge_[otherlabel2_Integer,facenum],fourthedge_}}:>{{firstedge[otherlabel1,facenum],secondedge},{fourthedge,thirdedge[otherlabel2,facenum]}}};
];
,If[Length[columnset]==2,
edge4by4=Map[Variables,Transpose[newtopleft[[rowset,columnset]]]/.Map[#->0&,Complement[Variables[newtopleft[[rowset,columnset]]],edgestosettozero]]];
edge4by4=Transpose[edge4by4/.{{{firstedge_[facenum,otherlabel1_Integer],secondedge_},{thirdedge_[facenum,otherlabel2_Integer],fourthedge_}}:>{{firstedge[facenum,otherlabel1],secondedge},{fourthedge,thirdedge[facenum,otherlabel2]}},{{firstedge_[otherlabel1_Integer,facenum],secondedge_},{thirdedge_[otherlabel2_Integer,facenum],fourthedge_}}:>{{firstedge[otherlabel1,facenum],secondedge},{fourthedge,thirdedge[otherlabel2,facenum]}}}];
,(*We have the situation of the form {{X+X+X+X}}*)
edge4by4=Partition[edgestosettozero,2];
edge4by4=edge4by4/.{{{firstedge_[facenum,otherlabel1_Integer],secondedge_[facenum,otherlabel2_Integer]},{thirdedge_,fourthedge_}}:>{{firstedge[facenum,otherlabel1],fourthedge},{thirdedge,secondedge[facenum,otherlabel2]}},{{firstedge_[otherlabel1_Integer,facenum],secondedge_[otherlabel2_Integer,facenum]},{thirdedge_,fourthedge_}}:>{{firstedge[otherlabel1,facenum],fourthedge},{thirdedge,secondedge[otherlabel2,facenum]}},{{firstedge_[facenum,otherlabel1_Integer],secondedge_},{thirdedge_[facenum,otherlabel2_Integer],fourthedge_}}:>{{firstedge[facenum,otherlabel1],secondedge},{fourthedge,thirdedge[facenum,otherlabel2]}},{{firstedge_[otherlabel1_Integer,facenum],secondedge_},{thirdedge_[otherlabel2_Integer,facenum],fourthedge_}}:>{{firstedge[otherlabel1,facenum],secondedge},{fourthedge,thirdedge[otherlabel2,facenum]}}};
(*There are actually two possible choices for edge4by4, since its transpose also gives a consistent index structure. However, it isn't necessarily true that both choices preserve the cyclic ordering of faces around the white node and the black node (found at positions rowset and columnset in the Kasteleyn). We will first find out what the order around these nodes is, then only choose the edge4by4 which will preserve this order.*)
fullkast=joinupKasteleyn[topleft,topright,bottomleft,bottomright];
rowvariables=Variables[fullkast[[rowset[[1]]]]];
columnvariables=Variables[Transpose[fullkast][[columnset[[1]]]]];
faceordersaroundwhitenode=Map[DeleteCases[Flatten[List@@@#][[;;;;2]],facenum]&,cyclicEdgeOrderings[rowvariables,rowvariables[[1]]]];
(*We add the first face to the end of the list in order to enforce the cyclicity, and turn the ordered list into pairs of faces, i.e. {1,2,3,4} \[Rule] {{1,2},{2,3},{3,4},{4,1}}.*)
faceordersaroundwhitenode=Map[Table[{#[[iii]],#[[iii+1]]},{iii,Length[#]-1}]&,Map[Append[#,#[[1]]]&,faceordersaroundwhitenode]];
(*Now we do the same thing for the faces around the black node*)
faceordersaroundblacknode=Map[DeleteCases[Flatten[List@@@#][[;;;;2]],facenum]&,cyclicEdgeOrderings[columnvariables,columnvariables[[1]]]];
faceordersaroundblacknode=Map[Table[{#[[iii]],#[[iii+1]]},{iii,Length[#]-1}]&,Map[Append[#,#[[1]]]&,faceordersaroundblacknode]];
(*Now we need to find out what kind of residual index structure is going to result from edge4by4, and whether it's compatible with the face orders we have just found.*)
(*This function returns a list of the form {___,{i,j},___,{k,l},___} for edge4by4 and its transpose. {i,...l} are the residual indices; newindicesonoldwhitenode is those indices that the white node will be forced to take from edge4by4, newindicesonoldblacknode is those indices that the black node will be forced to take*)
openIndicesOfEdge4by4=Function[{inputedge4by4,inputfacenum},
Block[{outputnewindicesonoldwhitenode,outputnewindicesonoldblacknode},
outputnewindicesonoldwhitenode=Map[Total[(List@@@Variables[#])/.inputfacenum->0]&,inputedge4by4];
outputnewindicesonoldwhitenode=Riffle[outputnewindicesonoldwhitenode,___,{1,-1,2}];
outputnewindicesonoldblacknode=Map[Total[(List@@@Variables[#])/.inputfacenum->0]&,Transpose[inputedge4by4]];
outputnewindicesonoldblacknode=Riffle[outputnewindicesonoldblacknode,___,{1,-1,2}];
{outputnewindicesonoldwhitenode,outputnewindicesonoldblacknode}
]
];
{newindicesonoldwhitenode,newindicesonoldblacknode}=openIndicesOfEdge4by4[edge4by4,facenum];
If[Cases[faceordersaroundwhitenode,newindicesonoldwhitenode|Reverse[newindicesonoldwhitenode]]==={}||Cases[faceordersaroundblacknode,newindicesonoldblacknode|Reverse[newindicesonoldblacknode]]==={},
(*The index structure in edge4by4 does not work with the possible index structures in faceordersaroundwhitenode and faceordersaroundblacknode. We need to transpose the matrix and try again.*)
edge4by4=Transpose[edge4by4];
{newindicesonoldwhitenode,newindicesonoldblacknode}=openIndicesOfEdge4by4[edge4by4,facenum];
If[Cases[faceordersaroundwhitenode,newindicesonoldwhitenode|Reverse[newindicesonoldwhitenode]]==={}||Cases[faceordersaroundblacknode,newindicesonoldblacknode|Reverse[newindicesonoldblacknode]]==={},
(*If there is still a problem with the index structure, something went wrong -- this example may need doing by hand.*)
Print["Warning - unexpected behavior when performing square move on kasteleyn:",{topleft,topright,bottomleft,bottomright},"\nThis example may require doing by hand."];
];
,(*If this version of edge4by4 appears to not give any problem, it might still be that its transpose also does not seemingly give any problem, and hence we still don't know which of the two to choose. We will now check to see if this is the case.*)
transedge4by4=Transpose[edge4by4];
{transnewindicesonoldwhitenode,transnewindicesonoldblacknode}=openIndicesOfEdge4by4[transedge4by4,facenum];
If[Cases[faceordersaroundwhitenode,transnewindicesonoldwhitenode|Reverse[transnewindicesonoldwhitenode]]=!={}&&Cases[faceordersaroundblacknode,transnewindicesonoldblacknode|Reverse[transnewindicesonoldblacknode]]=!={},
(*We could equally have chosen the transpose of edge4by4, and are hence unsure which of the two is correct*)
Print["Warning - unstable behavior when performing square move on kasteleyn:",{topleft,topright,bottomleft,bottomright},"\nConnectivity between the new nodes generated by bipartiteSUSY may be incorrect. This example may require doing by hand."];
];
];
];
];
(*Finally we'll add the connectivity between the new white nodes and the new black nodes*)
final4by4=Transpose[Map[#/.{head_[iij_Integer,jjk_Integer]:>head[jjk,iij]}&,edge4by4,{2}]];
newtopleft[[rowset,columnset]]=newtopleft[[rowset,columnset]]/.Map[#->0&,edgestosettozero];
(*Now we'll add two new rows and two new columns, representing the four new nodes that appear when doing a square move*)
whitenodestoadd=Table[0,{iii,2},{jjj,Dimensions[newtopleft][[2]]}];
blacknodestoadd=Table[{0,0},Length[newtopleft]];
For[ii=1,ii<=2,ii++,
newedgeW=edge4by4[[All,{ii}]]/.{{{_[facenum,iij_Integer]},{_[jjk_Integer,facenum]}}:>bipartiteSUSY`XX[jjk,iij],{{_[iij_Integer,facenum]},{_[facenum,jjk_Integer]}}:>bipartiteSUSY`XX[iij,jjk]};
whitenodestoadd[[ii,columns[[ii]]]]=newedgeW;
newedgeB=edge4by4[[{ii}]]/.{{{_[facenum,iij_Integer],_[jjk_Integer,facenum]}}:>bipartiteSUSY`XX[jjk,iij],{{_[iij_Integer,facenum],_[facenum,jjk_Integer]}}:>bipartiteSUSY`XX[iij,jjk]};
blacknodestoadd[[rows[[ii]],ii]]=newedgeB;
];
,(*Since BFTgraph=False we don't have to work so hard with the index structures, i.e. final4by4 is much easier to make.*)
final4by4=Partition[edgestosettozero,2];
newtopleft[[rowset,columnset]]=newtopleft[[rowset,columnset]]/.Map[#->0&,edgestosettozero];
(*Now we'll add two new rows and two new columns, representing the four new nodes that appear when doing a square move*)
whitenodestoadd=Table[0,{iii,2},{jjj,Dimensions[newtopleft][[2]]}];
blacknodestoadd=Table[{0,0},Length[newtopleft]];
(*We'll add edges indexed by an index that hasn't appeared yet, to make sure we don't create duplicate edge names*)
biggestindex=Max[Flatten[Map[List@@#&,Variables[joinupKasteleyn[topleft,topright,bottomleft,bottomright]]]]];
newedgesW=Map[bipartiteSUSY`XX[#]&,Range[biggestindex+1,biggestindex+2]];
newedgesB=Map[bipartiteSUSY`XX[#]&,Range[biggestindex+3,biggestindex+4]];
For[ii=1,ii<=2,ii++,
whitenodestoadd[[ii,columns[[ii]]]]=newedgesW[[ii]];
blacknodestoadd[[rows[[ii]],ii]]=newedgesB[[ii]];
];
];
newtopleft=Join[Join[newtopleft,whitenodestoadd],Join[blacknodestoadd,final4by4],2];
If[bottomleft==={},
newbottomleft={};
,newbottomleft=Join[bottomleft,Table[0,{iii,Length[bottomleft]},{jjj,2}],2];
];
newtopright=Join[topright,Table[0,{iii,2},{jjj,Dimensions[topright][[2]]}]];
newbottomright=bottomright;
(*Now we're finished. In the event that we created a duplicate edge, we'll rename it by tagging an X onto its Head until it's no longer a duplicate*)
(*Sometimes it's possible to have edges with multiplicity, e.g. 2 X[i,j], because of our renaming. We'll begin by renaming these to X[i,j]+XX[i,j].*)
{newtopleft,newtopright,newbottomleft,newbottomright}={newtopleft,newtopright,newbottomleft,newbottomright}//.{Times[mult_Integer,edgename_]:>(edgename+Total[Map[Symbol[StringJoin[SymbolName[Head[edgename]],#]]@@edgename&,Table[StringPadRight["",ii,"X"],{ii,1,mult-1}]]])};
(*This function makes a list of edges that appear twice*)
findDoubles=Function[{aa,bb,cc,dd},
Block[{tempkasteleyn,doubles},
tempkasteleyn=joinupKasteleyn[aa,bb,cc,dd];
doubles=Variables[tempkasteleyn][[Flatten[Position[Map[Length[Position[tempkasteleyn,#]]&,Variables[tempkasteleyn]],z_/;z>1]]]];
doubles]
];
doubleedges=findDoubles[newtopleft,newtopright,newbottomleft,newbottomright];
While[doubleedges=!={},
replacement=Map[(Symbol[StringJoin[SymbolName[Head[#]],"X"]]@@#)&,doubleedges];
For[jj=1,jj<=Length[replacement],jj++,
positioninwhichtoreplace=Position[newtopleft,doubleedges[[jj]]][[1]];
newtopleft=ReplacePart[newtopleft,positioninwhichtoreplace->replacement[[jj]]]//.{Times[mult_Integer,edgename_]:>(edgename+Total[Map[Symbol[StringJoin[SymbolName[Head[edgename]],#]]@@edgename&,Table[StringPadRight["",ii,"X"],{ii,1,mult-1}]]])};
];
doubleedges=findDoubles[newtopleft,newtopright,newbottomleft,newbottomright];
];
,Print["The square move can only be done on cycles with 4 edges. The current choice is invalid."];
{newtopleft,newtopright,newbottomleft,newbottomright}={Null,Null,Null,Null};
];
,Print["The input Kasteleyn is not valid."];
{newtopleft,newtopright,newbottomleft,newbottomright}={Null,Null,Null,Null};
];
{newtopleft,newtopright,newbottomleft,newbottomright}
];

bubblesQ[topleft_,topright_,bottomleft_,bottomright_,inputBFTgraph_:False,gauging_:2]/;(gauging===1||gauging===2):=Block[{BFTgraph,intfacelabels,allvars,aretherebubbles,onenumber,secondnumber,thirdnumber,anynumber,firstedge,secondedge},
If[gauging==1,
BFTgraph=True;
,BFTgraph=inputBFTgraph;
];
If[gauging==1,
(*bubbles not only have the index structure _[onenumber_,secondnumber_]+_[secondnumber_,thirdnumber_], but also secondnumber must be an internal face, and there must in total only be two variables in the Kasteleyn with this index, and this index may only appear twice anywhere*)
intfacelabels=getInternalFaceLabels[topleft,topright,bottomleft,bottomright];
allvars=Variables[joinupKasteleyn[topleft,topright,bottomleft,bottomright]];
aretherebubbles=MemberQ[joinupKasteleyn[topleft,topright,bottomleft,bottomright],{___,_[onenumber_Integer,secondnumber_Integer]+_[secondnumber_Integer,thirdnumber_Integer]+___,___}/;(MemberQ[intfacelabels,secondnumber]||Variables[{topright,bottomleft}]=={})&&Count[allvars,_[anynumber_Integer,secondnumber]|_[secondnumber,anynumber_Integer]]===2&&Count[Flatten[List@@@allvars],secondnumber]===2];
,aretherebubbles=MemberQ[joinupKasteleyn[topleft,topright,bottomleft,bottomright],{___,firstedge_+secondedge_+___,___}];
];
aretherebubbles
];

removeBubbles[topleft_,topright_,bottomleft_,bottomright_,inputBFTgraph_:False,gauging_:2]/;(gauging===1||gauging===2):=Block[{BFTgraph,intfacelabels,allvars,newtopleft,newtopright,newbottomleft,newbottomright,findDoubles,temporarykasteleyn,doubleedges,replacement,positioninwhichtoreplace,jj,onenumber,thirdnumber,anynumber,rowandcolumnindexsplit,firstedge},
If[gauging==1,
BFTgraph=True;
,BFTgraph=inputBFTgraph;
];
If[gauging==1,
(*we have to remove bubbles while keeping the index structure of the edges intact*)
(*bubbles not only have the index structure _[onenumber_,secondnumber_]+_[secondnumber_,thirdnumber_], but also secondnumber must be an internal face, and there must in total only be two variables in the Kasteleyn with this index, and this index may only appear twice anywhere*)
intfacelabels=getInternalFaceLabels[topleft,topright,bottomleft,bottomright];
allvars=Variables[joinupKasteleyn[topleft,topright,bottomleft,bottomright]];
{newtopleft,newtopright,newbottomleft,newbottomright}=({topleft,topright,bottomleft,bottomright}//.{_[onenumber_Integer,secondnumber_Integer]+_[secondnumber_Integer,thirdnumber_Integer]/;((MemberQ[intfacelabels,secondnumber]||Variables[{topright,bottomleft}]=={})&&Count[allvars,_[_Integer,secondnumber]|_[secondnumber,_Integer]]===2&&Count[Flatten[List@@@allvars],secondnumber]===2):>XX[onenumber,thirdnumber]});
{newtopleft,newtopright,newbottomleft,newbottomright}={newtopleft,newtopright,newbottomleft,newbottomright}//.{Times[mult_Integer,edgename_]:>(edgename+Total[Map[Symbol[StringJoin[SymbolName[Head[edgename]],#]]@@edgename&,Table[StringPadRight["",ii,"X"],{ii,1,mult-1}]]])};
(*We might have created duplicate edge names after doing this. We'll now remove the duplicates*)
findDoubles=Function[{tempkasteleyn},
Block[{doubles},
doubles=Variables[tempkasteleyn][[Flatten[Position[Map[Length[Position[tempkasteleyn,#]]&,Variables[tempkasteleyn]],z_/;z>1]]]];
doubles]
];
temporarykasteleyn=joinupKasteleyn[newtopleft,newtopright,newbottomleft,newbottomright];
doubleedges=findDoubles[temporarykasteleyn];
While[doubleedges=!={},
replacement=Map[(Symbol[StringJoin[SymbolName[Head[#]],"X"]]@@#)&,doubleedges];
For[jj=1,jj<=Length[replacement],jj++,
positioninwhichtoreplace=Position[temporarykasteleyn,doubleedges[[jj]]][[1]];
temporarykasteleyn=ReplacePart[temporarykasteleyn,positioninwhichtoreplace->replacement[[jj]]]//.{Times[mult_Integer,edgename_]:>(edgename+Total[Map[Symbol[StringJoin[SymbolName[Head[edgename]],#]]@@edgename&,Table[StringPadRight["",ii,"X"],{ii,1,mult-1}]]])};
];
doubleedges=findDoubles[temporarykasteleyn];
];
(*Now the duplicates are removed in temporarykasteleyn. We have to now split up this matrix into the four blocks corresponding to the top-left, top-right, bottom-left and bottom-right parts of the Kasteleyn.*)
rowandcolumnindexsplit=Map[PadRight[#,2,{{}}]&,MapThread[{#1,#2}&,{Map[Range[#]&,{Length[newtopleft],Dimensions[Join[newtopleft,newbottomleft]][[2]]}],Map[Range[#]&,Dimensions[temporarykasteleyn]-{Length[newtopleft],Dimensions[Join[newtopleft,newbottomleft]][[2]]}]+{Length[newtopleft],Dimensions[Join[newtopleft,newbottomleft]][[2]]}}]];
{newtopleft,newtopright,newbottomleft,newbottomright}=Map[temporarykasteleyn[[Sequence@@#]]&,Tuples[rowandcolumnindexsplit]];
,(*if we have a scattering graph or a BFT under gauging 2, any two nodes connected by more than one edge count as forming a bubble. We'll thus only keep one of these edges.*)
{newtopleft,newtopright,newbottomleft,newbottomright}={topleft,topright,bottomleft,bottomright}/.{firstedge_+secondedge_+___->firstedge};
];
{newtopleft,newtopright,newbottomleft,newbottomright}
];

formNewMatrixInternalInternal[{rowsbefore___},{rowsafter___},{firstzeros___},{secondzeros___},{thirdzeros___}]:=Block[{outputmat,internalsamecolorcolumns,sumoftwocolumns,remainingsamecolorcolumns},
(*The output matrix is composed of all rows except those of the bivalent node.*)
(*We only want to keep certain columns, i.e. opposite-colored nodes: those that do not connect to the bivalent node and the sum of those columns belonging to the bivalent node*)
outputmat={rowsbefore,rowsafter};
If[outputmat=!={},
(*in this matrix there are other nodes of the same color as the bivalent one*)
internalsamecolorcolumns=outputmat[[All,Join[Range[Length[{firstzeros}]],Range[Length[{firstzeros}]+2,Length[{firstzeros,secondzeros}]+1],Range[Length[{firstzeros,secondzeros}]+3,Length[{firstzeros,secondzeros,thirdzeros}]+2]]]];
sumoftwocolumns=Map[{Total[#]}&,outputmat[[All,{Length[{firstzeros}]+1,Length[{firstzeros,secondzeros}]+2}]]];
remainingsamecolorcolumns=outputmat[[All,Range[Length[{firstzeros,secondzeros,thirdzeros}]+3,Length[outputmat[[1]]]]]];
outputmat=Join[internalsamecolorcolumns,sumoftwocolumns,remainingsamecolorcolumns,2];
,(*signal there we removed every node of this color. We want to know how many opposite-colored nodes are left though*)
outputmat={"empty",Length[{firstzeros,secondzeros,thirdzeros}]+1};
];
outputmat
];

collapseBlackNodesInternalInternal[inputtopleft_,inputtopright_,inputbottomleft_,inputbottomright_]:=Block[{transposekasteleyn,reducedkasteleyn,outputtopleft,outputtopright,outputbottomleft,outputbottomright,bottomrightrownum,bottomrightcolnum},
{outputtopleft,outputtopright,outputbottomleft,outputbottomright}={inputtopleft,inputtopright,inputbottomleft,inputbottomright};
If[Join[inputtopleft,inputbottomleft]!={}&&Dimensions[Join[inputtopleft,inputbottomleft]][[2]]>0,
transposekasteleyn=Transpose[joinupKasteleyn[inputtopleft,inputtopright,inputbottomleft,inputbottomright]];
(*Now that we took the transpose, each row is a black node.*)
(*Each bivalent node appears after some rows "rowsbefore" and before some rows "rowsafter", which may be empty, i.e. may be equal to Sequence[]. A bivalent internal node has the structure of having only two nonzero entries, here called "firstedge" and "secondedge". These may be separated before and after by some possibly nonzero set of zeros (called "firstzeros", "secondzeros" and "thirdzeros"). Finally, if the black node is internal, there must be at the end a sequence of zeros as long as inputbottomleft; this reflects the fact that our node doesn't connect to external white nodes.*)
reducedkasteleyn=(transposekasteleyn//.{rowsbefore___,{firstzeros:0...,Except[0|somedge1_+anotheredge1_+___,firstedge_],secondzeros:0...,Except[0|somedge2_+anotheredge2_+___,secondedge_],thirdzeros:0...,Sequence@@ConstantArray[0,Length[inputbottomleft]]},rowsafter___}:>formNewMatrixInternalInternal[{rowsbefore},{rowsafter},{firstzeros},{secondzeros},{thirdzeros}]);
If[MemberQ[reducedkasteleyn,"empty"],
reducedkasteleyn=ConstantArray[{},reducedkasteleyn[[2]]];
,reducedkasteleyn=Transpose[reducedkasteleyn];
];
bottomrightrownum=Length[inputbottomright];
bottomrightcolnum=Dimensions[Join[inputtopright,inputbottomright]][[2]];
outputtopleft=reducedkasteleyn[[;;-(bottomrightrownum+1),;;-(bottomrightcolnum+1)]];
outputtopright=reducedkasteleyn[[;;-(bottomrightrownum+1),-(bottomrightcolnum);;]];
outputbottomleft=reducedkasteleyn[[-(bottomrightrownum);;,;;-(bottomrightcolnum+1)]];
outputbottomright=reducedkasteleyn[[-(bottomrightrownum);;,-(bottomrightcolnum);;]];
];
{outputtopleft,outputtopright,outputbottomleft,outputbottomright}
];

collapseWhiteNodesInternalInternal[inputtopleft_,inputtopright_,inputbottomleft_,inputbottomright_]:=Block[{kasteleyn,reducedkasteleyn,outputtopleft,outputtopright,outputbottomleft,outputbottomright,bottomrightrownum,bottomrightcolnum},
{outputtopleft,outputtopright,outputbottomleft,outputbottomright}={inputtopleft,inputtopright,inputbottomleft,inputbottomright};
If[Length[outputtopleft]>0||Length[outputtopright]>0,(*we have internal white nodes (which could potentially be bivalent)*)
kasteleyn=joinupKasteleyn[inputtopleft,inputtopright,inputbottomleft,inputbottomright];
(*This works very similarly to collapseBlackNodesInternalInternal*)
reducedkasteleyn=(kasteleyn//.{rowsbefore___,{firstzeros:0...,Except[0|somedge1_+anotheredge1_+___,firstedge_],secondzeros:0...,Except[0|somedge2_+anotheredge2_+___,secondedge_],thirdzeros:0...,Sequence@@ConstantArray[0,Dimensions[Join[inputtopright,inputbottomright]][[2]]]},rowsafter___}:>formNewMatrixInternalInternal[{rowsbefore},{rowsafter},{firstzeros},{secondzeros},{thirdzeros}]);
If[MemberQ[reducedkasteleyn,"empty"],
reducedkasteleyn={};
];
bottomrightrownum=Length[inputbottomright];
bottomrightcolnum=Dimensions[Join[inputtopright,inputbottomright]][[2]];
outputtopleft=reducedkasteleyn[[;;-(bottomrightrownum+1),;;-(bottomrightcolnum+1)]];
outputtopright=reducedkasteleyn[[;;-(bottomrightrownum+1),-(bottomrightcolnum);;]];
outputbottomleft=reducedkasteleyn[[-(bottomrightrownum);;,;;-(bottomrightcolnum+1)]];
outputbottomright=reducedkasteleyn[[-(bottomrightrownum);;,-(bottomrightcolnum);;]];
];
{outputtopleft,outputtopright,outputbottomleft,outputbottomright}
];

collapseBlackNodesInternalExternal[inputtopleft_,inputtopright_,inputbottomleft_,inputbottomright_]:=Block[{outputtopleft,outputtopright,outputbottomleft,outputbottomright,transposekasteleyn,bivalentblacknodes,somedge,anotheredge,kasteleyn,todeleterows,bottomrightrownum,bottomrightcolnum},
(*Here we want to remove bivalent nodes connected to an internal node and an external node. The way to do this is to throw away the external node and turn the bivalent node into the external node*)
{outputtopleft,outputtopright,outputbottomleft,outputbottomright}={inputtopleft,inputtopright,inputbottomleft,inputbottomright};
If[Join[inputtopleft,inputbottomleft]!={}&&Dimensions[Join[inputtopleft,inputbottomleft]][[2]]>0,(*we have internal black nodes (which could potentially be bivalent)*)
transposekasteleyn=Transpose[joinupKasteleyn[inputtopleft,inputtopright,inputbottomleft,inputbottomright]];
bivalentblacknodes=DeleteCases[Cases[transposekasteleyn,{0...,Except[0|somedge_+anotheredge_+___],0...,Except[0|somedge_+anotheredge_+___],0...}],{Sequence@@ConstantArray[0,Length[inputtopleft]],Sequence@@ConstantArray[_,Length[inputbottomleft]]}];
(*we found the bivalent nodes we're looking for. We now need to move these columns into the top-right part of the Kasteleyn, and remove the rows associated to the external nodes we're throwing away.*)
If[bivalentblacknodes=!={},
kasteleyn=Transpose[Join[Cases[transposekasteleyn,Except[Alternatives@@bivalentblacknodes]],bivalentblacknodes]];
todeleterows=Map[DeleteCases[Position[#,Except[0],1],{___,0,___}][[-1]]&,bivalentblacknodes];
kasteleyn=Delete[kasteleyn,todeleterows];
(*now we have the Kasteleyn, let's break it up into its four components*)
bottomrightrownum=Length[inputbottomright]-Length[todeleterows];
bottomrightcolnum=Dimensions[Join[inputtopright,inputbottomright]][[2]]+Length[bivalentblacknodes];
outputtopleft=kasteleyn[[;;-(bottomrightrownum+1),;;-(bottomrightcolnum+1)]];
outputtopright=kasteleyn[[;;-(bottomrightrownum+1),-(bottomrightcolnum);;]];
outputbottomleft=kasteleyn[[-(bottomrightrownum);;,;;-(bottomrightcolnum+1)]];
outputbottomright=kasteleyn[[-(bottomrightrownum);;,-(bottomrightcolnum);;]];
];
];
{outputtopleft,outputtopright,outputbottomleft,outputbottomright}
];

collapseWhiteNodesInternalExternal[inputtopleft_,inputtopright_,inputbottomleft_,inputbottomright_]:=Block[{outputtopleft,outputtopright,outputbottomleft,outputbottomright,kasteleyn,bivalentwhitenodes,somedge,anotheredge,todeletecolumns,bottomrightrownum,bottomrightcolnum},
{outputtopleft,outputtopright,outputbottomleft,outputbottomright}={inputtopleft,inputtopright,inputbottomleft,inputbottomright};
If[Length[outputtopleft]>0||Length[outputtopright]>0,(*we have internal white nodes (which could potentially be bivalent)*)
kasteleyn=joinupKasteleyn[inputtopleft,inputtopright,inputbottomleft,inputbottomright];
bivalentwhitenodes=DeleteCases[Cases[kasteleyn,{0...,Except[0|somedge_+anotheredge_+___],0...,Except[0|somedge_+anotheredge_+___],0...}],{Sequence@@ConstantArray[0,Dimensions[Join[inputtopleft,inputbottomleft]][[2]]],Sequence@@ConstantArray[_,Dimensions[Join[inputtopright,inputbottomright]][[2]]]}];
(*we found the bivalent nodes we're looking for. We now need to move these rows into the bottom-left part of the Kasteleyn, and remove the columns associated to the external nodes we're throwing away.*)
If[bivalentwhitenodes=!={},
kasteleyn=Join[Cases[kasteleyn,Except[Alternatives@@bivalentwhitenodes]],bivalentwhitenodes];
todeletecolumns=Map[DeleteCases[Position[#,Except[0],1],{___,0,___}][[-1]]&,bivalentwhitenodes];
kasteleyn=Transpose[Delete[Transpose[kasteleyn],todeletecolumns]];
(*now we have the Kasteleyn, let's break it up into its four components*)
bottomrightrownum=Length[inputbottomright]+Length[bivalentwhitenodes];
bottomrightcolnum=Dimensions[Join[inputtopright,inputbottomright]][[2]]-Length[todeletecolumns];
outputtopleft=kasteleyn[[;;-(bottomrightrownum+1),;;-(bottomrightcolnum+1)]];
outputtopright=kasteleyn[[;;-(bottomrightrownum+1),-(bottomrightcolnum);;]];
outputbottomleft=kasteleyn[[-(bottomrightrownum);;,;;-(bottomrightcolnum+1)]];
outputbottomright=kasteleyn[[-(bottomrightrownum);;,-(bottomrightcolnum);;]];
];
];
{outputtopleft,outputtopright,outputbottomleft,outputbottomright}
];

collapseBivalentNodes[topleft_,topright_,bottomleft_,bottomright_]:=Block[{previoustopleft,previoustopright,previousbottomleft,previousbottomright,newtopleft,newtopright,newbottomleft,newbottomright},
(*Need to do the replacements on repeat until the Kasteleyn stops changing. We'll start by collapsing bivalent nodes that connect to two internal nodes.*)
{previoustopleft,previoustopright,previousbottomleft,previousbottomright}={topleft,topright,bottomleft,bottomright};
{newtopleft,newtopright,newbottomleft,newbottomright}=collapseWhiteNodesInternalInternal[Sequence@@collapseBlackNodesInternalInternal[previoustopleft,previoustopright,previousbottomleft,previousbottomright]];
While[{previoustopleft,previoustopright,previousbottomleft,previousbottomright}=!={newtopleft,newtopright,newbottomleft,newbottomright},
{previoustopleft,previoustopright,previousbottomleft,previousbottomright}={newtopleft,newtopright,newbottomleft,newbottomright};
{newtopleft,newtopright,newbottomleft,newbottomright}=collapseWhiteNodesInternalInternal[Sequence@@collapseBlackNodesInternalInternal[previoustopleft,previoustopright,previousbottomleft,previousbottomright]];
];
{newtopleft,newtopright,newbottomleft,newbottomright}=collapseWhiteNodesInternalExternal[Sequence@@collapseBlackNodesInternalExternal[previoustopleft,previoustopright,previousbottomleft,previousbottomright]];
While[{previoustopleft,previoustopright,previousbottomleft,previousbottomright}=!={newtopleft,newtopright,newbottomleft,newbottomright},
{previoustopleft,previoustopright,previousbottomleft,previousbottomright}={newtopleft,newtopright,newbottomleft,newbottomright};
{newtopleft,newtopright,newbottomleft,newbottomright}=collapseWhiteNodesInternalExternal[Sequence@@collapseBlackNodesInternalExternal[previoustopleft,previoustopright,previousbottomleft,previousbottomright]];
];
{newtopleft,newtopright,newbottomleft,newbottomright}
];

simplifyGraph[topleft_,topright_,bottomleft_,bottomright_]:=Block[{previoustopleft,previoustopright,previousbottomleft,previousbottomright,newtopleft,newtopright,newbottomleft,newbottomright},
{previoustopleft,previoustopright,previousbottomleft,previousbottomright}={topleft,topright,bottomleft,bottomright};
{newtopleft,newtopright,newbottomleft,newbottomright}=collapseBivalentNodes[Sequence@@removeBubbles[previoustopleft,previoustopright,previousbottomleft,previousbottomright]];
While[{previoustopleft,previoustopright,previousbottomleft,previousbottomright}=!={newtopleft,newtopright,newbottomleft,newbottomright},
{previoustopleft,previoustopright,previousbottomleft,previousbottomright}={newtopleft,newtopright,newbottomleft,newbottomright};
{newtopleft,newtopright,newbottomleft,newbottomright}=collapseBivalentNodes[Sequence@@removeBubbles[previoustopleft,previoustopright,previousbottomleft,previousbottomright]];
];
{newtopleft,newtopright,newbottomleft,newbottomright}
];

higgsEdgesBFT[topleft_,topright_,bottomleft_,bottomright_,edgelisttohiggs_,checkneeded_:False]:=Block[{oktoproceed,newtopleft,newtopright,newbottomleft,newbottomright,edgestoremove,mergedfaces,facerenamingrule,renameDuplicateEdges,survivededges,edgerenamingrule,newedgerenamingrule,findDoubles,doubleedges,replacement,positioninwhichtoreplace,jj},
oktoproceed=True;
If[checkneeded,
oktoproceed=getKasteleynCheckQ[topleft,topright,bottomleft,bottomright,True];
];
If[oktoproceed,
{newtopleft,newtopright,newbottomleft,newbottomright}={topleft,topright,bottomleft,bottomright};
edgestoremove=consistentEdgeRemoval[topleft,topright,bottomleft,bottomright,edgelisttohiggs,False,True];
{newtopleft,newtopright,newbottomleft}={newtopleft,newtopright,newbottomleft}/.Map[#->0&,edgestoremove];
mergedfaces=Map[Sort[DeleteDuplicates[#]]&,Map[List@@#&,edgestoremove]//.{indexlists___}:>Map[Flatten,Gather[{indexlists},Intersection[#1,#2]=!={}&]]];
facerenamingrule=Flatten[Map[Delete[MapThread[Rule,{#,ConstantArray[#[[1]],Length[#]]}],1]&,mergedfaces]];
renameDuplicateEdges=Function[{gatheredduplicates},
Block[{edgesandtheirnewnames},
edgesandtheirnewnames=Transpose[gatheredduplicates];
edgesandtheirnewnames[[2]]=Map[Symbol[StringJoin[Sequence@@#,SymbolName[Head[edgesandtheirnewnames[[2,1]]]]]]@@edgesandtheirnewnames[[2,1]]&,Table[Table["X",iii],{iii,0,Length[edgesandtheirnewnames[[2]]]-1}]];
MapThread[Rule,edgesandtheirnewnames]]
];
survivededges=Complement[Variables[{topleft,topright,bottomleft,bottomright}],edgestoremove];
edgerenamingrule=Flatten[Map[renameDuplicateEdges,GatherBy[Map[{#,#/.facerenamingrule}&,survivededges],#[[2]]&]]];
newedgerenamingrule=Flatten[Map[renameDuplicateEdges,GatherBy[Map[{#,#/.edgerenamingrule}&,survivededges],#[[2]]&]]];
While[edgerenamingrule=!=newedgerenamingrule,
edgerenamingrule=newedgerenamingrule;
newedgerenamingrule=Flatten[Map[renameDuplicateEdges,GatherBy[Map[{#,#/.edgerenamingrule}&,survivededges],#[[2]]&]]];
];
{newtopleft,newtopright,newbottomleft}={newtopleft,newtopright,newbottomleft}/.edgerenamingrule;
(*In the event that we created a 2 X[i,j], we'll rename these as X[i,j]+XX[i,j]*)
{newtopleft,newtopright,newbottomleft}={newtopleft,newtopright,newbottomleft}//.{Times[mult_Integer,edgename_]:>(edgename+Total[Map[Symbol[StringJoin[SymbolName[Head[edgename]],#]]@@edgename&,Table[StringPadRight["",ii,"X"],{ii,1,mult-1}]]])};
(*This function makes a list of edges that appear twice*)
findDoubles=Function[{aa,bb,cc,dd},
Block[{tempkasteleyn,doubles},
tempkasteleyn=joinupKasteleyn[aa,bb,cc,dd];
doubles=Variables[tempkasteleyn][[Flatten[Position[Map[Length[Position[tempkasteleyn,#]]&,Variables[tempkasteleyn]],z_/;z>1]]]];
doubles]
];
doubleedges=findDoubles[newtopleft,newtopright,newbottomleft,newbottomright];
While[doubleedges=!={},
replacement=Map[(Symbol[StringJoin[SymbolName[Head[#]],"X"]]@@#)&,doubleedges];
For[jj=1,jj<=Length[replacement],jj++,
positioninwhichtoreplace=Map[Position[joinupKasteleyn[newtopleft,newtopright,newbottomleft,newbottomright],#][[1]]&,doubleedges];
If[positioninwhichtoreplace[[jj,1]]<=Length[newtopleft],
(*we need to replace either newtopleft or newtopright*)
If[positioninwhichtoreplace[[jj,2]]<=Dimensions[Join[newtopleft,newbottomleft]][[2]],
(*we need to replace newtopleft*)
newtopleft=ReplacePart[newtopleft,positioninwhichtoreplace[[jj]]->replacement[[jj]]]//.{Times[mult_Integer,edgename_]:>(edgename+Total[Map[Symbol[StringJoin[SymbolName[Head[edgename]],#]]@@edgename&,Table[StringPadRight["",ii,"X"],{ii,1,mult-1}]]])};
,(*we need to replace newtopright*)
newtopright=ReplacePart[newtopright,(positioninwhichtoreplace[[jj]]-{0,Dimensions[Join[newtopleft,newbottomleft]][[2]]})->replacement[[jj]]]//.{Times[mult_Integer,edgename_]:>(edgename+Total[Map[Symbol[StringJoin[SymbolName[Head[edgename]],#]]@@edgename&,Table[StringPadRight["",ii,"X"],{ii,1,mult-1}]]])};
];
,(*we need to replace either newbottomleft or newbottomright*)
If[positioninwhichtoreplace[[jj,2]]<=Dimensions[Join[newtopleft,newbottomleft]][[2]],
(*we need to replace newbottomleft*)
newbottomleft=ReplacePart[newbottomleft,(positioninwhichtoreplace[[jj]]-{Length[newtopleft],0})->replacement[[jj]]]//.{Times[mult_Integer,edgename_]:>(edgename+Total[Map[Symbol[StringJoin[SymbolName[Head[edgename]],#]]@@edgename&,Table[StringPadRight["",ii,"X"],{ii,1,mult-1}]]])};
,(*we need to replace newbottomright*)
newbottomright=ReplacePart[newbottomright,(positioninwhichtoreplace[[jj]]-{Length[newtopleft],Dimensions[Join[newtopleft,newbottomleft]][[2]]})->replacement[[jj]]]//.{Times[mult_Integer,edgename_]:>(edgename+Total[Map[Symbol[StringJoin[SymbolName[Head[edgename]],#]]@@edgename&,Table[StringPadRight["",ii,"X"],{ii,1,mult-1}]]])};
];
];
];
doubleedges=findDoubles[newtopleft,newtopright,newbottomleft,newbottomright];
];
,Print["The input Kasteleyn is not valid."];
{newtopleft,newtopright,newbottomleft,newbottomright}={Null,Null,Null,Null};
];
{newtopleft,newtopright,newbottomleft,newbottomright}
];


(*Functions useful for scattering amplitudes*)


planarityQ[inputtopleft_,inputtopright_,inputbottomleft_,inputbottomright_]:=
planarityQ[inputtopleft,inputtopright,inputbottomleft,inputbottomright,True];
planarityQ[inputtopleft_,inputtopright_,inputbottomleft_,inputbottomright_,collapsebivalentnodes_]:=
Block[{topleft,topright,bottomleft,bottomright,posemptyexternalwhitenodes,externalblackmatrix,posnonemptyexternalblacknodes,kasteleyn,oneskasteleyn,adjacencymat,graph,planar,externals,extnum,allperms,numberofperms,permutations,externaladjacencyseed,externaladjencyattempts,ii,testgraph},
If[collapsebivalentnodes,
{topleft,topright,bottomleft,bottomright}=collapseBivalentNodes[inputtopleft,inputtopright,inputbottomleft,inputbottomright];
,{topleft,topright,bottomleft,bottomright}={inputtopleft,inputtopright,inputbottomleft,inputbottomright};
];
(*First remove empty external nodes, since they do not affect planarity but add to the combinatorics*)
posemptyexternalwhitenodes=Position[bottomleft,{0...},{1}];
bottomleft=Delete[bottomleft,posemptyexternalwhitenodes];
bottomright=Delete[bottomright,posemptyexternalwhitenodes];
externalblackmatrix=Join[topright,bottomright];
If[externalblackmatrix!={},
externalblackmatrix=Transpose[externalblackmatrix];
posnonemptyexternalblacknodes=Complement[Range[Length[externalblackmatrix]],Flatten[Position[externalblackmatrix,{0...},{1}]]];
topright=topright[[All,posnonemptyexternalblacknodes]];
bottomright=bottomright[[All,posnonemptyexternalblacknodes]];
];
adjacencymat=turnIntoAdjacencyMatrix[topleft,topright,bottomleft,bottomright];
graph=AdjacencyGraph[adjacencymat];(*We have finished making the Mathematica graph!*)
(*If the graph can be embedded on genus zero, try and see if we can do so with only one boundary*)
planar=False;(*assume the graph is non-planar until proven otherwise*)
If[PlanarGraphQ[graph],
externals=Join[Range[Length[topleft]+1,Length[topleft]+Length[bottomleft]],Range[Total[Dimensions[Join[topleft,bottomleft]]]+1,Total[Dimensions[Join[topleft,bottomleft]]]+Dimensions[Join[topright,bottomright]][[2]]]];(*These are the node numbers corresponding to external nodes*)
extnum=Length[externals];
If[extnum>0,
(*We will now try and form a single external boundary by connecting up all external nodes sequentially*)
allperms=Permutations[Range[extnum-1]];
numberofperms=Length[allperms];
permutations=Map[Append[#,extnum]&,allperms[[DeleteDuplicates[MapThread[Sort[{#1,#2}][[1]]&,{Range[numberofperms],Ordering[Map[Reverse[#]&,allperms]]}]]]]];
(*We will start by making an adjacency matrix for one choice of external boundary. We will then permute this matrix in all possible ways*)
If[permutations[[1]]==={1,2},
externaladjacencyseed={{0,1},{1,0}};
,If[permutations[[1]]==={1},
externaladjacencyseed={{1}};
,externaladjacencyseed=Normal[AdjacencyMatrix[PathGraph[Prepend[permutations[[1]],extnum]]]];
];
];
externaladjencyattempts=Map[externaladjacencyseed[[#,#]]&,permutations];
For[ii=1,ii<=Length[externaladjencyattempts],ii++,
adjacencymat[[externals,externals]]=externaladjencyattempts[[ii]];
testgraph=AdjacencyGraph[adjacencymat];
If[PlanarGraphQ[testgraph],
planar=True;
Break[];
];
];
,(*the graph has no external nodes but can be embedded on the disk nonetheless*)
planar=True;
];
];
If[functionMemory,planarityQ[inputtopleft,inputtopright,inputbottomleft,inputbottomright,collapsebivalentnodes]=planar;];
planar
];

getOrderingExternalEdgesDefault[topleft_,topright_,bottomleft_,bottomright_]:=Block[{bigkasteleyn,ordering},
bigkasteleyn=Join[joinupKasteleyn[topleft,topright,bottomleft,bottomright],Transpose[joinupKasteleyn[topleft,topright,bottomleft,bottomright]]];
ordering=getOrderingExternalNodesDefault[topleft,topright,bottomleft,bottomright];
ordering=Map[#[[1,1]]->#[[2]]&,DeleteCases[MapThread[Rule,{Map[Variables[bigkasteleyn[[#]]]&,ordering],Range[Length[ordering]]}],{}->___]];
ordering
];

getOrderingExternalNodesDefault[topleft_,topright_,bottomleft_,bottomright_]:=Join[Range[Length[topleft]+1,Length[topleft]+Length[bottomleft]],Range[Total[Dimensions[Join[topleft,bottomleft]]]+1,Total[Dimensions[Join[topleft,bottomleft]]]+Dimensions[Join[topright,bottomright]][[2]]]];

getK[topleft_,topright_,bottomleft_,bottomright_]:=Total[(Map[Length[Variables[#]]&,Transpose[Join[topleft,bottomleft]]]-1)]+Length[topleft]-Length[Variables[topleft]]+Count[bottomleft,{0...}];

getN[topleft_,topright_,bottomleft_,bottomright_]:=Length[bottomleft]+Dimensions[Join[topright,bottomright]][[2]];

getSourceEdges[topright_,bottomleft_,referenceperfmatch_]:=Block[{referencevars,sourceedges},
referencevars=Variables[referenceperfmatch];
(*Sources are those variables in the bottomleft that are not in referenceperfmatch, and those in topright which are*)
sourceedges=Union[Complement[DeleteCases[Flatten[bottomleft],0],referencevars],Intersection[DeleteCases[Flatten[topright],0],referencevars]];
sourceedges
];

getSinkEdges[topright_,bottomleft_,referenceperfmatch_]:=Block[{perfmatchvars,sinkedges},
perfmatchvars=Variables[referenceperfmatch];
(*Sinks are those variables in the bottomleft that are in referenceperfmatch, and those in topright which are not*)
sinkedges=Union[Complement[DeleteCases[Flatten[topright],0],perfmatchvars],Intersection[DeleteCases[Flatten[bottomleft],0],perfmatchvars]];
sinkedges
];

getSourceNodes[topleft_,topright_,bottomleft_,bottomright_,referenceperfmatch_]:=Block[{referencevars,sourcenodes},
referencevars=Variables[referenceperfmatch];
(*Sources are those nodes in the bottomleft that do not have variables in referenceperfmatch, and those in topright which do*)
sourcenodes=Union[Flatten[Position[Transpose[Join[topright,bottomright]],{___,Alternatives@@referencevars,___}]]+Total[Dimensions[Join[topleft,bottomleft]]],Length[topleft]+Complement[Range[Length[bottomleft]],Flatten[Position[bottomleft,{___,Alternatives@@referencevars,___}]]]];
sourcenodes
];

getSinkNodes[topleft_,topright_,bottomleft_,bottomright_,referenceperfmatch_]:=Block[{referencevars,sinknodes},
referencevars=Variables[referenceperfmatch];
(*Sinks are those nodes in the bottomleft that have variables in referenceperfmatch, and those in topright which are do not*)
sinknodes=Union[Complement[Range[Dimensions[Join[topright,bottomright]][[2]]],Flatten[Position[Transpose[Join[topright,bottomright]],{___,Alternatives@@referencevars,___}]]]+Total[Dimensions[Join[topleft,bottomleft]]],Length[topleft]+Flatten[Position[bottomleft,{___,Alternatives@@referencevars,___}]]];
sinknodes
];

getExternalEdgeNodeNumbers[topleft_,topright_,bottomleft_,bottomright_,externaledgelist_]:=Union[Map[#[[1]]&,Position[bottomleft,Alternatives@@externaledgelist]+Length[topleft]],Map[#[[2]]&,Position[topright,Alternatives@@externaledgelist]+Total[Dimensions[Join[topleft,bottomleft]]]]];

traditionalConnectivityMatrix[topleft_,topright_,bottomleft_,bottomright_]:=traditionalConnectivityMatrix[topleft,topright,bottomleft,bottomright,Null];
traditionalConnectivityMatrix[topleft_,topright_,bottomleft_,bottomright_,referencematching_]:=Block[{perfmatchings,referenceperfmatch,kasteleyn,perfmatchvars,kastnopm,kastinvertedpm,bigmatrix,size,connectivitymat},
If[referencematching===Null,
perfmatchings=perfectMatchings[topleft,topright,bottomleft,bottomright];
If[perfmatchings=!={},
referenceperfmatch=perfmatchings[[lowNumberLoopsPMpos[topleft,topright,bottomleft,bottomright]]];
,referenceperfmatch=0;
];
,referenceperfmatch=referencematching;
];
If[referenceperfmatch=!=0,
kasteleyn=joinupKasteleyn[topleft,topright,bottomleft,bottomright];
perfmatchvars=Variables[referenceperfmatch];
(*We need to first form a large matrix based on the Kasteleyn, and then take its inverse*)
kastnopm=-(kasteleyn/.Map[#->0&,perfmatchvars]);
kastinvertedpm=-Transpose[kasteleyn/.Join[Map[#->1/#&,perfmatchvars],Map[#->0&,Complement[Variables[kasteleyn],perfmatchvars]]]];
bigmatrix=Join[Join[IdentityMatrix[Length[kasteleyn]],kastinvertedpm],Join[kastnopm,IdentityMatrix[Dimensions[kasteleyn][[2]]]],2];
connectivitymat=Inverse[bigmatrix];
,Print["This graph has no perfect matchings"];
size=Total[Dimensions[joinupKasteleyn[topleft,topright,bottomleft,bottomright]]];
If[size!=0,
connectivitymat=IdentityMatrix[size];
,connectivitymat={};
];
];
If[functionMemory,traditionalConnectivityMatrix[topleft,topright,bottomleft,bottomright,referencematching]=connectivitymat;];
connectivitymat
];

connectivityMatrix[topleft_,topright_,bottomleft_,bottomright_]:=connectivityMatrix[topleft,topright,bottomleft,bottomright,Null];
connectivityMatrix[topleft_,topright_,bottomleft_,bottomright_,referencematching_]:=Module[{perfmatchings,referenceperfmatch,kasteleyn,bigmatrix,adjacencymat,graph,connectivitymat,turnIntoContributionNoLoops,cycles,loopnodes,extraloopnodes,jj,toadd,duplnode,loopcontributions,cyclenodes,turnIntoContribution,size},
If[referencematching===Null,
perfmatchings=perfectMatchings[topleft,topright,bottomleft,bottomright];
If[perfmatchings=!={},
referenceperfmatch=perfmatchings[[lowNumberLoopsPMpos[topleft,topright,bottomleft,bottomright]]];
,referenceperfmatch=0;
];
,referenceperfmatch=referencematching;
];
If[referenceperfmatch=!=0,
kasteleyn=joinupKasteleyn[topleft,topright,bottomleft,bottomright];
bigmatrix=turnIntoOrientedAdjacencyMatrix[topleft,topright,bottomleft,bottomright,referenceperfmatch,True];adjacencymat=bigmatrix/.Map[#->1&,Variables[kasteleyn]];
graph=DirectedGraph[AdjacencyGraph[adjacencymat]];
(*We'll now find all paths between all nodes, expressed as lists of nodes traversed between the two endpoints*)
connectivitymat=Table[FindPath[graph,iii,jjj,Infinity,All],{iii,Total[Dimensions[kasteleyn]]},{jjj,Total[Dimensions[kasteleyn]]}];
(*FindPath misses the diagonal, i.e. from a node to itself, so we'll put that in by hand*)
connectivitymat=MapThread[Join,{connectivitymat,Map[{{#}}&,DiagonalMatrix[Range[Total[Dimensions[kasteleyn]]]],{2}]/.{{{0}}->{}}},2];
(*this function translates a sequence of nodes to an expression in terms of edge variables, neglecting the loop contributions in the denominator*)
turnIntoContributionNoLoops=Function[{pathnodes},
(Times@@Map[Power[bigmatrix[[Sequence@@#]],Signature[#]]&,Table[pathnodes[[{iii,iii+1}]],{iii,Length[pathnodes]-1}]])
];
(*for the final contribution to each element in the connectivity matrix, we'll need the contributions from loops*)
cycles=FindCycle[graph,Infinity,All]/.{DirectedEdge->List};(*these are the loops*)
(*we'll now turn each cycle into an expression similar to the output of FindPath*)
loopnodes=MapThread[Prepend,{Map[#[[2]]&,cycles,{2}],Map[#[[1,1]]&,cycles]}];
(*we now have the fundamental loops in the graph. We still need to add all combinations of independent loops (i.e. those loops which do not share nodes)*)
extraloopnodes={};
For[jj=2,jj<=Length[loopnodes],jj++,
toadd=Cases[Subsets[loopnodes,{jj}],Except[{___,{___,duplnode_,___},___,{___,duplnode_,___},___}]];
If[toadd==={},
Break[];
];
extraloopnodes=Join[extraloopnodes,toadd];
];
loopnodes=Join[Transpose[{loopnodes}],extraloopnodes];
(*loopcontributions contains the full list of loops, with their correct sign*)
loopcontributions=Map[Power[-1,Length[#]-1](Times@@#)&,Map[turnIntoContributionNoLoops,loopnodes,{2}]];
(*we want to know which nodes are occupied by each loopcontribution, in order to have the correct numerators. cyclenodes has the node numbers*)
cyclenodes=Map[Union@@#&,loopnodes];
turnIntoContribution=Function[{pathnodes},
Module[{totalcontrib},
totalcontrib=turnIntoContributionNoLoops[pathnodes];
totalcontrib=totalcontrib/(1-Expand[Total[loopcontributions]]);
totalcontrib=totalcontrib(1-Expand[Total[loopcontributions[[Flatten[Position[Map[Length[Intersection[#,pathnodes]]>0&,cyclenodes],False]]]]]]);
totalcontrib
]
];
connectivitymat=Map[Total,Map[turnIntoContribution,connectivitymat,{3}],{2}];
,Print["This graph has no perfect matchings"];
size=Total[Dimensions[joinupKasteleyn[topleft,topright,bottomleft,bottomright]]];
If[size!=0,
connectivitymat=IdentityMatrix[size];
,connectivitymat={};
];
];
If[functionMemory,connectivityMatrix[topleft,topright,bottomleft,bottomright,referencematching]=connectivitymat;];
connectivitymat
];

traditionalPathMatrix[topleft_,topright_,bottomleft_,bottomright_]:=traditionalPathMatrix[topleft,topright,bottomleft,bottomright,Null];
traditionalPathMatrix[topleft_,topright_,bottomleft_,bottomright_,referencematching_]:=
Block[{perfmatchings,referenceperfmatch,bigpathmatrix,externalrows,externalcolumns,finalpathmatrix},
If[referencematching===Null,
perfmatchings=perfectMatchings[topleft,topright,bottomleft,bottomright];
If[perfmatchings=!={},
referenceperfmatch=perfmatchings[[lowNumberLoopsPMpos[topleft,topright,bottomleft,bottomright]]];
,referenceperfmatch=0;
];
,referenceperfmatch=referencematching;
];
If[referenceperfmatch=!=0,
bigpathmatrix=connectivityMatrix[topleft,topright,bottomleft,bottomright,referenceperfmatch];
(*bigpathmatrix contains the connectivity between ALL pairs of nodes. We need to select those entries corresponding to sources going to external nodes.*)
externalrows=getSourceNodes[topleft,topright,bottomleft,bottomright,referenceperfmatch];
externalcolumns=Join[Range[Length[topleft]+1,Length[topleft]+Length[bottomleft]],Range[Total[Dimensions[Join[topleft,bottomleft]]]+1,Total[Dimensions[Join[topleft,bottomleft]]]+Dimensions[Join[topright,bottomright]][[2]]]];
finalpathmatrix=Expand[Simplify[bigpathmatrix[[externalrows,externalcolumns]]]];
(*The determinant of bigpathmatrix gives the loop factor in the paths between external nodes.*)
,Print["This graph has no perfect matchings"];
finalpathmatrix=Null;
];
If[functionMemory,traditionalPathMatrix[topleft,topright,bottomleft,bottomright,referencematching]=finalpathmatrix;];
finalpathmatrix
];

pathMatrix[topleft_,topright_,bottomleft_,bottomright_]:=pathMatrix[topleft,topright,bottomleft,bottomright,Null];
pathMatrix[topleft_,topright_,bottomleft_,bottomright_,referencematching_]:=
Module[{perfmatchings,referenceperfmatch,kasteleyn,bigmatrix,adjacencymat,graph,sources,allexternalnodes,finalpathmatrix,turnIntoContributionNoLoops,cycles,loopnodes,extraloopnodes,jj,toadd,duplnode,loopcontributions,cyclenodes,turnIntoContribution},
If[referencematching===Null,
perfmatchings=perfectMatchings[topleft,topright,bottomleft,bottomright];
If[perfmatchings=!={},
referenceperfmatch=perfmatchings[[lowNumberLoopsPMpos[topleft,topright,bottomleft,bottomright]]];
,referenceperfmatch=0;
];
,referenceperfmatch=referencematching;
];
If[referenceperfmatch=!=0,
kasteleyn=joinupKasteleyn[topleft,topright,bottomleft,bottomright];
bigmatrix=turnIntoOrientedAdjacencyMatrix[topleft,topright,bottomleft,bottomright,referenceperfmatch,True];adjacencymat=bigmatrix/.Map[#->1&,Variables[kasteleyn]];
graph=DirectedGraph[AdjacencyGraph[adjacencymat]];
sources=getSourceNodes[topleft,topright,bottomleft,bottomright,referenceperfmatch];
allexternalnodes=getOrderingExternalNodesDefault[topleft,topright,bottomleft,bottomright];
(*We'll now find all paths between source nodes and external nodes, expressed as lists of nodes traversed between the two endpoints*)
finalpathmatrix=Table[FindPath[graph,sources[[iii]],allexternalnodes[[jjj]],Infinity,All],{iii,Length[sources]},{jjj,Length[allexternalnodes]}];
If[finalpathmatrix=!={},
(*FindPath misses the diagonal, i.e. from a node to itself, so we'll put that in by hand*)
finalpathmatrix[[All,Flatten[Position[allexternalnodes,Alternatives@@sources]]]]=Map[{{#}}&,DiagonalMatrix[sources],{2}]/.{{{0}}->{}};
(*this function translates a sequence of nodes to an expression in terms of edge variables, neglecting the loop contributions in the denominator*)
turnIntoContributionNoLoops=Function[{pathnodes},
(Times@@Map[Power[bigmatrix[[Sequence@@#]],Signature[#]]&,Table[pathnodes[[{iii,iii+1}]],{iii,Length[pathnodes]-1}]])
];
(*for the final contribution to each element in the connectivity matrix, we'll need the contributions from loops*)
cycles=FindCycle[graph,Infinity,All]/.{DirectedEdge->List};(*these are the loops*)
(*we'll now turn each cycle into an expression similar to the output of FindPath*)
loopnodes=MapThread[Prepend,{Map[#[[2]]&,cycles,{2}],Map[#[[1,1]]&,cycles]}];
(*we now have the fundamental loops in the graph. We still need to add all combinations of independent loops (i.e. those loops which do not share nodes)*)
extraloopnodes={};
For[jj=2,jj<=Length[loopnodes],jj++,
toadd=Cases[Subsets[loopnodes,{jj}],Except[{___,{___,duplnode_,___},___,{___,duplnode_,___},___}]];
If[toadd==={},
Break[];
];
extraloopnodes=Join[extraloopnodes,toadd];
];
loopnodes=Join[Transpose[{loopnodes}],extraloopnodes];
(*loopcontributions contains the full list of loops, with their correct sign*)
loopcontributions=Map[Power[-1,Length[#]-1](Times@@#)&,Map[turnIntoContributionNoLoops,loopnodes,{2}]];
(*we want to know which nodes are occupied by each loopcontribution, in order to have the correct numerators. cyclenodes has the node numbers*)
cyclenodes=Map[Union@@#&,loopnodes];
turnIntoContribution=Function[{pathnodes},
Module[{totalcontrib},
totalcontrib=turnIntoContributionNoLoops[pathnodes];
totalcontrib=totalcontrib/(1-Expand[Total[loopcontributions]]);
totalcontrib=totalcontrib(1-Expand[Total[loopcontributions[[Flatten[Position[Map[Length[Intersection[#,pathnodes]]>0&,cyclenodes],False]]]]]]);
totalcontrib
]
];
finalpathmatrix=Map[Total,Map[turnIntoContribution,finalpathmatrix,{3}],{2}];
];
,Print["This graph has no perfect matchings"];
finalpathmatrix=Null;
];
If[functionMemory,pathMatrix[topleft,topright,bottomleft,bottomright,referencematching]=finalpathmatrix;];
finalpathmatrix
];

loopDenominator[topleft_,topright_,bottomleft_,bottomright_,referencematching_:Null,withsigns_:False]:=
Module[{perfmatchings,referenceperfmatch,kasteleyn,bigmatrix,adjacencymat,graph,turnIntoContributionNoLoops,cycles,loopnodes,extraloopnodes,jj,toadd,duplnode,loopcontributions,loopdenominator},
If[referencematching===Null,
perfmatchings=perfectMatchings[topleft,topright,bottomleft,bottomright];
If[perfmatchings=!={},
referenceperfmatch=perfmatchings[[lowNumberLoopsPMpos[topleft,topright,bottomleft,bottomright]]];
,referenceperfmatch=0;
];
,referenceperfmatch=referencematching;
];
If[referenceperfmatch=!=0,
kasteleyn=joinupKasteleyn[topleft,topright,bottomleft,bottomright];
bigmatrix=turnIntoOrientedAdjacencyMatrix[topleft,topright,bottomleft,bottomright,referenceperfmatch,True];adjacencymat=bigmatrix/.Map[#->1&,Variables[kasteleyn]];
graph=DirectedGraph[AdjacencyGraph[adjacencymat]];
(*this function translates a sequence of nodes to an expression in terms of edge variables, neglecting the loop contributions in the denominator*)
turnIntoContributionNoLoops=Function[{pathnodes},
(Times@@Map[Power[bigmatrix[[Sequence@@#]],Signature[#]]&,Table[pathnodes[[{iii,iii+1}]],{iii,Length[pathnodes]-1}]])
];
(*for the final contribution to each element in the connectivity matrix, we'll need the contributions from loops*)
cycles=FindCycle[graph,Infinity,All]/.{DirectedEdge->List};(*these are the loops*)
(*we'll now turn each cycle into an expression similar to the output of FindPath*)
loopnodes=MapThread[Prepend,{Map[#[[2]]&,cycles,{2}],Map[#[[1,1]]&,cycles]}];
(*we now have the fundamental loops in the graph. We still need to add all combinations of independent loops (i.e. those loops which do not share nodes)*)
extraloopnodes={};
For[jj=2,jj<=Length[loopnodes],jj++,
toadd=Cases[Subsets[loopnodes,{jj}],Except[{___,{___,duplnode_,___},___,{___,duplnode_,___},___}]];
If[toadd==={},
Break[];
];
extraloopnodes=Join[extraloopnodes,toadd];
];
loopnodes=Join[Transpose[{loopnodes}],extraloopnodes];
(*The quantity inside Expand[Total[...]] contains the full list of loops, with their correct sign*)
If[withsigns===False,
loopdenominator=(1-Expand[Total[Map[Power[-1,Length[#]-1](Times@@#)&,Map[turnIntoContributionNoLoops,loopnodes,{2}]]]]);
,loopdenominator=(1-Expand[Total[Map[Power[-1,2Length[#]-1](Times@@#)&,Map[turnIntoContributionNoLoops,loopnodes,{2}]]]]);
];
,Print["This graph has no perfect matchings"];
loopdenominator=Null;
];
loopdenominator
];

minorsAsPerfectMatchings[topleft_,topright_,bottomleft_,bottomright_]:=minorsAsPerfectMatchings[topleft,topright,bottomleft,bottomright,Null];
minorsAsPerfectMatchings[topleft_,topright_,bottomleft_,bottomright_,referencematching_]:=Block[{perfmatchings,referenceperfmatch,pathmat,minors,loopdenominator,truemapminortoperfmatch},
(*If we haven't selected a specific perfect matching, choose one with lowest possible multiplicity*)
If[referencematching===Null,
perfmatchings=perfectMatchings[topleft,topright,bottomleft,bottomright];
If[perfmatchings=!={},
referenceperfmatch=perfmatchings[[lowNumberLoopsPMpos[topleft,topright,bottomleft,bottomright]]];
,referenceperfmatch=0;
];
,referenceperfmatch=referencematching;
];
If[referenceperfmatch=!=0,
pathmat=pathMatrix[topleft,topright,bottomleft,bottomright,referenceperfmatch];
If[pathmat==={},(*this happens for cases when we have no external nodes, or no sources, for example*)
truemapminortoperfmatch={};
,minors=Minors[pathmat,Length[pathmat]][[1]];
loopdenominator=Expand[referenceperfmatch loopDenominator[topleft,topright,bottomleft,bottomright,referenceperfmatch]];
truemapminortoperfmatch=Expand[Simplify[minors loopdenominator]];
If[Position[truemapminortoperfmatch,(Power[___,num1_]/;(num1>1||num1<0))|(Times[num2_,___]/;num2>1)]=!={},
truemapminortoperfmatch=Expand[Simplify[truemapminortoperfmatch]];
];
];
,truemapminortoperfmatch=Null;
];
If[functionMemory,minorsAsPerfectMatchings[topleft,topright,bottomleft,bottomright,referencematching]=truemapminortoperfmatch;];
truemapminortoperfmatch
];

dimensionGrassmannian[topleft_,topright_,bottomleft_,bottomright_]:=Block[{minorexpressions,minorvars,tangentspacedim},
minorexpressions=minorsAsPerfectMatchings[topleft,topright,bottomleft,bottomright];
If[minorexpressions===Null,
tangentspacedim=-1;
,If[minorexpressions==={},(*this happens when we don't have any external nodes, or no sources, for example*)
tangentspacedim=0;
,minorvars=Variables[minorexpressions];
(*When computing the tangent space we need to subtract 1, because Plucker coordinates are projective variables*)
tangentspacedim=MatrixRank[Table[D[minorexpressions[[iii]],minorvars[[jjj]]],{iii,Length[minorexpressions]},{jjj,Length[minorvars]}]]-1;
];
];
If[functionMemory,dimensionGrassmannian[topleft,topright,bottomleft,bottomright]=tangentspacedim;];
tangentspacedim
];

reducibilityQ[topleft_,topright_,bottomleft_,bottomright_,checkneeded_:False,inputBFTgraph_:False,gauging_:2]/;(gauging===1||gauging===2):=Block[{BFTgraph,oktoproceed,edgesnaivereducibility,reducibility,pmatrix,numsources,numexternalnodes,maxpossibledimension,dimensionP,dimgrassmannian,dimafteredgeremoval,ii},
If[gauging==1,
BFTgraph=True;
,BFTgraph=inputBFTgraph;
];
(*First need to find out which columns are the same point in the moduli space*)
oktoproceed=True;
If[checkneeded,
oktoproceed=getKasteleynCheckQ[topleft,topright,bottomleft,bottomright,BFTgraph];
];
If[oktoproceed,
If[bubblesQ[topleft,topright,bottomleft,bottomright,BFTgraph,gauging]===True,(*if there are bubbles, the graph is definitely reducible*)
reducibility=True;
,edgesnaivereducibility=reducibilityBFTedges[topleft,topright,bottomleft,bottomright,gauging,checkneeded,BFTgraph];
If[edgesnaivereducibility===Null,
reducibility=Null;(*there was some problem with the Kasteleyn*)
,If[edgesnaivereducibility==={},
(*the removal of any edge will necessarily change the matroid polytope, and so the graph cannot be reducible*)
reducibility=False;
,If[BFTgraph||planarityQ[topleft,topright,bottomleft,bottomright],
(*if the graph is planar, if we may remove edges without changing the matroid polytope it means that the graph is reducible. Equally, this is the definition for a BFT graph to be reducible*)
reducibility=True;
,(*if we have a non-planar scattering graph, we need to do things carefully.*)
pmatrix=matchingPolytope[topleft,topright,bottomleft,bottomright];
If[Dimensions[pmatrix][[2]]==0&&Length[pmatrix]>0,
reducibility=True;
,numsources=getK[topleft,topright,bottomleft,bottomright];
numexternalnodes=Length[bottomleft]+Dimensions[Join[topright,bottomright]][[2]];
maxpossibledimension=numsources(numexternalnodes-numsources);
dimensionP=dimensionPolytope[pmatrix];
If[dimensionP>maxpossibledimension,
reducibility=True;
,dimgrassmannian=dimensionGrassmannian[topleft,topright,bottomleft,bottomright];
If[dimensionP>dimgrassmannian,
(*if the dimension of the Grassmannian is less than that from a naive counting of edges and perfect matchings, it is necessarily possible to remove edges without affecting the Grassmannian*)
reducibility=True;
,reducibility=False;
(*assume the graph is not reducible until you find an edge which, when removed, does not reduce the dimension*)
For[ii=1,ii<=Length[edgesnaivereducibility],ii++,
dimafteredgeremoval=dimensionGrassmannian[topleft/.{edgesnaivereducibility[[ii]]->0},topright/.{edgesnaivereducibility[[ii]]->0},bottomleft/.{edgesnaivereducibility[[ii]]->0},bottomright];
If[dimafteredgeremoval==dimgrassmannian,
(*we have found an edge which may be removed without decreasing the dimension of the Grassmannian!*)
reducibility=True;
Break[]
];
];
];
];
];
];
];
];
];
,reducibility=Null;(*there was some problem with the Kasteleyn*)
];
reducibility
];

reducibilityEdges[topleft_,topright_,bottomleft_,bottomright_,checkneeded_:False,inputBFTgraph_:False,gauging_:2]/;(gauging===1||gauging===2):=Block[{BFTgraph,edgesnaivereducibility,reducibilityedgelist,dimgrassmannian,dimafteredgeremoval,ii},
If[gauging==1,
BFTgraph=True;
,BFTgraph=inputBFTgraph;
];
(*First need to find out which columns are the same point in the moduli space*)
edgesnaivereducibility=reducibilityBFTedges[topleft,topright,bottomleft,bottomright,gauging,checkneeded,BFTgraph];
If[edgesnaivereducibility===Null,
reducibilityedgelist=Null;(*there was some problem with the Kasteleyn*)
,If[edgesnaivereducibility==={},
(*the removal of any edge will necessarily change the matroid polytope, and so the graph cannot be reducible*)
reducibilityedgelist={};
,If[BFTgraph||planarityQ[topleft,topright,bottomleft,bottomright],
(*if the graph is planar, if we may remove edges without changing the matroid polytope it means that the graph is reducible. Equally, this is the definition for a BFT graph to be reducible*)
reducibilityedgelist=edgesnaivereducibility;
,(*if we have a non-planar scattering graph, we need to do things carefully.*)
dimgrassmannian=dimensionGrassmannian[topleft,topright,bottomleft,bottomright];
(*Just select those edges which, when removed, do not decrease the dimension of the Grassmannian*)
reducibilityedgelist=Cases[edgesnaivereducibility,zz_/;dimensionGrassmannian[topleft/.{zz->0},topright/.{zz->0},bottomleft/.{zz->0},bottomright]==dimgrassmannian];
];
];
];
reducibilityedgelist
];

reductionGraph[topleft_,topright_,bottomleft_,bottomright_,checkneeded_:False,inputBFTgraph_:False,gauging_:2]/;(gauging===1||gauging===2):=Block[{BFTgraph,naivereductionedges,reductionedges,dimgrassmannian},
If[gauging==1,
BFTgraph=True;
,BFTgraph=inputBFTgraph;
];
naivereductionedges=reductionGraphBFT[topleft,topright,bottomleft,bottomright,gauging,checkneeded,BFTgraph];
If[naivereductionedges=!=Null,
If[naivereductionedges==={},
reductionedges={};
,(*If the graph is planar or is a BFT, the BFT definition of reductions is valid*)
If[BFTgraph||planarityQ[topleft,topright,bottomleft,bottomright],
reductionedges=naivereductionedges;
,(*we have a non-planar scattering graph, and must be more careful*)
dimgrassmannian=dimensionGrassmannian[topleft,topright,bottomleft,bottomright];
(*We only want those sets of edges which, when removed, do not reduce the dimension of the Grassmannian*)
reductionedges=Cases[naivereductionedges,zz_/;dimensionGrassmannian[topleft/.Map[#->0&,zz],topright/.Map[#->0&,zz],bottomleft/.Map[#->0&,zz],bottomright]==dimgrassmannian];
];
];
,reductionedges=Null;
];
reductionedges
];

nonPluckerPolesQ[topleft_,topright_,bottomleft_,bottomright_,checkneeded_:False]:=Block[{fullreducibility,nonstandardpoles},
(*Can only do this if the graph is reduced*)
fullreducibility=reducibilityQ[topleft,topright,bottomleft,bottomright,checkneeded];
If[fullreducibility=!=Null,
If[reducibilityQ[topleft,topright,bottomleft,bottomright,checkneeded]==False,
(*If the graph is reduced but the naive reducibility tells you that it's possible to remove edges without killing any Plucker coordinates, it means that some poles are nonstandard poles, i.e. that they aren't simply products of Plucker coordinates*)
nonstandardpoles=reducibilityBFTQ[topleft,topright,bottomleft,bottomright,2,checkneeded];
,Print["Need to start with a reduced graph."];
nonstandardpoles=Null;
];
,nonstandardpoles=Null;
];
nonstandardpoles
];

removableEdges[topleft_,topright_,bottomleft_,bottomright_,checkneeded_:False,inputBFTgraph_:False,gauging_:2]/;(gauging===1||gauging===2):=Block[{BFTgraph,startingpointbad,removables,varlist,varstotryout,quickReducibility,fullpmatrix,dimpmatrix,fullmodulispace,survivingperfmatchings,survivingrows,reducibilities},
If[gauging==1,
BFTgraph=True;
,BFTgraph=inputBFTgraph;
];
startingpointbad=False;
If[checkneeded,
startingpointbad=reducibilityQ[topleft,topright,bottomleft,bottomright,checkneeded,BFTgraph,gauging];
];
If[startingpointbad=!=Null,
If[startingpointbad,
Print["The starting graph is reducible. Reduce it first, using reductionGraph."];
removables=Null;
,(*We need to try to remove in turn each of the edges of the graph, and check whether the resulting graph is reducible*)
varlist=Variables[joinupKasteleyn[topleft,topright,bottomleft,bottomright]];
varstotryout=DeleteDuplicates[Map[consistentEdgeRemoval[topleft,topright,bottomleft,bottomright,{#},False,BFTgraph]&,varlist]];
(*If we have a BFT graph, or a planar scattering graph, we may use the moduli space / matroid polytope to determine reducibility.*)
If[BFTgraph||planarityQ[topleft,topright,bottomleft,bottomright],
(*Create a function that can give the reducibility of a given P-matrix with its corresponding moduli space / matroid polytope*)
quickReducibility=Function[{pmatrix,modulispace},
Block[{pmatrixtranspose,modulitranspose,pmatrixshort,reducib},
If[pmatrix==={},
reducib=True;
,pmatrixtranspose=Transpose[pmatrix];
If[modulispace==={},modulitranspose=Table[{0},Length[pmatrixtranspose]];,modulitranspose=Transpose[modulispace];];
pmatrixshort=Transpose[Map[Times@@pmatrixtranspose[[Flatten[Position[modulitranspose,#]]]]&,DeleteDuplicates[modulitranspose]]];
If[MemberQ[pmatrixshort,ConstantArray[0,Dimensions[pmatrixshort][[2]]]],reducib=True;,reducib=False;];];
reducib]];
(*Now make the P-matrix (i.e. the matching polytope) and the moduli space / matroid polytope for the full graph*)
fullpmatrix=matchingPolytope[topleft,topright,bottomleft,bottomright];
dimpmatrix=dimensionPolytope[fullpmatrix];
fullmodulispace=moduliSpaceBFT[topleft,topright,bottomleft,bottomright,gauging,False,BFTgraph];
(*In each of the edge-removals to try out, see which perfect matchings survive*)
survivingperfmatchings=Map[survivingPerfectMatchings[topleft,topright,bottomleft,bottomright,#,False,BFTgraph]&,varstotryout];
(*Also note which rows in fullpmatrix survive (all rows except for those corresponding to the edges we're trying to kill)*)
survivingrows=Map[Complement[Range[Length[varlist]],Flatten[Position[varlist,Alternatives@@#]]]&,varstotryout];
(*In each edge-removal case, if the edge removal decreases the dimension by ONE, use quickReducibility to see whether the resulting graph is reducible or not. Otherwise it's not a valid removal*)
reducibilities=MapThread[Function[{pmatrix,modulispace},Block[{reduc},If[dimensionPolytope[pmatrix]==dimpmatrix-1,reduc=quickReducibility[pmatrix,modulispace];,reduc=True;];reduc]][fullpmatrix[[#1,#2]],fullmodulispace[[All,#2]]]&,{survivingrows,survivingperfmatchings}];
(*Only keep those cases for which the resulting graph is not reducible*)
removables=varstotryout[[Flatten[Position[reducibilities,False]]]];
,(*we have a non-planar graph, so we need to check things carefully.*)
(*Only keep those cases for which the resulting graph is not reducible and where the dimension has decreased by one*)
dimpmatrix=dimensionPolytope[matchingPolytope[topleft,topright,bottomleft,bottomright]];
removables=Cases[varstotryout,zz_/;dimensionPolytope[matchingPolytope[topleft/.Map[#->0&,zz],topright/.Map[#->0&,zz],bottomleft/.Map[#->0&,zz],bottomright]]==dimpmatrix-1&&reducibilityQ[topleft/.Map[#->0&,zz],topright/.Map[#->0&,zz],bottomleft/.Map[#->0&,zz],bottomright,False,BFTgraph,gauging]==False];
];
];
,removables=Null;
];
removables
];

matroidQ[inputmatroid_,checkneeded_:True]:=Block[{matroidcheck,matroidOK},
matroidcheck=matroidViolationCheck[inputmatroid,checkneeded];
If[matroidcheck=!=Null,
matroidOK=(matroidcheck==={});
,matroidOK=Null;
];
matroidOK
];

matroidViolationCheck[inputmatroid_,checkneeded_:True]:=Module[{inputOK,matroid,matroidelementpairs,checkMatroidPair,badmatroidelementpairs},
inputOK=True;
If[checkneeded,
inputOK=Head[inputmatroid]===List&&And@@Map[Head[#]===List&,inputmatroid]&&And@@Flatten[Map[Head[#]===Integer&,inputmatroid,{2}]];
];
If[inputOK,
matroid=Map[Sort,inputmatroid];
matroidelementpairs=Subsets[matroid,{2}];
checkMatroidPair=Function[{matroidelementpair},
Block[{matroidpairOK,ii,jj,newelement},
matroidpairOK={};
For[ii=1,ii<=Length[matroidelementpair[[1]]],ii++,
newelement=Delete[matroidelementpair[[1]],ii];
For[jj=1,jj<=Length[matroidelementpair[[2]]],jj++,
(*If there is any one that works, this matroid pair is OK.*)
If[MemberQ[matroid,Sort[Append[newelement,matroidelementpair[[2,jj]]]]],
matroidpairOK=Append[matroidpairOK,True];
Break[]
];
If[jj==Length[matroidelementpair[[2]]],matroidpairOK=Append[matroidpairOK,False];];
];
];
For[ii=1,ii<=Length[matroidelementpair[[2]]],ii++,
newelement=Delete[matroidelementpair[[2]],ii];
For[jj=1,jj<=Length[matroidelementpair[[1]]],jj++,
(*If there is any one that works, this matroid pair is OK.*)
If[MemberQ[matroid,Sort[Append[newelement,matroidelementpair[[1,jj]]]]],
matroidpairOK=Append[matroidpairOK,True];
Break[]
];
If[jj==Length[matroidelementpair[[1]]],matroidpairOK=Append[matroidpairOK,False];];
];
];
matroidpairOK=And@@matroidpairOK;
matroidpairOK]
];
badmatroidelementpairs=Cases[matroidelementpairs,zz_/;checkMatroidPair[zz]==False];
,badmatroidelementpairs=Null;
Print["The input must be of the form {{_Integer,_Integer,...},...}"];
];
badmatroidelementpairs
];

getPremadePluckerRelations[]:=Block[{filename,premaderelationsfromfile},
filename=FileNameJoin[{Directory[],"premadePluckerRelations"}];
premaderelationsfromfile=Get[(filename)];
If[functionMemory,getPremadePluckerRelations[]=premaderelationsfromfile;];
premaderelationsfromfile
];

pluckerRelations[k_Integer,n_Integer]:=Block[{filename,premaderelations,indexlist1,indexlist2,relations,conditions,i,j,oppositerelations,todelete,ii},
filename=FileNameJoin[{Directory[],"premadePluckerRelations"}];
If[9<=n<=10&&k>2&&k<(n-2)&&FileExistsQ[(filename)],
premaderelations=getPremadePluckerRelations[];
relations=premaderelations[[n-3,k-1]];
,indexlist1=Subsets[Range[n],{k-1}];
indexlist2=Subsets[Range[n],{k+1}];
relations={};
conditions=Map[HoldForm[bipartiteSUSY`minor][Sequence@@#]->0&,indexlist1];
For[i=1,i<Length[indexlist1]+1,i++,
For[j=1,j<Length[indexlist2]+1,j++,
relations=Join[relations,{Sum[(-1)^(dum-1) (-1)^(PermutationOrder[Ordering[DeleteDuplicates[Join[indexlist1[[i]],{indexlist2[[j,dum]]}]]]]-1) HoldForm[bipartiteSUSY`minor][Sequence@@Union[Join[indexlist1[[i]],{indexlist2[[j,dum]]}]]]HoldForm[bipartiteSUSY`minor][Sequence@@Complement[indexlist2[[j]],{indexlist2[[j,dum]]}]],{dum,k+1}]==0}/.conditions];
];
];
relations=DeleteDuplicates[DeleteCases[relations,True]];
(*Remove the ones that are duplicate up to a minus sign*)
oppositerelations=Map[-#[[1]]==0&,relations];
todelete={};
For[ii=1,ii<=Length[relations],ii++,
If[FreeQ[todelete,ii],
todelete=Join[todelete,Flatten[Position[oppositerelations,relations[[ii]]]]];
];
];
relations=relations[[Complement[Range[Length[relations]],todelete]]];
];
If[functionMemory,pluckerRelations[k,n]=relations;];
relations
];

independentPluckerRelations[k_Integer,n_Integer]:=Block[{pluckerrel,numindeppluckerrelations,solutions,independentrelations,newsolution,ii,possibleindependentrelations,kk,possiblenewsolutions},
pluckerrel=pluckerRelations[k,n];
(*The max number of independent Plucker relations*)
numindeppluckerrelations=Binomial[n,k]-1-k(n-k);
solutions={};
(*If we have any Plucker relations, start solving them*)
If[pluckerrel=!={},
independentrelations=pluckerrel[[{1}]];(*this variable will contain all independent relations*)
newsolution=DeleteCases[Solve[And@@independentrelations],zz_/;MemberQ[zz,_->0]];
solutions=Join[solutions,newsolution[[1]]];(*this variable will contain all independent solutions*)
(*Go through the remaining Plucker relations. If the next Plucker relation is not triviliazed by the solutions we already found to the previous relations, add it to the list of independent relations, and solve it.*)
For[ii=2,ii<=Length[pluckerrel],ii++,
If[Simplify[pluckerrel[[ii]]//.solutions]=!=True,
possibleindependentrelations=Append[independentrelations,pluckerrel[[ii]]];
newsolution=DeleteCases[Solve[And@@Simplify[possibleindependentrelations//.solutions]],zz_/;MemberQ[zz,_->0]];
For[kk=1,kk<=Length[newsolution],kk++,
possiblenewsolutions=Join[solutions,newsolution[[kk]]];
(*Tidy up the solutions so that they all depend on the same set of variables*)
possiblenewsolutions=MapThread[Rule,{Map[#[[1]]&,possiblenewsolutions],Simplify[Expand[Simplify[Map[#[[2]]&,possiblenewsolutions]//.possiblenewsolutions]]]}];
If[FreeQ[possiblenewsolutions,_->0],
independentrelations=possibleindependentrelations;
solutions=possiblenewsolutions;
Break[]
];
];
(*If we have found as many solutions as there are independent relations in total, stop here, since the remaining Plucker relations cannot be independent*)
If[Length[solutions]==numindeppluckerrelations,
Break[];
];
];
];
,(*if there are no Plucker relations, return empty sets*)
independentrelations={};
];
{independentrelations,solutions}
];

makeOrderedPathMatrix[adjacencymatrix_,pathmat_,externalordering_,topleft_,topright_,bottomleft_,bottomright_]:=Block[{adjacencymat,planar,externals,extnum,allperms,numberofperms,permutations,externaladjacencyseed,externaladjencyattempts,ii,testgraph,defaultorder,ordering,rowordering,orderedpathmat},
adjacencymat=adjacencymatrix;
planar=False;
If[externalordering===Null,
(*If we haven't specified an external ordering, make a cyclic ordering when planar. If not planar, pick a default ordering based on the Kasteleyn*)
(*Let's see if we can find a planar cyclic ordering*)
externals=Join[Range[Length[topleft]+1,Length[topleft]+Length[bottomleft]],Range[Total[Dimensions[Join[topleft,bottomleft]]]+1,Total[Dimensions[Join[topleft,bottomleft]]]+Dimensions[Join[topright,bottomright]][[2]]]];(*These are the node numbers corresponding to external nodes*)
extnum=Length[externals];
(*We will now try and form a single external boundary by connecting up all external nodes sequentially*)
allperms=Permutations[Range[extnum-1]];
numberofperms=Length[allperms];
permutations=Map[Append[#,extnum]&,allperms[[DeleteDuplicates[MapThread[Sort[{#1,#2}][[1]]&,{Range[numberofperms],Ordering[Map[Reverse[#]&,allperms]]}]]]]];
(*We will start by making an adjacency matrix for one choice of external boundary. We will then permute this matrix in all possible ways*)
If[permutations[[1]]==={1,2},
externaladjacencyseed={{0,1},{1,0}};
,If[permutations[[1]]==={1},
externaladjacencyseed={{1}};
,externaladjacencyseed=Normal[AdjacencyMatrix[PathGraph[Prepend[permutations[[1]],extnum]]]];
];
];
externaladjencyattempts=Map[externaladjacencyseed[[#,#]]&,permutations];
For[ii=1,ii<=Length[externaladjencyattempts],ii++,
adjacencymat[[externals,externals]]=externaladjencyattempts[[ii]];
testgraph=AdjacencyGraph[adjacencymat];
If[PlanarGraphQ[testgraph],(*we found a cyclic planar ordering!*)
planar=True;
ordering=Ordering[permutations[[ii]]];
rowordering=Ordering[Flatten[Map[Position[ordering,#]&,Flatten[Map[Position[Transpose[pathmat],#]&,IdentityMatrix[Length[pathmat]]]]]]];
orderedpathmat=pathmat[[rowordering,ordering]];
Break[];
];
];
If[planar==False,(*if the graph is non-planar, pick the default ordering*)
orderedpathmat=pathmat;
];
,(*if we specified an ordering, use that instead. Here we don't care whether the graph is planar or not, since the user is forced to specify all the boundaries and cuts etc.*)
(*getOrderingExternalNodesDefault is the same as that chosen by pathMatrix*)
defaultorder=getOrderingExternalNodesDefault[topleft,topright,bottomleft,bottomright];
ordering=externalordering/.MapThread[Rule,{defaultorder,Range[Length[defaultorder]]}];
rowordering=Ordering[Flatten[Map[Position[ordering,#]&,Flatten[Map[Position[Transpose[pathmat],#]&,IdentityMatrix[Length[pathmat]]]]]]];
orderedpathmat=pathmat[[rowordering,ordering]];
];
{orderedpathmat,planar}
];

spiralInList[vertexlist_]:=Block[{remainingvertices,nextnode,finalvertexlist,polardistances},
remainingvertices=vertexlist;
(*The first node is the one with the largest y-coordinate*)
nextnode=Cases[remainingvertices,{_,Max[Map[#[[2]]&,remainingvertices]]}][[1]];
finalvertexlist={nextnode+{0,0.1},nextnode};
remainingvertices=DeleteCases[remainingvertices,nextnode];
While[remainingvertices=!={},
polardistances=Map[{#[[1]],Mod[#[[2]]-ToPolarCoordinates[finalvertexlist[[-2]]-nextnode][[2]],2Pi]}&,Map[ToPolarCoordinates[#-nextnode]&,remainingvertices]];
polardistances=Chop[SetPrecision[Chop[polardistances],10]];
(*The next node is the first one reached going radially and clockwise from the current node*)
nextnode=Cases[polardistances,{_,Max[Map[#[[2]]&,polardistances]]}];
(*If there are multiple ones with the same angle, pick the nearest one*)
nextnode=Cases[nextnode,{Min[Map[#[[1]]&,nextnode]],_}][[1]];
nextnode=remainingvertices[[Position[polardistances,nextnode][[1,1]]]];
finalvertexlist=Append[finalvertexlist,nextnode];
remainingvertices=DeleteCases[remainingvertices,nextnode];
];
finalvertexlist=Delete[finalvertexlist,1];
finalvertexlist
];

rotateExternalVertices[verticespos_,edgepos_,externalnodenumbers_]:=Module[{externaledges,tocriticalnode,externalvertices,cutcoordinates,freestandingexternalvertices,doesitavoidmycriticalnode,corrections,jj,badexternalnodes,rotateExternalEdge,segmentCrossQ,newverticespos,newedgepos,iterationvector,accidentallycrossededges,newexternaledgecoords,edgeswemightcrossnow,newexternalnodesrule},
(*We need to see if any of the cuts end up going through nodes attached to external nodes. If they do, things get complicated so it's better to rotate the external node to make sure the cut doesn't do this*)
externaledges=Cases[edgepos,{___,UndirectedEdge[Alternatives@@externalnodenumbers,_]}|{___,UndirectedEdge[_,Alternatives@@externalnodenumbers]}];
(*Our cuts may never go through the "critical nodes", i.e. those nodes attached to external nodes*)
tocriticalnode=MapThread[#1[[1,#2]]->#1[[1,(#2/.{1->2,2->1})]]&,{externaledges,Map[Position[#[[2]],Alternatives@@externalnodenumbers][[1,1]]&,externaledges]}];
(*Now we'll construct the cuts: they will run directly between the external vertices, since the boundaries are so tiny*)
(*We'll make a sequence of boundaries connected by cuts. We'll start with the external node with the highest y-coordinate, and proceed along external nodes as we spiral in to the middle. This ensures that the cuts never cross each other*)
externalvertices=Map[#[[2]]&,Cases[verticespos,{Alternatives@@externalnodenumbers,___}]];
externalvertices=spiralInList[externalvertices];
(*We may now form the cuts: they are (n-1) sequential pairs of externalvertices*)
cutcoordinates=Table[{externalvertices[[iii]],externalvertices[[iii+1]]},{iii,Length[externalvertices]-1}];
(*If we go through a critical node we need to take the external edges and rotate them. We must stay within the same face and also not cross any other edges.*)
(*Let's find the coordinates of those external nodes whose position forces a cut to run parallel over the external edge*)
(*Sometimes an external node is not connected to an external edge, i.e. it is freestanding*)
freestandingexternalvertices=Cases[externalvertices,Except[Alternatives@@Map[Sequence@@#[[1]]&,externaledges]]];
doesitavoidmycriticalnode=Map[Table[Solve[Chop[SetPrecision[Chop[#[[1]]+param(#[[2]]-#[[1]])==(#[[iii]]/.tocriticalnode)]&&(0<=param<=1.),10]],param]==={},{iii,2}]&,cutcoordinates];
corrections=Map[#&,Position[cutcoordinates,Alternatives@@freestandingexternalvertices]];
For[jj=1,jj<=Length[corrections],jj++,
doesitavoidmycriticalnode[[Sequence@@corrections[[jj]]]]=True;
];
badexternalnodes=Map[cutcoordinates[[Sequence@@#]]&,DeleteDuplicates[Position[doesitavoidmycriticalnode,False],First[#1]==First[#2]&]];
(*This function takes an external edge, finds the two nearest edges to it (coming from the same critical node), determines which ones has the smallest angle to our external edge, and rotates the external edge 95% (to the power "iteration") of the way there. If the critical node is bivalent this will work anyway: it will just select the (smallest) angle to the other edge of the bivalent node. There is a higher risk that we end up crossing other edges if we rotate around a bivalent critical node but this is irrelevant, since we will iterate the rotation-procedure (selecting smaller and smaller angles of rotation) until we're sure that we haven't crossed any edges*)
newverticespos=verticespos;
newedgepos=edgepos;
rotateExternalEdge=Function[{inputexternaledge,iteration},
(*This function needs tocriticalnode, newedgepos*)
Block[{criticalnode,externaledgenewcoordinates,otheredgesnewcoordinates,rotatedotheredgesnewcoordinates,anglesotheredges,smallestangle,newexternaledgeposition},
criticalnode=inputexternaledge/.tocriticalnode;
externaledgenewcoordinates=Chop[SetPrecision[Chop[ToPolarCoordinates[inputexternaledge-criticalnode]],10]];
otheredgesnewcoordinates=Map[DeleteCases[#,{0.|0,0.|0}][[1]]&,Map[Chop[SetPrecision[Chop[#-criticalnode],10]]&,DeleteCases[Map[#[[1]]&,Cases[newedgepos,{{___,criticalnode},___}|{{criticalnode,___},___}]],{___,inputexternaledge}|{inputexternaledge,___}],{2}]];
rotatedotheredgesnewcoordinates=Map[Chop[SetPrecision[Chop[ToPolarCoordinates[RotationMatrix[-externaledgenewcoordinates[[2]]].#]],10]]&,otheredgesnewcoordinates];
anglesotheredges=Map[Mod[#[[2]],2Pi]&,rotatedotheredgesnewcoordinates];
If[anglesotheredges=!={},
anglesotheredges={Min[anglesotheredges],Max[anglesotheredges]-2Pi};
smallestangle=anglesotheredges[[Ordering[Abs[anglesotheredges]][[1]]]];
,smallestangle=Pi;
];
newexternaledgeposition=Chop[SetPrecision[Chop[criticalnode+RotationMatrix[Power[0.95,iteration]smallestangle].(inputexternaledge-criticalnode)],10]];
inputexternaledge->newexternaledgeposition]
];
(*This function tells you whether two generic segments cross*)
segmentCrossQ=Function[{edge1coords,edge2coords},
Block[{matrixtoinvert,crossdistance,crossq},
matrixtoinvert={{edge1coords[[1,1]]-edge1coords[[2,1]],edge2coords[[2,1]]-edge2coords[[1,1]]},{edge1coords[[1,2]]-edge1coords[[2,2]],edge2coords[[2,2]]-edge2coords[[1,2]]}};
If[N[Chop[Det[matrixtoinvert]]]=!=0.,(*if the matrix is invertible*)
crossdistance=Chop[Inverse[matrixtoinvert].{edge1coords[[1,1]]-edge2coords[[1,1]],edge1coords[[1,2]]-edge2coords[[1,2]]}];
crossq=And@@Map[(#>=0)&&(#<=1.)&,crossdistance];
,(*the edges are parallel*)
If[Solve[Chop[SetPrecision[Chop[edge1coords[[1]]+param(edge1coords[[2]]-edge1coords[[1]])==edge2coords[[1]]]&&0<=param<=1.,10]],param]=!={}||Solve[Chop[SetPrecision[Chop[edge1coords[[1]]+param(edge1coords[[2]]-edge1coords[[1]])==edge2coords[[2]]]&&0<=param<=1.,10]],param]=!={},
(*the edges are parallel and overlap*)
crossq=True;
,crossq=False;];
];
crossq]
];
While[badexternalnodes=!={},
(*Now let's rotate until all badexternalnodes nodes have been rotated, without crossing any other edges*)
iterationvector=ConstantArray[1,Length[badexternalnodes]];(*iterationvector keeps track of how many times we've tried to rotate a node without accidentally crossing already existing edges. Each time we iterate we rotate it slightly less*)
accidentallycrossededges=True;
While[Or@@accidentallycrossededges,
newexternaledgecoords=MapThread[{#1/.tocriticalnode,rotateExternalEdge[#1,#2][[2]]}&,{badexternalnodes,iterationvector}];
(*We'll now check whether these new external edges cross any other edge. We must remember to check whether they cross other external edges which may have also rotated and changed position,(hence the MapThread for edgeswemightcrossnow).*)
edgeswemightcrossnow=Map[#[[1]]&,Map[DeleteCases[newedgepos,{{#,___},___}|{{___,#},___}]&,badexternalnodes/.tocriticalnode],{2}]/.MapThread[#1->#2&,{badexternalnodes,newexternaledgecoords[[All,2]]}];
accidentallycrossededges=MapThread[Or@@Table[segmentCrossQ[#1[[iii]],#2],{iii,Length[#1]}]&,{edgeswemightcrossnow,newexternaledgecoords}];
iterationvector=iterationvector+accidentallycrossededges/.{False->0,True->1};
];
newexternalnodesrule=MapThread[rotateExternalEdge[#1,#2]&,{badexternalnodes,iterationvector}];
newverticespos=newverticespos/.newexternalnodesrule;
newedgepos=newedgepos/.newexternalnodesrule;
externalvertices=spiralInList[externalvertices/.newexternalnodesrule];
cutcoordinates=Table[{externalvertices[[iii]],externalvertices[[iii+1]]},{iii,Length[externalvertices]-1}];
tocriticalnode=tocriticalnode/.newexternalnodesrule;
doesitavoidmycriticalnode=Map[Table[Solve[Chop[SetPrecision[Chop[#[[1]]+param(#[[2]]-#[[1]])==(#[[iii]]/.tocriticalnode)]&&(0<=param<=1.),10]],param]==={},{iii,2}]&,cutcoordinates];
corrections=Map[#&,Position[cutcoordinates,Alternatives@@freestandingexternalvertices]];
For[jj=1,jj<=Length[corrections],jj++,
doesitavoidmycriticalnode[[Sequence@@corrections[[jj]]]]=True;
];
badexternalnodes=Map[cutcoordinates[[Sequence@@#]]&,DeleteDuplicates[Position[doesitavoidmycriticalnode,False],First[#1]==First[#2]&]];
];
{newverticespos,newedgepos}
];

makePlanarGraph[graph_,topleft_,topright_,bottomleft_,bottomright_]:=Module[{planargraph,verticespos,edgepos,externalnodenumbers,verticestocoords,externalvertices,externaledges,decreaseExternalEdgeLength,shrinkedgesrule},
planargraph=Graph[graph,GraphLayout->"PlanarEmbedding"];
verticespos=MapThread[{#1,#2}&,{Range[Length[GraphEmbedding[planargraph]]],GraphEmbedding[planargraph]}];
edgepos=Map[{{verticespos[[#[[1]],2]],verticespos[[#[[2]],2]]},#}&,EdgeList[planargraph]];
edgepos=DeleteDuplicates[edgepos];(*in case there are bubbles*)
(*Now decrease the length of all external edges by about 14%, since PlanarEmbedding tries to put everything as collinear as possible, which is problematic when we make cuts*)
externalnodenumbers=Join[Range[Length[bottomleft]]+Length[topleft],Range[Dimensions[Join[topright,bottomright]][[2]]]+Total[Dimensions[Join[topleft,bottomleft]]]];
verticestocoords=Map[Rule@@#&,verticespos];
externalvertices=externalnodenumbers/.verticestocoords;
externaledges=Cases[edgepos,{___,UndirectedEdge[Alternatives@@externalnodenumbers,_]}|{___,UndirectedEdge[_,Alternatives@@externalnodenumbers]}];
decreaseExternalEdgeLength=Function[{inputedge,decreasequantity},
(*This function needs externalvertices to be accurate in order to work*)
Block[{tosubtractcoords,externalnodepolarcoords,newposition,newpositionrule},
tosubtractcoords=Cases[inputedge[[1]],Except[Alternatives@@externalvertices]][[1]];
externalnodepolarcoords=ToPolarCoordinates[DeleteCases[Map[Chop[SetPrecision[Chop[#-tosubtractcoords],10]]&,inputedge[[1]]],{0.|0,0.|0}][[1]]];
newposition=Chop[SetPrecision[Chop[tosubtractcoords+FromPolarCoordinates[{(1.-decreasequantity)externalnodepolarcoords[[1]],externalnodepolarcoords[[2]]}]],10]];
newpositionrule=Cases[inputedge[[1]],Except[tosubtractcoords]][[1]]->newposition;
newpositionrule]
];
(*Now we can shrink all edges by e.g. 0.14.*)
(*shrinkedgesrule=Map[decreaseExternalEdgeLength[#,0.14]&,externaledges];*)
(*Or, if you want, you can decrease the length of each external node differently, e.g. each node is decreased by 0.07 several times (but all of them a different number of times).*)
shrinkedgesrule=MapThread[decreaseExternalEdgeLength[#1,#2]&,{externaledges,Table[1-(1-0.07)^jij,{jij,Length[externaledges]}]}];
verticespos=verticespos/.shrinkedgesrule;
edgepos=edgepos/.shrinkedgesrule;
{verticespos,edgepos}=rotateExternalVertices[verticespos,edgepos,externalnodenumbers];
{verticespos,edgepos}
];

makeAutomaticBoundariesAndCuts[graph_,topleft_,topright_,bottomleft_,bottomright_]:=Module[{verticespos,edgepos,externalnodenumbers,externalvertices,coordstononumbers,boundaries,cutcoordinates,cutcoordinatesandnodes,edgesCrossQ,crossedEdges,cutsedgecrossings,extraCutEdges,extracrossededges,kasteleyn,bigkasteleyn,nameUndirectedEdges,edgenamerule,boundarypaircuts},
If[PlanarGraphQ[graph],
(*We shall begin by drawing out the graph such that no edges cross. The special way in which we draw it will also be useful to us when we make cuts between boundaries*)
{verticespos,edgepos}=makePlanarGraph[graph,topleft,topright,bottomleft,bottomright];
(*Now we have the vertices and edges for a good embedding with no edge crossings*)
(*Each external vertex will be seen as having its own tiny boundary attached to it. We'll order the nodes according to the cuts. To avoid the cuts crossing each other, we'll start from an external node far out and spiral in: this determines the order of externalvertices*)
externalnodenumbers=Join[Range[Length[bottomleft]]+Length[topleft],Range[Dimensions[Join[topright,bottomright]][[2]]]+Total[Dimensions[Join[topleft,bottomleft]]]];
externalvertices=Map[#[[2]]&,Cases[verticespos,{Alternatives@@externalnodenumbers,___}]];
externalvertices=spiralInList[externalvertices];
(*We may now form the tiny boundaries around each external node, and have them in the right order*)
coordstononumbers=Map[#[[2]]->#[[1]]&,verticespos];
boundaries=Transpose[{(externalvertices/.coordstononumbers)}];
(*Now we'll construct the cuts: they will run directly between the external vertices, since the boundaries are so tiny. The cuts are (n-1) sequential pairs of externalvertices*)
cutcoordinates=Table[{externalvertices[[iii]],externalvertices[[iii+1]]},{iii,Length[externalvertices]-1}];
(*For convenience we'll also append to each of these pairs the two node numbers that they represent*)
cutcoordinatesandnodes=MapThread[{#1,#2}&,{cutcoordinates,Map[Alternatives@@#&,cutcoordinates/.coordstononumbers]}];
(*Now we need to see which edges are crossed by each cut (remember that in each cut we don't want to consider cutting edges that pass through either of the two external nodes)*)
(*This function tells you whether a cut crosses an edge*)
edgesCrossQ=Function[{cutcoords,edgecoords},
Block[{matrixtoinvert,crossdistance,newcutcoords,crossq},
matrixtoinvert={{cutcoords[[1,1]]-cutcoords[[2,1]],edgecoords[[2,1]]-edgecoords[[1,1]]},{cutcoords[[1,2]]-cutcoords[[2,2]],edgecoords[[2,2]]-edgecoords[[1,2]]}};
If[N[Chop[Det[matrixtoinvert]]]=!=0.,(*if the matrix is invertible*)
crossdistance=Chop[Inverse[matrixtoinvert].{cutcoords[[1,1]]-edgecoords[[1,1]],cutcoords[[1,2]]-edgecoords[[1,2]]}];
If[crossdistance[[2]]==1.||crossdistance[[2]]==0.||crossdistance[[2]]==0,(*we are touching the endpoint of an edge*)
(*In this case we should slightly shift the cut downwards and so that it doesn't go right through the node*)
newcutcoords=Map[#-{0,0.05}&,cutcoords];
matrixtoinvert={{newcutcoords[[1,1]]-newcutcoords[[2,1]],edgecoords[[2,1]]-edgecoords[[1,1]]},{newcutcoords[[1,2]]-newcutcoords[[2,2]],edgecoords[[2,2]]-edgecoords[[1,2]]}};
If[N[Chop[Det[matrixtoinvert]]]=!=0.,
crossdistance=Chop[Inverse[matrixtoinvert].{newcutcoords[[1,1]]-edgecoords[[1,1]],newcutcoords[[1,2]]-edgecoords[[1,2]]}];
If[crossdistance[[2]]==1.||crossdistance[[2]]==0.||crossdistance[[2]]==0,(*we are STILL touching the endpoint of an edge*)
(*In this case we should slightly shift the cut to the right and so that it doesn't go right through the node*)
newcutcoords=Map[#+{0.05,0}&,newcutcoords];
matrixtoinvert={{newcutcoords[[1,1]]-newcutcoords[[2,1]],edgecoords[[2,1]]-edgecoords[[1,1]]},{newcutcoords[[1,2]]-newcutcoords[[2,2]],edgecoords[[2,2]]-edgecoords[[1,2]]}};
If[N[Chop[Det[matrixtoinvert]]]=!=0.,
crossdistance=Chop[Inverse[matrixtoinvert].{newcutcoords[[1,1]]-edgecoords[[1,1]],newcutcoords[[1,2]]-edgecoords[[1,2]]}];
,(*This situation should not be possible - we shifting the cut shouldn't change whether things are parallel or not. We include this possibility only in case of numerical instability.*)
crossdistance={2.,2.};
];
];
,(*This situation should not be possible - we shifting the cut shouldn't change whether things are parallel or not. We include this possibility only in case of numerical instability.*)
crossdistance={2.,2.};
];
];
crossq=And@@Map[(#>=0)&&(#<=1.)&,crossdistance];
,(*the edges are parallel*)
(*In these cases it is always possible to avoid it, even when the cut would run completely over the edge. Here the cut is declared to move infinitesimally either above or below the parallel edge, and hence never runs over it. (Whether it's above or below may be determined by how it behaves when it ends up crossing edges whose endpoint is on the cut, i.e. when the matrix is invertible above in the code).*)
crossq=False;
];
crossq]
];
(*This function takes a cut and tells you which UndirectedEdges in the graph it crosses*)
crossedEdges=Function[{cutinfo},
Map[#[[2]]&,DeleteCases[Cases[edgepos,zz_/;edgesCrossQ[cutinfo[[1]],zz[[1]]]],{___,UndirectedEdge[_,cutinfo[[2]]]}|{___,UndirectedEdge[cutinfo[[2]],_]}]]
];
(*Now we're able to determine which edges are crossed by each cut*)
cutsedgecrossings=Map[crossedEdges,cutcoordinatesandnodes];
(*In order to maintain the ordering of nodes we determined with our cuts, sometimes we need an external edge to be crossed an additional time by one of the two cuts in order to keep its position in the order of external nodes*)
(*This function takes a pair of cuts and returns a list containing the additional edges that get crossed. We should assume that it is the first of the pair of cuts that crosses the edge*)
extraCutEdges=Function[{pairofcutscoordinates},
Block[{pairofcuts,externaledgename,externaledge,cutangles,edgeangle,rotatedcutangles,rotatededgeangle,return},
pairofcuts=pairofcutscoordinates;
externaledgename=Cases[edgepos,{{___,pairofcuts[[1,2]],___},___}];
If[externaledgename=!={},
externaledgename=externaledgename[[1,2]];
externaledge=Cases[edgepos,{{___,pairofcuts[[1,2]],___},___}][[1,1]];
externaledge=DeleteCases[Map[Chop[SetPrecision[Chop[#-pairofcuts[[1,2]]],10]]&,externaledge],{0.|0,0.|0}];
pairofcuts=DeleteCases[Sequence@@@Map[Chop[SetPrecision[Chop[#-pairofcuts[[1,2]]],10]]&,pairofcuts,{2}],{0.|0,0.|0}];
cutangles=Map[Mod[#[[2]],2Pi]&,Map[ToPolarCoordinates,pairofcuts]];
edgeangle=Map[Mod[#[[2]],2Pi]&,Map[ToPolarCoordinates,externaledge]];
rotatedcutangles=Mod[Chop[SetPrecision[Chop[cutangles-cutangles[[1]]],10]],2Pi];
rotatededgeangle=Mod[Chop[SetPrecision[Chop[edgeangle-cutangles[[1]]],10]],2Pi];
If[rotatededgeangle[[1]]<rotatedcutangles[[2]],
return={externaledgename};
,return={};
];
,return={};];
return]
];
(*For each pair of cuts, we now get the additional edges that get crossed*)
extracrossededges=Map[extraCutEdges,Table[{cutcoordinates[[iii]],cutcoordinates[[iii+1]]},{iii,Length[cutcoordinates]-1}]];
(*These are added to cutsedgecrossings. Since the last cut never crosses an edge, add an empty list*)
extracrossededges=Append[extracrossededges,{}];
cutsedgecrossings=Map[DeleteDuplicates,MapThread[Join,{cutsedgecrossings,extracrossededges}]];
(*We need to translate this into actual edge variable names*)
kasteleyn=joinupKasteleyn[topleft,topright,bottomleft,bottomright];
bigkasteleyn=Join[kasteleyn,Transpose[kasteleyn]];
nameUndirectedEdges=Function[{undirectededge},
undirectededge->Sequence@@Intersection@@Map[Variables[bigkasteleyn[[#]]]&,List@@undirectededge]
];
edgenamerule=Map[nameUndirectedEdges,DeleteDuplicates[EdgeList[graph]]];
cutsedgecrossings=Map[#->-#&,cutsedgecrossings/.edgenamerule,{2}];
boundarypaircuts=MapThread[Rule,{Table[{boundaries[[iii]],boundaries[[iii+1]]},{iii,Length[boundaries]-1}],cutsedgecrossings}];
,Print["It must be possible to embed the graph on genus zero without any edges crossing."];
boundaries=Null;
boundarypaircuts=Null;
];
{boundaries,boundarypaircuts}
];

grassmannianMatrix[topleft_,topright_,bottomleft_,bottomright_,referencematching_:Null,externalordering_:Null,boundarylist_:Null,boundarycutreplacements_:Null]/;(externalordering===Null&&boundarylist===Null&&boundarycutreplacements===Null||externalordering=!=Null&&boundarylist=!=Null&&boundarycutreplacements=!=Null):=Module[{adjacencymat,graph,planar,perfmatchings,referenceperfmatch,pathmat,orderedpathmat,loopdenominator,looplist,loopreplacement,loop,loopsigns,grassmannianmatrix,sourcenodes,boundaries,boundarypaircuts,pathmatorder,neworder,newroworder,cutSequence,finalloopsignsmatrix,implementFinalLoops,globalsigns},
(*Let's first see if the graph can be embedded on genus zero*)
adjacencymat=turnIntoAdjacencyMatrix[topleft,topright,bottomleft,bottomright];
graph=AdjacencyGraph[adjacencymat];(*We have finished making the Mathematica graph!*)
planar=False;
If[PlanarGraphQ[graph],
(*If it can be embedded on genus zero make the path matrix*)
If[referencematching===Null,
perfmatchings=perfectMatchings[topleft,topright,bottomleft,bottomright];
If[perfmatchings=!={},
referenceperfmatch=perfmatchings[[lowNumberLoopsPMpos[topleft,topright,bottomleft,bottomright]]];
,referenceperfmatch=0;
];
,referenceperfmatch=referencematching;
];
If[referenceperfmatch=!=0,
pathmat=pathMatrix[topleft,topright,bottomleft,bottomright,referenceperfmatch];
If[pathmat==={},
grassmannianmatrix={};
,(*We shall now pick an ordering of external edges for this path matrix, depending on whether the user specified an ordering or not*)
{orderedpathmat,planar}=makeOrderedPathMatrix[adjacencymat,pathmat,externalordering,topleft,topright,bottomleft,bottomright];
(*Now we have the ordered path matrix*)
(*Now we will plug in the correct signs. We begin with those belonging to loops (excluding those loops formed by closing the path between multiple boundaries)*)
(*First find the loops, if any*)
loopdenominator=loopDenominator[topleft,topright,bottomleft,bottomright,referenceperfmatch];
If[Head[loopdenominator]===Plus,
(*we have multiple terms*)
looplist=-DeleteCases[List@@loopdenominator,1];
loopreplacement=MapThread[Rule,{looplist,Table[loop[iii],{iii,Length[looplist]}]}];
,looplist={};
loopreplacement={};
];
(*Now use a function to add the loop signs into the matrix*)
loopsigns=Function[{matrixentry},
Block[{terms},
If[Head[matrixentry]===Integer,
terms={matrixentry};
,If[Head[matrixentry]===Plus,
(*we have multiple terms*)
terms=Expand[Simplify[(List@@matrixentry)loopdenominator]]/loopdenominator;
,terms={Expand[Simplify[matrixentry loopdenominator]]/loopdenominator};
];
terms=terms//.loopreplacement;
terms=terms/.Map[#[[2]]->-#[[2]]&,loopreplacement];
];
Total[terms]]
];
(*We'll now put in the loop signs, including those from loops formed by closing the path between multiple boundaries*)
grassmannianmatrix=Map[loopsigns,orderedpathmat,{2}];
sourcenodes=Flatten[Map[Position[Transpose[orderedpathmat],#]&,IdentityMatrix[Length[orderedpathmat]]]];
If[planar==False,
If[externalordering===Null,
{boundaries,boundarypaircuts}=makeAutomaticBoundariesAndCuts[graph,topleft,topright,bottomleft,bottomright];
(*We'll need to re-order the Grassmannian nodes now that we have a new order determined by our cuts*)
pathmatorder=Sort[Flatten[boundaries]];
neworder=Flatten[boundaries]/.MapThread[Rule,{pathmatorder,Range[Length[pathmatorder]]}];
newroworder=Ordering[Flatten[Map[Position[neworder,#]&,sourcenodes]]];
sourcenodes=Sort[Flatten[Map[Position[neworder,#]&,sourcenodes]]];
grassmannianmatrix=grassmannianmatrix[[newroworder,neworder]];
,{boundaries,boundarypaircuts}={boundarylist,boundarycutreplacements};
];
(*This function takes a pair of external nodes and returns a list of replacement lists to be used on the Grassmannian. These replacements represent all the cuts required to go from one boundary to the next*)
cutSequence=Function[{externaledgepair},
Block[{bigkasteleyn,externalnodepair,boundariestoconnect,boundarynumberrule,boundarypairnumbers,shortestpath,cutpath},
bigkasteleyn=Join[joinupKasteleyn[topleft,topright,bottomleft,bottomright],Transpose[joinupKasteleyn[topleft,topright,bottomleft,bottomright]]];
externalnodepair=Flatten[Map[Intersection[#,Flatten[boundaries]]&,Map[#[[1]]&,Map[Position[bigkasteleyn,#]&,externaledgepair],{2}]]];
boundariestoconnect=Cases[boundaries,zz_/;MemberQ[zz,Alternatives@@externalnodepair]];
If[Length[boundariestoconnect]>1,(*the nodes are on different boundaries*)
boundarynumberrule=MapThread[Rule,{boundaries,Range[Length[boundaries]]}];
boundariestoconnect=boundariestoconnect/.boundarynumberrule;
boundarypairnumbers=Map[#[[1]]&,boundarypaircuts]/.boundarynumberrule;
(*Let's now find the shortest path between these two boundaries, using our cuts*)
shortestpath=FindShortestPath[Graph[Map[UndirectedEdge@@#&,boundarypairnumbers]],Sequence@@boundariestoconnect];
(*Turn this sequence of boundaries into pairs that can be identified with cuts*)
shortestpath=Table[{shortestpath[[iii]],shortestpath[[iii+1]]},{iii,Length[shortestpath]-1}];
(*This is the sequence of cuts we must take to go from one boundary to the other. These cuts must be performed sequentially, not all at once (in case some edges get cut multiple times)!*)
cutpath=shortestpath/.(boundarypaircuts/.boundarynumberrule);
,(*the two external nodes are on the same boundary*)
cutpath={};
];
cutpath]
];
finalloopsignsmatrix=Map[cutSequence[Intersection[Variables[#],Variables[Join[topright,bottomleft]]]]&,grassmannianmatrix,{2}];
implementFinalLoops=Function[{matrixentry,replacementlists},
Block[{newmatrixentry,ii},
newmatrixentry=matrixentry;
For[ii=1,ii<=Length[replacementlists],ii++,
newmatrixentry=newmatrixentry/.replacementlists[[ii]];
];
newmatrixentry]
];
grassmannianmatrix=MapThread[implementFinalLoops[#1,#2]&,{grassmannianmatrix,finalloopsignsmatrix},2];
];
(*We have finished putting in signs due to loops*)
(*We'll now put in the global signs on matrix entries*)
globalsigns=Partition[Map[Power[-1,Count[sourcenodes,zz_/;zz>#[[1]]&&zz<#[[2]]]]&,Map[Sort,Tuples[{sourcenodes,Range[Dimensions[grassmannianmatrix][[2]]]}]]],Dimensions[grassmannianmatrix][[2]]];
grassmannianmatrix=(grassmannianmatrix globalsigns)/.Map[#[[2]]->#[[1]]&,loopreplacement];
];
,Print["This graph has no perfect matchings"];
grassmannianmatrix=Null;
];
,(*If it cannot be embedded on genus zero, stop here*)
Print["The diagram cannot be embedded on genus zero."];
grassmannianmatrix=Null;
];
grassmannianmatrix
];

pluckerCoordinates[topleft_,topright_,bottomleft_,bottomright_,referencematching_:Null,withsigns_:False]:=Module[{perfmatchings,referenceperfmatch,Cmatrix,minors,pathmat},
If[referencematching===Null,
perfmatchings=perfectMatchings[topleft,topright,bottomleft,bottomright];
If[perfmatchings=!={},
referenceperfmatch=perfmatchings[[lowNumberLoopsPMpos[topleft,topright,bottomleft,bottomright]]];
,referenceperfmatch=0;
];
,referenceperfmatch=referencematching;
];
If[referenceperfmatch=!=0,
If[withsigns,
Cmatrix=grassmannianMatrix[topleft,topright,bottomleft,bottomright,referenceperfmatch];
,Cmatrix=pathMatrix[topleft,topright,bottomleft,bottomright,referenceperfmatch];
];
If[Cmatrix==={},
minors={};
,minors=Expand[Simplify[Minors[Cmatrix,Length[Cmatrix]][[1]]]];
];
,minors=Null;
];
minors
];

getOrderingExternalEdgesGrassmannian[topleft_,topright_,bottomleft_,bottomright_]:=Block[{ordering,adjacencymat,graph,planar,externals,extnum,allperms,numberofperms,permutations,externaladjacencyseed,externaladjencyattempts,ii,testgraph,verticespos,edgepos,externalvertices,bigkasteleyn},
adjacencymat=turnIntoAdjacencyMatrix[topleft,topright,bottomleft,bottomright];
graph=AdjacencyGraph[adjacencymat];
planar=False;
If[PlanarGraphQ[graph],(*the graph can be embedded on genus zero, but may still be non-planar*)
(*Make a cyclic ordering when planar. If not planar, pick a default ordering based on the Kasteleyn*)
(*Let's see if we can find a planar cyclic ordering*)
externals=Join[Range[Length[topleft]+1,Length[topleft]+Length[bottomleft]],Range[Total[Dimensions[Join[topleft,bottomleft]]]+1,Total[Dimensions[Join[topleft,bottomleft]]]+Dimensions[Join[topright,bottomright]][[2]]]];(*These are the node numbers corresponding to external nodes*)
ordering=externals;
If[externals==={},
ordering={};
,extnum=Length[externals];
(*We will now try and form a single external boundary by connecting up all external nodes sequentially*)
allperms=Permutations[Range[extnum-1]];
numberofperms=Length[allperms];
permutations=Map[Append[#,extnum]&,allperms[[DeleteDuplicates[MapThread[Sort[{#1,#2}][[1]]&,{Range[numberofperms],Ordering[Map[Reverse[#]&,allperms]]}]]]]];
(*We will start by making an adjacency matrix for one choice of external boundary. We will then permute this matrix in all possible ways*)
If[permutations[[1]]==={1,2},
externaladjacencyseed={{0,1},{1,0}};
,If[permutations[[1]]==={1},
externaladjacencyseed={{1}};
,externaladjacencyseed=Normal[AdjacencyMatrix[PathGraph[Prepend[permutations[[1]],extnum]]]];
];
];
externaladjencyattempts=Map[externaladjacencyseed[[#,#]]&,permutations];
For[ii=1,ii<=Length[externaladjencyattempts],ii++,
adjacencymat[[externals,externals]]=externaladjencyattempts[[ii]];
testgraph=AdjacencyGraph[adjacencymat];
If[PlanarGraphQ[testgraph],(*we found a cyclic planar ordering!*)
planar=True;
ordering=ordering[[Ordering[permutations[[ii]]]]];
Break[];
];
];
(*If the graph was planar, we now have the ordering of external nodes*)
If[planar==False,
{verticespos,edgepos}=makePlanarGraph[graph,topleft,topright,bottomleft,bottomright];
externalvertices=Map[#[[2]]&,Cases[verticespos,{Alternatives@@externals,___}]];
externalvertices=spiralInList[externalvertices];
ordering=ordering[[(externalvertices/.Map[#[[2]]->#[[1]]&,verticespos])/.MapThread[Rule,{externals,Range[Length[externals]]}]]];
];
bigkasteleyn=Join[joinupKasteleyn[topleft,topright,bottomleft,bottomright],Transpose[joinupKasteleyn[topleft,topright,bottomleft,bottomright]]];
ordering=Map[#[[1,1]]->#[[2]]&,DeleteCases[MapThread[Rule,{Map[Variables[bigkasteleyn[[#]]]&,ordering],Range[Length[ordering]]}],{}->___]];
];
,(*If it cannot be embedded on genus zero, stop here*)
Print["The diagram cannot be embedded on genus zero."];
ordering=Null;
];
ordering
];

getOrderingExternalNodesGrassmannian[topleft_,topright_,bottomleft_,bottomright_]:=Block[{ordering,adjacencymat,graph,planar,externals,extnum,allperms,numberofperms,permutations,externaladjacencyseed,externaladjencyattempts,ii,testgraph,verticespos,edgepos,externalvertices},
ordering=Join[Range[Length[topleft]+1,Length[topleft]+Length[bottomleft]],Range[Total[Dimensions[Join[topleft,bottomleft]]]+1,Total[Dimensions[Join[topleft,bottomleft]]]+Dimensions[Join[topright,bottomright]][[2]]]];
adjacencymat=turnIntoAdjacencyMatrix[topleft,topright,bottomleft,bottomright];
graph=AdjacencyGraph[adjacencymat];
planar=False;
If[PlanarGraphQ[graph],(*the graph can be embedded on genus zero, but may still be non-planar*)
(*Make a cyclic ordering when planar. If not planar, pick a default ordering based on the Kasteleyn*)
(*Let's see if we can find a planar cyclic ordering*)
externals=Join[Range[Length[topleft]+1,Length[topleft]+Length[bottomleft]],Range[Total[Dimensions[Join[topleft,bottomleft]]]+1,Total[Dimensions[Join[topleft,bottomleft]]]+Dimensions[Join[topright,bottomright]][[2]]]];(*These are the node numbers corresponding to external nodes*)
If[externals==={},
ordering={};
,extnum=Length[externals];
(*We will now try and form a single external boundary by connecting up all external nodes sequentially*)
allperms=Permutations[Range[extnum-1]];
numberofperms=Length[allperms];
permutations=Map[Append[#,extnum]&,allperms[[DeleteDuplicates[MapThread[Sort[{#1,#2}][[1]]&,{Range[numberofperms],Ordering[Map[Reverse[#]&,allperms]]}]]]]];
(*We will start by making an adjacency matrix for one choice of external boundary. We will then permute this matrix in all possible ways*)
If[permutations[[1]]==={1,2},
externaladjacencyseed={{0,1},{1,0}};
,If[permutations[[1]]==={1},
externaladjacencyseed={{1}};
,externaladjacencyseed=Normal[AdjacencyMatrix[PathGraph[Prepend[permutations[[1]],extnum]]]];
];
];
externaladjencyattempts=Map[externaladjacencyseed[[#,#]]&,permutations];
For[ii=1,ii<=Length[externaladjencyattempts],ii++,
adjacencymat[[externals,externals]]=externaladjencyattempts[[ii]];
testgraph=AdjacencyGraph[adjacencymat];
If[PlanarGraphQ[testgraph],(*we found a cyclic planar ordering!*)
planar=True;
ordering=ordering[[Ordering[permutations[[ii]]]]];
Break[];
];
];
(*If the graph was planar, we now have the ordering of external nodes*)
If[planar==False,
{verticespos,edgepos}=makePlanarGraph[graph,topleft,topright,bottomleft,bottomright];
externalvertices=Map[#[[2]]&,Cases[verticespos,{Alternatives@@externals,___}]];
externalvertices=spiralInList[externalvertices];
ordering=ordering[[(externalvertices/.Map[#[[2]]->#[[1]]&,verticespos])/.MapThread[Rule,{externals,Range[Length[externals]]}]]];
];
];
,(*If it cannot be embedded on genus zero, stop here*)
Print["The diagram cannot be embedded on genus zero."];
ordering=Null;
];
ordering
];

stratificationBoundaries[topleft_,topright_,bottomleft_,bottomright_,checkneeded_:False,inputBFTgraph_:False,gauging_:2]/;(gauging===1||gauging===2):=Block[{BFTgraph,checkOK,matchingpoly,stratification,xlistandPmatrix,modulispace,startingplanarity,removable,topdim,varlist,makeDaughterGraphs,planarReducibility,tofixlevels,maxnonplanardimension,level,nonplanarpositions,planarboundaries,nonplanarboundaries,templevel,boundarykillededges,newplanarity,planarpositions,fix,identremovable,patternidentremovable,dim,locationofparents,thislevelspositions},
If[gauging==1,
BFTgraph=True;
,BFTgraph=inputBFTgraph;
];
checkOK=True;
If[checkneeded==True,
checkOK=getKasteleynCheckQ[topleft,topright,bottomleft,bottomright,BFTgraph];
];
If[checkOK==True,
(*We begin by making the face lattice of the matching polytope. Each element in the face lattice will be composed of three objects: the perfect matching matrix P, the moduli space/matroid polytope, and the answer to planarityQ. This will allow us to construct the face lattice while computing the perfect matchings and matrix P as few times as possible (not once per subgraph!)*)
(*We'll start with making the top-dimensional element. In P we shall also tag on which edges correspond to each row, by making the first element of each row the edge name*)
matchingpoly=matchingPolytope[topleft,topright,bottomleft,bottomright,checkneeded,BFTgraph];
If[Length[matchingpoly]===0||Dimensions[matchingpoly][[2]]===0,
stratification={};
,xlistandPmatrix=Join[Transpose[{Variables[joinupKasteleyn[topleft,topright,bottomleft,bottomright]]}],matchingpoly,2];
modulispace=moduliSpaceBFT[topleft,topright,bottomleft,bottomright,gauging,checkneeded,BFTgraph];
(*This will be the top-dimensional element in our stratification*)
startingplanarity=planarityQ[topleft,topright,bottomleft,bottomright];
If[BFTgraph||startingplanarity,
removable[0]={{xlistandPmatrix,modulispace,True}};
(*Since planarity is inherited by subgraphs, this means we'll never have to assess planarity again and we can treat everything as planar. This will mean we can assess reducibility very fast and easily*)
,removable[0]={{xlistandPmatrix,modulispace,startingplanarity}};
];
(*We'll save some basic information to avoid having to evaluate it many times*)
topdim=dimensionPolytope[matchingpoly];
varlist=Variables[joinupKasteleyn[topleft,topright,bottomleft,bottomright]];
(*For each element in the face lattice, we will need to find all of its boundaries. These are found by deleting edges. makeDaughterGraphs takes an element in the face lattice and removes all possible edges, making potential boundaries (which will need to be verified). Initially the planarity of the subgraphs is inherited, i.e. is declared equal to the originating graph.*)
makeDaughterGraphs=Function[{boundaryelement},
Block[{pmat,moduli,elementplanarity,pmstokeep,daughters},
pmat=boundaryelement[[1]];
moduli=boundaryelement[[2]];
elementplanarity=boundaryelement[[3]];
pmstokeep=Table[Flatten[Position[boundaryelement[[1]][[jjj]],0,1]],{jjj,Length[pmat]}];
daughters=Table[{DeleteCases[pmat[[All,Prepend[pmstokeep[[jjj]],1]]],Prepend[ConstantArray[0,Length[pmstokeep[[jjj]]]],_]],moduli[[All,pmstokeep[[jjj]]-1]],elementplanarity},{jjj,Length[pmstokeep]}];
daughters
]
];
(*After making all subgraphs, we'll keep only those whose dimension has decreased by one. Furthermore, since we're ultimately only interested in reduced graphs, we'll remove those that are reducible. planarReducibility is able to take a planar case and tell you its reducibility very fast.*)
planarReducibility=Function[{pmatrix,modulispace},
Block[{pmatrixtranspose,modulitranspose,pmatrixshort,reducib},
If[pmatrix==={},
reducib=True;
,pmatrixtranspose=Transpose[pmatrix];
If[modulispace==={},modulitranspose=Table[{0},Length[pmatrixtranspose]];,modulitranspose=Transpose[modulispace];];
pmatrixshort=Transpose[Map[Times@@pmatrixtranspose[[Flatten[Position[modulitranspose,#]]]]&,DeleteDuplicates[modulitranspose]]];
If[MemberQ[pmatrixshort,ConstantArray[0,Dimensions[pmatrixshort][[2]]]],reducib=True;,reducib=False;];];
reducib]
];
(*Now we'll go through each level, starting from the top-dimensional one and working our way down, and first construct the face lattice, and then remove those elements which are reducible.*)
(*Sometimes (when the starting graph is reducible) a level only contains reducible boundaries. In these cases we'll eliminate the reducible examples in a second step*)
(*We'll start by assessing the reducibility of the starting point. If it's planar, we may use the fast way. Otherwise we'll need to use the dimension of the Grassmannian.*)
If[BFTgraph||startingplanarity,
If[planarReducibility[Drop[removable[0][[1,1]],None,{1}],removable[0][[1,2]]]===False,
tofixlevels={};
,tofixlevels={0};
];
,If[dimensionGrassmannian[topleft,topright,bottomleft,bottomright]===topdim,
tofixlevels={};
,tofixlevels={0};
];
];
(*maxnonplanardimension is the highest Grassmannian dimension of any nonplanar diagram in the stratification. For now we haven't evaluated it, and we'll assume it's equal to topdim, until we decide it's worthwhile to check what this number should really be*)
maxnonplanardimension=topdim;
For[level=1,level<=topdim,level++,
(*For each element in removable[level-1] we make all subgraphs. We'll end up with many duplicates. Since they all inherit their planarity, some subgraphs are simultaneously labeled planar=True as well as planar=False. If any of these labels is True for a set of duplicates, then the graph has come from a planar one and must hence be planar. If it's still labeled non-planar, we'll later use planarityQ to check whether this is still the case.*)
removable[level]=Map[{#[[1,1]],#[[1,2]],Or@@Map[Last,#]}&,GatherBy[Table[Sequence@@makeDaughterGraphs[removable[level-1][[iii]]],{iii,Length[removable[level-1]]}],First]];
(*Now we'll remove those elements whose dimension has decreased by too much*)
removable[level]=Cases[removable[level],zz_/;dimensionPolytope[Drop[zz[[1]],None,{1}]]===topdim-level];
(*On the surviving elements, we'll reassess planarity on the nonplanar cases.*)
nonplanarpositions=Flatten[Position[removable[level],{___,False}]];
templevel=removable[level];
(*Now we'll take the nonplanar cases and check whether they really are still nonplanar. Begin by turning each of these cases into a list of killed edges.*)
boundarykillededges=Map[#->0&,Map[Complement[varlist,#[[1,All,1]]]&,removable[level][[nonplanarpositions]]],{2}];
newplanarity=Map[planarityQ[topleft/.#,topright/.#,bottomleft/.#,bottomright]&,boundarykillededges];
templevel[[nonplanarpositions,3]]=newplanarity;
(*Now we know for sure that the planarity labeling is correct*)
(*We'll now want to only keep reduced elements. For planar cases, planarReducibility is very fast at determining this. For nonplanar cases, we'll need to check whether the dimension of the Grassmannian is the same as that of P. If not, it means we have secretly reduced the dimension of the Grassmannian too much by creating a reducible graph.*)
planarpositions=Flatten[Position[templevel,{___,True}]];
nonplanarpositions=Flatten[Position[templevel,{___,False}]];
(*We'll put the reduced planar elements first, then the reduced non-planar ones*)
planarboundaries=Cases[templevel[[planarpositions]],zz_/;planarReducibility[Drop[zz[[1]],None,{1}],zz[[2]]]===False];
(*For the nonplanar boundaries we'll need to evaluate the dimension of the Grassmannian, which is very time-consuming. At level=1 (i.e. codimension-1 boundaries of the starting point), if there are no reduced graphs, we'll look at the nonplanar reducible graphs and evaluate all of their Grassmannian dimensions, to find the true value of maxnonplanardimension (otherwise it had just been set to be equal to topdim). Since those graphs are reducible, maxnonplanardimension will necessarily be a smaller number than topdim-1. For all dimensions between topdim and maxnonplanardimension, we will not need to assess the Grassmannian of the nonplanar diagrams, since its dimension will still be lower than topdim-level, indicating that these nonplanar diagrams are reducible*)
If[maxnonplanardimension>=topdim-level,
nonplanarboundaries=templevel[[nonplanarpositions]][[Flatten[Position[Map[dimensionGrassmannian[topleft/.#,topright/.#,bottomleft/.#,bottomright]&,boundarykillededges[[Flatten[Position[newplanarity,False]]]]],topdim-level]]]];
,nonplanarboundaries={};
];
removable[level]=Join[planarboundaries,nonplanarboundaries];
If[removable[level]==={},
(*If some level happens to only contain reducible examples, we'll keep all boundaries, and remove the reducible ones later.*)
removable[level]=templevel;
tofixlevels=Append[tofixlevels,level];
(*If we are the at the first level and there were no reduced boundaries, find out what the maximal dimension of the Grassmannian is for nonplanar diagrams, so that we don't need to evaluate it again until topdim-level is equal to this Grassmannian dimension. If we don't do this, we might be forced to go through many levels where everything is reducible and assess the dimension of the Grassmannian many times*)
If[level==1,
maxnonplanardimension=Max[Map[dimensionGrassmannian[topleft/.#,topright/.#,bottomleft/.#,bottomright]&,boundarykillededges[[Flatten[Position[newplanarity,False]]]]]];
];
];
];
For[fix=1,fix<=Length[tofixlevels],fix++,
removable[tofixlevels[[fix]]]={};
];
(*Now we'll identify boundaries according to their substratification. From each element, it's sufficient to check the substratification one level down, since everything below that has been vetted by this first substratification level. At the bottom level (zero-dimensional) we can identify everything according to their moduli space.*)
identremovable[topdim]=Map[#[[1,All,1]]&,GatherBy[removable[topdim],#[[2]]&],{2}];
(*In order to compute the substratifications in a fast way, we'll check which boundaries of one dimension higher have these as subsets. We can do this by writing 0-dim boundaries as {___,edge1,___,edge2,__...} and check which boundaries of one dimension high fit this pattern. We do this because Mathematica's pattern recognition is very fast.*)
patternidentremovable[topdim]=Map[Alternatives@@#&,Map[Riffle[#,___,{1,-1,2}]&,identremovable[topdim],{2}]];
(*We'll now go through each of the dimensions, starting from the bottom*)
If[BFTgraph||startingplanarity,
(*We can identify everything according to its moduli space*)
For[dim=1,dim<topdim,dim++,
identremovable[topdim-dim]=Map[#[[1,All,1]]&,GatherBy[removable[topdim-dim],Sort[DeleteDuplicates[Transpose[#[[2]]]]]&],{2}];
];
,(*we'll need to identify according to the substratifications*)
For[dim=1,dim<topdim,dim++,
(*Begin by turning the boundaries into lists of edges*)
removable[topdim-dim]=Map[#[[1,All,1]]&,removable[topdim-dim]];
(*For each of the sub-boundaries, we want to find which graphs of one dimension higher terminate in this sub-boundary*)
locationofparents=Map[Flatten[Position[removable[topdim-dim],#]]&,patternidentremovable[topdim-dim+1]];
(*In each of the elements in removable[topdim-dim], we now want to know where they are in the list of locationofparents.*)
(*Since locationofparents indexes according to position, we'll turn removable[topdim-dim] into positions first.*)
thislevelspositions=Range[Length[removable[topdim-dim]]];
identremovable[topdim-dim]=Map[removable[topdim-dim][[#]]&,GatherBy[thislevelspositions,Position[locationofparents,{___,#,___}]&],{2}];
(*Now we're ready to do the same thing for the next dimension, and will need patternidentremovable for this dimension*)
patternidentremovable[topdim-dim]=Map[Alternatives@@#&,Map[Riffle[#,___,{1,-1,2}]&,identremovable[topdim-dim],{2}]];
];
];
(*Finally, the top-dimensional level is simply the list of edges in the starting point*)
identremovable[0]=Map[{#[[1,All,1]]}&,removable[0]];
(*The stratification will be outputted as a list of elements, each containing all the boundaries of a certain dimensionality. Each boundary is expressed as a list of possible non-zero edges which are move-equivalent configurations, all representing the same boundary.*)
stratification=Table[identremovable[iii],{iii,0,topdim}];
];
,stratification=Null;
];
stratification
];

stratificationNumbers[topleft_,topright_,bottomleft_,bottomright_,checkneeded_:False,inputBFTgraph_:False,gauging_:2]/;(gauging===1||gauging===2):=Block[{BFTgraph,checkOK,stratification,stratificationnumbers},
If[gauging==1,
BFTgraph=True;
,BFTgraph=inputBFTgraph;
];
checkOK=True;
If[checkneeded==True,
checkOK=getKasteleynCheckQ[topleft,topright,bottomleft,bottomright,BFTgraph];
];
If[checkOK==True,
stratification=stratificationBoundaries[topleft,topright,bottomleft,bottomright,checkneeded,BFTgraph,gauging];
stratificationnumbers=Map[Length,stratification];
,stratificationnumbers=Null;
];
stratificationnumbers
];

stratificationEulerNumber[topleft_,topright_,bottomleft_,bottomright_,checkneeded_:False,inputBFTgraph_:False,gauging_:2]/;(gauging===1||gauging===2):=Block[{BFTgraph,checkOK,eulernumber,stratificationnumbers},
If[gauging==1,
BFTgraph=True;
,BFTgraph=inputBFTgraph;
];
checkOK=True;
If[checkneeded==True,
checkOK=getKasteleynCheckQ[topleft,topright,bottomleft,bottomright,BFTgraph];
];
If[checkOK==True,
stratificationnumbers=stratificationNumbers[topleft,topright,bottomleft,bottomright,checkneeded,BFTgraph,gauging];
eulernumber=Sum[Power[(-1),iii+1]stratificationnumbers[[-iii]],{iii,Length[stratificationnumbers]}];
,eulernumber=Null;
];
eulernumber
];

matchingPolytopeBoundaries[topleft_,topright_,bottomleft_,bottomright_,checkneeded_:False,BFTgraph_:False]:=Block[{checkOK,matchingpoly,xlistandPmatrix,facelatticeboundaries,topdim,makeDaughterGraphs,level,facelattice},
checkOK=True;
If[checkneeded==True,
checkOK=getKasteleynCheckQ[topleft,topright,bottomleft,bottomright,BFTgraph];
];
If[checkOK==True,
(*Each element in the face lattice of the matching polytope will be described by the perfect matching matrix P, which will be computed only once for the top-dimensional element; this will allow us to construct the face lattice while computing the perfect matchings and matrix P as few times as possible (not once per subgraph!)*)
(*We'll start with making the top-dimensional element. In P we shall also tag on which edges correspond to each row, by making the first element of each row the edge name*)
matchingpoly=matchingPolytope[topleft,topright,bottomleft,bottomright,checkneeded,BFTgraph];
If[Length[matchingpoly]===0||Dimensions[matchingpoly][[2]]===0,
facelattice={};
,xlistandPmatrix=Join[Transpose[{Variables[joinupKasteleyn[topleft,topright,bottomleft,bottomright]]}],matchingpoly,2];
(*This will be the top-dimensional element in our stratification*)
facelatticeboundaries[0]={xlistandPmatrix};
(*We'll save some basic information to avoid having to evaluate it many times*)
topdim=dimensionPolytope[matchingpoly];
(*For each element in the face lattice, we will need to find all of its boundaries. These are found by deleting edges. makeDaughterGraphs takes an element in the face lattice and removes all possible edges, making potential boundaries (which will need to be verified)*)
makeDaughterGraphs=Function[{boundaryelement},
Block[{pmat,pmstokeep,daughters},
pmat=boundaryelement;
pmstokeep=Table[Flatten[Position[boundaryelement[[jjj]],0,1]],{jjj,Length[pmat]}];
daughters=Table[DeleteCases[pmat[[All,Prepend[pmstokeep[[jjj]],1]]],Prepend[ConstantArray[0,Length[pmstokeep[[jjj]]]],_]],{jjj,Length[pmstokeep]}];
daughters
]
];
(*After making all subgraphs, we'll keep only those whose dimension has decreased by one*)
For[level=1,level<=topdim,level++,
(*For each element in removable[level-1] we make all subgraphs. We'll end up with many duplicates*)
facelatticeboundaries[level]=DeleteDuplicates[Table[Sequence@@makeDaughterGraphs[facelatticeboundaries[level-1][[iii]]],{iii,Length[facelatticeboundaries[level-1]]}]];
(*Now we'll remove those elements whose dimension has decreased by too much*)
facelatticeboundaries[level]=Cases[facelatticeboundaries[level],zz_/;dimensionPolytope[Drop[zz,None,{1}]]===topdim-level];
];
facelatticeboundaries[topdim]=DeleteCases[facelatticeboundaries[topdim],{}];
facelattice=Map[#[[All,1]]&,Table[facelatticeboundaries[iii],{iii,0,topdim}],{2}];
];
,facelattice=Null;
];
facelattice
];

stratificationGraph[topleft_,topright_,bottomleft_,bottomright_,checkneeded_:False,inputBFTgraph_:False,gauging_:2]/;(gauging===1||gauging===2):=Block[{BFTgraph,checkOK,matchingpoly,stratificationgraph,xlistandPmatrix,modulispace,startingplanarity,removable,topdim,varlist,makeDaughterGraphs,planarReducibility,tofixlevels,maxnonplanardimension,level,nonplanarpositions,templevel,boundarykillededges,newplanarity,planarpositions,planarboundaries,nonplanarboundaries,fix,identremovable,patternidentremovable,dim,locationofparents,thislevelspositions,identifiedboundaries,newlayer,alllayers,totalnumberofboundaries,tochangeposition,tokeeprowsandcolumns,adjacencymatrix},
If[gauging==1,
BFTgraph=True;
,BFTgraph=inputBFTgraph;
];
checkOK=True;
If[checkneeded==True,
checkOK=getKasteleynCheckQ[topleft,topright,bottomleft,bottomright,BFTgraph];
];
If[checkOK==True,
(*We begin by making the face lattice of the matching polytope. Each element in the face lattice will be composed of three objects: the perfect matching matrix P, the moduli space/matroid polytope, and the answer to planarityQ. This will allow us to construct the face lattice while computing the perfect matchings and matrix P as few times as possible (not once per subgraph!)*)
(*We'll start with making the top-dimensional element. In P we shall also tag on which edges correspond to each row, by making the first element of each row the edge name*)
matchingpoly=matchingPolytope[topleft,topright,bottomleft,bottomright,checkneeded,BFTgraph];
If[Length[matchingpoly]===0||Dimensions[matchingpoly][[2]]===0,
stratificationgraph=AdjacencyGraph[{}];
,xlistandPmatrix=Join[Transpose[{Variables[joinupKasteleyn[topleft,topright,bottomleft,bottomright]]}],matchingpoly,2];
modulispace=moduliSpaceBFT[topleft,topright,bottomleft,bottomright,gauging,checkneeded,BFTgraph];
(*This will be the top-dimensional element in our stratification*)
startingplanarity=planarityQ[topleft,topright,bottomleft,bottomright];
If[BFTgraph||startingplanarity,
removable[0]={{xlistandPmatrix,modulispace,True}};
(*Since planarity is inherited by subgraphs, this means we'll never have to assess planarity again and we can treat everything as planar. This will mean we can assess reducibility very fast and easily*)
,removable[0]={{xlistandPmatrix,modulispace,startingplanarity}};
];
(*We'll save some basic information to avoid having to evaluate it many times*)
topdim=dimensionPolytope[matchingpoly];
varlist=Variables[joinupKasteleyn[topleft,topright,bottomleft,bottomright]];
(*For each element in the face lattice, we will need to find all of its boundaries. These are found by deleting edges. makeDaughterGraphs takes an element in the face lattice and removes all possible edges, making potential boundaries (which will need to be verified). Initially the planarity of the subgraphs is inherited, i.e. is declared equal to the originating graph.*)
makeDaughterGraphs=Function[{boundaryelement},
Block[{pmat,moduli,elementplanarity,pmstokeep,daughters},
pmat=boundaryelement[[1]];
moduli=boundaryelement[[2]];
elementplanarity=boundaryelement[[3]];
pmstokeep=Table[Flatten[Position[boundaryelement[[1]][[jjj]],0,1]],{jjj,Length[pmat]}];
daughters=Table[{DeleteCases[pmat[[All,Prepend[pmstokeep[[jjj]],1]]],Prepend[ConstantArray[0,Length[pmstokeep[[jjj]]]],_]],moduli[[All,pmstokeep[[jjj]]-1]],elementplanarity},{jjj,Length[pmstokeep]}];
daughters
]
];
(*After making all subgraphs, we'll keep only those whose dimension has decreased by one. Furthermore, since we're ultimately only interested in reduced graphs, we'll remove those that are reducible. planarReducibility is able to take a planar case and tell you its reducibility very fast.*)
planarReducibility=Function[{pmatrix,modulispace},
Block[{pmatrixtranspose,modulitranspose,pmatrixshort,reducib},
If[pmatrix==={},
reducib=True;
,pmatrixtranspose=Transpose[pmatrix];
If[modulispace==={},modulitranspose=Table[{0},Length[pmatrixtranspose]];,modulitranspose=Transpose[modulispace];];
pmatrixshort=Transpose[Map[Times@@pmatrixtranspose[[Flatten[Position[modulitranspose,#]]]]&,DeleteDuplicates[modulitranspose]]];
If[MemberQ[pmatrixshort,ConstantArray[0,Dimensions[pmatrixshort][[2]]]],reducib=True;,reducib=False;];];
reducib]
];
(*Now we'll go through each level, starting from the top-dimensional one and working our way down, and first construct the face lattice, and then remove those elements which are reducible.*)
(*Sometimes (when the starting graph is reducible) a level only contains reducible boundaries. In these cases we'll eliminate the reducible examples in a second step*)
(*We'll start by assessing the reducibility of the starting point. If it's planar, we may use the fast way. Otherwise we'll need to use the dimension of the Grassmannian.*)
If[BFTgraph,
If[planarReducibility[Drop[removable[0][[1,1]],None,{1}],removable[0][[1,2]]]===False,
tofixlevels={};
,tofixlevels={0};
];
,If[dimensionGrassmannian[topleft,topright,bottomleft,bottomright]===topdim,
tofixlevels={};
,tofixlevels={0};
];
];
(*maxnonplanardimension is the highest Grassmannian dimension of any nonplanar diagram in the stratification. For now we haven't evaluated it, and we'll assume it's equal to topdim, until we decide it's worthwhile to check what this number should really be*)
maxnonplanardimension=topdim;
For[level=1,level<=topdim,level++,
(*For each element in removable[level-1] we make all subgraphs. We'll end up with many duplicates. Since they all inherit their planarity, some subgraphs are simultaneously labeled planar=True as well as planar=False. If any of these labels is True for a set of duplicates, then the graph has come from a planar one and must hence be planar. If it's still labeled non-planar, we'll later use planarityQ to check whether this is still the case.*)
removable[level]=Map[{#[[1,1]],#[[1,2]],Or@@Map[Last,#]}&,GatherBy[Table[Sequence@@makeDaughterGraphs[removable[level-1][[iii]]],{iii,Length[removable[level-1]]}],First]];
(*Now we'll remove those elements whose dimension has decreased by too much*)
removable[level]=Cases[removable[level],zz_/;dimensionPolytope[Drop[zz[[1]],None,{1}]]===topdim-level];
(*On the surviving elements, we'll reassess planarity on the nonplanar cases.*)
nonplanarpositions=Flatten[Position[removable[level],{___,False}]];
templevel=removable[level];
(*Now we'll take the nonplanar cases and check whether they really are still nonplanar. Begin by turning each of these cases into a list of killed edges.*)
boundarykillededges=Map[#->0&,Map[Complement[varlist,#[[1,All,1]]]&,removable[level][[nonplanarpositions]]],{2}];
newplanarity=Map[planarityQ[topleft/.#,topright/.#,bottomleft/.#,bottomright]&,boundarykillededges];
templevel[[nonplanarpositions,3]]=newplanarity;
(*Now we know for sure that the planarity labeling is correct*)
(*We'll now want to only keep reduced elements. For planar cases, planarReducibility is very fast at determining this. For nonplanar cases, we'll need to check whether the dimension of the Grassmannian is the same as that of P. If not, it means we have secretly reduced the dimension of the Grassmannian too much by creating a reducible graph.*)
planarpositions=Flatten[Position[templevel,{___,True}]];
nonplanarpositions=Flatten[Position[templevel,{___,False}]];
(*We'll put the reduced planar elements first, then the reduced non-planar ones*)
planarboundaries=Cases[templevel[[planarpositions]],zz_/;planarReducibility[Drop[zz[[1]],None,{1}],zz[[2]]]===False];
(*For the nonplanar boundaries we'll need to evaluate the dimension of the Grassmannian, which is very time-consuming. At level=1 (i.e. codimension-1 boundaries of the starting point), if there are no reduced graphs, we'll look at the nonplanar reducible graphs and evaluate all of their Grassmannian dimensions, to find the true value of maxnonplanardimension (otherwise it had just been set to be equal to topdim). Since those graphs are reducible, maxnonplanardimension will necessarily be a smaller number than topdim-1. For all dimensions between topdim and maxnonplanardimension, we will not need to assess the Grassmannian of the nonplanar diagrams, since its dimension will still be lower than topdim-level, indicating that these nonplanar diagrams are reducible*)
If[maxnonplanardimension>=topdim-level,
nonplanarboundaries=templevel[[nonplanarpositions]][[Flatten[Position[Map[dimensionGrassmannian[topleft/.#,topright/.#,bottomleft/.#,bottomright]&,boundarykillededges[[Flatten[Position[newplanarity,False]]]]],topdim-level]]]];
,nonplanarboundaries={};
];
removable[level]=Join[planarboundaries,nonplanarboundaries];
If[removable[level]==={},
(*If some level happens to only contain reducible examples, we'll keep all boundaries, and remove the reducible ones later.*)
removable[level]=templevel;
tofixlevels=Append[tofixlevels,level];
(*If we are the at the first level and there were no reduced boundaries, find out what the maximal dimension of the Grassmannian is for nonplanar diagrams, so that we don't need to evaluate it again until topdim-level is equal to this Grassmannian dimension. If we don't do this, we might be forced to go through many levels where everything is reducible and assess the dimension of the Grassmannian many times*)
If[level==1,
maxnonplanardimension=Max[Map[dimensionGrassmannian[topleft/.#,topright/.#,bottomleft/.#,bottomright]&,boundarykillededges[[Flatten[Position[newplanarity,False]]]]]];
];
];
];
For[fix=1,fix<=Length[tofixlevels],fix++,
removable[tofixlevels[[fix]]]={};
];
(*Now we'll identify boundaries according to their substratification. From each element, it's sufficient to check the substratification one level down, since everything below that has been vetted by this first substratification level. At the bottom level (zero-dimensional) we can identify everything according to their moduli space.*)
identremovable[topdim]=Map[#[[1,All,1]]&,GatherBy[removable[topdim],#[[2]]&],{2}];
(*In order to compute the substratifications in a fast way, we'll check which boundaries of one dimension higher have these as subsets. We can do this by writing 0-dim boundaries as {___,edge1,___,edge2,__...} and check which boundaries of one dimension high fit this pattern. We do this because Mathematica's pattern recognition is very fast.*)
patternidentremovable[topdim]=Map[Alternatives@@#&,Map[Riffle[#,___,{1,-1,2}]&,identremovable[topdim],{2}]];
(*We'll now go through each of the dimensions, starting from the bottom. When we find the connectivity between the various dimensions, we'll store it in an adjacency matrix format. At the end we'll turn this information into a stratification graph.*)
For[dim=1,dim<=topdim,dim++,
If[BFTgraph||startingplanarity,
thislevelspositions=Range[Length[removable[topdim-dim]]];
identifiedboundaries=GatherBy[thislevelspositions,Sort[DeleteDuplicates[Transpose[removable[topdim-dim][[#]][[2]]]]]&];
removable[topdim-dim]=Map[#[[1,All,1]]&,removable[topdim-dim]];
locationofparents=Map[Flatten[Position[removable[topdim-dim],#]]&,patternidentremovable[topdim-dim+1]];
,(*Begin by turning the boundaries into lists of edges*)
removable[topdim-dim]=Map[#[[1,All,1]]&,removable[topdim-dim]];
(*For each of the sub-boundaries, we want to find which graphs of one dimension higher terminate in this sub-boundary*)
locationofparents=Map[Flatten[Position[removable[topdim-dim],#]]&,patternidentremovable[topdim-dim+1]];
(*In each of the elements in removable[topdim-dim], we now want to know where they are in the list of locationofparents.*)
(*Since locationofparents indexes according to position, we'll turn removable[topdim-dim] into positions first.*)
thislevelspositions=Range[Length[removable[topdim-dim]]];
identifiedboundaries=GatherBy[thislevelspositions,Position[locationofparents,{___,#,___}]&];
];
identremovable[topdim-dim]=Map[removable[topdim-dim][[#]]&,identifiedboundaries,{2}];
(*Now we're ready to do the same thing for the next dimension, and will need patternidentremovable for this dimension*)
patternidentremovable[topdim-dim]=Map[Alternatives@@#&,Map[Riffle[#,___,{1,-1,2}]&,identremovable[topdim-dim],{2}]];
(*Now we'll make a matrix with rows corresponding to boundaries in removable[topdim-dim] and columns corresponding to boundaries in identremovable[topdim-dim+1]. If an object in removable[topdim-dim] can access a sub-boundary in identremovable[topdim-dim+1] that entry has a 1, otherwise it is 0.*)
(*The levels that contain no boundaries cause difficulties. Every time this happens, we'll place a fake boundary there with no connectivity to any other boundaries. When we've finished constructing the final adjacency matrix we'll throw away these fake boundaries.*)
If[Length[identremovable[topdim-dim]]===0&&Length[locationofparents]===0,
(*If the current level is empty and so is the next, create an isolated node with no connectivity*)
newlayer[dim]={{0}};
,If[Length[identremovable[topdim-dim]]===0&&Length[locationofparents]=!=0,
(*If the current level is empty but the next one is not, create a temporary node (with no connectivity)*)
newlayer[dim]=Table[0,{iii,1},{jjj,Length[locationofparents]}];
,If[Length[identremovable[topdim-dim]]=!=0&&Length[locationofparents]===0,
(*If the current level is not empty but the one beneath it is, create zero adjacency to the temporary node sitting at the empty level*)
newlayer[dim]=Table[0,{iii,Length[identremovable[topdim-dim]]},{jjj,1}];
,If[Length[identremovable[topdim-dim]]=!=0&&Length[locationofparents]=!=0,
(*If we have boundaries going to other boundaries, make the correct connectivity matrix*)
newlayer[dim]=Normal[SparseArray[Map[#->1&,MapThread[Sequence@@Transpose[{#1,ConstantArray[#2,Length[#1]]}]&,{locationofparents,Range[Length[locationofparents]]}]]]];
(*If there are some elements that are not connected with lower-dim boundaries, we need to make sure that we have the right number of (empty) rows and columns.*)
newlayer[dim]=PadRight[newlayer[dim],{Length[removable[topdim-dim]],Length[locationofparents]}];
(*After the identifications many objects in removable[topdim-dim] are declared to be the same. We'll therefore only select one representative from each such equivalence class of graphs. Since for scattering amplitudes all equivalence classes of graphs have the same subboundaries, we can just pick one of the graphs. For BFTs we'll have to create an object which has connectivity to any subgraphs accessible from this equivalence class.*)
If[BFTgraph,
newlayer[dim]=Map[Total,Map[newlayer[dim][[#]]&,identifiedboundaries,{2}]]/.{_?Positive->1};
,newlayer[dim]=newlayer[dim][[Complement[Range[Length[removable[topdim-dim]]],Map[Sequence@@Delete[#,1]&,identifiedboundaries]]]];
];
];
];
];
];
];
alllayers=Reverse[Table[newlayer[iii],{iii,1,topdim}]];
(*In the highest-dimensional non-zero layer, we have the top-dimensional elements going to the codimension-1 elements. Since the top-dim elements are not connected to themselves in the stratification, we must add some zeros in front of newlayer[xxx] so that the adjacency matrix is correct.*)
If[Length[alllayers]>0,
alllayers[[1]]=Join[Table[0,{iii,Length[alllayers[[1]]]},{jjj,Length[alllayers[[1]]]}],alllayers[[1]],2];
];
totalnumberofboundaries=Total[Map[Dimensions[#][[2]]&,alllayers]];
If[totalnumberofboundaries===0,
totalnumberofboundaries=1;
];
(*We need to throw away those boundaries that correspond to fake temporary nodes*)
tokeeprowsandcolumns=Complement[Range[totalnumberofboundaries],Accumulate[Map[Dimensions[#][[1]]&,alllayers]][[tofixlevels+1]]];
adjacencymatrix=Normal[SparseArray[Band[{1,1}]->alllayers,{totalnumberofboundaries,totalnumberofboundaries}]][[tokeeprowsandcolumns,tokeeprowsandcolumns]];
stratificationgraph=AdjacencyGraph[adjacencymatrix];
];
,stratificationgraph=Null;
];
stratificationgraph
];

matchingPolytopeBoundariesGraph[topleft_,topright_,bottomleft_,bottomright_,checkneeded_:False,BFTgraph_:False]:=Block[{checkOK,matchingpoly,xlistandPmatrix,facelatticeboundaries,topdim,makeDaughterGraphs,level,patternfacelatticeboundaries,locationofparents,newlayer,alllayers,totalnumberofboundaries,stratificationgraph},
checkOK=True;
If[checkneeded==True,
checkOK=getKasteleynCheckQ[topleft,topright,bottomleft,bottomright,BFTgraph];
];
If[checkOK==True,
(*Each element in the face lattice of the matching polytope will be described by the perfect matching matrix P, which will be computed only once for the top-dimensional element; this will allow us to construct the face lattice while computing the perfect matchings and matrix P as few times as possible (not once per subgraph!)*)
(*We'll start with making the top-dimensional element. In P we shall also tag on which edges correspond to each row, by making the first element of each row the edge name*)
matchingpoly=matchingPolytope[topleft,topright,bottomleft,bottomright,checkneeded,BFTgraph];
If[Length[matchingpoly]===0||Dimensions[matchingpoly][[2]]===0,
stratificationgraph=AdjacencyGraph[{}];
,xlistandPmatrix=Join[Transpose[{Variables[joinupKasteleyn[topleft,topright,bottomleft,bottomright]]}],matchingpoly,2];
(*This will be the top-dimensional element in our stratification*)
facelatticeboundaries[0]={xlistandPmatrix};
(*We'll save some basic information to avoid having to evaluate it many times*)
topdim=dimensionPolytope[matchingpoly];
(*For each element in the face lattice, we will need to find all of its boundaries. These are found by deleting edges. makeDaughterGraphs takes an element in the face lattice and removes all possible edges, making potential boundaries (which will need to be verified)*)
makeDaughterGraphs=Function[{boundaryelement},
Block[{pmat,pmstokeep,daughters},
pmat=boundaryelement;
pmstokeep=Table[Flatten[Position[boundaryelement[[jjj]],0,1]],{jjj,Length[pmat]}];
daughters=Table[DeleteCases[pmat[[All,Prepend[pmstokeep[[jjj]],1]]],Prepend[ConstantArray[0,Length[pmstokeep[[jjj]]]],_]],{jjj,Length[pmstokeep]}];
daughters
]
];
(*After making all subgraphs, we'll keep only those whose dimension has decreased by one*)
For[level=1,level<=topdim,level++,
(*For each element in removable[level-1] we make all subgraphs. We'll end up with many duplicates*)
facelatticeboundaries[level]=DeleteDuplicates[Table[Sequence@@makeDaughterGraphs[facelatticeboundaries[level-1][[iii]]],{iii,Length[facelatticeboundaries[level-1]]}]];
(*Now we'll remove those elements whose dimension has decreased by too much*)
facelatticeboundaries[level]=Cases[facelatticeboundaries[level],zz_/;dimensionPolytope[Drop[zz,None,{1}]]===topdim-level];
];
facelatticeboundaries[topdim]=DeleteCases[facelatticeboundaries[topdim],{}];
facelatticeboundaries[0]=Map[#[[All,1]]&,facelatticeboundaries[0]];
(*We'll go through each level of the stratification. When we find the connectivity between the various dimensions, we'll store it in an adjacency matrix format. At the end we'll turn this information into a stratification graph.*)
For[level=1,level<=topdim,level++,
(*Begin by turning the boundaries into lists of edges*)
facelatticeboundaries[level]=Map[#[[All,1]]&,facelatticeboundaries[level]];
(*For each of the sub-boundaries, we want to find which graphs of one dimension higher terminate in this sub-boundary*)
(*In order to compute the substratifications in a fast way, we'll check which boundaries of one dimension higher have these as subsets. We can do this by writing 0-dim boundaries as {___,edge1,___,edge2,__...} and check which boundaries of one dimension high fit this pattern*)
patternfacelatticeboundaries[level]=Map[Riffle[#,___,{1,-1,2}]&,facelatticeboundaries[level]];
(*In each of the elements in removable[topdim-dim], we now want to know where they are in the list of locationofparents.*)
locationofparents=Map[Flatten[Position[facelatticeboundaries[level-1],#]]&,patternfacelatticeboundaries[level]];
(*Now we'll make a matrix with rows corresponding to boundaries in removable[topdim-dim] and columns corresponding to boundaries in identremovable[topdim-dim+1]. If an object in removable[topdim-dim] can access a sub-boundary in identremovable[topdim-dim+1] that entry has a 1, otherwise it is 0.*)
newlayer[level]=Normal[SparseArray[Map[#->1&,MapThread[Sequence@@Transpose[{#1,ConstantArray[#2,Length[#1]]}]&,{locationofparents,Range[Length[locationofparents]]}]]]];
];
If[topdim>0,
newlayer[1]=Join[Table[0,{iii,Length[newlayer[1]]},{jjj,Length[newlayer[1]]}],newlayer[1],2];
];
alllayers=Table[newlayer[iii],{iii,1,topdim}];
totalnumberofboundaries=Total[Map[Dimensions[#][[2]]&,alllayers]];
If[totalnumberofboundaries===0,
totalnumberofboundaries=1;
];
stratificationgraph=AdjacencyGraph[Normal[SparseArray[Band[{1,1}]->alllayers,{totalnumberofboundaries,totalnumberofboundaries}]]];
];
,stratificationgraph=Null;
];
stratificationgraph
];


End[];
EndPackage[]

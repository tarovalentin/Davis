% 3vertex1.mp -- do not edit, generated automatically by slides.tex
input feynmp
require_RCS_revision "1.30";
beginchar(1, 50*1.0pt#, 40*1.0pt#, 0);
"feynmf: 1";
LaTeX_unitlength:=1.0pt;
subgraph (0, 0, w, h);
vinit;
pickup pencircle scaled thin;
vleft (__i1, __i2);
vright (__o1);
vlabel ("$ q,\rho $", __i1);
vlabel ("$ k,\mu $", __i2);
vlabel ("$ p,\nu $", __o1);
vconnect ("photon", __i1, __v1);
vconnect ("photon,tension=1.5", __v1, __o1);
vconnect ("photon", __v1, __i2);
vfreeze;
vdraw;
endsubgraph;
endchar;
% the end.
end.
endinput;

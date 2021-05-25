% 4vertex1.mp -- do not edit, generated automatically by slides.tex
input feynmp
require_RCS_revision "1.30";
beginchar(1, 50*1.0pt#, 40*1.0pt#, 0);
"feynmf: 1";
LaTeX_unitlength:=1.0pt;
subgraph (0, 0, w, h);
vinit;
pickup pencircle scaled thin;
vleft (__i1, __i2);
vright (__o1, __o2);
vconnect ("photon", __i1, __v1);
vconnect ("photon", __v1, __o1);
vconnect ("photon", __v1, __o2);
vconnect ("photon", __v1, __i2);
vlabel ("$\lambda $", __i1);
vlabel ("$\mu $", __i2);
vlabel ("$ \nu $", __o2);
vlabel ("$\rho $", __o1);
vfreeze;
vdraw;
endsubgraph;
endchar;
% the end.
end.
endinput;

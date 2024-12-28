#!/bin/bash
#
# This file encrypted at Sat Dec 28 21:06:05 WIB 2024 by
# +------------------------------------------------------+
# | Author: Rerechan02                                   |
# | Reguon: Indonesia ( Asia Tenggara )                  |
# | Chanel: https://t.me/fn_project / Admin  @Rerechan02 |
# +------------------------------------------------------+
# Don't forget follow me on:
# -  https://github.com/Rerechan02
# Sponsor this project:
# -  https://t.me/fn_project/245
# -  https://prof.rerechan02.com

skip=70
tab='	'
nl='
'
IFS=" $tab$nl"

# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @Rerechan02 / widyabakti02@gmail.com
USER=${USER:-$(id -u -n)}
# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @Rerechan02 / widyabakti02@gmail.com
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# PC does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

shctmpdir=
trap 'res=$?
  test -n "$shctmpdir" && rm -fr "$shctmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  shctmpdir=`mktemp -d "${TMPDIR}shctmpXXXXXXXXX"`
else
  shctmpdir=${TMPDIR}shctmp$$; mkdir $shctmpdir
fi || { (exit 127); exit 127; }

shctmp=$shctmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$shctmp" && rm -r "$shctmp";;
*/*) shctmp=$shctmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "fn project | Lv:8p:GK:Xi:oT:Tf:4j:8O:ks:VV:y7:Kh:05:QJ:C4:10:q3:hZ:MR:6N:vj:Yy:uE:Sx:2A:ZR:hL:dU:TK:Yo:5Z:AL:eD:Uh:Bv:FV:Dc:Pl:oK:WQ:7o:Ye:q9:Ip:Pa:fz:nx:Kq:oM:wc:70:tv:UK:Cb:SL:L1:wR:o2:Nh:ZX:aL:yb:gM:gc:5U:0M:Hd:R4:3t:Z1:Bz:kF:An:KS:Qk:EB:Dc:py:zB:Q4:Vm:E0:qk:Ok:nb:0a:Yl:Zr:h5:U7:P6:NQ:eT:ye:d2:Ea:s1:kM:B0:EM:Et:wd:qm:4M:nP:UK:xi:z0:gX:yQ:BY:jW:ru:Zk:E6:wV:4Q:bf:pT:PY:yZ:gf:EH:oH:Lk:1J:Gi:ag:b5:K2:eM:AU:3a:CP:G5:JP:Rb:nO:bA:WS:1N:0R:Yi:Oo:cj:mY:5P:Xh:7l:vz:W9:kQ:4j:Oe:AU:YW:wc:Ea:OR:fG:3Y:BE:Cd:wr:1q:gz:RL:mc:Zn:70:Ww:Vw:Av:7V:FE:DY:YW:ju:3P:fz:7h:Pv:DS:Uk:ur:uk:An:Jo:OM:Nw:fF:Lf:P7:ZD:sW:Q9:Ui:Be:25:7X:s6:cJ:Rm:Bv:Zg:G8:En:52:B8:Oq:NI:I2:EK:Mh:a6:ho:Lu:Pz:QM:uL:3g:QT:46:7N:OO:VH:Et:UE:C7:UE:fM:45:mp:3H:Z6:4Z:C2:LY:o8:ti:v0:81:l3:eH:c1:ng:6Y:5Q:9G:Fo:4f:nR:ti:Lo:yB:HX:Mh:iD:0I:wZ:O4:F4:v1:63:B6:Or:oc:qR:Cq:dV:lk:4v:tD:IM:B2:Rm:x6:ph:VM:7w:wr:nQ:tI:ue:Yc:6E:ME:aW:nw:oS:1H:xh:sx:Ul:G3:Gw:F0:jY:HF:Xv:jF:dU:7l:ye:XU:YS:sw:RD:XA:yI:Pp:7z:O9:0i:8v:FA:A0:fY:WM:84:vQ:Zb:4X:28:Z1:Gc:h0:po:vP:nC:6L:BW:k4:BH:6R:ge:OH:bm:v9:Xr:3e:cx:aj:Io:ew:2x:yA:9D:TB:Yx:Tn:mn:00:Ze:mC:Dw:Kc:JS:9P:CA:FH:pC:Ev:sC:48:SB:kq:7K:sm:pr:oZ:G0:7j:VI:ko:LC:zE:cn:M1:5n:EC:bN:0E:6e:8S:iN:gk:XU:XM:0s:E0:pb:S7:KB:DF:rW:L7:3G:Rw:wW:12:P8:tH:7h:e1:Tj:V3:ga:91:1G:tY:gk:gm:yS:JO:yB:SO:Gf:0x:4D:Nl:nI:vW:xE:8V:LG:w1:Sm:B9:5B:y3:hq:OR:wc:5O:SZ:WZ:HT:WZ:J0:Tq:xc:WD:o3:py:Gt:bs:D2:D8:Qe:w2:RX:h5:no:dU:6s:LF:IW:WD:JS:an:Yx:wB:UJ:p0:Kn:fX:UV:Tj:F4:tf:WY:5H:qR:Kn:6u:mY:rD:K8:8Y:2M:rT:If:th:Lt:7m:K4:jd:EF:pY:g5:lD:xu:4c:gf:zc:83:e2:V8:r2:Wm:1K:RI:yh:13:1r:DX:Kv:pv:tk:7S:Y9:j2:B5:Dt:IY:AQ:vK:I4:vE:ck:Up:Rh:PF:CZ:5F:FI:GP:Rr:AM:Fb:p5:c5:PD:Or:U0:q0:MO:lz:Yi:6n:1D:Md:O1:U3:Hg:tq:Rk:fA:55:zp:XH:lr:S2:oX:uv:IG:n3:pg:DG:ZD:qc:y5:yc:VS:v5:iG:BV:vS:EX:l5:hS:aj:g5:Ly:DI:Cl:zs:Xs:Cl:eK:Zh:xS:Ef:MY:Ju:bA:VJ:Bo:OF:Bl:cq:pC:wn:E7:VR:7O:Wl:Pv:eR:n7:B1:VW:3K:7C:aa:zw:bJ:Pa:zX:CJ:uR:uM:Pb:03:jy:fx:DA:Mz:cI:q8:v0:nO:DW:2c:Pv:Ld:Ld:54:mY:Mr:Eu:mR:7I:N9:Ps:jU:MH:Za:0O:iY:2F:kx:Zg:5v:Mo:HC:U6:lS:HS:Os:X9:Sc:Fd:sJ:8i:Yv:Ou:hG:9B:lb:ls:qu:Gt:76:TQ:eA:Py:GB:81:7l:DZ:lt:08:2R:ar:2k:0u:QC:jt:Iu:b4:eh:Gm:Yw:ys:8P:ei:q5:gk:cS:zG:sP:f0:Sk:HI:kT:FU:p0:Tt:iD:nB:5h:NS:2J:HW:bb:Y7:B9:Qr:Zu:Xe:oO:S9:63:M0:Xd:jU:bG:Of:9k:Gq:qJ:rq:OI:HE:q7:b9:3z:kN:wC:Jt:Yx:hg:F5:Hs:P8:Dg:yz:Pq:sq:s4:PC:7k:NO:cS:Bc:JK:bW:mU:mY:98:Tb:ls:Ec:C8:kN:T8:vI:ku:wb:D2:gu:PB:8r:7Y:xp:Xd:by:D6:dl:aV:WB:gt:gm:HY:pU:N7:Yg:JL:sc:I7:NP:SR:og:f7:2N:P4:1Q:Tj:oU:SA:oN:CU:05:FV:BI:5K:tU:P7:oN:3B:lF:6Y:sC:od:mL:jw:cK:uU:h7:xA:Zr:H8:we:MB:cA:a3:lg:S4:kE:La:Na:nS:jj:lm:pM:3G:6Y:vR:DS:HW:fR:uW:WC:20:Sr:gE:mg:Yo:0V:eI:QT:ZP:uv:h6:o1:eb:zU:JG:Jd:1E:95:qT:Rh:9U:dn:et:qD:gu:LS:oh:db:5M:Gg:0P:Nm:hW:yQ:cz:Ze:57:6v:dE:oh:py:ue:ns:Fy:LA:lE:QI:pr:6z:2b:V2:Xz:6d:pf:y1:BC:o1:26:gL:ZI:Jc:Ul:C8:Wq:7f:9I:3G:3d:Fz:xL:t4:vw:Mp:ha:GD:Gj:uh:BX:EA:vu:jT:mX:NW:ca:xv:gn:UF:ZM:1C:HR:rA:NT:vV:Cz:of:Ur:ys:4s:Hf:p3:SL:Ms:eB:8B:Eh:8O:eG:cC:CK:VC:JE:pz:yr:Uz:Rc:IB:7m:M2:2i:Xa:NH:RQ:qh:ma:aa:FP:Hg:VH:zi:sa:4n:p2:e6:71:ig:Iu:0m:K2:RP:4b:yn:OT:rg:x8:Vr:FL:5b:Qn:fo:dF:QH:mN:yB:9H:kR:OU:6Y:yn:OD:dn:XG:O9:8f:WU:2l:K1:EV:EL:Kd:fe:38:bl:IJ:SH:Xv:uT:qb:4z:1f:cg:EH:Em:cR:V1:iz:EQ:Fr:Y3:mz:Vd:y0:ru:QQ:oJ:Tt:QG:yS:8i:DL:IR:Ag:BP:8I:X1:ng:KX:Jm:qk:e1:Ig:ca:fy:ys:r7:Ek:D8:ud:9A:vL:hn:Z5:XZ:aL:p1:FI:Kw:SZ:TO:Ex:SM:cE:yH:Bb:Bk:FX:Zn:XW:Da:GC:DK:Ii:o9:Ik:CA:MW:5S:qO:bu:My:gm:gT:Qj:te:hs:zQ:O8:TJ:CL:7l:cf:4m:uG:G0:Os:v7:cn:KN:OV:I2:7h:zJ:Xx:Tp:dH:c4:q0:xd:TJ:6S:VX:DT:p5:dj:Wu:m7:pi:Cu:ZZ:yH:sM:S3:Ch:1H:Gk:Ny:TY:v9:sd:Rp:hG:uS:Y7:eL:r0:MR:1K:jz:P0:i1:AO:lr:b8:cN:ni:7k:US:WS:Q4:ao:Ts:0w:2i:57:hR:8g:4J:gG:VQ:89:MX:bj:Rh:K1:Vi:65:ZS:1S:lA:Iw:Ym:T0:u6:s6:db:bM:rV:BF:e2:i6:K0:Bg:Hp:Hf:X0:BX:yX:bk:La:Oc:Xi:qL:KU:b8:67:SX:RZ:Sw:cY:6g:bm:gs:wU:4N:ek:e4:J3:Dg:pt:r4:AI:Kt:aU:0v:uD:uY:Ot:Je:JU:ug:z5:WZ:Gl:lc:D2:Sf:5r:4n:ZA:8d:gK:sK:eI:A7:Iu:we:Aj:pz:RA:jK:MY:oo:dq:sN:Gs:ou:iW:7q:Dy:jq:0A:Vy:qE:jJ:da:7i:h7:jU:tv:vW:1a:Nf:Ct:AS:Ky:oY:40:1v:C8:NO:8v:F9:ds:ai:4v:5n:BZ:Ae:GW:sd:ls:Hd:4i:PX:aP:CV:rn:pH:S5:ap:5M:OR:TN:lj:61:i7:al:tM:Wn:0a:Id:ah:Iw:7C:gl:LS:bg:uE:63:t3:em:Kk:dN:Dk:XT:DM:JC:Y1:1m:CA:w7:TY:iC:Nx:MM:YO:eK:j7:tX:XU:Lv:yZ:gh:YU:5j:sQ:qb:NI:MX:Km:YP:yd:fr:dg:NQ:H7:4E:Ti:ch:ui:hA:Tx:Mg:Xm:LP:ut:oV:1Z:4k:ac:QM:kz:g4:x2:yp:1f:pU:vg:a1:WO:7c:oP:R8:u1:Zx:uS:55:oh:sL:Tz:1D:am:FA:80:PR:c8:mO:OS:nR:t4:LL:FS:YK:39:MV:Q1:OE:ra:1z:ZC:S5:UJ:7N:E1:nH:aL:QP:3V:D8:h1:Bb:Qe:YV:yX:tZ:qW:PK:FI:xQ:dR:Sl:PD:zX:f2:ka:A2:2b:wx:Td:6N:IC:WZ:kq:1D:87:C6:qL:hi:Tz:Xi:d3:5R:Mo:dr:0Z:gL:qu:HD:xh:mL:dB:tN:cN:eC:Gi:i2:Iz:QW:l9:bn:RF:o1:Nw:jD:yS:bV:oe:Jt:Yh:M8:Yz:MG:gA:mp:6K:tR:05:pA:PP:4K:bP:9t:zB:O5:53:cG:Hw:fg:NL:zw:Yh:Xc:xJ:ml:BQ:te:Od:VF:XK:Zm:vS:xi:pt:Fy:8K:oW:M7:8R:wL:N7:sv:PT:Jt:mc:AW:fB:PN:Ha:eP:Fo:w0:7y:PC:36:8C:R5:c0:yk:V5:ai:0j:mj:ky:zJ:2B:mq:2B:Ho:bA:R1:Ce:T7:hP:iY:Bk:2b:wF:F7:jy:ZE:Yn:mw:hV:vQ:ED:DC:OY:rl:Mm:0z:TJ:TJ:DW:Os:bE:Sj:bM:sI:yg:ti:gX:pI:56:Vp:A6:Lq:tZ:5c:E6:jP:NE:yL:BA:9x:nS:8Z:N5:kt:MD:By:8O:o0:XN:zR:wg:pv:Uc:mb:kj:wr:At:Wr:BM:Us:9l:Xe:E0:j8:HB:Ht:dW:Kv:5q:st:FR:U1:4l:Or:R4:0W:Gb:TF:Ha:fZ:Dd:36:bo:7R:gP:T9:5g:Sk:Z1:yv:AX:aC:sT:cA:C4:4k:IB:Jl:VZ:hz:bG:mD:xd:SZ:qu:tv:5M:Rb:4s:Za:47:2N:PL:YQ:Fv:lX:Yf:QJ:Ym:XY:0N:ch:aF:CH:vc:s4:Q4:We:QF:Pk:AF:iQ:MW:i1:tG:qX:67:l1:Up:Ua:ki:Qb:kM:YR:a7:hF:DO:Cv:uo:M5:RX:Bu:HN:go:rE:KM:Ni:Fi:AT:9c:k6:WM:sz:ib:UV:4K:DL:zT:X2:BX:f2:3G:xc:4o:Og:Ec:OR:Mr:eB:YU:eo:st:J2:3M:Sb:4r:8h:dn:fJ:vO:wt:sK:ID:14:Re:6T:gJ:QR:P2:id:u2:oG:1X:ZC:9v:VG:Y4:BN:bC:AM:BI:nO:Ly:a9:xO:UV:O2:aN:ta:3b:ts:Gd:fq:iu:X2:W0:1I:TE:md:dj:R6:6i:9e:KM:JO:Pa:aW:P0:xM:yU:t0:wh:FH:Kz:3U:qZ:Ps:5O:ZW:zC:Sk:BV:hG:2u:dQ:vu:qZ:PQ:Nw:8U:ye:V4:kG:HA:sz:St:3K:D6:MU:rg:5Z:By:RS:lY:O3:1S:2p:1a:XY:A8:lr:LO:Ho:4i:OH:gD:iY:bh:Gs:TL:La:z9:eU:5O:4y:Gg:c6:Jk:dT:pJ:pK:ha:QQ:2r:hr:Nl:GS:OK:tB:ax:cm:ts:yk:00:Ox:ef:ug:wo:C4:6M:p0:vK:kd:Ip:Nx:vD:Sl:cF:eA:Cx:EI:u1:mW:k8:2C:H8:8h:v7:R5:3I:50:Am:9c:0X:OJ:dm:tu:ha:cE:se:A2:fT:EA:4q:R1:Ed:T8:5v:Di:5l:v7:WK:dk:Ry:HH:aF:5U:6i:I4:Sn:33:a5:L2:B2:Ng:NH:7I:Ep:B2:3A:eX:MI:WN:sF:qg:PQ:uD:F9:T9:lL:DU:Gu:aR:zl:gA:cm:jR:rR:4O:6O:Nb:0p:N2:K3:LX:Kp:96:kP:Jt:Fx:MP:db:9a:B5:o8:is:oQ:U3:w2:LY:j3:9t:S8:F6:zF:ZF:ni:br:ls:tg:Cq:WC:rs:sU:WA:Gk:Es:jH:1B:B7:BY:Bd:Fa:cd:NS:At:a2:Xn:De:BS:8C:og:0x:4L:OJ:y1:KV:rs:KJ:L3:Gt:vR:n9:p2:vI:gp:iD:6P:yq:NC:iY:kL:LB:lW:Xl:p4:mP:kE:eq:ro:WE:sX:K9:1p:H8:rJ:pu:bO:4z:Vf:LD:bX:Rk:ss:Ta:GY:5k:20:S5:cM:e2:Bt:8R:gw:og:00:pD:JI:Wo:jm:fV:gQ:5N:X4:dh:DO:0I:uI:OJ:yI:ah:GU:Fn:sC:ue:Yl:kq:9O:Jz:Jx:3J:ZF:no:Ae:G3:zm:ho:fR:dp:nW:gV:Nk:PN:OX:3H:99:n2:DQ:hd:bv:Ns:RI:bn:gO:1l:u4:G9:lz:kg:sA:FP:46:C9:be:T7:Md:dg:YM:H6:Zm:72:Sj:Wn:t2:sK:9k:4J:G3:Vo:Vh:53:Nm:m9:53:GE:BG:lc:XT:Fg:w3:f2:Xd:oZ:VH:M4:1Y:eR:O1:Mk:zq:qW:1l:id:X8:E6:pu:FX:Ee:37:1v:VC:6f:A2:KB:Hi:66:eM:AX:NJ:7T:7m:te:in:49:M0:TW:Ur:LC:1n:GM:Aw:SR:15:nV:Ge:En:St:4b:to:6W:uU:lF:FJ:X5:46:f1:8P:Sz:z8:GN:Tp:Nz:88:3Q:FI:yJ:k4:xB:nx:Xw:pJ:x7:zS:4K:0K:SN:sP:gx:gp:zS:XF:wy:ZQ:mR:B4:Y3:M8:mx:Jo:uh:h5:Gs:MS:5t:dw:YB:px:Df:kE:EJ:r5:Ny:1O:NQ:hg:zG:rA:tQ:4T:VJ:lu:8c:hE:a9:9a:XJ:BU:qT:md:J5:Sa:jZ:PQ:Ux:bR:L1:rL:W4:6N:Hg:Sh:Gt:ZK:Kw:cQ:TU:IE:hi:IE:3h:jB:hI:Tz:9V:BU:ie:wm:8a:jJ:GF:0T:AJ:oa:U0:Qk:Ci:zw:a3:TX:07:E9:dq:TC:mU:Qa:jg:wK:ty:WB:Tx:Rz:so:Mi:71:5j:om:97:oz:iD:yp:R1:yj:NT:az:Cx:mE:vB:F2:NW:Xx:Fs:Ml:Aw:hc:3k:AH:Yk:YO:wJ:h8:V5:IX:E1:NX:MN:MF:ic:xs:uM:T6:pA:RK:Gx:lG:uG:te:p8:CI:p0:cb:WY:Of:Yr:15:tI:4c:mR:zM:UK:tE:kh:Ps:Vj:MG:2c:k8:R2:80:ll:0j:kv:d5:It:hT:ZU:nX:eL:mH:Yc:oI:eP:Ek:PT:hF:iu:gH:vB:Ct:Wj:3m:Nu:AB:bC:MY:ci:CV:be:Uj:2g:EP:Ru:Ur:vg:nc:Dw:e8:Iv:aY:0f:fh:11:fu:nX:ja:rn:Ja:w0:Gz:63:Ri:8Z:hH:eA:99:eg:o5:Xu:xt:mL:Mo:JI:ea:oC:9C:mF:u8:UA:kE:RY:Oj:W5:fr:WS:lf:Hq:9m:aJ:Ck:VD:Y5:vz:TE:JD:UR:CF:uu:yQ:3E:wt:Q2:cm:n4:H2:S8:X2:Aj:IX:aj:Rc:hW:0Q:bo:vU:2f:ca:Gq:kf:Jo:CV:3k:Ym:Ld:vk:sR:1W:UT:pE:Z1:qY:XU:im:dg:8n:BM:lX:fV:az:8K:EQ:t2:6t:a5:aw:gH:U0:88:5b:Qg:KH:Oi:Sd:Hk:de:xm:pV:Ik:4W:kn:m9:LP:Ow:d0:jG:8r:Kj:33:ar:hu:xm:RA:ls:zP:LZ:Jh:SC:Aq:q3:m3:X5:v5:ys:Qk:ps:hh:sf:i0:kX:jP:wK:tK:Ow:SD:Oy:TU:CP:Df:3N:sh:vZ:rd:Jd:tw:NY:ji:4H:jv:Rw:sw:Uj:Tb:j9:8j:DG:iL:R5:0J:0s:IH:56:t9:zB:Z1:Ov:Y9:rY:3s:id:NX:wI:ET:Zd:Ds:7y:oa:Fs:o9:OY:Iu:7r:bF:t7:ps:6k:XF:WT:FK:1R:qV:CP:EU:2l:uc:xL:jC:BZ:s8:9g:0x:Tf:2T:3p:7k:e6:ps:IG:sh:Aw:TN:aa:Re:C4:zk:VW:d2:KR:Ay:eS:Sl:X1:Af:lN:zB:uO:n0:pj:a4:Np:cS:Yr:SX:bq:4r:DO:Ji:cy:iP:It:Nm:Bb:3J:u4:CB:ei:id:35:6R:nZ:6c:MC:TE:eg:Md:v7:n4:GQ:xy:kd:eb:3d:Bu:mc:Ra:pq:E8:wA:YI:UO:LL:gI:G4:Vq:9g:SA:FF:tu:qe:pB:bT:NH:A2:mk:zN:hU:aB:UN:NU:I4:lS:Vf:RA:zB:zl:lQ:EY:45:XH:cN:U7:f9:tC:QT:cg:Zn:hx:kN:G7:T5:kb:sH:DD:BA:JP:P4:J0:Et:xE:8L:ws:pC:pM:di:20:ru:Vf:2X:gA:eZ:zD:VC:f1:lg:c3:Hf:u1:Ez:JB:zH:MR:GV:72:bp:Fb:4l:oQ:08:bA:E7:TY:gU:mC:lD:XJ:av:P2:NY:Yf:j2:mS:xk:j8:Jv:HI:dz:E3:5h:dF:OS:rU:lT:ga:Tj:O0:ks:tR:WZ:IE:Ow:o5:Sr:NV:aj:NK:Qe:lI:u5:Gj:yG:Sx:Jr:F7:S4:O1:bN:v3:VU:qW:60:Cb:Ft:iI:6j:q0:44:Be:t2:nb:lg:iD:Sx:Bs:C7:Lm:IE:kQ:4i:3w:Sn:dF:IR:Rr:4c:oJ:XZ:oZ:Bb:RP:ho:Ia:JA:cO:Hb:Vr:sI:jt:nF:Ic:0Q:fP:rg:Ee:4p:iI:8C:9Z:2B:nF:dQ:kU:c6:Rn:cf:82:YX:NF:ZV:Tn:gN:KG:9c:IB:Ri:mB:o1:8Z:UO:bb:jv:Le:U8:4h:cr:Zh:AR:RN:57:Qc:a0:2k:KE:ZH:D8:X5:I2:oU:5W:P6:VL:J4:16:Ag:gl:gp:iv:Uw:qP:qW:VJ:Vh:d9:N3:oi:LW:KA:gh:wh:j8:aD:8k:O7:ZL:T3:G9:bb:VX:Yf:na:ar:08:Jt:J5:72:10:kD:WH:o6:22:GR:Wb:im:j6:IK:5X:3l:Zo:Kj:Au:wj:mP:rp:hk:ak:qL:Nb:My:Hg:gd:y0:Ka:EZ:Sv:r0:BG:u8:Gv:kf:GU:Fq:Di:JS:dv:OW:y2:qJ:fs:RX:HK:mp:SP:A7:G8:WS:Cy:Eo:Q1:7T:Ip:HK:Ps:Hs:CQ:JJ:1T:Gr:hV:Vf:g4:6W:IB:Op:Ao:oN:Cm:38:aJ:ah:ZD:hK:zL:i4:4y:Sd:G7:Gg:9j:gh:LP:wY:ed:Af:03:bj:25:RW:kC:RF:Po:cZ:TJ:89:x9:Iu:Zw:ky:UQ:zd:gh:X9:CC:ra:dU:Kq:U5:WC:mF:M0:8C:BS:ZA:2t:KM:gh:3D:bA:VL:qF:Lc:KL:oD:J3:B6:MJ:VA:nF:p2:sm:O2:m8:qG:X8:J6:0Y:Pi:3i:2A:RA:zO:l6:kR:nl:YN:QT:6G:AF:AN:5g:oP:DJ:pz:iW:s4:zh:bw:Ga:dI:FS:BH:IL:dG:fw:7p:bt:Dy:4u:XO:HP:ce:9L:wR:1G:S2:xu:C3:4z:ZK:vN:cW:I3:mL:XD:Tc:lc:Th:vs:tJ:Q0:MJ:ST:dl:ea:dV:xa:yY:tF:Ew:JS:jF:PT:bB:6y:YY:2P:gM:IP:Mz:Ux:AN:zf:S0:EL:Vv:7X:7i:zx:e5:fc:oa:nN:sb:VW:mC:y9:M6:wm:8p:uO:au:u7:vl:RV:wf:vd:TP:uD:pN:td:MD:OG:m9:Z4:Mm:NF:by:DT:vk:2E:Tr:Mz:ys:8f:M1:d3:lB:MK:36:Zh:2R:qL:4Y:Q7:9j:qZ:Ce:J6:ge:hn:xx:H6:IY:mM:pE:pS:iO:YA:T0:yf:61:eu:EY:SQ:3h:AB:zR:MK:GJ:4r:xc:tY:jC:MY:Xg:bO:FJ:VG:9B:yl:9g:Kl:3T:Pm:y0:7D:1b:Zh:b0:RV:hy:DL:kh:4u:jL:BN:c9:QV:RF:wE:Ak:Lg:TL:zt:Eq:Dh:d2:Rj:od:T2:xC:aO:xK:WK:mt:Z8:Mj:lz:vk:pg:eD:tp:NP:5D:wU:PU:pM:Zp:tO:76:An:si:dB:F2:gQ:Gf:DK:Tl:nD:mR:zS:K2:yW:My:4x:qQ:Bc:m6:g9:8f:9I:W4:t7:4S:Ww:ME:0l:Cu:Zj:8M:kR:H3:dO:bA:Wp:4P:sF:3h:vk:gG:OX:64:FF:EX:4I:D5:92:Y9:L3:eY:C4:3h:NI:jD:SV:p0:Pg:rA:Az:DE:V8:wx:1R:ei:WU:pI:sY:rW:tN:Mi:3I:1S:iO:P3:2n:rI:Yn:DX:NO:ZR:yK:M2:jO:HP:cK:0Q:OT:0p:FJ:qI:QD:2m:r7:PT:Xv:uK:bg:7w:Xp:FD:sh:Uv:bZ:xF:g0:ZY:uN:4k:nl:13:BI:4t:d2:MP:mO:LS:45:tt:48:VC:yf:sV:9O:0P:FX:4X:69:T0:GR:XU:uC:ic:Cw:OX:we:pV:XD:9t:ZC:M3:SL:DM:7s:pA:gR:G5:UB:wv:jN:Pk:1h:WL:3Y:iD:nX:WC:1H:qP:B1:6Q:zL:Hy:13:QB:qf:m1:Nt:lE:kf:gT:Y1:B7:2h:Nn:o1:Hw:Ru:eL:ds:wk:hf:3X:fp:zX:yn:Fv:UF:iU:Wh:YB:8C:bT:W2:xi:aO:uL:fA:0D:6H:8p:Tz:e2:iC:3O:70:7E:lA:Jx:JW:QP:KD:Sy:FF:lV:6d:bA:Wi:AA:V7:nj:bi:pd:JW:rp:Ho:yA:UA:Gh:C1:fJ:Gd:4P:zy:4z:Bc:kj:Pn:sT:P5:hj:kz:8M:or:gJ:5m:HY:ux:Ov:qX:Xr:iW:sD:g2:UH:n9:UV:ko:UF:e7:M1:8I:KQ:so:Q5:GL:Xa:p1:vG:kP:Og:jM:6c:2a:Rl:v8:Er:fi:ht:bt:6k:YN:AC:A4:ro:1h:sW:NL:J0:lu:NL:nf:2Z:4s:wk:xt:cO:Gl:hp:hP:Ke:rk:DQ:xF:b5:tF:aZ:bd:JA:v6:8H:9U:nD:Sg:PM:8e:B2:zj:nI:a9:CX:Tm:vC:Gr:19:T0:Qe:SX:59:Ou:jX:xa:uL:wL:mO:tv:A3:Pt:yT:aS:AM:i8:OR:0K:Ds:0a:3T:pw:Gn:ia:FF:3z:mX:s8:gA:x3:bI:Dl:eT:BD:oL:Kv:LV:QE:gi:Tv:r7:cw:jV:6z:b7:4W:eU:Ra:yB:Na:Tx:Yk:i7:ie:WH:oF:hg:uT:E7:xd:nl:0j:0D:v2:vK:J8:7P:Bf:16:7p:K8:8J:RK:D9:83:7e:2r:NO:OC:Yc:kp:xT:AX:kw:gE:5o:K8:N0:mE:yX:wQ:qR:pA:wD:aw:gZ:3o:vj:yx:9h:0v:a5:ef:uZ:6O:wq:Gz:UZ:oF:1D:EA:li:IM:ww:I3:f2:iq:Vu:3b:dU:iJ:97:vZ:5m:YE:o6:es:mJ:gt:Nd:OY:VY:5X:yE:Vq:aX:AK:T4:vK:Mg:zo:AQ:fU:XK:TZ:sL:s6:lz:UK:p4:e4:dr:uU:Ts:9M:Mq:hx:1n:MY:1y:Eu:Ar:wY:3Z:rl:Fd:wi:3o:JU:XI:ys:6e:n8:uf:tH:n3:yx:ix:vK:Yh:Q5:Dv:9d:TA:pV:Oi:lC:VF:1M:ym:84:TL:Bk:xQ:8w:ep:aH:fC:aj:Zy:hQ:Ew:Uk:Jk:E0:w6:WJ:jX:A8:JM:7l:WK:iw:Cd:ah:2O:Lt:x8:94:2l:LV:Qy:JQ:UP:51:NI:TQ:U6:O3:KJ:qd:HC:jV:jx:fa:Sv:fC:7S:sL:Lj:lA:SC:lC:pC:Ge:m7:Ke:ct:ex:uM:hf:JJ:BL:uR:jQ:XB:ty:L3:IU:nX:gu:FT:JO:7A:J7:ah:M2:NQ:k8:a4:e1:mZ:dY:RT:5D:Vd:j7:HL:DO:CE:xw:7b:Nu:pR:Zx:o9:PV:Bm:em:Ci:MI:nA:V0:fm:kW:BX:1I:YQ:jy:MV:JS:IZ:Lm:lK:tE:aC:XX:5u:9O:7k:DX:h4:CJ:9N:KC:Jp:FS:mZ:sc:5W:Pq:T8:nM:eP:8t:Pf:HI:NC:d8:EK:oH:ka:pt:Uc:4K:Ss:LT:6e:ER:ls:lJ:1W:c8:Wr:V4:XK:HX:dm:ET:XA:Pr:Ar:uk:1j:dj:58:Zv:qt:Cm:07:6m:zN:RJ:0Q:gt:fB:w6:iP:ce:yO:yc:BD:e5:BE:hW:DD:WU:Ne:fW:I8:qp:cO:MZ:mq:jy:Fx:nD:4v:2H:Gp:6J:aY:gm:T4:o0:4i:A0:t1:bD:qm:b4:rh:Pz:5T:ad:u1:yp:9j:H2:XX:oc:BL:EM:zb:Fw:XX:Tn:sH:HY:Mo:UQ:NT:rW:BD:yI:5n:cf:9V:id:09:ql:89:Zm:U0:MF:42:Uk:C2:mP:UO:ZK:i8:gy:HZ:de:zX:iH:FF:tE:6m:qi:r0:ZH:18:3m:GM:qx:A6:HM:g5:vc:y8:9E:6N:vj:3Z:8T:as:AD:PO:WP:Yh:U9:Df:AP:rm:u6:Pg:MF:EL:sf:aY:KZ:5M:Ly:p7:Az:Bq:9r:CB:58:zz:cI:Vi:CY:V5:QS:y2:1s:ke:iZ:y8:HB:ij:N4:H2:tx:ct:Fq:Dv:cO:LM:hK:Ry:kM:9E:Dq:t3:XD:4s:Uo:fp:aj:SW:Mj:26:1u:W9:Qw:vU:y7:zp:hr:Tp:tV:EE:tH:ch:FZ:rD:k5:ic:iO:gk:r6:Lf:5z:DG:9b:Ox:mx:S4:0w:dK:fb:7Z:AJ:rK:Rj:lw:HA:Id:dl:bf:wd:Fu:xm:iA:hI:UO:jc:6s:c7:0c:Qc:CL:lr:OV:iq:45:X0:d9:lJ:Xs:ko:Oj:dW:8u:Gb:o4:eL:q5:xy:4Z:Yt:BX:hV:I2:0H:UU:cb:Me:7K:U4:9b:CA:pQ:H1:7V:O1:Pw:Q2:L1:sM:RY:QJ:1J:6m:vs:c3:25:x0:1A:cV:UJ:J6:aV:bb:O4:0w:ZG:nv:1c:tV:zO:Op:z7:G5:wb:pF:R5:4N:4H:55:HT:9P:03:0T:bP:82:YI:iw:v0:2l:AC:2m:HK:oq:Wr:Cg:36:l4:su:sS:Rp:Y0:nk:qa:go:B9:Ve:mc:mk:mn:oz:P9:UV:Hk:c2:67:8T:Sf:rg:3e:74:mQ:zq:Qb:rd:oL:Yh:2w:p1:0n:1W:RF:pB:3c:yO:Tv:1S:OI:lS:qV:sY:tt:Fg:WP:b8:5Y:8C:If:EX:Dm:ss:yS:W0:ZV:oE:HB:gT:Zj:8e:pC:LJ:fr:v7:gU:T0:0A:iC:Bx:68:Xc:S4:Hi:Pe:52:d2:Cs:38:WX:Al:3t:uR:O3:tp:dX:QZ:h6:sD:ra:kt:eP:EI:tU:oj:YT:4B:Vi:NW:OM:Rv:dC:30:8m:6H:9r:oT:Fb:uj:DA:rX:RY:VI:n2:bD:cR:Hy:Zq:Hh:8P:Md:Mm:Ek:t9:34:Bk:G8:SG:oY:DV:eH:pI:R1:Bw:Q7:ry:PA:ry:q9:WS:6e:Gv:sa:zQ:5I:P7:ti:Ds:t2:vk:lA:kd:Ih:4E:2p:Bj:7f:0B:q3:Lv:04:Ku:XI:dh:Dy:Wj:hp:I0:mb:BK:H0:Fq:rp:QR:8s:wd:ql:4l:lr:j7:9N:uI:kf:36:KV:LV:dd:UK:p3:zH:Up:x7:u8:Th:ed:Wu:4s:do:ml:FI:bv:5N:pK:KI:iI:LT:a7:FP:wk:zv:QG:UN:RT:rI:W1:Zz:vV:pJ: | Rerechan02 | @Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot $ | Projeft FN" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <widyabakti02@gmail.com>."
  (exit 127); res=127
fi; exit $res
�	D�ԟ�������=鮊��g�SG�*L7��w��r�_�%�S3�8Ӓ�2<�@U���=9hKl�Z9�)BK��Sr~��~\z枬���^p�d����G�V�����D�b�rw�ɑ���&�X纕	���뗠��~�R/��]��]D�gi7�-�a��DZ��sJǔ���^^<�,;�H��U7*8��b������@���M�V�5�I��|�*�������L�c�n�ՃjHA���.��"|.c��2���ŝ�13�4O��9��l/&��o�����M @ù�sMړ�S��ݗ�#����H竎~�Zȴg݂W�(K>�/�LC���Ý�i���8�L!��� ��r�t�='��=������B�Zc{�c�����&�x����bw��:3�v~WCH�m[4�u�鄹�&$��C�Ú9��kǶ߷?��6L}��
V4R��&"/�![�ﰈV^��m��!���2�ɐ>��K]�
UG��XЀ �!�I� �X��LN��-���(�g3��X������p�J�fa�
�I��|�&�qu.)���P��A�ٌ���>���@�F�=9�7u@KYUC������Ź"�����s���Y���V���4��ǀ�
�㝚z`�Fኪj�> Q�y������s�	\����) 9���? �Y���/4������o�N�d���&�2�+[�I1���k���S�Su`2�f�ܖ�j'Z���~���3�@T$C�˴~w��0�"4v���'����������Ii4��^�F8�fn'RQ�=Ԯ�H��<�^Q�4�Z��_E1���cv援џ�N������ʘ���?Q���xС�p�cc��/[2�Go��Kð��yc܁�YV��L �4L���u��78�>�>1�lA
���&��w{ <�3)���r�CLԈ�\�wg�����ʫ}S���V�*�)�W�sW
&�v͋��gF:�єs��n�u���zS�dm��Ϩ��ϫaX"&|M�|�6Z�l/�gby��l�^s���t�Z� ��_���0n�y1b�i4�Z���Ogl,������G�l������w����A%�گ�+�"��y�o�����̤Qʌ��d[r����d�� �-�D�<��3x�y�(�$���C�}�����^�� <�|��EObc�\x" =���Fn��@�wB��JeB�.J���b�#ަ�3jsg�����|�lg��n���z� �:g���
����p/�$���7�PL7Y�ZO*0��k=�-m�(P����&e7?#5�F�V�x
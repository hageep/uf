#!/bin/bash
#
# This file encrypted at Sat Dec 28 21:05:54 WIB 2024 by
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
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "fn project | eq:D6:dN:LF:47:ZM:Rc:uV:IY:U0:mc:EW:B9:hy:zR:wu:uX:K8:Mj:VX:vB:i5:2K:2j:7q:dL:Fl:5y:Zy:Uo:3R:sH:gj:Tr:rQ:pv:Z2:9Y:ix:wK:bB:Q2:1L:YG:wh:LL:gu:eF:o7:QH:qc:On:Wf:2M:R0:vv:LO:RF:Q2:GX:Ja:MU:2l:UY:wR:Gv:RS:Kh:hc:9f:RY:Hd:7y:Ci:sE:0i:6p:Yv:kk:9h:Be:Q6:I0:Ee:F0:YT:RH:Ce:dz:6a:eX:L7:Kh:2R:tn:p8:fy:mK:0g:0t:HS:9x:fx:ib:Uj:0l:g2:1p:D8:IJ:UH:ib:5x:yK:rD:cu:jU:HI:gs:jj:uL:JQ:pn:MZ:Mr:Tx:op:eH:HO:vk:xP:HM:Gd:sm:F5:Wq:Tc:IO:yF:NQ:aB:rS:iP:yF:qE:gm:dm:zS:rU:eI:nS:Jv:pk:0E:A6:N3:zZ:b9:pq:Yy:O5:pi:m9:60:Jk:Ld:11:N6:mL:Jq:jY:9c:Pt:gY:wx:Pf:TE:FP:JM:iM:12:0E:Vh:el:Ki:QV:e6:HB:ms:qd:Ef:Mj:oG:8G:hW:o4:xB:dV:Uq:2j:80:Dr:4W:tM:Gx:em:9P:or:2Y:xF:8b:uV:3D:d5:JV:J7:U6:mV:Cd:Iu:p2:MI:gs:xc:iJ:yn:ek:XX:J5:Tz:im:1z:zD:rG:k9:2G:J3:QV:LS:W3:jb:Zo:kz:bX:X3:48:uD:aN:jz:xk:Lc:TV:dW:zX:JY:cM:pg:kA:S1:qa:xs:Iq:tV:8y:DZ:zG:C7:U4:1U:5f:Bm:c3:yr:H3:pG:Gx:Jv:v6:yG:eF:yi:qt:5U:Ii:18:3x:GX:ZL:xw:n6:Iu:Rk:R8:Xy:XC:OL:Jm:mb:jO:vG:12:YI:Fc:ls:2z:hi:42:sQ:sM:ZB:Ri:p3:Zf:EY:OY:er:cT:IZ:Xd:3Y:uc:kP:iZ:9i:c9:Mt:Bp:s8:PB:R3:l6:ow:jp:fO:T0:FF:xA:r7:Nb:im:2x:mB:NZ:ns:u1:5k:nu:g6:lZ:4O:ZP:L3:La:rt:D8:wR:vA:DK:4k:th:6X:FY:su:hW:im:uF:Pe:Do:K1:cg:ul:nN:wW:zo:n1:zq:R5:sZ:Xe:hM:Jn:eU:1k:FF:Aq:Bh:D7:yA:fq:sS:ad:1H:Qv:52:2k:tb:JA:Rn:ji:kr:j9:MW:XM:KO:gk:IY:oS:RD:5Z:Fe:qn:gf:sZ:2f:Hk:3w:ok:0L:sv:xm:ry:EX:oh:QW:o5:tU:TV:7R:jP:66:SM:7f:J8:XB:ag:xA:Mp:5N:8O:Pm:lG:8m:Da:4e:Pu:Fm:1H:2W:OM:zz:Am:Yn:g3:F1:60:Tg:dN:Rg:ws:Ei:RH:sz:fG:BR:PA:Xg:mQ:Fe:oC:0J:Nn:85:gG:xa:f4:No:qj:MA:VH:nk:gj:TN:Kd:fi:ED:6y:UY:dm:Ql:7n:hX:wH:HS:am:Ag:hk:tQ:ou:ou:kD:Cg:qj:sz:nY:s2:Vq:RT:7w:rP:8w:3j:lE:wO:80:Yg:gh:Ek:qG:yr:z9:Sd:33:g4:rk:hx:WW:xo:VU:K1:nz:rl:ZQ:JT:MO:x5:Ng:5D:pZ:Dh:Jt:2i:dm:IV:KA:MR:nc:Ja:yl:ts:7H:Sh:vN:g8:6Y:CW:2a:7j:Ly:fV:7Y:oA:rY:SU:bW:dG:wg:60:If:lo:54:qo:Ta:qd:MR:IM:mf:4w:CP:AK:ky:hF:05:bY:da:dd:Xj:ak:ep:h7:sY:ss:n0:2R:tr:FO:7i:ag:A8:SQ:4X:0B:wR:UC:pY:4u:IG:fm:t8:jA:Ek:ho:um:b9:8N:A4:ZE:As:BL:K7:qa:2q:up:mZ:Fe:x7:Yb:0e:B2:Lu:uW:UQ:OS:LX:oW:DI:FH:r5:0K:07:fT:Y9:65:bh:mJ:UJ:hM:lM:O6:aQ:f7:Lq:tq:aU:2G:qO:1c:DZ:m4:wK:E2:mW:mv:vw:Sj:Kg:AR:D9:CK:NR:Cc:5D:5c:2U:yj:Us:16:fw:Jp:1M:YN:Kr:Wc:sT:mE:ac:WV:om:5e:NY:lq:ei:FL:b8:Jh:fl:I8:fA:jF:zO:XM:eB:NI:eH:Nc:EC:hK:23:kS:OT:Mi:X8:4u:kC:Wv:Ov:oS:KU:NO:17:sJ:Y6:NP:8g:Y9:2n:Mr:ya:0t:pp:Jn:tJ:CC:0J:tR:J7:KQ:lE:Km:ia:cA:az:jz:3N:Xd:dj:AA:Jr:5d:Ij:ZV:0c:TA:CU:Ro:7N:0J:br:Rg:0q:Fa:rY:Mf:Go:Bp:nx:h3:2m:x7:2C:bO:JL:94:KJ:v9:iu:M9:Dv:gS:gy:lM:RT:TW:da:0r:2H:N4:7W:x9:Mu:kM:mz:qL:k7:8S:Jw:BS:K8:w5:ll:hw:I7:hF:Zf:qn:D5:Hv:nU:YY:w4:dR:DN:pn:uF:Er:La:mV:2b:yo:Cg:zs:Rb:lL:Nv:dk:9v:Ny:ki:rw:9Q:8I:K5:ke:CQ:Qx:B5:cy:Qr:HD:cN:sS:ey:fN:D9:zt:TK:wI:XY:aQ:y0:e8:7y:Ch:K7:09:no:QA:fq:Yh:Ck:2k:SL:0g:JB:q9:qe:Oa:mV:t8:c5:8w:sr:ZP:8y:DD:mP:gC:Ee:SO:Up:0Y:9D:BQ:5H:ku:2C:zc:D7:u6:lN:7u:rU:Ow:XM:m5:9D:eM:l9:2S:cd:lG:pA:58:HT:IC:ZK:uk:T9:K3:S6:nB:2Z:SW:Sz:gU:DM:Ss:cF:IQ:nc:vt:kB:IY:zN:SM:3g:mR:5u:KV:zQ:XV:OT:EW:9E:AK:j3:4Y:6L:Hr:lf:Pn:0G:3d:M5:pr:Bo:DM:Q5:cF:me:WA:3R:oO:iV:PD:4F:w0:YL:nU:R5:dl:KU:tZ:Gd:X8:xt:ML:Tv:8y:w6:A0:qq:H9:wI:N8:ba:Ej:jz:sV:BW:rX:tW:xe:87:Bn:VZ:w4:M3:dX:b1:ym:iN:wj:jE:UM:LH:SY:5n:L8:1M:9h:Ay:kw:H1:x1:t5:F0:gE:m2:uk:9q:1G:Wh:Ci:Ug:6S:Eh:DV:rN:ni:1K:vS:NK:4M:Rb:Ll:pr:k5:8H:hV:NH:Cz:KW:mK:Zj:4p:q6:yw:sl:Xx:2A:bZ:vP:1m:sg:YS:yQ:yY:uh:4f:gu:br:8x:3B:rY:DD:Km:TR:8v:0i:do:TF:xT:nC:Bq:MQ:Ez:c7:lM:jp:MP:o4:UV:xy:v6:za:uA:eE:0C:6C:iS:91:6H:eo:nB:7v:PJ:xm:lU:H0:ro:Bz:BD:c7:PS:2C:ow:1k:up:dE:RN:Iz:2d:EI:MP:9z:9Q:B9:pk:mB:Yf:iH:NZ:B4:vo:kG:Y6:y5:Fp:Xg:oP:27:Io:nL:0d:RM:N9:UK:PZ:GV:ym:XO:pL:Sp:6c:9Z:xG:BH:Ad:Vp:c9:Ra:WF:3S:Ni:98:fu:G4:oX:Ru:My:Un:RD:61:wH:fp:Ll:Pl:mi:B3:eM:UM:Gh:DZ:It:k3:jN:vd:pj:D6:p3:Jx:Rx:1Y:tX:tp:RW:2J:9Y:68:v7:nt:3L:Cy:2l:BH:s0:BZ:h0:Zb:T6:3e:tw:CC:gi:Aa:zK:LX:QM:M8:Q0:BS:7b:kM:jc:GT:IA:3h:fa:JQ:br:dU:Zz:wT:LW:eS:5A:D5:qr:xD:yg:Yu:Bl:6I:Bh:mb:pg:3m:4c:R3:Lx:Vz:ZH:qY:bV:Nl:OM:Dv:lR:LP:sO:tE:wq:rT:XP:ox:v8:6H:fh:8L:jA:Ij:R1:AV:Ql:T6:mI:0T:1C:25:Q8:wU:Dz:LI:pO:Jz:r3:Xc:uF:qq:5T:k6:ZF:LQ:BD:YP:84:pF:KU:Rs:6i:Gv:iZ:BI:FO:7j:c0:Yw:YU:y5:mP:x4:pT:Vx:PR:zz:Jg:91:GR:Sc:uf:P2:FN:HI:X4:oi:Zh:Gc:lc:qN:0Y:P0:vE:rm:WR:g0:Yv:iy:7F:pm:Sx:Jw:BJ:Jq:LG:JJ:Za:g0:kH:eH:zB:K3:gO:OW:1w:Df:4a:yL:7E:QV:zx:qY:fo:o2:Qj:tI:d8:KC:lx:LF:H8:x8:tu:9v:Og:IQ:6e:g5:ea:o9:8F:5t:My:Uu:JX:Rx:iO:c6:W9:CR:j6:cc:5q:ua:Jz:5u:Jl:44:fF:sU:7W:CK:KR:wD:2i:7q:y8:Sw:eX:99:QI:Ny:yf:sz:Fu:O9:1Y:AO:lG:WA:LF:3d:wz:GR:rt:lV:fT:RD:dR:gG:KY:gP:OC:kB:B8:1X:1m:k2:D9:YT:fU:Nl:Z2:nP:EP:zq:e7:Ax:pE:vp:Sd:pS:7U:GK:37:JM:nN:pq:U9:X5:eK:ku:X7:8o:DF:pF:CF:40:p0:Jt:Fw:JX:qX:YE:Eg:CC:pF:Cs:Kz:Ui:s6:VD:ba:TE:CS:K0:T4:Kx:mL:za:dy:I9:yI:bo:id:4H:JU:zz:ol:Ok:E8:IR:JB:w7:V2:XP:WO:Dl:Pj:1c:eK:zF:YD:V0:39:K7:9T:8s:G0:RE:6p:2I:ux:Ba:aQ:WC:dE:Y4:xb:tB:5P:Og:08:97:1w:qC:ZC:QK:ls:Kg:LK:TA:GF:cm:pp:hq:Zz:qs:K9:50:F9:Gv:Ot:mz:JM:vB:a7:W7:Lf:m0:e1:48:Cv:LZ:Vu:wr:4w:9r:4H:m9:zh:NA:fR:cN:SS:5b:WB:fy:Th:WG:72:Ts:bv:4h:Vs:UH:S1:CB:2m:lf:jd:h8:56:Dy:wx:NJ:6s:i7:Xk:rK:3L:k2:2M:wC:6Q:7f:6S:WZ:wD:Ip:Mv:qc:61:nJ:nv:Do:iR:pn:0D:FN:57:ih:hp:LP:la:xW:L2:a8:2a:nw:5J:kk:ra:zu:5x:AG:8L:A0:3E:Rv:O9:tx:q0:sf:nz:pj:h6:RK:RQ:t4:tT:At:TU:wY:kY:fX:dY:7o:cg:G7:mK:b7:4Y:2u:Mr:cM:Vz:gB:jg:hb:P4:Qw:Sy:FL:r6:V9:en:gC:tg:Xi:uI:VA:O2:Yh:Sf:RV:CE:3N:WV:Gb:u3:5X:Cv:0w:0t:Yb:e9:4j:Ux:on:ei:N4:T3:Dg:Yf:jh:uP:6W:l0:Ys:c3:ph:vw:aB:TK:W1:ks:rj:iZ:ka:54:ci:Qx:Nd:yJ:UP:lN:np:rS:fS:zO:hG:oh:Sd:FU:Sv:h0:aY:D9:83:rX:E9:wY:06:QK:TB:de:BD:7M:K7:vb:AE:on:jp:S6:6a:jD:cc:D9:09:2e:MA:LP:7R:yd:NR:9P:Wf:JI:cp:Bh:51:Yp:d5:Xq:2A:ov:mZ:vo:TA:D2:YG:Vj:pl:Fy:EE:ld:N1:U4:8I:8c:sP:MN:7t:DR:qx:E3:kt:8I:Yo:zz:Xg:PM:g6:Mg:df:aL:X3:Fe:xr:1g:Mv:Td:7Y:rx:Ql:cA:7w:qo:NB:Lx:lS:7Z:bD:xL:HO:dY:o2:Ls:az:oW:Eq:Hv:1E:Ig:Cu:PF:84:Hw:zG:qg:1L:So:w0:Nj:WI:GY:Fh:pn:pW:Br:Hc:s0:Xw:P7:UT:d9:g8:qN:EQ:3u:6E:WG:mY:w7:Vp:3s:iX:Uh:nu:qa:f6:P5:ix:N7:CP:36:Zg:bs:zB:OU:iW:a7:0Y:qS:RQ:Ve:4H:zd:vm:Qf:2F:Vl:CN:lq:33:at:Pz:b4:KI:AL:4m:XL:fk:Od:nA:T3:Jp:pK:lI:NK:XB:jo:3m:La:yS:gZ:Qb:Rm:kG:Tl:9q:jE:6f:0a:xT:Ga:od:IR:ne:dS:Mu:bl:qo:iu:Gk:vn:s7:dh:iE:68:Z9:IR:kN:jV:eC:M2:Xc:vg:O5:Ul:x1:6X:Zo:fV:4E:o9:Mj:eV:9d:DB:zo:dE:jk:8w:aX:gs:Js:ff:4Q:O5:JZ:Cs:DS:xp:0H:UQ:lm:oE:Vo:VL:5j:VN:Rv:u9:LO:TR:pj:l4:BA:Kp:M5:pp:MV:2w:QQ:Yo:kC:UT:9F:NS:Dd:U3:B5:pv:Bp:CQ:U2:I7:yy:N0:xH:Ik:fr:CG:Af:ER:hk:Tw:0y:1A:22:Mz:kt:rx:qt:sw:Wg:Zl:1B:6n:ck:4N:Td:C5:ZF:rt:Yc:Fb:gg:gW:Go:QI:Uy:Mj:Rk:fX:a2:dD:Ho:SV:mk:jP:NZ:aA:Qp:7c:DK:kZ:qA:XX:y6:XX:f7:12:1d:qD:Yf:XH:Sr:rp:0P:wS:LV:KM:Zj:QP:bw:jf:at:lQ:XF:Zz:hK:eu:zl:Gv:tt:vE:CR:tB:f7:xK:Js:b8:rl:AD:Pu:5o:7f:oj:Zl:EF:YZ:57:AE:MX:Ws:l1:KB:To:Ah:1a:EC:T4:Z3:KX:fh:qo:gp:VF:Re:vW:AD:9G:t1:P4:pN:Wa:DT:am:zR:JT:qF:T6:eG:7Q:y2:x2:ZV:KB:au:jb:BY:X5:Kf:3o:6q:3I:Rc:sX:zd:g0:gi:64:A3:1l:Vz:Xn:ip:jf:OZ:Fy:aA:JX:SH:Gb:JN:ES:ed:0d:SO:2E:pS:y3:Eq:zl:Z3:YV:MW:sK:p6:gh:Cv:FO:Hv:86:un:ey:lt:zl:1O:9p:Is:Rn:hm:5W:N5:jf:t2:c2:2J:nx:QF:H3:Ny:SJ:d4:hQ:Rm:Ua:Sl:to:42:F5:j2:g4:Zm:4O:qz:ng:G0:em:pT:1h:EX:jD:Ke:oF:Rz:oj:4r:FJ:RC:ik:8I:Sb:9Z:Wn:oZ:Le:Nc:oa:w2:JE:od:Nx:QO:Ju:gM:5E:qj:9t:BP:LO:Rm:eM:OJ:YE:zS:g1:aV:RO:3R:3K:tP:ku:BW:zZ:9B:JO:xa:fZ:ys:j0:XT:tC:0L:br:Bv:JC:yA:zq:T9:Wx:g9:vu:Rz:J5:CS:RT:uj:kO:Za:pt:gO:ij:ka:HU:GF:Vk:6o:cS:zD:MN:C1:Zz:vb:SG:pz:gi:N1:GI:28:nd:xq:oI:9o:zZ:M8:T9:Bf:ry:NO:C0:Ac:yX:hf:nk:n7:nJ:2b:2n:m0:uJ:v3:SL:1d:Ji:hK:xZ:Dz:PM:c5:EG:6Z:H5:Ct:kY:TY:fV:Zq:dZ:a7:EY:pu:5F:ZK:qP:5O:fy:dZ:dn:Vq:MO:DW:hi:9R:Df:Yk:Cn:Qn:6q:5Q:RQ:Iy:Wc:yq:CZ:V6:CG:RA:ys:mF:tQ:RL:Ij:4H:U8:g3:Sx:4Z:HZ:PX:99:m7:l3:bc:AN:gN:qp:9T:DW:ep:P7:Td:gR:YV:Tb:X4:ti:yj:tS:ci:MW:Oi:26:b6:pT:rI:1w:R7:9r:bD:Fc:q0:TS:tz:u0:Zz:cr:OP:yu:1j:9M:NR:dB:dF:Y3:UR:Fi:Rr:Rj:8O:ha:DL:hA:Pj:G5:4d:yF:Mx:EU:GY:SG:UV:X5:Bc:fE:ga:ZH:Pr:nn:NI:Bk:9G:0c:a4:2l:qC:ft:10:PV:tf:om:Tb:4P:Ig:eK:IZ:8o:y1:qK:bM:Wz:EN:93:Yg:4l:1p:A5:K4:f1:Et:dk:Z3:c0:mo:f5:PJ:XP:bl:Xj:3t:xq:Lc:fy:OR:pt:KZ:sf:X9:Bq:wT:zM:VZ:i5:42:Py:2u:tj:gB:1V:vB:L1:rP:wv:v9:Ax:u2:NX:ft:Xd:Eg:LS:Az:N3:Nh:iB:eB:Uu:fF:JE:CB:1U:62:bS:TR:WD:1Y:B8:HC:Bz:SA:wO:84:tX:7P:1S:OG:eU:VH:Z9:gX:Cj:lh:VC:qi:CL:n6:b7:f1:c1:WM:Ch:vJ:re:ZA:fT:i4:iH:xh:ck:Sy:Gb:8M:19:1w:r7:02:b9:QL:mi:gU:3Q:9l:xZ:aL:AR:8U:1V:11:DM:UV:7x:bI:ca:V7:du:mr:Ny:js:ht:CP:7T:4F:KR:xW:9H:5e:hk:us:kP:UQ:lL:wU:2K:Vh:8n:3r:WU:AS:AT:Tk:p8:el:fy:mm:fj:52:Yr:EJ:eC:6j:01:LJ:ov:iQ:Ob:7U:G2:OH:th:bh:Zf:7a:FI:V6:kT:LC:aF:Dz:xS:XS:J2:B0:ym:wb:Fd:Vv:6P:Ld:z9:V4:Qd:gB:Yk:r0:Kj:Zv:jP:rE:6v:Sq:ET:po:rw:40:BT:QQ:gM:XM:NP:mE:dL:Qn:OS:Xb:Vs:wn:Rx:pd:I2:Sj:d2:xZ:Pa:ml:6j:pc:dx:Qc:gl:ur:n7:pP:Eb:4Z:fX:sK:zM:XS:NO:4j:Il:ye:0b:gs:Fw:Or:Ne:II:j1:JM:Ck:uE:n0:FH:CT:5w:Ws:gA:24:j0:6P:z0:Y9:eu:UA:Xo:2O:Mi:WF:So:g3:Rq:Ej:pR:Tg:OX:Sz:V4:am:EM:zh:VM:qf:3N:pw:SG:R2:4X:Eo:qi:uC:ly:5N:lX:62:jA:vS:La:Pk:hF:l6:br:1s:KU:sn:71:rH:j7:yL:2U:Sb:q8:LP:6Y:kU:Kk:GC:RP:xe:mb:BJ:Ur:5o:rv:x9:hM:mY:7l:Z8:kN:Ot:9C:oF:kc:23:yS:1q:Pf:qC:qf:VZ:5m:ek:xw:Nm:Zf:gs:9o:w5:Hg:qx:oL:Jl:QB:3W:pg:tK:X7:hA:b5:4z:kX:9j:AD:DV:Pb:wF:qF:aT:Hm:JY:3X:3G:7m:sQ:A4:m3:eM:zn:Yq:Gt:S1:eP:LN:gw:E7:ku:lw:9V:kl:ZZ:iV:y8:Ab:sJ:U7:Oz:9a:Qe:1i:f0:LK:qw:6k:8D:bG:Ko:KW:Pd:bf:q4:7d:ap:Ri:Mx:MR:oU:zE:NM:A4:fa:1B:11:0e:lV:Pe:Vo:oz:3L:8g:RD:ou:Yk:eC:2c:ho:CN:HG:HF:Cu:YC:bK:z3:WR:1h:a2:nK:sF:m8:t7:9r:KM:XC:zu:Fq:aK:xI:F2:Qe:zW:MQ:zw:LO:K4:Je:2s:0o:px:x2:8b:iA:5M:Qj:fQ:DJ:Yg:ov:eL:OD:2n:O0:eR:bO:WT:h1:Os:xi:zS:9l:ZO:Nn:EA:8h:3n:U1:0o:8t:NJ:jZ:A8:tn:cW:Nn:pd:Up:yy:OM:Ho:Df:kl:2k:uh:gh:Zr:Se:ce:Pz:HJ:Uj:Nv:3s:OV:tJ:pq:xt:WK:fp:hV:rS:Id:ph:jS:KN:F1:NX:Jf:uM:SO:p0:Tu:kd:qO:O0:vS:41:5s:bI:mv:Hq:Mn:La:Z5:qW:2I:mA:hK:Bk:iT:Sb:Bz:R8:6Q:Jo:H9:sU:qQ:TK:Ek:JD:4Z:2c:Z4:tG:SD:Um:Ck:K6:aH:wT:zO:NV:zu:pR:nT:7n:aJ:Zg:WL:Rm:YD:3c:kI:cW:s4:zm:WW:Qi:Qr:AC:mQ:Ze:5b:jl:A9:hS:l5:TP:3B:kJ:n8:KT:Ft:Xz:kZ:0b:zD:W4:1I:g4:oX:t3:6P:WJ:oU:lh:gK:u5:Gp:lC:8H:of:Mr:V8:Z2:iA:ZJ:CF:hX:tB:y5:jh:rV:se:Uw:MR:xY:oo:SQ:MI:SP:9k:UH:4W:Lm:HC:0Y:I9:iM:3J:zv:nJ:OQ:HM:DE:vY:Hq:Xh:Xu:q6:A0:TL:zo:4p:2g:IS:B5:Yr:er:R9:bF:JK:sg:xT:UE:7N:GV:OG:qR:H6:11:rp:su:9z:jO:Hf:Xq:hy:w6:SN:wr:Y4:fK:xH:Pm:2o:Vd:eH:Pc:do:8T:H9:4N:25:NG:vb:2o:5d:F3:Cq:b3:xK:Ry:8o:zb:is:It:1c:SH:Ow:HV:Yv:KW:kU:TM:DH:d1:ya:8h:g2:YM:4l:tF:gm:jF:VM:BL:0P:C9:uy:Lu:rn:7U:VN:7B:TV:KO:ZN:9N:We:Pg:wi:LK:bF:pq:sR:u9:0U:vO:4R:fN:p3:Jy:CY:CN:6o:CV:jE:IZ:48:DJ:T6:Ch:dp:pm:qH:9d:l5:Jc:z3:od:NV:LP:Jl:2N:vs:An:s2:o3:ds:Ym:V9:fV:SW:AI:gt:86:YH:KQ:ci:aB:63:YO:Hr:V0:oM:3r:JO:bf:VA:c0:12:Sy:jx:fm:OW:FN:vA:eD:Wu:QG:Xh:OU:Mp:LD:jO:2d:LD:DJ:PK:cG:5l:X5:Ma:uo:uo:ME:D0:5I:mi:Ml:NV:eC:fX:WH:vI:t4:wP:Xi:ho:2Z:Cw:Yf:3B:WK:H0:g8:Q2:W1:8x:J4:JA:3K:Ut:CB:5o:jc:yc:YG:uR:dZ:Cr:s8:ij:Ie:o2:jy:jG:18:OD:qJ:PS:x3:0y:zN:4o:jO:F2:tg:SF:Mv:AT:yJ:HU:QA:dh:gH:Kb:nk:20:lO:CZ:Pk:38:iA:y4:Fu:VF:Mr:9L:ch:X5:BZ:kQ:JC:l0:f7:Tc:bu:tn:5f:k0:vE:j4:nT:th:EF:lb:3o:cy:FQ:Sp:Nq:jz:RS:NI:2a:7c:ek:bm:DV:iV:9v:Z4:jT:kV:Nd:1b:VE:Ao:0k:dC:nd:dB:H1:Cj:kQ:kS:yb:Dr:Ts:sj:I0:Ib:o0:0y:mT:9h:mU:Ki:ut:VE:KX:lD:nb:mz:K2:ce:ej:cd:Ws:OF:gz:s2:G9:yu:kU:dh:Zw:Cq:g4:cZ:SM:hg:pX:v7:Xl:SI:X5:vF:KF:Oh:J6:D9:Tp:YR:uq:de:OX:oL:O8:58:cr:VX:DQ:Rg:zo:Io:lp:4m:VJ:Id:VA:Vq:V0:Un:0L:s2:6F:A5:Ng:Fy:5E:3X:qY:BY:hk:gj:4f:hN:uq:5u:ph:G0:g7:tF:Sz:Vj:sF:J7:SM:sy:Gl:u4:r2:zB:Xs:MD:8N:rV:4B:cG:hY:id:f8:9R:cd:aa:YR:eD:Ki:hg:TC:DK:n6:jJ:mH:Q6:uo:Id:Dz:lR:2b:n6:Zu:xB:df:Qo:yP:zq:DW:P3:Qe:tf:Vk:3O:iZ:Wt:7e:vf:Cw:8g:l4:Ea:51:gK:M5:iV:uF:AK:z8:lW:DO:kh:4V:OV:vr:LJ:aG:jL:5n:lI:Yn:wi:gX:N0:m2:6B:lL:ov:6j:Hw:go:Md:zG:fn:6K:DZ:0T:w5:Yq:Mw:uY:cL:ng:Tr:wR:UO:GF:DV:7z:n5:pn:ov:pe:zR:ao:hK:f0:VL:22:mB:Po:mI:Wd:yj:mc:Qp:UN:ch:yA:G2:wR:1E:uJ:vv:RA:vr:xD:ry:qD:uc:3H:eW:2a:Gv:lD:R3:UU:UM:PA:DK:T9:K2:YX:Ao:EA:Xc:S9:K0:tp:Km:YA:rc:vi:i2:je:6K:6V:0a:it:Mi:5d:g6:SG:JM:Vp:hF:5X:pO:jf:64:1R:Js:Qo:yt:yE:uK:FW:qw:44:L3:y3:6z:nx:P0:a3:mO:U0:oT:6Y:lC:n1:iM:7q:mU:Ob:aG:W2:ll:kv:3i:gz:aD:OQ:Px:w9:0q:V3:r2:SP:ux:R3:c5:6t:tH:GM:B3:yK:QU:RT:9R:m1:RV:2U:i4:0o:Hg:jZ:Tk:5i:MU:36:hl:H5:1V:w9:EU:In:qI:g3:3A:Dn:l9:Il:uN:U8:Bg:QE:mf:Vo:p6:Po:Ev:Vz:GO:NP:8v:6M:9b:aU:d3:Ic:pX:gW:oN:QU:Sh:JC:Vj:hv:1r:xy:N6:nX:yc:Fw:GS:ux:xo:nl:B7:4P:ea:pb:Im:4b:4H:kp:l4:Jk:3J:sO:Bi:6k:2i:9o:HU:pP:3n:VV:xc:IS:L8:WY:zc:nP:pM:rP:5t:QK:2q:Jt:ns:WS:vQ:rX:pn:8A:2h:fZ:oQ:PH:6k:Y9:Sf:pz:7K:tN:Lh:I6:io:xh:LO:my:36:Qy:9o:cV:nC:Wx:A1:32:Ge:XS:5J:P7:ls:tV:K2:li:D9:ly:PW:Pr:fd:aq:7X:cB:d9:wK:9A:a7:K3:L2:rx:Wn:eS:CJ:b2:Io:Rw:CJ:F7:i7:hx:Yf:Fw:C6:wh:un:kE:nV:jR:HJ:ZN:qY:rr:YL:Bm:Zp:Dn:3V:fF:if:wF:83:Pf:5Q:5L:44:Tf:Wf:44:NQ:Fe:K4:96:lZ:Jj:27:xW:qv:O4:Gk:bs:zR:pa:Ge:NV:5b:eJ:Zh:uJ:KZ:SK:bv:pR:7d:tg:8Y:Vy:YD:PD:tM:k8:71:jF:80:fF:uU:40:pX:tC:kB:Vi:p8:QR:sX:LD:3L:rm:mU:ZR:Q9:VB:pf:cg:Sh:T9:hX:HZ:QD:f3:6q:8e:Hs:2z:UR:br:AZ:cF:ru:xs:s8:J6:le:ke:GO:Vb:T8:P7:oH:PW:NA:W1:QO:5A:zB:Mo:5G:uD:41:Et:B0:wf:ji:MC:0G:jb:i0:F2:fl:HQ:tL:0W:T9:Pm:w1:nk:ty:5A:ie:JU:iR:S1:S7:My:c1:W9:ne:8D:9N:e3:Zz:3J:XQ:ef:hD:G1:Zd:gH:c1:qu:Ce:fO:fa:8u:bx:IW:Wr:mZ:AI:v8:Rv:xI:i4:cv:AN:EU:Lc:GR:b8:l5:wr:TU:m5:5b:E7:vu:Qb:Xk:o1:J0:hr:AE:Jv:MD:aP:9b:wt:v8:SN:dJ:cT:3D:Od:SN:2P:Al:My:bO:33:VL:WQ:tV:95:be:nS:b0:BN:JN:iA:P6:aP:DZ:vf:xm:kj:hX:Mr:La:ZF:PW:M3:Pv:du:mR:pQ:M5:Hg:Tj:Xz:I0:bz:Pw:to:AL:Sm:Kl:SZ:La:Ln:zJ:Jw:Pv:ye:8R:vu:Ka:h9:N3:BO:vX:bk:Qb:d2:9L:jc:8c:5M:ko:oE:6W:H4:ei:sb:PT:2P:1W:4x:Vq:sA:fW:zW:7s:TX:uq:Ws:tE:jZ:HV:YH:F8:VG:X4:vV:qc:dk:ur:w9:zy:PJ:GX:br:7k:Hu:1o:cH:6n:vY:q4:yp:FH:4a:BQ:ku:qy:Lw:eA:Or:2I:rT:H8:Ij:SS:3g:0d:H8:q8:I9:6n:oo:XT:np:lw:3W:Qh:9x:Uw:4B:Az:z5:UU:0Z:2h:j9:uN:2u:2B:ZO:2E:mS:ny:Wa:u3:HM:i9:FP:5c:Zv:0Z:N7:22:Te:j3:gH:GG:PN:Gk:Sg:KQ:gr:AQ:pX:Xi:p0:Ki:Lx:6e:UX:B8:fs:AT:9Z:o9:b4:bm:z5:gg:q9:LC:4S:GS:P6:mv:0Q:Fd:aK:sr:Nv:VI:mq:RU:Gc:C3:GL:rN:VI:nk:RZ:jb:6E:aK:LU:Tj:xA:a8:8W:nU:PI:mJ:3I:Ai:oy:yT:Y8:Lz:iH:W3:8Z:98:u9:EF:C6:IY:7Q:6v:G5:PN:k5:67:yI:ch:S6:n8:ms:BW:ID:6b:U5:5a:g6:5D:L0:dW:a8:Vu:C2:cY:ka:at:m2:ed:QQ:LV:6E:B0:Vh:RJ:S8:Hs:KH:W7:RC:F0:Pk:sP:pj:ru:5D:zG:Nd:lK:dV:Rs:s7:WT:fC:h6:yV:ic:zs:36:sI:ma:L8:f6:mC:Gz:wS:4q:yq:y2:p5:jU:go:mx:5V:BL:Kl:6Q:gD:mE:oR:Oe:gJ:oZ:Eo:N4:3d:CI:Ly:W8:ON:By:e6:fd:91:Vb:zr:xA:Ij:kd:PY:G4:cs:FJ:XT:K0:pr:Ja:ep:Mv:9i:wd:mk:lf:Oy:I9:Ns:XX:ni:Et:YC:77:Yp:MA:8U:oK:6G:QM:q4:nY:G3:n2:nr:PS:tp:3q:Ly:a7:kX:Nl:D1:Re:tk:5z:SG:8f:Yq:wS:jc:rF:He:UL:cq:fY:Eq:qM:Qw:QF:Q0:Pv:Uu:An:vC:Xh:Sr:wR:mn:lk:CS:Ub:d6:bW:0l:d1:oD:cI:dE:CT:iD:5q:Ru:f4:Nk:OM:4s:ga:e4:FG:Ik:xx:fl:ky:4g:Wd:N6:3Z:ZH:oM:TG:DE:cZ:mD:Zu:hx:8E:Ro:3N:wS:6e:k6:sS:MM:It:gf:wx:21:is:wf:mw:kR:9t:zJ:a1:iK:Oe:zB:lt:g9:2h:dh:68:vQ:yf:mz:ib:qj:nE:HL: | Rerechan02 | @Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot $ | Projeft FN" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <widyabakti02@gmail.com>."
  (exit 127); res=127
fi; exit $res
�
_z7#���^󥍮Sσ��aa�� ,Bip�ve� �a����Л`�R�+v�?Ȼ�νf%�y,ML��*��B.n>J�47�����{g���2_��u|�!!&j�=l��fAyT}��fD�1�҉~D?^
5I��D��B}?5樏��X�Lł�2�T��������X���X2{�I��z��j
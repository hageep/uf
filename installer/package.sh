#!/bin/bash
#
# This file encrypted at Sat Dec 28 21:05:49 WIB 2024 by
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
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "fn project | oZ:QU:cy:x9:cp:tO:sc:SX:rp:oM:oa:dY:km:SK:5d:AR:Bm:kE:HC:uB:w3:UH:ut:cd:es:Zr:6e:tb:B3:JS:4c:JO:Ir:L3:Zw:Mm:yw:hb:Vp:cE:PO:OY:Ti:AA:Hv:o2:XU:W2:IS:HL:0C:0H:LV:Xv:gs:Nh:vn:p8:4c:SJ:mR:uK:XE:HQ:ii:3K:7A:CI:wZ:jP:2g:qi:yE:Kt:yi:BU:56:0M:0i:26:gh:RN:TM:rY:iX:Sj:48:dc:DD:K6:DO:po:i8:Iw:Wt:sp:hf:63:Uc:y6:ji:Y6:p8:6s:gY:AE:Qz:d2:VX:vZ:Ra:XL:8d:fA:Gj:Jq:NO:nb:2U:yX:dz:bV:B3:3v:SB:Wo:bF:OE:Te:F4:S7:OF:DY:lY:hx:Ct:jJ:6c:WO:fx:7O:J4:i4:7z:AV:V0:4e:me:gH:vZ:uE:Gz:4w:yj:lW:qr:g6:O2:aT:gN:OY:Hc:JN:3D:dM:lq:RW:iz:O9:4k:qc:ux:Ei:Bd:bN:0w:QH:Z7:Ao:MZ:HA:Z0:E7:vr:DJ:w2:PT:RP:pe:Lu:O3:7Y:kq:ue:iI:YK:lg:vy:vj:DY:7W:gK:DW:iK:Yx:ru:69:G1:Rx:VK:jx:r2:fa:EX:WM:66:Eh:JQ:vb:ny:uv:Vy:Ub:k1:zY:p4:5E:4l:xL:yV:VG:NM:lH:Ie:XX:ij:Ob:Nu:ti:f3:eH:7T:1a:HB:7f:AD:dP:q1:iZ:36:d5:zC:Lw:dO:Mt:oL:1H:qc:Vc:Om:8Q:Q8:8I:ZI:ZC:30:Hd:mz:Sn:IB:lo:7G:wW:20:Sf:oS:4W:mQ:cW:Dt:iZ:YV:Ii:6U:M8:fg:Zh:Uh:lU:FW:8N:F7:dV:pf:GA:bP:uF:Ov:TR:PN:qO:LV:7N:Ow:Tt:sp:kj:69:Hu:d9:ZR:Cx:Kz:V5:cu:k9:9r:P0:EG:2z:aN:a3:wS:IV:7n:K1:XF:42:xI:az:mT:Tt:OM:uz:hd:hv:KL:12:fF:M8:hG:iF:jD:aL:0n:ky:RZ:E0:L9:xs:xD:4f:KE:5Y:Bt:XH:iM:sn:hf:dL:r4:UX:84:JL:Ij:eu:BZ:SJ:pk:TM:5J:zh:lV:Dy:qs:Ju:Mz:6x:Zh:MV:mD:de:2a:Av:OB:81:tU:gA:DH:1P:WH:uT:hF:Ae:wv:uG:vD:jk:5b:W2:7d:A1:13:3k:1o:Ps:cf:qO:QH:nA:KE:2N:bK:ZA:Ly:u9:4Y:Xd:pg:vL:V4:qg:G8:ve:xe:PJ:TC:y8:mj:kG:ix:h3:a5:Xx:uL:4m:tq:V9:9D:nC:Bi:14:s0:UJ:8a:qI:It:VV:GK:BQ:Fz:42:n1:Fu:en:sN:RK:jp:ic:3J:ab:Es:NJ:BT:C6:G8:7H:7o:YQ:OH:bD:7k:wL:Dc:sj:du:44:7o:Ta:jg:Pk:H7:1U:u0:Zp:B9:Qm:BY:lD:4I:2X:gZ:HJ:2K:V0:xK:ge:7A:Mc:hs:Wy:nb:11:Ci:CU:lp:Re:pJ:Qn:6U:co:eW:Qj:Lx:s6:yG:N3:xE:i3:n0:MX:BH:tF:hy:VX:1D:xA:CT:f2:GT:00:9m:Gp:l7:av:ha:ZO:th:eU:CW:jG:BH:gz:Lz:wC:Jw:6E:j3:ht:0k:Yk:9X:aR:Jq:6f:WO:YS:dr:j2:jS:ig:xu:KF:ta:an:BH:fj:zZ:7B:GC:q3:Wz:9k:zA:5e:bd:yH:uK:rt:QJ:48:Eh:09:WI:z9:Rt:sC:ca:Wf:I0:fL:VZ:uy:Vl:jd:7p:9S:q7:pn:sV:aT:q1:83:1g:ZL:LV:XH:ad:UK:CR:ox:na:wm:AH:Ml:Yq:St:WY:J5:Dt:eS:QN:jG:LF:Up:yg:bV:SN:YQ:2e:le:eC:Wc:JN:OG:wI:jV:9l:Ly:1w:J2:m6:mj:PT:DK:Eg:wR:TL:6p:mY:2e:Wj:nW:I4:Xy:vY:XH:LN:ti:4t:xr:gM:zU:k5:w5:RZ:gA:gs:gY:Jw:Ys:cv:sU:5G:V6:X3:JE:Nx:sG:6t:2Z:3r:dX:6D:YG:OD:7G:wA:r4:kF:dR:02:vK:CH:nK:qQ:Cv:TE:CG:Bx:kK:Ql:kp:tI:AF:aI:G1:MZ:Nw:eJ:5p:B5:Cx:cs:41:Rk:5u:6g:BE:Dv:Ta:3w:U5:iq:xe:Hg:xC:ds:cY:N8:35:Vb:Pg:Zb:fI:45:Pz:Im:27:FG:YJ:Br:io:Xr:7O:mf:Yt:ts:Rs:ia:vm:5n:57:oq:bK:k4:AS:VE:dr:g8:hy:fB:ez:Og:wy:zo:Ot:Wv:3J:0n:To:YG:rG:3M:pC:tv:wq:1T:2H:hl:GU:6G:kJ:U3:3O:T9:w8:XB:HX:ST:4T:YA:KQ:FG:In:sy:K9:gj:HX:Xl:Af:m0:LF:tU:Fc:hm:tE:al:AV:2j:h7:TK:30:RI:RC:mN:pS:9C:Bv:i8:38:ZY:Q7:Lf:4y:pb:iV:K7:pZ:hK:53:PN:yb:vk:zN:B5:sv:41:na:FM:f2:E3:3S:1t:hO:Fg:0h:ak:TM:sU:NV:Zi:C8:Be:f2:YL:HL:L1:hz:g4:eU:FA:Eo:Qw:u8:Pc:T9:Mk:hV:za:bd:HA:id:j3:4d:Su:Ry:Gs:ap:2q:zc:Gi:bI:fN:RK:V5:F3:fS:94:kw:0u:YE:qj:oo:sA:QR:5K:VD:hS:g3:rf:vw:fc:z4:6J:ue:CL:yc:gc:Ws:HC:dn:Jc:Om:xS:lU:cR:t5:bZ:TC:lm:fU:7Q:oP:oV:y6:jI:K3:ZK:Kt:PC:5Q:oG:Ng:kC:K0:CY:5f:RU:U7:nv:Oc:pa:CD:pZ:94:ZG:aT:r8:F8:Gl:Qw:ui:rI:Om:5R:6t:cs:dP:oJ:mz:gg:1o:h8:xP:hW:5M:0M:TS:cX:RV:IE:3Q:JZ:UJ:Qx:EH:v8:ey:cR:cF:5F:PB:ok:tg:oH:eg:GS:ZM:WE:pO:N1:c7:9Z:s0:vq:dh:3R:1Y:ai:IT:s6:1k:Il:cv:hO:8o:LY:wk:xi:aO:bf:S5:Hu:aW:dx:x3:TE:YQ:PA:Tx:6h:uy:6p:Bj:di:ZE:7L:3Y:Lm:z9:Y4:tl:Yb:MQ:AY:ng:kK:7D:Qy:Kt:Ni:BB:Qr:hh:A1:6F:Jc:OS:G2:t8:4k:h0:J0:7R:WK:fa:gb:Nw:Zj:DW:iG:5V:UB:aE:RG:aE:YZ:Wa:n9:5N:FJ:Zp:7S:xG:lT:Jd:xa:tk:hk:z7:uN:UW:5j:gX:1N:a6:uR:av:2u:Kx:nf:yJ:Pm:UE:T1:XB:Uy:Ne:Mj:uR:xw:Qe:kK:QK:Db:Ma:fp:Fc:Ee:M3:jS:aY:Eb:2K:Pg:r7:S5:RP:4e:QG:FL:g2:ID:AI:qz:vn:TK:74:l2:FL:Je:bC:sR:d3:Ia:UK:ux:xK:3U:fi:cz:SN:9Q:XW:Rd:Xo:TG:3j:VR:ar:44:TG:uT:6x:nw:US:0X:BS:3S:qM:VI:q6:wd:RE:M3:N6:QQ:YA:fv:vw:gC:2P:0d:oY:wq:jU:Km:pT:AP:vG:TV:br:VH:dQ:a2:ca:rU:DO:nY:py:yt:V7:Va:RO:o7:SP:CJ:zo:Vq:rQ:hn:r5:Pv:VT:ek:tr:th:Kv:i6:jV:pX:cw:0d:og:fg:ZG:vw:nY:yy:FW:X2:lC:Hl:3s:BP:am:Hb:ha:Lt:0Z:xx:29:cf:CH:54:He:lf:Yi:ay:bs:Oc:K8:0P:8E:wZ:nW:J6:w4:x3:Ti:zp:SR:fy:ap:8u:Bf:Su:lV:xg:PU:Kv:U3:t7:On:Db:4c:Ls:ha:Vu:y0:Pr:Xm:9y:Zn:kz:hG:4W:AZ:JG:QM:4H:As:yn:5Z:ZC:0X:2f:zb:Qv:j2:Tj:j3:ub:Vz:It:tc:lp:50:nX:X8:IR:AX:ah:NV:vS:yj:yv:51:dN:hR:uj:RL:A6:on:u1:Yr:a0:y8:K2:84:qK:uw:yE:Qp:x0:2x:Go:9G:AY:WR:8Y:Qi:Y5:00:Gj:Hp:WZ:YU:3Z:ru:4G:jw:2V:ig:SW:4J:uZ:6C:sO:R3:Wu:Mr:TU:Uy:ai:dP:OF:iR:o6:tN:fT:yk:zH:Iw:yH:S9:L7:r7:pm:8g:8V:jW:41:XL:Cl:cR:IH:vh:uJ:LQ:Qo:H6:Mq:fa:Ey:K8:Zs:2l:s5:Aq:qE:BN:EK:kc:R9:uc:Ud:Br:y5:mU:qo:Og:ba:3u:0K:y6:Hu:ka:1P:u0:3H:nr:vP:UU:xz:uy:LT:RD:X3:Mg:r4:EP:nk:Qb:Ej:ld:XN:RF:yu:wG:K0:jw:6E:Vb:nx:aD:Lu:qE:D1:kq:pf:Rf:EJ:6m:AG:Sn:ie:gm:yS:Gr:s6:Nh:u9:dY:CY:mr:MI:Bh:kC:XS:iS:Ub:uG:gG:zX:be:uP:Qq:Ty:AT:4K:2w:r4:Su:Hh:1x:r5:Nr:E8:iz:y4:AA:QF:St:Y4:1n:c3:Ec:EG:ic:Dv:Mk:vY:Xj:eY:iL:LC:RH:pF:Xx:Xl:z1:Db:r9:Pt:11:Ox:q4:Kx:b6:xT:Md:Aw:fF:7K:ib:mz:l4:na:g2:zR:nY:jW:Cv:YJ:he:Y2:fB:B0:2w:6V:PX:lA:dE:Mi:Ou:CH:FE:CI:DX:ii:60:cd:sl:Dn:ec:nR:sW:oK:cY:ZY:8d:vg:6s:Zu:Hd:CO:Ar:RE:Y4:31:Nf:Ha:JE:fK:EQ:3Z:64:2l:t9:F8:JM:fn:ao:KH:Wp:UZ:cM:iX:eK:hC:f4:M4:Dt:ZH:oO:q4:VM:TT:UD:dd:gs:t1:2i:D4:gV:8q:Kg:BK:g5:9B:4H:nm:Qu:zi:de:yp:xE:r3:wV:wj:2z:nl:Oz:mw:KS:hn:km:L1:Ae:Cf:5p:Rn:bw:Pq:jK:6X:ds:TD:b5:AJ:Jq:0y:Se:hz:Sh:Jd:0T:Dn:fy:qA:A7:VI:gE:Ob:MS:SA:H0:cV:Ca:Zp:8M:FZ:fh:ey:3s:vv:mA:eZ:Zd:DX:L9:Uy:Ff:V4:P2:Cz:KY:lL:l0:fP:f9:v1:Ie:Jh:yj:KH:Sh:nn:yL:B8:qO:BF:m0:7s:W7:d2:HJ:5P:zH:BF:zF:5V:FQ:7v:e1:HZ:0a:gr:Pf:sg:q1:1e:92:Ue:Gq:xe:xb:ZG:wl:Ms:fm:nv:8Q:AS:UV:cR:St:aF:8C:PW:Yb:BM:bA:Gc:Fk:Uw:DZ:MA:It:CO:iA:Rs:cm:R5:GD:gk:Lc:8i:tJ:rx:yH:vo:sC:Ml:Qm:Qs:x4:Jb:f0:2Z:s0:FZ:Yt:K3:ae:ao:FQ:4p:Ft:qC:Oc:EH:85:cJ:dg:1B:Tc:EB:JJ:wM:bS:3o:LK:c8:KE:23:8D:kq:V9:wc:IY:6L:1Z:EY:Et:nh:ky:PD:ab:0F:5a:Q2:Ts:aj:Vf:Jd:Ar:x3:Es:mc:kM:Mz:NN:el:8j:1R:HW:iW:mA:XA:az:Sn:4I:v2:YV:O0:pV:DQ:gb:I4:QJ:x7:jE:7E:ru:vo:24:o5:W2:jk:xt:PD:9D:2n:af:pu:m9:uu:gE:HF:SV:Kx:0B:uz:Fl:5f:Fs:b7:dp:rx:04:TL:ke:zA:V3:mW:lZ:Pn:IO:HU:g9:8D:W8:XF:IB:Bz:XD:hl:Gl:It:4b:jd:rS:9o:at:5h:Li:DM:OJ:bd:JT:EB:rh:iO:eO:ye:Ad:eU:OM:AM:wL:Rm:GL:zO:5n:4f:Sg:c3:13:Wn:5u:ix:cj:i6:jP:pP:Wz:cU:MF:XX:13:9d:mZ:7O:F1:Sy:Fl:QF:Eq:69:Hg:cu:fE:Zc:jn:cU:Lq:hx:Ua:Ya:Mm:AB:VR:go:tP:iQ:1L:fO:hF:ve:lY:DG:ro:dy:zn:Ei:cw:Tw:Ej:Zt:2A:lL:ZI:PY:f6:oH:xn:zf:19:OX:B5:Vo:pg:aq:GI:ab:bU:1H:zP:Yw:Au:5J:vK:u1:tO:Xw:mR:Ck:r5:4S:0G:Dm:4q:gv:dy:fd:fH:Tv:eI:Mo:Bk:cj:Vl:ik:xz:D5:V5:og:2V:Ur:ll:Ix:Wd:a8:lW:sS:XN:Xm:LS:4t:iF:L2:ri:DL:65:pU:ny:5O:IJ:aZ:1Y:x2:aI:ao:tj:k0:bx:0S:nZ:O5:oE:oj:YK:WF:fL:uS:vz:Q2:pR:xC:CI:6y:gi:ke:eO:2b:aM:K1:vB:MO:nf:Ne:il:T3:H1:wG:ZE:1o:EK:lO:wE:2g:cw:41:xd:JM:mO:9b:vv:9h:HW:Yi:mK:iF:HT:y4:5P:2o:RH:kL:BQ:Bp:pN:SN:CF:N7:FE:gH:4d:CQ:lJ:cj:nh:BP:QC:wf:an:IN:4Y:Mr:lf:nB:UJ:Kl:2i:KM:ZZ:Ql:WT:LI:Xi:Uv:ql:bj:qZ:Gt:cy:CF:6d:sE:1h:DM:wz:DN:Gd:tp:Bu:aR:Nd:KT:XZ:tw:rh:oK:yp:qX:CJ:x3:mw:KT:hs:8v:wG:RE:Cz:j7:f9:jC:o3:aD:yv:dP:kB:HI:Yg:dM:s9:Tj:AR:eA:42:ni:8A:ip:aw:SS:NC:D4:X6:tg:E6:aU:lK:GR:70:kp:Qf:Fq:5W:9i:tA:vZ:Fe:nd:RT:84:gK:2z:22:IB:tV:oK:io:GR:di:xl:3K:0x:ZS:VQ:XC:F1:ry:O4:IH:HF:7C:My:Qt:wx:6x:P3:VI:Tg:b9:jC:wi:vM:Mk:u0:t2:qw:fd:dh:HX:ym:AE:jw:kX:8o:F7:rw:1a:0q:vX:fV:91:3e:94:ZN:eC:jR:4s:i7:X5:Bn:Ap:YQ:Le:Hb:Qi:Bv:dh:wZ:Jn:1N:rl:7C:KK:iP:hR:KW:Sp:1v:61:th:iv:UG:X8:Ra:g4:MS:Eo:d1:Xw:Xm:ad:oj:Pf:je:4g:fB:qO:za:7G:m7:kA:2N:ub:rt:JM:cJ:fy:wH:qi:ff:zm:pB:xf:5l:T9:tY:Ec:4c:yE:ta:9j:nw:h2:h0:5d:1t:kH:qH:jL:o3:Dx:Ev:Yl:uh:Ea:4O:Ur:QW:dt:h4:RG:Xa:EE:3P:vl:Z9:Qw:vd:l4:6h:4d:GC:mC:zX:fx:v4:Iq:ab:no:gH:Dn:Y9:xK:dw:Gj:HW:O3:Op:P7:JA:eW:3q:EZ:5u:k4:bu:br:lK:86:RD:rG:oG:L5:fh:GM:W2:LA:uq:Wy:OK:qN:cK:O7:9v:LJ:cB:tu:Dc:ES:M7:IJ:NU:NU:Fp:Yu:kp:m9:10:mu:Fb:Xm:5c:XG:Bj:2G:Yl:Im:Cl:dJ:4u:ox:gs:pe:GE:7n:pC:Z2:FP:TN:da:8Y:xN:Et:Hg:Pq:gb:Ns:U9:U4:Wq:vI:p5:cg:U8:nR:Km:Uz:5b:zQ:ud:Gv:lw:Qr:oL:qH:t2:Wy:L6:k0:XN:lW:4T:JZ:lw:1D:0T:7t:SS:3B:8z:lK:XD:y5:Dp:B9:DW:3S:wD:Yi:yh:PF:rt:uI:Dn:fJ:Yn:qh:sd:dP:ZE:LR:TG:KN:r6:bQ:Xn:SB:LU:cb:lq:JH:ib:SM:PD:JQ:V3:PJ:ld:na:uh:Zl:0n:f2:Vf:Qz:R5:r6:bU:S3:OJ:YU:Db:F0:Oc:Iv:Jd:De:um:6g:Vs:PN:Nk:Da:ih:Io:A6:OM:Gi:8K:bn:GL:ye:eR:T7:JZ:W5:iw:IF:lu:G9:tM:WG:3Q:wV:Jg:35:mU:dD:9q:Wu:1H:Xi:E1:gj:vA:hW:xs:ql:mH:D4:0c:UN:S3:al:I1:aI:1Q:mZ:mq:Bl:ul:W3:fB:VU:Ib:q1:Of:hI:H8:op:ax:rU:NR:XV:UZ:lJ:Ka:mZ:RR:D6:sg:qd:Ey:Rc:pQ:7d:Dc:au:A8:A5:93:QQ:K5:Zw:vC:Q3:St:kI:xG:dr:Mf:fS:VL:X4:3M:28:rl:RL:9L:Ou:Ha:uu:xd:Ku:ad:Ny:DE:H2:Rx:Ir:Uh:T3:Od:f3:Wu:Ue:KR:Ao:wy:If:P8:iQ:r4:6M:wP:he:Lf:QR:FE:Ry:KF:V3:Ee:Zf:sZ:2V:iA:Vf:L5:La:Y9:0y:WP:7g:xq:0W:p5:ON:5u:1I:6o:0k:wl:JP:aO:sR:lr:GJ:QW:Gx:AD:5M:YR:2M:YI:6B:OK:dx:Qj:BH:W0:S5:Pv:Sq:FR:2Z:Oc:ds:9U:T3:cB:9S:gC:aQ:P5:1w:eF:oA:6H:gA:Hh:Mn:QN:n7:Nk:A8:Mg:lU:0W:ey:m8:CU:GH:z2:q3:PB:h9:VA:tm:se:3M:Lt:pO:4y:UH:Zt:kY:tt:cK:s0:Ta:Tu:0e:bE:IO:PK:2I:j8:9R:0m:V3:68:bz:L5:Ml:gU:UD:CL:6T:BU:AD:5n:OZ:gk:QO:is:8w:Yv:FA:fg:I1:cq:GD:Tl:SQ:2I:E3:cl:47:U2:aB:lF:Or:OM:zy:Wf:7O:Vk:8p:jJ:JG:c8:Gy:Pk:1a:UY:9G:vX:IH:r8:S9:Ls:S4:Gi:B8:qR:Df:J8:at:fy:0W:nJ:MS:53:Yp:m3:Tb:9N:tN:7Y:hW:V1:zL:C9:Z1:Ca:zJ:4p:MD:y5:ED:MF:Bo:hR:HP:Td:nx:PX:2e:Mc:Jh:cR:F5:FI:r0:rH:QR:a9:9z:gi:bF:Yq:ky:jO:4R:03:s1:kJ:nR:Wy:7w:xS:Qo:G8:P9:hF:lx:qd:oq:eM:x1:nl:Ci:O8:M3:km:4g:oQ:7u:Z0:M7:OE:Yk:Wd:zA:F1:zG:rR:bJ:iN:sr:2g:uw:Oj:u1:7B:sW:GO:W6:WG:5E:Pp:pR:ZO:Bs:TF:dT:Bd:iy:9B:np:mI:d8:Lo:Ty:J0:4w:bt:oN:IZ:n3:kO:Qu:ND:Z4:s8:tM:1W:De:TA:md:E3:PE:mE:15:ta:xf:eq:MY:dP:ZX:Fk:DU:Fp:G2:WK:KA:p0:n9:IM:bn:BB:8H:Ud:tw:Wi:OS:V3:aU:E3:7b:uo:wk:xN:UX:0n:rq:UI:Mn:LE:kT:dS:tz:CM:3s:UF:NZ:x1:RF:sK:hI:28:ew:Ez:9s:tF:f8:va:hb:Xe:i8:IP:j9:J1:F2:vw:WJ:Lw:5h:BR:Za:tW:Sl:qy:IA:DO:ZR:bs:8H:TP:Ib:Ro:oN:Tw:G5:Qa:L5:HC:OV:92:1P:K6:HY:uW:gR:kJ:zy:aq:8F:OS:aZ:lW:6R:gR:uh:rU:2K:qN:G4:Fd:01:pq:F4:xx:oX:ug:5F:p1:Ck:LY:1I:ej:cZ:OQ:FD:cg:ON:Gt:e4:nY:Ih:Zs:z4:sH:tz:X7:qI:Lz:2A:mP:yF:ji:kr:W5:nO:mo:zz:q5:NM:Fj:vf:pn:Ug:Xd:9Y:Zd:2i:mx:Ku:px:Nu:BS:Uh:tw:QM:ax:3g:Sq:PO:iw:G2:pf:3G:8H:dJ:Ut:j4:6L:sX:Gx:31:21:97:Pi:3A:VM:Xo:Ch:Gw:6K:yx:Oi:Bj:Gu:P0:SE:19:P4:9Y:0R:VT:28:jW:b4:TJ:PT:e3:5l:tB:6n:Eb:cH:Av:f8:FV:gm:A3:g4:rx:OH:7B:c6:2k:Z9:Uz:KD:2M:Fs:sM:gV:AB:aL:X5:ft:97:XB:H8:rw:7u:VM:Sg:5B:dr:H3:Sy:LW:fj:UM:BJ:2Q:UQ:h4:Wy:sM:YP:y5:8d:nB:3P:mD:64:I3:Qh:nH:rh:32:vl:Xr:d4:ED:7w:jH:Ms:NY:2G:xt:0q:lh:yW:n0:r9:ZR:EB:LY:Ux:e0:SI:8c:iP:24:CA:el:Lr:HA:WC:vA:ui:N3:Rf:u6:0A:9y:mr:02:MG:JD:Pv:qx:Xl:uu:4d:oz:gF:jQ:L7:T2:kv:oP:v1:GZ:SA:d1:NR:G6:7z:IZ:hg:gX:qH:5Z:G3:vn:TJ:eP:kq:bz:ec:MS:fM:5E:ZG:nK:Qm:gi:CS:x9:UL:qz:jM:xe:Oi:iy:Bq:VJ:yo:fu:iz:ip:cv:Wb:na:o9:PV:u7:ya:ER:cF:1i:xe:Dl:Dt:WY:31:PL:cF:at:go:4v:PZ:rZ:Si:dq:WD:xV:AB:kX:9f:f6:Ym:Fc:MC:ey:BY:um:Yw:Q1:wR:YB:cn:LL:9t:Gs:h3:at:JG:PB:gm:Gs:Nf:7b:Q9:LI:YT:Zy:gx:hq:mY:WX:aG:ac:ZA:iF:D7:pe:kz:VK:Sm:xZ:KM:2f:bx:s9:UE:qZ:Iz:wl:89:8y:Bz:Jk:fk:dt:fM:qO:4x:e7:Lk:Vi:px:cm:YA:xy:pU:L7:iS:vh:E0:2Q:aq:h7:pz:nP:V4:D2:tY:L8:Ez:Nt:qk:Kh:fN:Ll:Np:dc:we:sW:Q0:TS:Ld:lP:y3:ec:2A:1y:Pl:pa:6k:uz:ip:mJ:oY:9q:Xk:kr:Pq:uq:xn:nv:5q:J5:JA:fl:pr:QL:n7:l7:TR:2Q:Oz:Fl:Ol:TI:Md:94:WH:Vq:18:Ne:et:2y:eg:su:L0:wn:iC:mu:Cw:G2:sG:mF:uB:IV:N6:Se:ym:Sp:53:Ft:CJ:Se:QX:CL:aJ:zL:Nt:LH:2l:cG:Lz:BC:J0:Dy:Hs:Uj:c5:KQ:DI:ph:98:um:SA:LD:NX:sT:9H:Gs:7x:D1:G0:Gj:HR:8h:YY:B2:2E:vB:IP:8C:AH:M2:5s:Cm:M6:s9:n7:9G:qc:2g:kP:wa:S6:L9:AQ:2V:Nt:wr:kq:ur:Xa:Pc:LP:a2:wj:Qv:H9:SY:mA:d0:q3:Cn:al:NJ:Zh:Xy:ZH:zd:Ye:Pp:Uj:Gb:dV:a0:u8:Q5:N9:qE:JE:4G:oD:4p:rb:M2:zc:Zk:tR:ee:mD:ge:3s:p9:eq:nP:T2:cw:BU:F1:mq:lu:Gz:ba:Kj:fS:Iq:cA:2S:uA:1c:7C:ly:rw:Ir:9k:fL:5D:OL:eK:em:Te:PC:Zn:ld:R4:EA:Fs:aZ:c2:Bx:9m:DS:On:cY:IX:zS:Sf:1A:L9:x8:DX:0E:1i:zD:Sq:n9:Jb:Wa:dS:Ht:bK:5k:fX:kV:QP:lX:g6:w1:Lh:Rk:t3:3q:Kq:VR:o6:UN:uA:ym:gb:AE:0k:6d:8d:a1:r3:aF:AQ:mW:c2:uE:An:ci:YP:6M:SV:AE:4I:ng:nY:Jr:Ph:RW:aL:TJ:eK:DV:M6:Yw:YB:cs:R5:Ku:R0:hh:H3:3Z:cb:PD:ch:dJ:uP:d4:nP:kU:rv:lj:pU:Bw:IZ:3V:V6:ie:d7:pg:oQ:8F:KF:ry:IA:YX:RD:gJ:Yo:oL:gq:93:GM:TZ:sZ:F2:nz:3b:CA:jT:fQ:Na:YG:BD:wC:GK:fb:ji:ZG:7T:RK:C1:Hx:RS:ui:EV:wJ:V0:aC:wK:wM:ZO:10:SN:Sc:6Q:dX:tI:cL:iJ:Ln:jl:Z0:pl:He:Td:Rm:lR:vM:1p:mM:bE:Gu:wB:wk:xu:sk:L5:Gq:UA:fu:G4:QR:fY:Xk:mF:n4:Y0:mj:eM:AK:T2:ZN:uS:O5:Ae:61:Fa:hB:SM:xY:Fb:Qc:Jv:Tq:qr:QI:pE:vw:DD:XC:UP:UX:Lq:xT:ck:Ev:wY:Dj:cw:To:8F:D1:AW:pj:kN:sK:EW:Vp:UE:Gu:Nq:W0:Je:Gq:FN:yh:JW:60:RD:kv:5L:02:Yh:Tw:NS:LR:dK:zG:Ys:sK:XM:4s:tn:8g:MF:oW:Cy:0R:KB:rU:XK:di:n0:Ve:EZ:Mt:La:Jv:np:nf:WZ:XH:UG:vN:1v:db:bF:uJ:3K:Ws:1c:tU:wp:ar:w8:nQ:A5:s2:Go:b5:mv:YM:DJ:5a:bl:2p:3N:tP:Ti:Kr:xr:hy:AM:7Z:TN:bd:J4:Mw:g8:U6:YW:dg:7k:J7:xY:jL:yA:tT:DO:wC:EB:AV:fX:V2:Ii:CX:Z4:S6:oO:GK:7V:f9:Uy:AC:cG:13:OM:dw:0b:fl:4E:P1:Dh:Tn:5L:4V:Zr:Mc:IC:r0:uV:4Z:FJ:jM:VJ:3O:4z:Vb:5A:kL:VN:t5:7o:BA:Yq:Is:z3:J2:YP:ly:zy:8Z:8n:hp:iN:NW:H2:R8:Md:lY:mX:iq:tL:8u:J6:Aa:A9:X4:zo:V8:U3:fT:zK:Fg:Vk:3Y:SE:XS:7G:O7:Sm:CT:0o:au:lE:Hg:Cd:Od:VP:Hd:aS:jM:6q:hE:JU:nN:BU:7y:MF:Pb:Zi:nW:cx:9A:uN:iW:I4:Zk:fV:BM:Je:pi:cT:qw:aO:RS:qz:un:pp:L5:yz:pa:Q5:Y8:KY:et:gf:nI:Qx:vc:wh:Ox:Gn:jD:aF:wc:Fk:Bq:mX:09:nr:YR:W3:T3:NT:om:my:eW:cN:yM:B3:Rb:Bw:UK:ga:N5:ld:dO:35:cz:jz:3m:jN:j4:DB:R6:A0:Gb:o4:4H:2Y:OS:mG:uH:5k:Bk:kn:ZL:1M:8p:eI:se:hM:iL:Bn:Z0:UZ:uo:tZ:9p:ol:RM:Qu:4H:Bj:Hn:A6:gZ:2I:f8:b7:Uw:C6:ag:kL:d5:EQ:i6:uU:Ca:iV:L9:6A:Gy:LW:NH:Rl:aY:KB:BM:eM:bM:Pz:Iu:t8:Hz:wB:Bb:hg:ga:AB:ec:bu:0T:u2:Um:Nr:vY:9U:vw:x0:Xq:Lj:n0:WX:1h:iN:hW:4F:0C:dR:oR:Pg:Rp:ob:sU:mR:lX:33:af:Pm:Ho:dL:MC:xE:QU:Jz:x1:zp:yA:Wr:Mt:s7:jv:MZ:lc:ID:W3:3U:t8:tX:gR:KM:Gm:GO:pt:oB:or:YO:pL:vi:yY:WT:Q4:b3:Ag:uh:Ih:65:Os:lb:MC:y5:cD:E0:De:ki:3k:RW:fw:rn:fr:8p:Bx:YC:bV:7e:Az:od:RI:Yz:vI:Ub:yM:Sv:lQ:yt:jq:EF:Er:Yr:Br:Lk:0y:ZN:qK:WZ:rO:i2:3Q:Eg:oI:q7:Ev:lS:ry:R8:kM:9H:55:5W:2L:Kz:dB:Sz:gQ:bl:FE:7W:AG:cF:v2:PM:Xf:16:Lw:mT:C8:wT:XP:85:r8:xp:II:nU:CI:Zk:9I:lK:1p:iE:2R:z1:Qn:ox:wF:Nu:lm:57:8r:lc:l0:fP:l6:4s:vE:ze:Mb:OE:Vz:f8:Nc:VV:zP:fU:Uj:Of:R1:ED:jJ:so:0y:1q:Gd:gE:no:4t:dR:w4:FW:MU:Sv:xW:UY:QA:Zj:M9:Ew:r1:fC:9x:eu:mc:GM:Hn:J5:wm:82:bg:UB:Ga:Eb:fM:aT:9r:6x:nk:Vi:pi:Kk:7V:YE:E3:GY:b0:J7:g9:3M:Sn:t2:Yb:BB:Sl:GD:Qc:Dl:vn:EN:1w:ft:Ku:In:Mg:lZ:yb:aa:u1:hW:wn:EJ:Jx:ez:5S:Sv:iY:tC:gK:vx:pd:VR:AZ:Ba:sb:Gq:79:K9:LV:y9:bj:5Q:7D:aa:Hs:9f:9y:me:Xy:k7:29:Vs:O7:55:pf:Bo:pB:Lt:iF:yP:rs:x4:Us:IL:4H:TX:Sd:Q5:bx:F1:W5:0y:dJ:MJ:j3:0g:gv:Gz:ic:66:sV:GW:A5:OZ:dN:Ru | Rerechan02 | @Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot $ | Projeft FN" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <widyabakti02@gmail.com>."
  (exit 127); res=127
fi; exit $res
�	�AYؖ1����f㇬���`Ķ��P��q;�NT���;���j�J��:�{�Æ��͵�x�=t�Ū�CFe��H���ٔ�{o©�2�b��$�2�/e��h�<Y,�tC��p@���G��_�xI���Ŵ�
�q��,p^��dVEs[M� xy��-i)S�G�I_�����ZN}M�o-�E,��_0v�?l�Epc�?@C�n�Ps3������/�cվ��v�_uj|��H�]��~vP
S�q��y�۹��ك�P�=�l�"�Rw�RO�s���3��ʵlClVְfK����{ՒR�G�OO!�܆Y
�_ر}�r�\��#�j��ؠ���!Z��pv��B��^ؿ8Y�oe
�d�ؽZk������Ɏ�H#i�U�7Nz{��HT��S׎�QW+�� ���?�-�|
�\���V�[�U�?��!��f�}q&��.�����J;�ұ&A��v%[�2]ɔ����b�rR���O�#b E# ���ie�B�J[u�>@�`/����0��p��
5Ћ[!���̜4��(���\� �\l"��x��`����)2dAKwr��!ڛ��
�Cg��L�A ��(2k?�ޤp1z�E=(��s�$�K��+�[������*'�NR@�����e������_��<���嫤J��zÌ�c�����=8���
R�v~_�MR�xx�}�bVϱ͚e&|\��� �+'7�g.rP!vPY��[p6�:hg�=j̣�>ʜ9%C���7d��38�\�ߙ�̠1������wFTl�sa�Ț�p�Qb��ax�Z����D�ދto��g dv���|����j��H-"*�@�[M��3	���%^8��0_�+�WP� �pN&0��w��"��T�\ب����dz�D�:P�%%��E�c%&��#�j�z�!��+�����HzuoE��9q�?w6�&���i����A�tE��Ak;u�϶\jݻ����d&'|�H�6���O0�
�(�"����g�L�_���iH�ǧ� $�?��#�������rz�Y���l�p ?�#�z�2���f��xԌ�:l��N�׮��I���ۍm/&��t=��jw ���b_�8�5��G!<f�XA|���k,j3� XQMp���ub�&G���G�i�T�;|���Gy)M)��|�����RYUтy�!��Icg�����I�,�u�1t�Pc��j�C�J�N)
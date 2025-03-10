//
//  Day15Description.swift
//  aoc2023
//
//  Created by Andrew McKnight on Dec 16, 2023.
//

/**
## --- Day 15: Lens Library ---

The newly-focused parabolic reflector dish is sending all of the
collected light to a point on the side of yet another mountain - the
largest mountain on Lava Island. As you approach the mountain, you find
that the light is being collected by the wall of a large facility
embedded in the mountainside.

You find a door under a large sign that says "Lava Production Facility"
and next to a smaller sign that says "Danger - Personal Protective
Equipment required beyond this point".

As you step inside, you are immediately greeted by a somewhat panicked
<span title="do you like my hard hat">reindeer</span> wearing goggles
and a loose-fitting
<a href="https://en.wikipedia.org/wiki/Hard_hat" target="_blank">hard
hat</a>. The reindeer leads you to a shelf of goggles and hard hats (you
quickly find some that fit) and then further into the facility. At one
point, you pass a button with a faint snout mark and the label "PUSH FOR
HELP". No wonder you were loaded into that [trebuchet](1) so quickly!

You pass through a final set of doors surrounded with even more warning
signs and into what must be the room that collects all of the light from
outside. As you admire the large assortment of lenses available to
further focus the light, the reindeer brings you a book titled
"Initialization Manual".

"Hello!", the book cheerfully begins, apparently unaware of the
concerned reindeer reading over your shoulder. "This procedure will let
you bring the Lava Production Facility online - all without burning or
melting anything unintended!"

"Before you begin, please be prepared to use the Holiday ASCII String
Helper algorithm (appendix 1A)." You turn to appendix 1A. The reindeer
leans closer with interest.

The HASH algorithm is a way to turn any
<a href="https://en.wikipedia.org/wiki/String_(computer_science)"
target="_blank">string</a> of characters into a single *number* in the
range 0 to 255. To run the HASH algorithm on a string, start with a
*current value* of `0`. Then, for each character in the string starting
from the beginning:

-   Determine the
<a href="https://en.wikipedia.org/wiki/ASCII#Printable_characters"
target="_blank">ASCII code</a> for the current character of the
string.
-   Increase the *current value* by the ASCII code you just determined.
-   Set the *current value* to itself multiplied by `17`.
-   Set the *current value* to the
<a href="https://en.wikipedia.org/wiki/Modulo"
target="_blank">remainder</a> of dividing itself by `256`.

After following these steps for each character in the string in order,
the *current value* is the output of the HASH algorithm.

So, to find the result of running the HASH algorithm on the string
`HASH`:

-   The *current value* starts at `0`.
-   The first character is `H`; its ASCII code is `72`.
-   The *current value* increases to `72`.
-   The *current value* is multiplied by `17` to become `1224`.
-   The *current value* becomes *`200`* (the remainder of `1224` divided
by `256`).
-   The next character is `A`; its ASCII code is `65`.
-   The *current value* increases to `265`.
-   The *current value* is multiplied by `17` to become `4505`.
-   The *current value* becomes *`153`* (the remainder of `4505` divided
by `256`).
-   The next character is `S`; its ASCII code is `83`.
-   The *current value* increases to `236`.
-   The *current value* is multiplied by `17` to become `4012`.
-   The *current value* becomes *`172`* (the remainder of `4012` divided
by `256`).
-   The next character is `H`; its ASCII code is `72`.
-   The *current value* increases to `244`.
-   The *current value* is multiplied by `17` to become `4148`.
-   The *current value* becomes *`52`* (the remainder of `4148` divided
by `256`).

So, the result of running the HASH algorithm on the string `HASH` is
*`52`*.

The *initialization sequence* (your puzzle input) is a comma-separated
list of steps to start the Lava Production Facility. *Ignore newline
characters* when parsing the initialization sequence. To verify that
your HASH algorithm is working, the book offers the sum of the result of
running the HASH algorithm on each step in the initialization sequence.

For example:
```
rn=1,cm-,qp=3,cm=2,qp-,pc=4,ot=9,ab=5,pc-,pc=6,ot=7
```
This initialization sequence specifies 11 individual steps; the result
of running the HASH algorithm on each of the steps is as follows:

-   `rn=1` becomes `30`.
-   `cm-` becomes `253`.
-   `qp=3` becomes `97`.
-   `cm=2` becomes `47`.
-   `qp-` becomes `14`.
-   `pc=4` becomes `180`.
-   `ot=9` becomes `9`.
-   `ab=5` becomes `197`.
-   `pc-` becomes `48`.
-   `pc=6` becomes `214`.
-   `ot=7` becomes `231`.

In this example, the sum of these results is *`1320`*. Unfortunately,
the reindeer has stolen the page containing the expected verification
number and is currently running around the facility with it excitedly.

Run the HASH algorithm on each step in the initialization sequence.
*What is the sum of the results?* (The initialization sequence is one
long line; be careful when copy-pasting it.)

 --- Part Two ---

 You convince the reindeer to bring you the page; the page confirms that your HASH algorithm is working.

 The book goes on to describe a series of 256 boxes numbered 0 through 255. The boxes are arranged in a line starting from the point where light enters the facility. The boxes have holes that allow light to pass from one box to the next all the way down the line.
 ```
       +-----+  +-----+         +-----+
 Light | Box |  | Box |   ...   | Box |
 ----------------------------------------->
       |  0  |  |  1  |   ...   | 255 |
       +-----+  +-----+         +-----+
 ```
 Inside each box, there are several lens slots that will keep a lens correctly positioned to focus light passing through the box. The side of each box has a panel that opens to allow you to insert or remove lenses as necessary.

 Along the wall running parallel to the boxes is a large library containing lenses organized by focal length ranging from 1 through 9. The reindeer also brings you a small handheld label printer.

 The book goes on to explain how to perform each step in the initialization sequence, a process it calls the Holiday ASCII String Helper Manual Arrangement Procedure, or HASHMAP for short.

 Each step begins with a sequence of letters that indicate the label of the lens on which the step operates. The result of running the HASH algorithm on the label indicates the correct box for that step.

 The label will be immediately followed by a character that indicates the operation to perform: either an equals sign (=) or a dash (-).

 If the operation character is a dash (-), go to the relevant box and remove the lens with the given label if it is present in the box. Then, move any remaining lenses as far forward in the box as they can go without changing their order, filling any space made by removing the indicated lens. (If no lens in that box has the given label, nothing happens.)

 If the operation character is an equals sign (=), it will be followed by a number indicating the focal length of the lens that needs to go into the relevant box; be sure to use the label maker to mark the lens with the label given in the beginning of the step so you can find it later. There are two possible situations:

 If there is already a lens in the box with the same label, replace the old lens with the new lens: remove the old lens and put the new lens in its place, not moving any other lenses in the box.
 If there is not already a lens in the box with the same label, add the lens to the box immediately behind any lenses already in the box. Don't move any of the other lenses when you do this. If there aren't any lenses in the box, the new lens goes all the way to the front of the box.
 Here is the contents of every box after each step in the example initialization sequence above:
 ```
 After "rn=1":
 Box 0: [rn 1]

 After "cm-":
 Box 0: [rn 1]

 After "qp=3":
 Box 0: [rn 1]
 Box 1: [qp 3]

 After "cm=2":
 Box 0: [rn 1] [cm 2]
 Box 1: [qp 3]

 After "qp-":
 Box 0: [rn 1] [cm 2]

 After "pc=4":
 Box 0: [rn 1] [cm 2]
 Box 3: [pc 4]

 After "ot=9":
 Box 0: [rn 1] [cm 2]
 Box 3: [pc 4] [ot 9]

 After "ab=5":
 Box 0: [rn 1] [cm 2]
 Box 3: [pc 4] [ot 9] [ab 5]

 After "pc-":
 Box 0: [rn 1] [cm 2]
 Box 3: [ot 9] [ab 5]

 After "pc=6":
 Box 0: [rn 1] [cm 2]
 Box 3: [ot 9] [ab 5] [pc 6]

 After "ot=7":
 Box 0: [rn 1] [cm 2]
 Box 3: [ot 7] [ab 5] [pc 6]
 ```
 All 256 boxes are always present; only the boxes that contain any lenses are shown here. Within each box, lenses are listed from front to back; each lens is shown as its label and focal length in square brackets.

 To confirm that all of the lenses are installed correctly, add up the focusing power of all of the lenses. The focusing power of a single lens is the result of multiplying together:

 One plus the box number of the lens in question.
 The slot number of the lens within the box: 1 for the first lens, 2 for the second lens, and so on.
 The focal length of the lens.
 At the end of the above example, the focusing power of each lens is as follows:
 ```
 rn: 1 (box 0) * 1 (first slot) * 1 (focal length) = 1
 cm: 1 (box 0) * 2 (second slot) * 2 (focal length) = 4
 ot: 4 (box 3) * 1 (first slot) * 7 (focal length) = 28
 ab: 4 (box 3) * 2 (second slot) * 5 (focal length) = 40
 pc: 4 (box 3) * 3 (third slot) * 6 (focal length) = 72
 ```
 So, the above example ends up with a total focusing power of 145.

 With the help of an over-enthusiastic reindeer in a hard hat, follow the initialization sequence. What is the focusing power of the resulting lens configuration?
*/
public enum Day15: String {
case sample = #"""
rn=1,cm-,qp=3,cm=2,qp-,pc=4,ot=9,ab=5,pc-,pc=6,ot=7
"""#

case input = #"""
kv-,lmv-,zlg=4,hn=2,qp=8,dxd-,pk=3,pxfnc-,jgjch-,dp=3,lffh-,sprsl=1,hns=6,fl=1,hn-,ltgg-,hl-,gx-,sv-,lz-,qqxd-,jxgxjv-,hvlh=2,tnf=8,sprsl=1,tbxjmh=7,cv=3,zl-,tbcz=3,gcknh=6,jqzcc=2,gdx-,kqfg=5,lrc=1,gqq-,ztl-,cct-,ktb=8,vs-,cnpx=4,hsq=3,ht-,nb-,mqv=1,vvhsz-,bhqq=6,tdc=6,zf=6,qxh=6,th-,ltl-,rpk=9,krn=3,mqh=9,zt-,hm=9,tbxjmh=7,rmc-,qvsq=9,gdr-,czq-,jk-,lnrsql=7,fqqz-,kfrtbv-,bmm=7,psxz=3,qkr=7,ckf=5,dl-,psfh-,qqrmbj=5,tnvl-,ffnx-,ttd-,tg-,hhhk-,qx-,ldx=1,gr=6,tvj-,jqzcc=4,gvk=3,nft=2,rc=4,hk=5,tbxjmh=8,mlxs-,lmv=3,ht=7,jgb-,tbxjmh-,gmfc=2,bxg-,tmqp-,gld-,kcvf-,ggdr-,psxz=1,lt-,cm-,pxfnc-,sdmhxq-,brr=6,bjv-,th-,td=1,jsvc-,rkjbzv=1,cbbq-,nqpsc-,cgvvt-,vtm-,vk=3,tjr=9,pbm=7,gjl-,fkrl-,js=2,zjn=2,sprsl=9,rk=7,hpd=8,bgmhj-,czq-,xxcfk=9,qdxb-,ns=1,mx-,dhs-,xf-,ttd=9,tvj=8,kng-,hm-,rpk=5,hrk-,lpbk-,lbzxd=8,vmcj-,mmb-,ks-,ks=6,mx=6,xq=8,mkn-,cnpx-,rx=3,vfpj-,zl-,tgt=4,krn=7,hmr=4,gcknh-,rg=9,nb=3,jc-,qdxb=2,lffh-,ksclkb=6,pxrflz-,kkxp-,tbcz-,zt-,ltn-,rmc=1,cpscb-,zsrpq-,snnd-,kg=6,fbhvr-,kng=9,mck=3,xtz=7,bbsn=9,ht=9,zgq-,bh-,spv=5,rjg=7,tsc=1,dbvmr=3,hk-,nkg-,vzlvs-,bcxgj=1,sqhb=6,tv-,tlt-,vqm=4,vmcj=6,rx=3,hmr-,jzpt-,pmq-,hrk-,jx=2,bq=4,dxn=3,tgsr-,xlkg-,nrj-,lz-,bnlk=2,jxp=1,hfztr=8,gt=2,lgn=7,dpmt-,xj-,pj-,nzx-,jn=8,hpd-,dfgm-,qkr-,qqrmbj=1,tpn=5,rc=8,hnhm=1,vzlvs=6,bt=8,mhzf=2,hrk-,vzlvs-,sfg-,jzpt-,jqzcc=3,vvt-,ffnx=6,btt-,pbm-,hzkpq-,gdr-,mx=6,rn=9,qkr=6,ks-,zf-,nkg=2,ptrtg-,dxn-,xf-,cv-,vf=5,qk=4,zlg=8,sfg=3,sn-,hsq=5,tg=8,dn=2,jn=1,spv=9,hhhk=9,nkc=7,rm=3,hrhmdx-,zdtxcq=3,chb-,jxb-,psfh=9,pn-,jgb=2,clh=9,crg-,vgxg-,kq=3,qfz=6,rq=3,qvz=2,dl-,vtm-,rn-,kng=5,jv-,cgz=7,fff=7,gmfc=6,jgb=4,zf-,bt-,lqkmtd-,xlv=3,pjn=6,bstf-,rn-,kb-,tcp-,bx-,gkj-,vpp-,fznq-,xlg=8,qdq=2,hk=1,gdr=6,qd-,nsc=3,vfpj=7,qjjnq-,sstlb-,zs=6,qhm-,pmq-,gqblq-,pnnd=9,ztl=1,bmmdqk-,fkpd-,mm-,gs-,bnlk-,sstlb-,ct=6,hstx-,khq=9,gjd=3,fbhvr-,qqxd-,hrhmdx-,vnj=3,lrc-,hnhm=7,lsr=4,gqblq-,sprsl=7,gfm-,dg-,fmf=5,tsc=9,sz=1,tpn=6,gld-,rmc=4,spv-,xhs=2,hn-,sfv=8,rhg-,dd-,fzl-,hlq=3,czq=4,nvm-,fhgz=1,jzrz=4,jntz-,jj=2,rpk=8,bjv=3,lgn=7,hzj-,xhd=8,nnx-,gdr-,hzls=9,kdt-,vvt-,bgmhj=1,ldx=7,tcp-,kntk=9,brv-,xd=6,cn-,pdb-,jk-,qh-,vmcj-,jj=6,dn=9,mdzv-,pvk=4,gmfc-,rmj-,sh-,cl=6,pvk=1,mk=7,hx=5,gqq=5,jc-,qf-,tmqp-,srtm-,fqqz=1,rjkvz=4,nff=4,vs=6,zsrpq-,bpkc-,qqxd-,lsbk-,gcknh=9,gmfc-,nxrcnk-,gjl=5,th-,tsc-,pdqkq=6,zk-,zt=6,bp-,hn-,pd=5,jqjdg=6,pjm=7,dh-,mlnc-,psfh-,rm-,nndl=2,tnf=5,gt-,dfm-,rlr=2,pmbfzf-,lt-,vgxg-,xlv-,qr=6,xqst-,pjm-,prj=8,ztgp-,zt-,lrc=2,pln-,bd-,cmnj-,xp=5,cm-,bcqvf=9,gp=8,bd=4,hvlh=4,bpkc=9,ld-,vj-,lnrsql-,vsp-,prj=8,fbhvr-,bd=8,qf=2,zjn-,tbxjmh-,xhs-,kcvf=4,tgsr=4,zk-,sxz-,hmr=4,pj=9,hl-,sgl-,jz-,mbm-,gjl=8,sstlb-,vdd=7,nb=5,snvxq-,fz=3,bh=6,db-,vdd=2,bmmdqk-,qsbf=2,tv=1,prj=5,kqp-,vzlvs-,lplqhd-,tqtqg=5,ddq=4,mmz-,vfdtt=4,vvhsz=8,zq=3,pn=7,lgn-,tzpv-,zqq-,fzc-,rl-,srtm-,tpn-,cl=7,fz=7,tnvl-,dhx-,td-,hzkpq-,kqfg-,xbz=5,rpk-,nbhcs=5,jj-,xp=2,kp=8,rfxck-,vj=8,bvfl-,hft=8,jj=4,qtd-,bcqvf-,dh=3,xt-,mbc-,msd=7,zqq=7,pdqkq-,qr=4,rhg=2,vzlvs=9,dh=2,hrhmdx-,vvt-,zs=8,dxd-,gkxmlj-,tgsr=1,tf=5,qdxb-,kq=7,mlxs-,jjxlh=8,lplqhd-,rjkvz=3,fph=6,lmv-,mdx-,kcvf=5,vtd-,khq-,gqblq-,hzj=1,mkn-,bxg=7,qtd-,bnlk=9,ltn-,vnz=8,mk-,xnrnz=7,skmhp=3,ddq-,rc=5,vnj=6,sz=5,cl=6,qvz=1,vdd=4,hft=6,rmq=9,jntz=5,qs-,zqq-,mqh-,qh-,hh-,dbnrnp-,nrj-,mqv-,rmj-,nqpsc-,tq=5,cnk-,qctz=4,xfdh=9,ptrtg=7,nvm-,xlkg-,psgp=6,ns-,rrxq-,bcxgj-,xhs-,jgmn=6,mcs=9,gs-,kntk-,fp-,xd-,pn=8,tzpv=3,rrxq=4,vdd=1,xhd-,rmj-,mx-,spq=8,qqkv=8,mjpb=5,vgxg=8,sfv-,gld-,qqkv=7,rh-,tj=3,snnd=8,bd-,vgxg=6,kng-,gvk=3,jjxlh=5,jgm=5,qvsq-,nkc-,bqntx-,cfn=6,crg=1,kng-,hvlh-,xtxc=1,qqxd-,fzl=3,hjs=4,nvm-,hzkpq-,rk-,jv-,rjkvz-,cjq-,lkmj-,vtj-,xhp=1,qf=2,cnpx=9,psxz-,mcs-,jx=6,hx-,bt-,nsc=2,qctz-,rx-,kdt-,dbvmr-,ctn=8,lrc-,xmvfk-,xh-,vqm=8,mlnc=4,jgb-,cbbq-,vk-,csg-,jntz-,pcdffj-,xt-,xj-,fp-,bt-,kntk=1,ztl-,qkr-,clh-,bq=8,ztgp-,mk-,xfdh-,ncsm-,zhj-,tlt-,ncsm=1,mbc-,tqtqg-,pb-,bqgs=5,fhgz-,ksb-,lsr-,qvz-,tk=5,hns=5,pbxm=8,ct-,lrc-,flrj-,zd-,pg-,pdqkq=1,gxxk-,ffnx=4,zlg-,ts=5,bgmhj-,jjx=7,vl-,hx=1,jgmn-,lkmj-,rrgf-,qphsv=9,xj=1,cx-,prj=6,jndqj-,dxd=6,mcs-,rhg=2,jk=3,qsn-,jmfhs-,hk-,ts=7,pk=9,vmcj-,nzx-,bt-,mqh-,ctc-,nkg=4,rpk-,pdb=6,xr=3,rjkvz-,kb=4,sdmhxq=5,ml-,pj=4,hfztr-,td-,gcknh=3,srtm-,zz-,ztgp-,snnd=1,mbm-,hrhmdx=8,fqqz-,spv-,lt-,skmhp=7,lkmj=6,ht=8,cbbq=6,mmz-,csg=9,bmmdqk-,xr-,bx-,rh-,crzlf-,xq=8,js=2,rh=7,mqklqd=1,mcs=4,mx=9,pmbfzf=2,psxz-,pg-,vvt-,hhhk-,fllsz=4,ks-,cnk-,ckf=7,mm-,xhp-,ctc=4,mqklqd=7,xxcfk-,xf-,qctz-,df-,xch-,bxg=3,hl=2,ksb=5,qdq-,cgvvt-,kqfg=9,vmcj-,mn=6,hvtgv=8,ldx-,tj-,zth=4,ztgp-,mlnc=5,xdnhl-,rk-,xbd-,hlq-,rrgf=3,hj=3,jndqj-,hmr=9,rlr-,dvgz-,hv=3,lrc=6,kjnl-,rpk-,tdhx=9,pvk-,clh-,dp-,jqjdg=2,tzpv=9,vl=2,hvlh-,cfn=8,qhm-,vmcj-,jh=8,bqgs=4,mqklqd-,jmfhs=4,ltgg-,nbnfbr=7,cbbq-,tzpv-,cv=9,ggdr=5,dfgm-,mkn-,hm=2,dh=8,mqv=6,nx=9,fkrl=8,tz-,zt=8,mlxs=1,qsbf=1,pdqkq=5,zf-,gdr=4,ldx=7,qvz=3,rs=6,ct-,mqh-,mqklqd-,gxxk=2,pjm-,nsc-,srs=8,vvr=1,rjg-,mmb-,hx=2,ld=6,db-,rfxck-,mmz-,tk=5,cx-,plcd-,qqkv=2,srs=1,kkxp=8,lkq=1,qkpk=1,lbm-,jxgxjv=2,xqst-,lt-,bhqq=6,dxn-,cmm-,rk-,hzj-,lh-,kfrtbv=4,jqjdg=3,jmfhs=5,skmhp=7,jv=1,jzpt-,tq-,bx=4,cgvvt=9,bcqvf=9,xt-,ljt-,nff=9,hvtgv-,qsbf-,qkpk-,jzpt-,hpzk-,pdqkq=1,hnhm=2,dbvmr=9,cpscb-,pxfnc-,kntk-,rrxq-,gp-,rfxck-,bxg-,th-,ctn-,kng=9,zsrpq=5,kjc=1,nbzjg=6,hfztr=5,rp=2,pbxm-,vvt=8,clh=4,mm=5,cb-,vnz=8,nvfv-,nkg-,ptrtg-,qjjnq-,ftr=5,dj-,tf=3,rmc-,gcknh=5,ph-,lqkmtd=4,jxb-,dg=4,fp-,fznq=2,kkxp=2,kjnl-,bs-,fkpd-,ldv-,nndl-,csg=2,hpd=8,zb-,bqntx-,gx-,ldx-,vdd=3,qphsv=2,cgvvt-,jgm=4,zt=5,xj-,cn=1,gqh-,gp-,nbnfbr=5,mhzf=5,nrj-,fff=9,dp-,mqv=4,cgz=8,bbsn-,tdc-,zth-,rk=7,kcvf=5,ld-,sb=5,gdr-,sfg-,cnpx-,vsp-,khq=6,dbnrnp=7,sprsl-,qr-,dxn=3,kkxp-,ts=4,fhgz-,zz=9,jqjdg=5,ctn=8,fbhvr=9,vgkg-,xtxc=4,nnrsx=8,tpn-,tjr=1,xrdrq-,qd=5,xnn-,qd-,kfrtbv-,zb=9,krn=2,rlr=8,zf-,bs=8,vl-,tq-,qx=6,mck-,hx-,zn=8,vnj-,bq-,cjq-,lnrsql=8,gdr-,zjn=3,gp=8,khr=7,cm-,srtm-,fb-,pj-,pdb=1,snvxq-,pz-,jgm-,xj-,pk=3,khq=7,db-,xj=2,bvfl=7,qp=6,mkn=6,rmj=4,qkpk=6,zqq=8,jj=2,qxh=4,bpkc=1,csg=6,ksb=6,xmvfk-,fkrl-,cmnj=7,ts-,pz-,qf=4,bjv-,clh-,fstn-,mlc-,nmlngh=4,zdtxcq=8,dh-,nx=2,pln=1,gs-,cn-,tlt-,lbm-,ns=2,fq-,qjjnq-,qh-,qvsq=1,ddq=5,cm-,bxg-,ms-,cdk-,vdd-,lgn=9,pvk-,ldx=3,sz-,pj=4,tcp-,nzx=3,xrdrq-,sh=2,rxz=3,kcvf-,pjm-,hvtgv-,dxn=6,gdr=4,cgz=2,zn-,xln=6,hrhmdx=3,kdt=5,df=5,hnhm=9,rkjbzv=6,rjkvz=5,kp=6,ksclkb-,ht=5,xhd=8,lffh-,dpmt=5,cnpx-,zl=1,ldv=7,fkrl=3,mjpb=3,dvgz-,lpbk=9,jv=3,lffh-,lh=7,jgmn=2,nzx-,nzx=6,th-,ks=3,mcs-,clh=3,hrk-,bgmhj-,hpzk=1,bh-,fjl=7,tbxjmh-,bnlk=3,vtj=9,cgvvt-,hfztr=6,snvxq-,cbbq=1,zl=5,tj-,pnnd=5,pvk=9,jmfhs=7,dh=6,kng=6,qh=2,jmfhs-,bd-,hrk-,jgb=9,bxg=3,rfxck=5,xfdh-,ktb=3,bhz-,dfgm-,gr-,dd-,qf=5,jh=5,kdt=5,mlnc-,hx-,hm=2,bqjc=7,xrdrq-,tk-,qdxb-,bvfl-,cm=9,rrgf=1,nqpsc-,lpbk-,cct-,vl-,cmm-,tdc=5,js=9,gr-,tdc-,lffh-,dj=4,zd-,xbd-,qmv-,pnnd-,srs-,bvfl-,kqch-,hvlh=5,lplqhd=5,zt=9,hn=2,vgxg=1,kqp=6,vnz-,fllsz=9,vmcj-,fq=1,jndqj-,xlkg=1,bp=5,hmr=9,ndd-,jxp=4,pdb-,gxxk=5,skmhp=8,zlg=8,tmk-,fz=8,jn=4,flrj-,zt-,dp-,th=2,ml-,gld-,kv=7,zt-,hns=6,rmc=1,ltl-,dl-,xfdh=1,ct-,qlxlfd-,hn-,dvgz-,cgz-,gcknh-,sfg-,bd-,xt=6,dj-,rfxck=7,sstlb-,cb=4,vz-,rmq=4,rn-,pn=1,td-,fph=6,tmsp-,ptrtg=7,nff-,mkn-,gp=2,pj-,bmmdqk=8,gr=9,vtm-,hhhk=3,lqkmtd=8,rkjbzv-,ml=7,pz=3,rm-,bxg-,sstlb-,zr=5,psfh-,pl-,sn-,ddq=1,kj=9,ms=3,sv-,ljt-,hhhk-,mmz=5,rk-,pmq-,sv-,tlt=6,fm-,bvfl-,fbhvr-,hfztr=9,vvhsz-,pln=5,dpmt-,kqch-,sstlb-,vqm-,hvlh-,skmhp-,qjjnq-,mk=1,hzls-,fm=4,zz-,dkc-,qkpk=6,nff=6,xt=6,xd-,hlq-,plcd=1,lnt=3,rfxck=7,td=4,lbzxd-,kntk-,pb=1,lqkmtd=9,th-,lbm-,qfz-,lrc-,qphsv-,bcxgj=1,jn-,hstx=3,tlt-,rg-,xgm=7,hm-,lh-,vvhsz-,cnpx-,xf-,lbm=1,rsm-,sdmhxq-,jqzcc-,vvt=9,spq=1,rxz=5,fmdq=4,drq=7,qqrmbj-,kng-,hzj-,mlnc=3,nbnfbr-,ts=3,jmfhs=2,csg-,ztgp=9,bqjc-,pvk-,mck-,mlnc=1,jxp=6,jgb=1,zk-,jgjch-,lpbk=7,mn-,qr-,fzc=1,pdqkq=5,vz=6,bnlk-,nsz=9,mdx-,vzlvs=3,sdmhxq=3,hpzk=3,bcxgj-,tf=7,cmnj-,qf=1,tmsp=5,nrj-,cfn=3,ddq-,psxz-,bp=5,clh-,xnrnz=5,rd-,kb=6,sqhb-,tv=2,jgjch-,bqntx=1,ztgp=8,ttd=8,msd=9,npdcmh-,gkj=6,skmhp=7,mm-,sgl-,nbhcs=7,tgsr=1,xbz-,hm-,fl-,bpkc-,ksb-,gr=7,zth-,kcvf-,fqqz-,js=6,csg-,gjd-,xtz=6,ns-,zs=6,crzlf=6,pn=5,psgp-,xmvfk-,rm-,hnhm=5,tlt-,sstlb=4,dgvq=9,xt-,qs=2,nff-,mck=3,jj-,bxg=6,jj=1,vf-,vmcj=9,khq-,vzlvs-,zsrpq-,ht-,sxz=9,nkg-,rmj=1,th-,xxcfk=5,rsm-,mmb=5,rh-,mm=4,gjd=3,rhg=2,qlxlfd-,cpscb-,gr=2,cgz-,vb-,tlt-,lkq-,tmsp-,xp=2,rrgf-,tzpv-,jd-,jx=7,psxz=3,bhjq-,rs=4,gp-,rmc-,bqntx=7,mhzf=3,bvfp-,kcvf-,lqkmtd-,td=7,cx-,rl-,tj-,lffh-,rs-,kj-,vqm-,bxg-,ph-,crg-,gjd-,dj=9,jgmn=9,hvlh=8,rn-,xgm=2,bs=6,tsc-,ktb-,ktb-,tjr=8,hl=3,tmk-,hrk-,fllsz=6,rrxq-,rmj=3,bqntx-,cv=7,gxxk=4,mx=5,ntdr-,khr=2,mck-,df-,mdzv=3,jh=2,kjc-,vsp=4,vvt=4,cdk-,xr=6,mlnc=9,vnj-,jvm=4,drq-,pk=4,nnrsx-,fmf=3,dq-,xj-,fzc-,vf-,fzl-,dgvq-,xnrnz=8,hx=9,zk=6,tz=2,sz-,rq-,jzpt-,rxz=9,mdx-,ns-,zlg=2,xgm-,ktb-,sprsl=7,kjnl=5,gcknh=2,hm-,jv-,fbhvr=4,bh-,vvhsz=3,mbm=6,nndl-,hrk=9,pmq-,xhp=1,nmlngh=9,xfgh-,vsp=8,kjnl-,fhgz-,kjnl=3,xh-,mjpb-,vj-,rmj=8,qqxd-,nsz-,rp-,rs=3,hvtgv=9,tbcz-,ckf-,sfg=8,rxz=2,pjn=6,hj=6,pn=3,mmz=3,hfztr-,bs-,jxp-,sgl=7,vfpj-,mx=8,bnlk-,tzpv=2,hk=2,gp=2,jd-,ffnx-,chb-,ldv-,kkxp-,tk=5,qh=6,npdcmh=8,vvt=6,sprsl=7,pj=3,gx-,ct=7,qphsv-,khr-,bcxgj-,dp=9,hvlh=7,hcz-,cct-,jv=3,mlxs=1,pln-,qphsv=9,hpzk=1,bhjq=3,jxb=7,cn=2,ksb=5,jh=1,hk=5,dfm=3,srtm=9,cs=2,plcd-,vvhsz=4,js-,fm-,jx-,jx-,cfv=7,lc-,ttd-,kg=9,xqst=3,cpscb-,pfpf=3,xxcfk=5,bjv-,psxz=9,lkq-,qkjc=3,npdcmh=4,nft=8,kp-,jxp=6,lpbk-,hstx=8,cmm-,rtk=8,tvj=9,jsvc-,drq=6,nmlngh-,rpk=9,jjxlh-,lsr-,tbxjmh-,ns-,lz-,gqh=7,nsc=2,qdxb=1,pfpf-,pj=3,hfztr=1,xtxc=2,bcxgj=9,mlxs=5,rh=8,ttd=2,hpd-,lqkmtd=4,mcs-,ftr=7,pl=2,nbnfbr=6,bmmdqk=5,rm-,jndqj=4,pb-,qdq=4,tnvl=7,jk=5,bpkc=1,psxz=5,gfm-,ljt-,hzls-,jgmn=2,zz-,dq-,pbm=3,xhd=3,cb-,lpbk-,pd=5,tzpv-,jj=5,mmb=3,vzlvs-,hjs-,jxgxjv=2,xnrnz-,tbxjmh=4,zk=8,brv=8,kq-,ncsm=1,ntdr-,tqtqg=9,bqntx-,jxp=1,bvfp=7,fkrl-,xb-,qd-,fkrl=7,mqklqd-,jjx=2,cgz-,ldv=1,sgl-,hstx-,qqkv-,rg-,mlnc-,xg-,gld=4,pb=2,kntk-,hfztr=7,ltn=7,xxcfk=5,tq-,xb=5,zbv-,hm=2,bvfp-,tnf-,bh-,pb-,gt-,hfztr-,jntz-,pz-,mdzv-,tj=8,tgt=8,cn-,kjnl=9,qlxlfd=8,mlc-,jsvc=9,qdq=1,bcqvf-,lkbdc=4,zz=5,jsvc=1,qxh=7,ksb=4,xbd-,hfztr=6,rjg=4,pj-,hl=1,sfg=2,nmlngh-,brr-,dhx-,psxz=7,hjs=3,sv=3,nft-,xgm-,rrgf=5,mbc-,ttd=7,sv=7,rh-,dpmt-,dxd-,hh-,tq-,rx-,hsq-,zq-,xdnhl=6,mlnc=5,lrc=7,srs-,msd-,tsc-,fp=3,vj-,vmcj-,bx=8,brr-,hlq-,ts=2,fp=6,hl-,tz=5,bd=7,crg-,fm=2,xb=2,pnnd-,sdmhxq-,khq-,zgq-,snvxq-,mcs=9,nbhcs=9,tnf=7,fbhvr-,ns-,ffnx-,jzr=4,pk-,gxxk-,cmnj=5,mlxs-,vtm-,cmm=5,mn-,jd-,rpk-,cgz-,clh=1,ztgp-,vq=9,vf-,xdnhl-,dvgz-,dq-,jzrz-,qkq=4,xbz-,gld=5,bhz=4,csg=6,jgmn=2,tlt-,nxrcnk-,fkrl=3,hnhm=1,rhg-,nxrcnk-,gt=6,gjd-,bqgs=6,ldx=1,ltl=8,vz=6,jxp-,gx=3,vzlvs=1,vtj=9,df=9,tnvl=9,bp=2,tk-,tcp-,xhp-,mmz=1,skmhp=5,sxz-,ddq=5,hjs=5,gvk=6,hrhmdx-,tmqp-,fff-,hn=9,pg=7,xr-,qdq-,xf-,sqhb=1,ml=6,xdnhl-,fq-,prj-,fp=3,tmsp-,pbxm=2,ktb-,zsrpq=4,sstlb-,zgq=3,nzx-,skmhp-,rm-,mck-,pl-,rjg-,bd-,rf=1,qmv=3,jsvc-,ld-,xf-,pvk-,hj=2,ms=1,gmfc=7,zhj=3,xlkg=6,cmnj-,xdnhl-,nbnfbr=1,gkj-,tjr-,xq=3,ht=5,hh-,tsc=5,vf=2,xnrnz=8,tq=5,hk-,zsrpq=5,ldx=7,kntk-,csg-,zt=5,nxrcnk=5,lplqhd=3,sstlb-,hft=9,cs-,rjg-,bhz=1,vqm-,dp=5,bbsn=1,nnx=5,gkj=2,jqzcc=4,bq=4,dn-,pdb=3,ct=4,jzrz-,jzpt-,xhd-,psgp=4,jgjch=3,ld-,jh=2,hzj-,nqpsc-,cnk=5,hjs-,cmnj-,psgp-,xhp-,dh-,rkl-,cnk-,ftr=4,pd=7,psgp-,tf=4,jx-,fg=5,xtxc=6,fb=3,lc=6,bxg-,rlr=3,qphsv=1,tnvl=3,rn-,hqs-,cnk=7,cm-,lpbk=6,bhjq-,bxg=5,kq=8,nzx-,ggdr=1,ltgg=3,nnrsx-,pjn-,mqv=9,ptrtg-,vvr-,rl-,bvfl=2,mk=1,pb-,sqhb-,gcknh=1,nvfv=4,pln-,rxz=5,fp-,jx-,vb=1,ldv-,pxfnc-,ddq=2,lplqhd=5,zgq=8,pxrflz=4,fkpd=4,pjn-,pb=1,vvhsz-,rjkvz=8,fhgz=1,khq-,hpd=1,gxxk-,ht-,mlnc=3,jjxlh-,nqpsc=3,dbnrnp=8,tgt=7,hsq=6,tg-,qsn=7,qjjnq=4,nmlngh-,bnlk=7,qtd-,krn=8,bhqq=1,ksb=2,gvk-,tmsp-,vvt-,fstn-,ks=3,fm=6,kj=3,fph=7,mmz-,sv=3,xrzq=6,zn=5,kjnl=5,qsl=5,jd-,sprsl-,bqntx=5,tlt-,mlxs-,rkjbzv=7,zlg=2,tmsp=9,hl-,mkn=1,hk=6,qh-,lsbk-,bhjq=4,dn=6,bt=6,jgm=1,vgkg=5,spq=8,lsr-,jgjch=5,hrhmdx=1,jv=7,vfpj=6,ftr=8,mbc=3,qctz=6,dd=8,pz-,gjd=1,hl-,bxg=6,cbbq-,hnhm-,pxrflz=1,kp-,nzx-,jzr-,nndl=4,fq-,qvsq=9,prj-,gdr=3,qlxlfd-,ncx-,rf=8,nft-,bmmdqk=4,nrj=7,kkxp=8,gqblq-,ncx-,pk-,lnt=6,vg=5,ztl-,fb=4,nmlngh-,brv-,tz=4,xt=5,dxn=3,hmr-,zb-,mqklqd-,vk=4,hvlh=8,ptrtg=2,xch-,fqqz=4,gmfc-,vnz-,chb-,lbzxd=4,jd-,ztgp=5,zdtxcq=5,lbm=5,ncx=2,vvhsz-,prj=5,gkj=4,qdq=2,tq=5,xlg=8,sxz-,mmz-,dhx-,fzl-,tdc=3,pmq=3,hn=7,tzpv=8,jvm=6,dfm=4,xt=2,rk-,hstx-,rd-,qsn=9,mqh-,pdb-,qkq-,ld-,psxz-,hfztr=6,jgm-,bt=3,khr-,vvhsz=5,kq-,hx=2,xfdh=2,ddq-,rrgf=3,dl-,tq-,jjxlh-,bmmdqk-,pln-,vf=7,vvhsz-,xtxc-,dhs-,mlxs-,hpzk-,dhx=5,dq-,krn-,ztl-,vtd-,gs-,dxn-,pvk-,ndd-,ztgp-,mn-,nkc=4,tg-,ftr-,hsq=3,vdd=8,lh=7,vj=6,ftr-,kcvf=1,mkn=3,tdc=9,ksb-,kj=9,drq-,gmfc=5,drsjd=6,dd-,tg-,sfg-,hrk-,fzl=3,srtm-,lrc-,xr-,fmdq-,xb-,cbbq=7,pcdffj-,fhgz-,dj=3,qvz=7,qhm=2,chb-,fzc=8,qxh=4,pbxm=1,sb-,mfv=7,nbzjg=2,vgkg-,rx=6,mbc=6,tjr-,jgb=2,rmq=1,bx-,qk-,zth=3,mlxs-,khq=9,sstlb-,sfg-,rx-,xnn=6,cv-,sgl=2,bp-,vtj=8,jc-,tq=9,tmk-,flrj=2,srtm=8,qkpk=6,sprsl-,dn-,mqv=4,mg-,vgxg-,zn-,msd=9,gjl=3,xhp-,jntz-,qvsq-,hk=4,rc-,bcxgj=6,nmlngh=5,qlxlfd-,rkl-,sfv=1,jv=8,cfv-,mn=6,pjn-,xln=4,gkj-,fjl-,rp-,cb=2,zqq=8,cm=4,gqblq-,bhz=5,qvsq=2,flrj-,qh=9,mjpb=6,xb=8,nsz-,gs-,drsjd-,ndd=5,zdtxcq=3,vtj=6,nbzjg-,lsr=4,rkl-,cn=2,sfg=8,xp-,fkrl-,tcp=6,pjm=4,mbm=1,lsbk=2,fllsz-,hft-,nbnfbr-,jxgxjv-,cl-,tmsp-,bs-,fb=9,xp-,bvfl-,fm=7,lc-,pxrflz-,bhjq-,btt-,sfv=8,fllsz-,sdmhxq=5,ncsm=3,jh=8,dxd-,fm=8,fhgz=3,mjpb-,tsc-,dvgz-,kg-,qdxb-,pln=4,fmdq-,pxfnc=5,hns-,bhjq-,kj-,qsl-,vs=8,zth=5,jndqj=4,zr-,fff=1,cv-,ntdr=3,rq=7,mqklqd=8,jgb=8,qvsq=8,xfdh=9,rjkvz-,gld=8,fbhvr-,ks=4,pk=6,cnpx-,kp=1,qtd=1,xqst=5,vfdtt=3,hh-,kq-,mck=7,dxd-,qkpk-,mmb=1,mlnc-,dfm-,xbv=1,cl-,gdx=3,jzpt-,qvz=9,xrdrq-,jqjdg=4,dhs=6,czq=5,hzls=4,mjpb=6,ldx-,nff-,pxfnc-,vq-,jmfhs-,pfpf=3,jh-,nx-,crg=5,jzrz=3,zd-,xgm=7,dhs=3,lkmj=9,xhd-,nnx-,cfv-,zbv-,qp-,ns-,hl=2,qvsq=3,prj=7,lc=8,kjnl-,fstn-,kqp=9,gdr-,dgvq-,mn=9,hqs-,gjd=4,hqs-,rmj=1,jk-,fkrl-,vtj-,pfpf=4,hrk=1,pb-,xr-,lkbdc=3,pcdffj=1,zjn=9,hqs-,vgkg-,gmfc-,bpkc=3,zq=8,brr-,gfm-,hm-,qlxlfd=2,rkl=5,snnd=2,bhqq-,nb-,bh=9,dkc=5,nvfv=9,brr-,xd-,hqs-,ldx-,tlt=1,bcxgj-,lkq=2,khq=4,xln-,vtm=5,bd-,cpscb=8,ns=5,jzrz-,kcvf=1,dgvq-,vf=9,tz=4,jsvc=1,rh-,gkxmlj-,hlq-,msd-,jxb=5,rx=7,nnx=3,rx=3,mmb=4,xg-,lkmj=8,xqst-,gkxmlj=7,hnhm-,qsn=9,cnk=6,psxz-,nnx-,qkjc=6,gs-,bjv=1,ndd-,hn=3,brr-,ns-,xrdrq=3,qphsv=9,hzls-,rxz=7,lplqhd=4,tmsp=2,lrp-,rl=9,vz-,fznq=9,fff-,kv=6,db=9,dxn-,pk-,ld=5,tbxjmh=2,bp=4,sgl=4,qkr=7,lbzxd=2,lkbdc-,gqq=5,vnz=7,khr=7,xbz=2,tjr-,snvxq=3,xlg=6,qqrmbj-,zbv-,mmb=5,hrk=2,nnrsx-,dl-,xr=3,tbxjmh=9,fzc-,mcs-,jqjdg=2,jqjdg-,psxz=1,mjpb=6,khq-,gdr-,qxh-,cv=5,gvk-,vqm=7,jz=1,qhm=2,vg=4,jk=4,rjg=1,rjg=5,sxz=9,lnt-,lz=1,jd=2,fz=6,cb-,cpscb=2,td-,cgz-,qxh=6,td=4,gx=6,sdmhxq=3,dp-,hn-,ltgg-,ztgp-,qdxb=9,tzpv-,qxh=5,rrgf-,jn-,lplqhd-,tnf-,gjd=5,rn-,fm-,tqtqg-,fz=1,tv=8,gcknh=2,xlkg-,zsrpq=5,vz-,jxgxjv=6,xhp-,kjc=1,nvfv=7,jjxlh=7,rf-,pb=9,nft-,jc-,khr-,hj=3,jd-,vg=8,rm=7,fp=9,xb=6,fkrl=5,pmq-,rn=6,krn-,zk-,plcd-,gs-,nxrcnk-,xg=5,mlc=4,qqrmbj=8,fkpd=7,cjq-,gld-,kg=5,tgsr=7,qx-,pcdffj=9,pbm=5,fz-,jgm=4,lkmj=2,cs=2,vpp-,ldx-,bx=7,ftr=2,bqjc=9,rlr=5,rmj=9,xqst-,vnj=1,qsbf-,vgxg-,fkrl=9,kq-,kkxp-,tj=6,vz=7,qqrmbj=4,tcp-,xh=5,ht=3,xbd-,rpk-,cx-,xhs-,nqpsc=6,mg=3,csg-,nkc=3,gdx-,bhz-,kp-,rs-,hh=8,tbxjmh-,pdb=7,rp=2,vtj-,fm-,tmk-,spv-,hvtgv=7,gkj-,rmq-,mdx-,pz-,ksb=9,jqzcc=3,tsc-,ntdr-,jxb=1,mlnc=7,ns-,dhs=6,sgl-,dn=3,jzpt-,lh-,rs-,zk-,ht-,fkrl-,kv-,vs=9,mqv-,ptrtg-,pb-,gr=7,hh-,jzrz-,jgm-,mbc-,kqp=1,tmqp=6,zb-,ldx-,ctn=2,bgmhj-,dxd=2,nndl-,dl=6,rmq-,vtm-,mk=2,sgl-,dgvq=3,ffnx=4,tpn-,xbz=4,hrhmdx=8,xf=3,zr-,fph=5,nsz-,tf-,lkmj=1,vvt-,bd-,tvj=3,bcqvf=4,pvk-,cs=8,gld=6,bmmdqk-,fm=7,dbnrnp-,nqpsc-,lrp-,mlxs=2,jz=3,jj=6,tdhx-,ztgp-,bqgs-,ht=8,hj-,bqgs-,cnpx=5,lc-,js-,hft-,vgxg-,clh-,gcknh-,mbc-,gmfc-,fhgz-,dxn=8,spv=6,dfm=3,xq-,qsl-,mhzf-,qr-,tgt=7,bq-,kq-,jzrz=8,zr=2,qkpk-,qh=1,rs=9,lrc=7,qsn=2,tmsp=3,ml=5,fmf=5,rjkvz=9,fhgz-,kp=6,mbc=1,hk-,vtm-,ltgg-,ncsm-,fm-,dp=8,hft=1,vmcj-,sgl=5,pd-,pk-,lt=9,xd-,bmm-,qxh-,tk-,kfrtbv-,qf=6,rd-,tbxjmh=2,dbvmr=7,rjkvz-,mbc=4,tmk=7,fg-,cnpx=8,fp-,ztl=5,fl-,lmv-,zjn=1,jd=6,cgvvt-,jqjdg=8,rsm=2,mmb-,xnrnz-,rrxq=2,vgkg-,xqst-,ld-,sn-,pbxm-,cdk=6,vs-,pg=7,cm-,pjn=5,ltl-,fzc-,cdk=6,vtm-,fm-,kkxp-,jx-,spv=4,qr-,ksb=1,qkq-,bhqq=4,vz-,mg=3,tgsr=4,rjkvz-,ldv=6,fg=5,cmm-,mlc-,dxd-,qh=2,lrp=5,lh-,cgz=5,jd-,ztl=7,vvhsz=2,dj-,tz=8,bs-,hstx=7,qctz=6,tdzv-,dp-,bvfp-,qsn-,dn-,pjm-,skmhp=8,jxgxjv=4,tj=3,lffh-,khq=7,nxrcnk=5,zqq-,hqs-,drq=8,qk-,gs=4,zf-,qlxlfd-,mk=7,brr=4,tmsp-,tgt=3,qphsv=7,gxxk=3,gr-,cs-,nsz=7,vqm=1,gt-,pl=7,sxz=8,pjn=4,zq=4,sz-,kqp-,lsr-,rx=9,vgxg=4,qp=9,xh=1,qqrmbj-,jjx=1,zlg=1,bmmdqk-,nbzjg=6,khq=7,xj-,rjkvz-,jh-,gt=4,xnn=2,vb=7,qfz-,rc-,tg-,bd=9,hvtgv-,clh=7,qqxd=6,zq=2,bvfl=7,nmlngh-,xfgh=4,xnn-,vsp-,rn-,gmfc=5,dfgm-,kj=6,zl-,bs=8,jgb=9,vgkg=3,jc=4,nkg-,hpzk-,rjkvz-,hns=1,nmlngh-,btt-,fkrl=6,lplqhd=9,bqgs-,rm=9,hzls-,mqh-,mhzf-,bmm-,sxz-,tnf=7,hzls=8,vs-,kv=6,jj-,xln=8,kjc=7,qkr=9,mlnc-,mlnc=9,jvm=2,bnlk-,xgm=7,hvtgv-,spq-,bnlk=8,cct-,fp=9,cct-,tmk=6,hjs=9,tmsp=7,bq-,plcd=1,cnk-,qfz-,zr-,rxz=5,ldv=4,sgl=1,gmfc-,pl=7,zk=8,cmm=4,mjpb=9,xlg=5,tmsp=2,ltl-,csg-,dhx=7,kjnl-,dp=1,cct=3,jxb-,xtr-,dj-,lrp=3,cn-,tq-,pj=3,xtr-,rc=9,tnvl=8,cmnj-,xhd-,dbvmr=6,dkc=5,zq-,rtk=7,tmqp=9,pdb=4,qx=9,rn=5,tvj-,gt=7,qqrmbj-,cx-,drsjd=6,sprsl-,mk-,npdcmh-,fph=1,rpk-,ncsm-,crzlf-,zth=7,qdq=8,kp-,mmb-,lmv-,dvgz=2,pnnd=9,vb-,bvfp=5,bjv=3,qd-,ptrtg-,kv-,dkc-,pmbfzf=6,bqjc-,xq=8,sb-,rp-,qd=3,nx=4,rf-,hsq=6,ms=6,khq=1,fllsz-,fjl-,psxz-,xfgh=5,cbbq=8,pvk=4,bvfl=1,zlg-,rjkvz-,xq=8,hh=1,kq=2,mmb=8,rk-,nsc-,rk-,jzpt=7,kjc-,mlxs=1,lkq=7,vfdtt-,lmv=4,xp-,nrj-,sn-,df-,hzkpq-,vgkg=5,fznq-,clh-,dq=2,fhgz=2,tcp-,mkn-,pmq-,vvhsz-,rpk=6,jc=5,tbcz=3,rxz=6,bqjc-,kdt=7,fjl-,ztl=3,pcdffj-,xbd-,rkjbzv-,kq-,dhs-,xr=3,lbm=3,ncsm-,kcvf-,qd=9,vk=4,jjx=1,czq-,tgt=2,hh=7,ks=3,qhm-,brv-,mbc=5,cnk-,xrzq=5,hqs-,vgxg=7,rs-,nb-,tjr=4,gkxmlj-,ntdr-,lnt=1,vj-,hlq-,cmm-,krn-,nvm-,zl=1,gs=3,hstx-,df=4,tbcz=8,vnz=5,cjq=1,rlr-,ph=8,ld=2,hlq=6,vfpj-,tsc=3,pcdffj=4,jgb-,fhgz=1,tcp-,vl-,xtz=7,xd=7,hhhk=3,qqkv=1,rk-,hm-,rsm=5,cjq=3,sqhb-,sn-,vk-,npdcmh-,kv=9,xfgh-,tf=1,vtm=1,hk-,xhp=4,jx-,vvhsz=9,pjm-,rmq-,sgl=7,mhzf=3,ct-,zf=7,xbz=4,xch=2,qnz-,vgxg-,crg-,pz-,qh=4,rm=4,zq-,pd-,dgvq-,bhqq-,qqrmbj=8,rx=7,nkc=1,hpd=4,vz=2,kqfg-,vfdtt-,rkjbzv-,xbz=4,ks-,cfv=4,vg-,snnd=7,mmz=6,db=6,pd-,mhzf=4,tnf-,rmq=5,chb=3,qqxd=1,bvfl-,jzr=9,cl-,pj=5,zth-,fmf-,hqs=5,cdk=7,drsjd-,lffh-,bcxgj=2,jqjdg=6,pxfnc-,qdxb=2,vfpj=8,zs-,tz-,qphsv-,mmb-,fqqz=4,sfg-,bs=3,xd=1,vnj=7,qkr-,tv=1,xfgh-,xtr=5,zf-,hzls-,bcxgj-,lmv-,nnrsx-,jxgxjv-,ldv-,lsr=3,nx-,sdmhxq=4,fjl=4,mcs=9,cnk=9,zd-,psfh=2,gt-,cdk-,bq=8,clh-,vgkg-,nxrcnk=7,nzx-,rf-,cfn=7,vpp=6,vl=7,xb=5,pcdffj=6,tj-,dh-,hpzk-,pbxm-,hhhk-,sprsl-,ltn-,nndl-,fbhvr-,ts=9,vpp=8,tgsr-,tdhx-,cb=7,nqpsc=1,qfz=1,jv=9,th-,qkpk-,xgm=9,qdxb-,xhd-,sb=5,sqhb=6,mkn-,kcvf=6,tdc=6,ph=4,mhzf=7,zn=3,bqjc=2,bhqq-,rc-,fph-,mx-,xmvfk=2,pbxm-,zl=7,rkjbzv-,rs-,hj-,xhd-,hjs-,xrzq=2,vb=6,rkl-,hlq-,rk=3,zbv=7,mdx-,xbd-,gr-,qk-,td-,hvlh-,hzls=9,lplqhd=5,rl-,kv-,df-,tgt=9,gdx-,hrk=2,nff-,sz-,tgsr=7,qkr=8,sn=1,xtxc-,qsbf=3,tsc-,rpk-,cnpx=5,nsc=6,gqh=7,gdr-,zq=3,cx=3,sxz-,df=3,mdzv=9,chb-,fkpd=3,rpk-,rh=3,hjs-,zz=3,bhjq-,xlg-,srs-,ltgg-,vs=6,cm-,lnrsql=2,cl-,jxp-,kj=7,rh=9,rm=7,dh=4,dbnrnp-,hvtgv=7,lplqhd-,fzl-,zb=3,fph-,qdq-,bcqvf=4,vb-,ncsm-,ct-,vmcj=1,mfv-,ckf=5,pjm-,xlkg=1,nb-,dfgm-,jjx-,plcd=4,xg-,msd-,vnj=5,bhqq-,rfxck=5,rd=5,dl-,nndl=4,snvxq-,ffnx=2,cnk=6,bgmhj=9,hv-,nsz=1,nxrcnk=2,xfdh-,flrj=7,rpk=3,kv=4,jzr=3,ts=1,xdnhl-,hfztr-,hqs=7,qh=2,hk=7,hjs=9,bt-,ncsm=9,mmb=2,pdb=1,ctc=5,jmfhs=7,sqhb=1,spq=2,nmlngh-,nzx=7,nvm-,cbbq=8,mlc-,xtz=3,gjd-,dxd=4,zhj-,xt=9,lc=2,fz=1,qphsv-,ld=6,pfpf=5,xnn=1,xlv-,vf-,zr-,gqh=6,zl=5,qp-,rkl=1,xln=6,xrzq-,crg-,fmdq-,mmb-,nrj-,qfz=5,mfv-,ftr=6,sqhb-,xd-,crg=8,jc=1,nbnfbr-,lbzxd-,jxb-,xhs-,nx-,bmmdqk-,jd=4,tjr=4,rpk-,qkjc=2,fq-,zk-,cdk=3,tcp-,jgm-,mjpb=1,nsc=7,btt-,bstf=3,ncsm-,gqblq=4,hft-,vvr=3,rn=1,tmsp-,qd-,kqch-,gdx-,gjd=8,gp-,dxd=5,cmm-,df-,bbsn-,pln=5,cx=3,xd-,sdmhxq-,bmm-,kjc-,sn-,xd-,jc=5,rp=4,fvbhz-,dfgm=9,ptrtg-,spv-,fzc-,rsm-,bmmdqk-,bnlk=8,nqpsc-,vq-,bx=8,pmq=2,nb-,db=7,vvhsz-,lz-,chb-,hjs=5,ms-,pn=7,cgz=1,jxb=7,qf=2,jjxlh=9,cl=4,cfv-,bnlk=5,jqjdg-,fzl=8,cdk-,bcxgj=7,qjjnq-,skmhp=5,df=6,td-,fjl=3,nqpsc=6,pxfnc=1,dfgm=2,tlt-,vs-,kdt-,jvm-,vl=8,ltgg=5,crg-,sfg-,sdmhxq-,msd-,kj-,pxfnc=6,lsbk=6,krn=9,hx=9,gvk-,vfdtt-,pxfnc-,kfrtbv-,vvt-,dkc-,dp=7,cm=4,dj-,pcdffj=6,lh=9,lz=8,xq-,rp=5,vj=8,dn=7,rl=8,rrxq=2,xln-,nzx=6,fz-,cpscb=6,jmfhs=1,vvhsz=1,xqst-,cmnj=8,dh=3,qr-,psgp=4,gr=2,xhd-,jzr-,zdtxcq-,qdxb=4,bbsn-,czq=4,cb=3,ksclkb=9,tqtqg=6,gp-,tdc=5,pdqkq-,zs-,zq-,vf=6,fm-,mjpb-,vvhsz=3,gdr-,pcdffj-,njkz=7,bvfl-,rmq=7,sn=5,ltn=9,zn=8,gs-,cl=3,qkq-,tqtqg=5,tdzv-,ml=4,vgkg=1,fmf=3,jgm-,sxz-,crzlf-,msd-,pln=7,fllsz-,pmq=9,zr=2,vtd-,psfh=4,jmfhs-,khr=9,qphsv-,ms-,brv=9,db=1,bcxgj-,gqq-,fg=4,zz=6,xnn=4,xb-,fzc-,pnnd-,cfv=9,lsr=1,tmqp=9,bcxgj=9,qqxd-,srs=5,nvm=4,pjm=9,js=8,hj=9,df=9,fqqz=1,bqjc-,fg=6,qsbf=8,jc-,flrj-,hzj=7,jx=2,bxg-,gxxk=6,vzlvs-,ct-,hpd-,vnz-,fjl-,dj-,bqjc-,zhj-,xdnhl=1,qf-,kjc-,tgt-,ptrtg-,xrzq=2,th=7,gvk-,rpk=2,rn-,sprsl=1,xtxc-,vtd=5,bp-,bd-,kjnl=7,qk=6,zqq=5,gp=3,drsjd=9,zbv=5,zt=4,hzkpq=9,xlkg=6,rrxq-,lffh=7,ggdr-,bqntx=9,hrk-,ltn-,hl=2,mdx=2,pdqkq-,xp-,lkmj-,dxn-,qctz=2,rjkvz=1,lnrsql=3,lkq=8,mfv=6,xxcfk=5,hnhm=5,khq=8,tmsp=4,gjl-,rp-,xch=1,xtr-,ph=2,bcxgj=9,jndqj=9,xtr-,zs=9,vvhsz=8,tz=9,tcp=3,cb-,mmz-,nff=4,xq=5,qx-,lffh=9,ksclkb-,mqklqd=6,mlnc-,ml-,tgt-,srtm-,dq-,mlnc=2,fvbhz=3,gqh=6,fph=8,db-,bq-,sn-,xqst-,kjnl=9,rkjbzv=4,qjjnq=2,lrp=2,bp-,td-,tzpv-,pjm=3,tgt=1,vmcj-,jgm=5,bmmdqk=2,rhg=6,qfz=6,tzpv=8,xb-,ltgg-,rd-,lkmj-,lc=8,tdzv=5,rrgf-,skmhp-,czq=8,zd-,pfpf-,rg-,cfn-,ddq-,pj=6,psxz-,ntdr-,hlq=4,vvhsz=8,hpzk-,ns=3,gmfc-,bp=8,snvxq-,qf-,gqq=2,qkpk=8,jn=7,ztl-,bt=8,rd-,mx=3,tnf-,ksclkb=1,jjx=6,qp=4,rjkvz-,jgjch=9,lt=7,rmq=3,rk-,xhd=5,bcxgj-,jn-,zk-,vs-,ktb=9,zjn=2,vq-,rkjbzv-,jgjch=8,vnj=5,nbnfbr=1,ztgp=8,xt-,ms-,tnf-,vvr=6,ph=7,mmb-,ddq=8,zqq=8,krn-,rlr=5,fb-,ml=8,bx=1,rpk-,hstx=7,hn-,rsm=1,jmfhs=2,xfgh=6,bqgs-,qtd=3,lbm=5,jsvc=4,crg=2,dg-,lrp=2,qhm=8,xtr-,jgm=6,dpmt=1,kjc=1,lsbk=7,xd-,qs=2,vg-,jxgxjv-,tnf-,xg-,qqrmbj-,khr-,cjq-,qjdgtx=6,fz-,sz-,vtj-,vb-,hlq-,jxp=5,bq=4,ldx=2,dgvq-,sb=1,kjc=5,mfv-,pz-,hvtgv=2,zb-,vj=3,srs=9,nbnfbr-,cgz=7,ph=4,jzpt-,mfv=6,dvgz=8,vvhsz=3,xlkg-,hmr=4,fvbhz=6,hx=6,hm-,tk=7,mlxs-,kjc=1,hqs-,vmcj-,sgl-,mx=2,dfgm-,qr=3,jjxlh-,hqs-,qqxd-,jxp=7,cm=2,qsbf-,bhqq-,nbzjg-,ztl-,xtxc=4,hk-,lsr-,rrxq-,vpp-,jd=8,hm=3,xch=6,bxg=9,xlg=3,xbd-,rlr=5,dvgz=6,cn=4,snvxq=4,spv-,vgxg-,tnvl=1,psfh=9,jgm-,hfztr=8,rh-,dj=2,vk=7,cnpx-,mqv-,qkpk-,nvfv=5,mdx-,pbxm=1,ctc=7,xtr-,cs=7,xtz=4,snvxq=9,mn=8,ztgp-,fkrl-,fhgz-,jjxlh=8,sdmhxq-,cx-,hnhm-,zbv-,bhz-,lt-,jgjch-,mjpb=6,khq-,ct-,zsrpq=9,nsc-,tz-,nzx=7,tvj-,zk=7,kg-,qkjc-,mbm=9,xdnhl-,bh=9,tpn=1,mlc=5,bhqq-,gjd-,nb=9,psfh-,qjjnq-,ckf=4,mk-,fz-,nbhcs=8,dxn-,sb=3,lpbk=8,msd-,hft=5,qsn-,tqtqg=9,vtm=3,xrzq-,sgl-,th=5,vf-,cnpx-,bhjq-,kdt=3,cl=5,pj-,qk-,pg-,dq-,pmbfzf=7,kj-,mjpb=7,msd=3,zq=7,jqjdg=9,df=5,xh=3,vb-,cfn=8,hpzk=9,gcknh-,tdhx-,hk=2,kqp=7,nxrcnk=3,vvr=1,gvk-,crzlf=3,zq=3,gp=3,spv=5,nbnfbr=5,cct=3,hstx-,bmm-,gkxmlj=6,kjc=5,gjl-,chb-,dq-,jh-,ctn-,vk=2,xq=3,lt=5,xhs=4,drsjd=5,nb-,tcp=3,qdq-,dhx=9,gs=1,bmm=8,tj-,ftr-,ftr-,npdcmh=9,rrgf-,xrdrq-,pdqkq=2,hpd=9,lbm-,jndqj=7,lsbk=9,xrdrq-
"""#
}

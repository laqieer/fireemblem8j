	.section .text.s_08002CD4, "ax", %progbits
@ AllocateProcess region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08002CD4..0x08002CE4
	.thumb
	.align 2, 0
	.global AllocateProcess
	.thumb_func
AllocateProcess:
	.incbin "data/residual/AllocateProcess.bin"

	.section .text.s_08002CE4, "ax", %progbits
@ FreeProcess region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08002CE4..0x08002CF4
	.thumb
	.align 2, 0
	.global FreeProcess
	.thumb_func
FreeProcess:
	.incbin "data/residual/FreeProcess.bin"

	.section .text.s_08002CF4, "ax", %progbits
@ InsertRootProcess region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08002CF4..0x08002D18
	.thumb
	.align 2, 0
	.global InsertRootProcess
	.thumb_func
InsertRootProcess:
	.incbin "data/residual/InsertRootProcess.bin"

	.section .text.s_08002D18, "ax", %progbits
@ InsertChildProcess region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08002D18..0x08002D30
	.thumb
	.align 2, 0
	.global InsertChildProcess
	.thumb_func
InsertChildProcess:
	.incbin "data/residual/InsertChildProcess.bin"

	.section .text.s_08002D30, "ax", %progbits
@ UnlinkProcess region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08002D30..0x08002D78
	.thumb
	.align 2, 0
	.global UnlinkProcess
	.thumb_func
UnlinkProcess:
	.incbin "data/residual/UnlinkProcess.bin"

	.section .text.s_080D6760, "ax", %progbits
@ __muldi3 region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D6760..0x080D67D0
	.thumb
	.align 2, 0
	.global __muldi3
	.thumb_func
__muldi3:
	.incbin "data/residual/__muldi3.bin"

	.section .text.s_080D67D0, "ax", %progbits
@ __udivsi3 region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D67D0..0x080D6848
	.thumb
	.align 2, 0
	.global __udivsi3
	.thumb_func
__udivsi3:
	.incbin "data/residual/__udivsi3.bin"

	.section .text.s_080D6848, "ax", %progbits
@ __umodsi3 region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D6848..0x080D6908
	.thumb
	.align 2, 0
	.global __umodsi3
	.thumb_func
__umodsi3:
	.incbin "data/residual/__umodsi3.bin"

	.section .text.s_080D6B14, "ax", %progbits
@ vfprintf region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D6B14..0x080D6B28
	.thumb
	.align 2, 0
	.global vfprintf
	.thumb_func
vfprintf:
	.incbin "data/residual/vfprintf.bin"

	.section .text.s_080D8BE8, "ax", %progbits
@ __sfp region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D8BE8..0x080D8C5C
	.thumb
	.align 2, 0
	.global __sfp
	.thumb_func
__sfp:
	.incbin "data/residual/__sfp.bin"

	.section .text.s_080D9858, "ax", %progbits
@ memchr region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D9858..0x080D98D8
	.thumb
	.align 2, 0
	.global memchr
	.thumb_func
memchr:
	.incbin "data/residual/memchr.bin"

	.section .text.s_080D98D8, "ax", %progbits
@ memmove region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D98D8..0x080D9960
	.thumb
	.align 2, 0
	.global memmove
	.thumb_func
memmove:
	.incbin "data/residual/memmove.bin"

	.section .text.s_080D99C0, "ax", %progbits
@ _Bfree region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D99C0..0x080D99D8
	.thumb
	.align 2, 0
	.global _Bfree
	.thumb_func
_Bfree:
	.incbin "data/residual/_Bfree.bin"

	.section .text.s_080D9AF4, "ax", %progbits
@ _hi0bits region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D9AF4..0x080D9B4C
	.thumb
	.align 2, 0
	.global _hi0bits
	.thumb_func
_hi0bits:
	.incbin "data/residual/_hi0bits.bin"

	.section .text.s_080D9EC8, "ax", %progbits
@ __mdiff region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D9EC8..0x080D9FB8
	.thumb
	.align 2, 0
	.global __mdiff
	.thumb_func
__mdiff:
	.incbin "data/residual/__mdiff.bin"

	.section .text.s_080D9FB8, "ax", %progbits
@ _ulp region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D9FB8..0x080DA004
	.thumb
	.align 2, 0
	.global _ulp
	.thumb_func
_ulp:
	.incbin "data/residual/_ulp.bin"

	.section .text.s_080DA004, "ax", %progbits
@ _b2d region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA004..0x080DA0C0
	.thumb
	.align 2, 0
	.global _b2d
	.thumb_func
_b2d:
	.incbin "data/residual/_b2d.bin"

	.section .text.s_080DA0C0, "ax", %progbits
@ _d2b region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA0C0..0x080DA1A8
	.thumb
	.align 2, 0
	.global _d2b
	.thumb_func
_d2b:
	.incbin "data/residual/_d2b.bin"

	.section .text.s_080DA1A8, "ax", %progbits
@ _ratio region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA1A8..0x080DA1F8
	.thumb
	.align 2, 0
	.global _ratio
	.thumb_func
_ratio:
	.incbin "data/residual/_ratio.bin"

	.section .text.s_080DA238, "ax", %progbits
@ isinf region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA238..0x080DA25C
	.thumb
	.align 2, 0
	.global isinf
	.thumb_func
isinf:
	.incbin "data/residual/isinf.bin"

	.section .text.s_080DA25C, "ax", %progbits
@ isnan region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA25C..0x080DA27C
	.thumb
	.align 2, 0
	.global isnan
	.thumb_func
isnan:
	.incbin "data/residual/isnan.bin"

	.section .text.s_080DA2A8, "ax", %progbits
@ __sread region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA2A8..0x080DA2DC
	.thumb
	.align 2, 0
	.global __sread
	.thumb_func
__sread:
	.incbin "data/residual/__sread.bin"

	.section .text.s_080DA2DC, "ax", %progbits
@ __swrite region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA2DC..0x080DA31C
	.thumb
	.align 2, 0
	.global __swrite
	.thumb_func
__swrite:
	.incbin "data/residual/__swrite.bin"

	.section .text.s_080DA35C, "ax", %progbits
@ __sclose region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA35C..0x080DA36C
	.thumb
	.align 2, 0
	.global __sclose
	.thumb_func
__sclose:
	.incbin "data/residual/__sclose.bin"

	.section .text.s_080DA4B8, "ax", %progbits
@ error region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA4B8..0x080DA4CC
	.thumb
	.align 2, 0
	.global error
	.thumb_func
error:
	.incbin "data/residual/error.bin"

	.section .text.s_080DA4CC, "ax", %progbits
@ wrap region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA4CC..0x080DA4E4
	.thumb
	.align 2, 0
	.global wrap
	.thumb_func
wrap:
	.incbin "data/residual/wrap.bin"

	.section .text.s_080DA5D4, "ax", %progbits
@ _lseek region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA5D4..0x080DA5E0
	.thumb
	.align 2, 0
	.global _lseek
	.thumb_func
_lseek:
	.incbin "data/residual/_lseek.bin"

	.section .text.s_080DA6F0, "ax", %progbits
@ _open region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA6F0..0x080DA704
	.thumb
	.align 2, 0
	.global _open
	.thumb_func
_open:
	.incbin "data/residual/_open.bin"

	.section .text.s_080DA738, "ax", %progbits
@ _close region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA738..0x080DA744
	.thumb
	.align 2, 0
	.global _close
	.thumb_func
_close:
	.incbin "data/residual/_close.bin"

	.section .text.s_080DA7DC, "ax", %progbits
@ _gettimeofday region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA7DC..0x080DA808
	.thumb
	.align 2, 0
	.global _gettimeofday
	.thumb_func
_gettimeofday:
	.incbin "data/residual/_gettimeofday.bin"

	.section .text.s_080DA918, "ax", %progbits
@ abort region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA918..0x080DA938
	.thumb
	.align 2, 0
	.global abort
	.thumb_func
abort:
	.incbin "data/residual/abort.bin"

	.section .text.s_080DA9A0, "ax", %progbits
@ __pack_d region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA9A0..0x080DAAE8
	.thumb
	.align 2, 0
	.global __pack_d
	.thumb_func
__pack_d:
	.incbin "data/residual/__pack_d.bin"

	.section .text.s_080DAAE8, "ax", %progbits
@ __unpack_d region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DAAE8..0x080DABC0
	.thumb
	.align 2, 0
	.global __unpack_d
	.thumb_func
__unpack_d:
	.incbin "data/residual/__unpack_d.bin"

	.section .text.s_080DAE2C, "ax", %progbits
@ __adddf3 region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DAE2C..0x080DAE5C
	.thumb
	.align 2, 0
	.global __adddf3
	.thumb_func
__adddf3:
	.incbin "data/residual/__adddf3.bin"

	.section .text.s_080DAE5C, "ax", %progbits
@ __subdf3 region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DAE5C..0x080DAE94
	.thumb
	.align 2, 0
	.global __subdf3
	.thumb_func
__subdf3:
	.incbin "data/residual/__subdf3.bin"

	.section .text.s_080DB488, "ax", %progbits
@ __gtdf2 region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DB488..0x080DB4D4
	.thumb
	.align 2, 0
	.global __gtdf2
	.thumb_func
__gtdf2:
	.incbin "data/residual/__gtdf2.bin"

	.section .text.s_080DB4D4, "ax", %progbits
@ __gedf2 region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DB4D4..0x080DB520
	.thumb
	.align 2, 0
	.global __gedf2
	.thumb_func
__gedf2:
	.incbin "data/residual/__gedf2.bin"

	.section .text.s_080DB5B8, "ax", %progbits
@ __floatsidf region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DB5B8..0x080DB634
	.thumb
	.align 2, 0
	.global __floatsidf
	.thumb_func
__floatsidf:
	.incbin "data/residual/__floatsidf.bin"

	.section .text.s_080DB6F8, "ax", %progbits
@ __truncdfsf2 region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DB6F8..0x080DB73C
	.thumb
	.align 2, 0
	.global __truncdfsf2
	.thumb_func
__truncdfsf2:
	.incbin "data/residual/__truncdfsf2.bin"

	.section .text.s_080DB73C, "ax", %progbits
@ __pack_f region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DB73C..0x080DB7F4
	.thumb
	.align 2, 0
	.global __pack_f
	.thumb_func
__pack_f:
	.incbin "data/residual/__pack_f.bin"

	.section .text.s_080DB9EC, "ax", %progbits
@ __addsf3 region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DB9EC..0x080DBA18
	.thumb
	.align 2, 0
	.global __addsf3
	.thumb_func
__addsf3:
	.incbin "data/residual/__addsf3.bin"

	.section .text.s_080DBA18, "ax", %progbits
@ __subsf3 region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DBA18..0x080DBA4C
	.thumb
	.align 2, 0
	.global __subsf3
	.thumb_func
__subsf3:
	.incbin "data/residual/__subsf3.bin"

	.section .text.s_080DBC9C, "ax", %progbits
@ __fpcmp_parts_f region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DBC9C..0x080DBD80
	.thumb
	.align 2, 0
	.global __fpcmp_parts_f
	.thumb_func
__fpcmp_parts_f:
	.incbin "data/residual/__fpcmp_parts_f.bin"

	.section .text.s_080DBE38, "ax", %progbits
@ __gtsf2 region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DBE38..0x080DBE80
	.thumb
	.align 2, 0
	.global __gtsf2
	.thumb_func
__gtsf2:
	.incbin "data/residual/__gtsf2.bin"

	.section .text.s_080DBE80, "ax", %progbits
@ __gesf2 region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DBE80..0x080DBEC8
	.thumb
	.align 2, 0
	.global __gesf2
	.thumb_func
__gesf2:
	.incbin "data/residual/__gesf2.bin"

	.section .text.s_080DBF58, "ax", %progbits
@ __floatsisf region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DBF58..0x080DBFB8
	.thumb
	.align 2, 0
	.global __floatsisf
	.thumb_func
__floatsisf:
	.incbin "data/residual/__floatsisf.bin"

	.section .text.s_080DBFB8, "ax", %progbits
@ __fixsfsi region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DBFB8..0x080DC020
	.thumb
	.align 2, 0
	.global __fixsfsi
	.thumb_func
__fixsfsi:
	.incbin "data/residual/__fixsfsi.bin"

	.section .text.s_080DC020, "ax", %progbits
@ __negsf2 region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DC020..0x080DC044
	.thumb
	.align 2, 0
	.global __negsf2
	.thumb_func
__negsf2:
	.incbin "data/residual/__negsf2.bin"

	.section .text.s_080DC05C, "ax", %progbits
@ __extendsfdf2 region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DC05C..0x080DC088
	.thumb
	.align 2, 0
	.global __extendsfdf2
	.thumb_func
__extendsfdf2:
	.incbin "data/residual/__extendsfdf2.bin"


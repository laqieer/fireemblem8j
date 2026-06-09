	.section .text.s_08001044, "ax", %progbits
@ ApplyColorAddition_ClampMax region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08001044..0x080010A0
	.thumb
	.align 2, 0
	.global ApplyColorAddition_ClampMax
	.thumb_func
ApplyColorAddition_ClampMax:
	.incbin "baserom.gba", 0x1044, 0x5C

	.section .text.s_080010A0, "ax", %progbits
@ ApplyColorAddition_ClampMin region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080010A0..0x080010FC
	.thumb
	.align 2, 0
	.global ApplyColorAddition_ClampMin
	.thumb_func
ApplyColorAddition_ClampMin:
	.incbin "baserom.gba", 0x10A0, 0x5C

	.section .text.s_08002CD4, "ax", %progbits
@ AllocateProcess region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08002CD4..0x08002CE4
	.thumb
	.align 2, 0
	.global AllocateProcess
	.thumb_func
AllocateProcess:
	.incbin "baserom.gba", 0x2CD4, 0x10

	.section .text.s_08002CE4, "ax", %progbits
@ FreeProcess region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08002CE4..0x08002CF4
	.thumb
	.align 2, 0
	.global FreeProcess
	.thumb_func
FreeProcess:
	.incbin "baserom.gba", 0x2CE4, 0x10

	.section .text.s_08002CF4, "ax", %progbits
@ InsertRootProcess region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08002CF4..0x08002D18
	.thumb
	.align 2, 0
	.global InsertRootProcess
	.thumb_func
InsertRootProcess:
	.incbin "baserom.gba", 0x2CF4, 0x24

	.section .text.s_08002D18, "ax", %progbits
@ InsertChildProcess region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08002D18..0x08002D30
	.thumb
	.align 2, 0
	.global InsertChildProcess
	.thumb_func
InsertChildProcess:
	.incbin "baserom.gba", 0x2D18, 0x18

	.section .text.s_08002D30, "ax", %progbits
@ UnlinkProcess region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08002D30..0x08002D78
	.thumb
	.align 2, 0
	.global UnlinkProcess
	.thumb_func
UnlinkProcess:
	.incbin "baserom.gba", 0x2D30, 0x48

	.section .text.s_08003038, "ax", %progbits
@ ProcCmd_DELETE region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003038..0x08003044
	.thumb
	.align 2, 0
	.global ProcCmd_DELETE
	.thumb_func
ProcCmd_DELETE:
	.incbin "baserom.gba", 0x3038, 0xC

	.section .text.s_08003220, "ax", %progbits
@ ProcCmd_SET_MARK region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003220..0x08003234
	.thumb
	.align 2, 0
	.global ProcCmd_SET_MARK
	.thumb_func
ProcCmd_SET_MARK:
	.incbin "baserom.gba", 0x3220, 0x14

	.section .text.s_08028534, "ax", %progbits
@ InitSupportBonuses region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08028534..0x08028544
	.thumb
	.align 2, 0
	.global InitSupportBonuses
	.thumb_func
InitSupportBonuses:
	.incbin "baserom.gba", 0x28534, 0x10

	.section .text.s_08030088, "ax", %progbits
@ BMapVSync_OnEnd region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08030088..0x08030094
	.thumb
	.align 2, 0
	.global BMapVSync_OnEnd
	.thumb_func
BMapVSync_OnEnd:
	.incbin "baserom.gba", 0x30088, 0xC

	.section .text.s_08030094, "ax", %progbits
@ BMapVSync_OnLoop region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08030094..0x080300A0
	.thumb
	.align 2, 0
	.global BMapVSync_OnLoop
	.thumb_func
BMapVSync_OnLoop:
	.incbin "baserom.gba", 0x30094, 0xC

	.section .text.s_08030940, "ax", %progbits
@ WfxCloudsOffsetGraphicsEffect region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08030940..0x080309A8
	.thumb
	.align 2, 0
	.global WfxCloudsOffsetGraphicsEffect
	.thumb_func
WfxCloudsOffsetGraphicsEffect:
	.incbin "baserom.gba", 0x30940, 0x68

	.section .text.s_080D6760, "ax", %progbits
@ __muldi3 region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D6760..0x080D67D0
	.thumb
	.align 2, 0
	.global __muldi3
	.thumb_func
__muldi3:
	.incbin "baserom.gba", 0xD6760, 0x70

	.section .text.s_080D67D0, "ax", %progbits
@ __udivsi3 region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D67D0..0x080D6848
	.thumb
	.align 2, 0
	.global __udivsi3
	.thumb_func
__udivsi3:
	.incbin "baserom.gba", 0xD67D0, 0x78

	.section .text.s_080D6848, "ax", %progbits
@ __umodsi3 region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D6848..0x080D6908
	.thumb
	.align 2, 0
	.global __umodsi3
	.thumb_func
__umodsi3:
	.incbin "baserom.gba", 0xD6848, 0xC0

	.section .text.s_080D6B14, "ax", %progbits
@ vfprintf region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D6B14..0x080D6B28
	.thumb
	.align 2, 0
	.global vfprintf
	.thumb_func
vfprintf:
	.incbin "baserom.gba", 0xD6B14, 0x14

	.section .text.s_080D8BE8, "ax", %progbits
@ __sfp region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D8BE8..0x080D8C5C
	.thumb
	.align 2, 0
	.global __sfp
	.thumb_func
__sfp:
	.incbin "baserom.gba", 0xD8BE8, 0x74

	.section .text.s_080D9858, "ax", %progbits
@ memchr region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D9858..0x080D98D8
	.thumb
	.align 2, 0
	.global memchr
	.thumb_func
memchr:
	.incbin "baserom.gba", 0xD9858, 0x80

	.section .text.s_080D98D8, "ax", %progbits
@ memmove region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D98D8..0x080D9960
	.thumb
	.align 2, 0
	.global memmove
	.thumb_func
memmove:
	.incbin "baserom.gba", 0xD98D8, 0x88

	.section .text.s_080D99C0, "ax", %progbits
@ _Bfree region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D99C0..0x080D99D8
	.thumb
	.align 2, 0
	.global _Bfree
	.thumb_func
_Bfree:
	.incbin "baserom.gba", 0xD99C0, 0x18

	.section .text.s_080D9AF4, "ax", %progbits
@ _hi0bits region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D9AF4..0x080D9B4C
	.thumb
	.align 2, 0
	.global _hi0bits
	.thumb_func
_hi0bits:
	.incbin "baserom.gba", 0xD9AF4, 0x58

	.section .text.s_080D9EC8, "ax", %progbits
@ __mdiff region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D9EC8..0x080D9FB8
	.thumb
	.align 2, 0
	.global __mdiff
	.thumb_func
__mdiff:
	.incbin "baserom.gba", 0xD9EC8, 0xF0

	.section .text.s_080D9FB8, "ax", %progbits
@ _ulp region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D9FB8..0x080DA004
	.thumb
	.align 2, 0
	.global _ulp
	.thumb_func
_ulp:
	.incbin "baserom.gba", 0xD9FB8, 0x4C

	.section .text.s_080DA004, "ax", %progbits
@ _b2d region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA004..0x080DA0C0
	.thumb
	.align 2, 0
	.global _b2d
	.thumb_func
_b2d:
	.incbin "baserom.gba", 0xDA004, 0xBC

	.section .text.s_080DA0C0, "ax", %progbits
@ _d2b region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA0C0..0x080DA1A8
	.thumb
	.align 2, 0
	.global _d2b
	.thumb_func
_d2b:
	.incbin "baserom.gba", 0xDA0C0, 0xE8

	.section .text.s_080DA1A8, "ax", %progbits
@ _ratio region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA1A8..0x080DA1F8
	.thumb
	.align 2, 0
	.global _ratio
	.thumb_func
_ratio:
	.incbin "baserom.gba", 0xDA1A8, 0x50

	.section .text.s_080DA238, "ax", %progbits
@ isinf region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA238..0x080DA25C
	.thumb
	.align 2, 0
	.global isinf
	.thumb_func
isinf:
	.incbin "baserom.gba", 0xDA238, 0x24

	.section .text.s_080DA25C, "ax", %progbits
@ isnan region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA25C..0x080DA27C
	.thumb
	.align 2, 0
	.global isnan
	.thumb_func
isnan:
	.incbin "baserom.gba", 0xDA25C, 0x20

	.section .text.s_080DA2A8, "ax", %progbits
@ __sread region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA2A8..0x080DA2DC
	.thumb
	.align 2, 0
	.global __sread
	.thumb_func
__sread:
	.incbin "baserom.gba", 0xDA2A8, 0x34

	.section .text.s_080DA2DC, "ax", %progbits
@ __swrite region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA2DC..0x080DA31C
	.thumb
	.align 2, 0
	.global __swrite
	.thumb_func
__swrite:
	.incbin "baserom.gba", 0xDA2DC, 0x40

	.section .text.s_080DA35C, "ax", %progbits
@ __sclose region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA35C..0x080DA36C
	.thumb
	.align 2, 0
	.global __sclose
	.thumb_func
__sclose:
	.incbin "baserom.gba", 0xDA35C, 0x10

	.section .text.s_080DA4B8, "ax", %progbits
@ error region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA4B8..0x080DA4CC
	.thumb
	.align 2, 0
	.global error
	.thumb_func
error:
	.incbin "baserom.gba", 0xDA4B8, 0x14

	.section .text.s_080DA4CC, "ax", %progbits
@ wrap region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA4CC..0x080DA4E4
	.thumb
	.align 2, 0
	.global wrap
	.thumb_func
wrap:
	.incbin "baserom.gba", 0xDA4CC, 0x18

	.section .text.s_080DA5D4, "ax", %progbits
@ _lseek region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA5D4..0x080DA5E0
	.thumb
	.align 2, 0
	.global _lseek
	.thumb_func
_lseek:
	.incbin "baserom.gba", 0xDA5D4, 0xC

	.section .text.s_080DA6F0, "ax", %progbits
@ _open region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA6F0..0x080DA704
	.thumb
	.align 2, 0
	.global _open
	.thumb_func
_open:
	.incbin "baserom.gba", 0xDA6F0, 0x14

	.section .text.s_080DA738, "ax", %progbits
@ _close region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA738..0x080DA744
	.thumb
	.align 2, 0
	.global _close
	.thumb_func
_close:
	.incbin "baserom.gba", 0xDA738, 0xC

	.section .text.s_080DA7DC, "ax", %progbits
@ _gettimeofday region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA7DC..0x080DA808
	.thumb
	.align 2, 0
	.global _gettimeofday
	.thumb_func
_gettimeofday:
	.incbin "baserom.gba", 0xDA7DC, 0x2C

	.section .text.s_080DA918, "ax", %progbits
@ abort region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA918..0x080DA938
	.thumb
	.align 2, 0
	.global abort
	.thumb_func
abort:
	.incbin "baserom.gba", 0xDA918, 0x20

	.section .text.s_080DA9A0, "ax", %progbits
@ __pack_d region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA9A0..0x080DAAE8
	.thumb
	.align 2, 0
	.global __pack_d
	.thumb_func
__pack_d:
	.incbin "baserom.gba", 0xDA9A0, 0x148

	.section .text.s_080DAAE8, "ax", %progbits
@ __unpack_d region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DAAE8..0x080DABC0
	.thumb
	.align 2, 0
	.global __unpack_d
	.thumb_func
__unpack_d:
	.incbin "baserom.gba", 0xDAAE8, 0xD8

	.section .text.s_080DAE2C, "ax", %progbits
@ __adddf3 region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DAE2C..0x080DAE5C
	.thumb
	.align 2, 0
	.global __adddf3
	.thumb_func
__adddf3:
	.incbin "baserom.gba", 0xDAE2C, 0x30

	.section .text.s_080DAE5C, "ax", %progbits
@ __subdf3 region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DAE5C..0x080DAE94
	.thumb
	.align 2, 0
	.global __subdf3
	.thumb_func
__subdf3:
	.incbin "baserom.gba", 0xDAE5C, 0x38

	.section .text.s_080DB488, "ax", %progbits
@ __gtdf2 region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DB488..0x080DB4D4
	.thumb
	.align 2, 0
	.global __gtdf2
	.thumb_func
__gtdf2:
	.incbin "baserom.gba", 0xDB488, 0x4C

	.section .text.s_080DB4D4, "ax", %progbits
@ __gedf2 region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DB4D4..0x080DB520
	.thumb
	.align 2, 0
	.global __gedf2
	.thumb_func
__gedf2:
	.incbin "baserom.gba", 0xDB4D4, 0x4C

	.section .text.s_080DB5B8, "ax", %progbits
@ __floatsidf region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DB5B8..0x080DB634
	.thumb
	.align 2, 0
	.global __floatsidf
	.thumb_func
__floatsidf:
	.incbin "baserom.gba", 0xDB5B8, 0x7C

	.section .text.s_080DB6F8, "ax", %progbits
@ __truncdfsf2 region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DB6F8..0x080DB73C
	.thumb
	.align 2, 0
	.global __truncdfsf2
	.thumb_func
__truncdfsf2:
	.incbin "baserom.gba", 0xDB6F8, 0x44

	.section .text.s_080DB73C, "ax", %progbits
@ __pack_f region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DB73C..0x080DB7F4
	.thumb
	.align 2, 0
	.global __pack_f
	.thumb_func
__pack_f:
	.incbin "baserom.gba", 0xDB73C, 0xB8

	.section .text.s_080DB9EC, "ax", %progbits
@ __addsf3 region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DB9EC..0x080DBA18
	.thumb
	.align 2, 0
	.global __addsf3
	.thumb_func
__addsf3:
	.incbin "baserom.gba", 0xDB9EC, 0x2C

	.section .text.s_080DBA18, "ax", %progbits
@ __subsf3 region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DBA18..0x080DBA4C
	.thumb
	.align 2, 0
	.global __subsf3
	.thumb_func
__subsf3:
	.incbin "baserom.gba", 0xDBA18, 0x34

	.section .text.s_080DBC9C, "ax", %progbits
@ __fpcmp_parts_f region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DBC9C..0x080DBD80
	.thumb
	.align 2, 0
	.global __fpcmp_parts_f
	.thumb_func
__fpcmp_parts_f:
	.incbin "baserom.gba", 0xDBC9C, 0xE4

	.section .text.s_080DBE38, "ax", %progbits
@ __gtsf2 region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DBE38..0x080DBE80
	.thumb
	.align 2, 0
	.global __gtsf2
	.thumb_func
__gtsf2:
	.incbin "baserom.gba", 0xDBE38, 0x48

	.section .text.s_080DBE80, "ax", %progbits
@ __gesf2 region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DBE80..0x080DBEC8
	.thumb
	.align 2, 0
	.global __gesf2
	.thumb_func
__gesf2:
	.incbin "baserom.gba", 0xDBE80, 0x48


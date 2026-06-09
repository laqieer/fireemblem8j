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


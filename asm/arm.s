	.section .text.arm, "ax", %progbits
@ arm region-same arm code stranded out of src/ (US asm/arm.o):
@ JP 0x08000228..0x08000A20 (shift +0); descriptive incbin baserom.gba
	.arm
	.align 2, 0
	.global ARMCodeToCopy_Start
ARMCodeToCopy_Start:
	.incbin "baserom.gba", 0x228, 0xC
	.global ColorFadeTick
ColorFadeTick:
	.incbin "baserom.gba", 0x234, 0xD0
	.global ClearOam
ClearOam:
	.incbin "baserom.gba", 0x304, 0x5C
	.global Checksum32
Checksum32:
	.incbin "baserom.gba", 0x360, 0x48
	.global TmFillRect
TmFillRect:
	.incbin "baserom.gba", 0x3A8, 0x38
	.global TmCopyRect
TmCopyRect:
	.incbin "baserom.gba", 0x3E0, 0x5C
	.global TmApplyTsa
TmApplyTsa:
	.incbin "baserom.gba", 0x43C, 0x58
	.global PutOamHi
PutOamHi:
	.incbin "baserom.gba", 0x494, 0xA0
	.global PutOamLo
PutOamLo:
	.incbin "baserom.gba", 0x534, 0x30
	.global DrawGlyph
DrawGlyph:
	.incbin "baserom.gba", 0x564, 0xBC
	.global DrawGlyphHalfStride
DrawGlyphHalfStride:
	.incbin "baserom.gba", 0x620, 0xC4
	.global DecodeString
DecodeString:
	.incbin "baserom.gba", 0x6E4, 0xA0
	.global MapFloodCoreStep
MapFloodCoreStep:
	.incbin "baserom.gba", 0x784, 0xF0
	.global MapFloodCore
MapFloodCore:
	.incbin "baserom.gba", 0x874, 0x1AC
	.global ARMCodeToCopy_End
ARMCodeToCopy_End:

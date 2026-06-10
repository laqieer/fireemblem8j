	.section .text.arm, "ax", %progbits
@ arm region-same arm code stranded out of src/ (US asm/arm.o):
@ JP 0x08000228..0x08000A20 (shift +0); descriptive incbin baserom.gba
	.arm
	.align 2, 0
	.global ARMCodeToCopy_Start
ARMCodeToCopy_Start:
	.incbin "data/residual/ARMCodeToCopy_Start.bin"
	.global ColorFadeTick
ColorFadeTick:
	.incbin "data/residual/ColorFadeTick.bin"
	.global ClearOam
ClearOam:
	.incbin "data/residual/ClearOam.bin"
	.global Checksum32
Checksum32:
	.incbin "data/residual/Checksum32.bin"
	.global TmFillRect
TmFillRect:
	.incbin "data/residual/TmFillRect.bin"
	.global TmCopyRect
TmCopyRect:
	.incbin "data/residual/TmCopyRect.bin"
	.global TmApplyTsa
TmApplyTsa:
	.incbin "data/residual/TmApplyTsa.bin"
	.global PutOamHi
PutOamHi:
	.incbin "data/residual/PutOamHi.bin"
	.global PutOamLo
PutOamLo:
	.incbin "data/residual/PutOamLo.bin"
	.global DrawGlyph
DrawGlyph:
	.incbin "data/residual/DrawGlyph.bin"
	.global DrawGlyphHalfStride
DrawGlyphHalfStride:
	.incbin "data/residual/DrawGlyphHalfStride.bin"
	.global DecodeString
DecodeString:
	.incbin "data/residual/DecodeString.bin"
	.global MapFloodCoreStep
MapFloodCoreStep:
	.incbin "data/residual/MapFloodCoreStep.bin"
	.global MapFloodCore
MapFloodCore:
	.incbin "data/residual/MapFloodCore.bin"
	.global ARMCodeToCopy_End
ARMCodeToCopy_End:

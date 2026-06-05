@ Raw-ROM decompilation baseline.
@
@ This file incbins the entire original ROM so the build is byte-perfect from
@ day one (`make compare` -> OK). As code and data are decompiled into src/ and
@ carved out into descriptively-named asm/data files, the corresponding ranges
@ are removed from this incbin and the new objects are inserted at the right
@ place by ldscript.txt. Progress = how much of this incbin has been replaced.

	.section .rom, "ax", %progbits
	.global gRomBaseline
	.align 2
gRomBaseline:
	.incbin "baserom.gba"
	.global gRomBaselineEnd
gRomBaselineEnd:

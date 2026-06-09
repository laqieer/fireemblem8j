	.syntax unified
	.section .text.SwapScanlineBufs, "ax", %progbits
@ SwapScanlineBufs @ JP 0x080846D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SwapScanlineBufs
	.thumb_func
SwapScanlineBufs:
	ldr r0, _080846DC @ =0x0203E750
	ldr r2, [r0]
	ldr r1, [r0, #4]
	str r1, [r0]
	str r2, [r0, #4]
	bx lr
	.align 2, 0
_080846DC: .4byte 0x0203E750


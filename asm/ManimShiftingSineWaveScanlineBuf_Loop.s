	.syntax unified
	.set SwapScanlineBufs, 0x080846D0 + 1
	.set sub_8084568, 0x08084568 + 1
	.section .text.ManimShiftingSineWaveScanlineBuf_Loop, "ax", %progbits
@ ManimShiftingSineWaveScanlineBuf_Loop @ JP 0x080848F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ManimShiftingSineWaveScanlineBuf_Loop
	.thumb_func
ManimShiftingSineWaveScanlineBuf_Loop:
	push {lr}
	ldr r1, _08084924 @ =0x0203E750
	ldr r3, [r1, #4]
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r3, r3, r1
	adds r0, #0x64
	ldrh r1, [r0]
	adds r2, r1, #1
	strh r2, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r3, #0
	movs r2, #0x10
	movs r3, #8
	bl sub_8084568
	bl SwapScanlineBufs
	pop {r0}
	bx r0
	.align 2, 0
_08084924: .4byte 0x0203E750


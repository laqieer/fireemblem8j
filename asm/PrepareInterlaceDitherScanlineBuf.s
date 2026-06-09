	.syntax unified
	.set SwapScanlineBufs, 0x080846D0 + 1
	.section .text.PrepareInterlaceDitherScanlineBuf, "ax", %progbits
@ PrepareInterlaceDitherScanlineBuf @ JP 0x08084C5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PrepareInterlaceDitherScanlineBuf
	.thumb_func
PrepareInterlaceDitherScanlineBuf:
	push {r4, r5, lr}
	movs r3, #0
	ldr r5, _08084C88 @ =0x0203E758
	movs r4, #1
_08084C64:
	ldr r0, [r5]
	lsls r2, r3, #1
	adds r2, r2, r0
	adds r0, r3, #0
	ands r0, r4
	asrs r1, r3, #1
	adds r0, r0, r1
	rsbs r0, r0, #0
	strh r0, [r2]
	adds r3, #1
	cmp r3, #0x9f
	ble _08084C64
	bl SwapScanlineBufs
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08084C88: .4byte 0x0203E758


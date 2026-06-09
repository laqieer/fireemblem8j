	.syntax unified
	.set InitScanlineBuf, 0x080846E0 + 1
	.set MapAnimDitheredCircleScanlineCore, 0x08084998 + 1
	.set SwapScanlineBufs, 0x080846D0 + 1
	.section .text.UpdateMapAnimDitheredCircleScanline, "ax", %progbits
@ UpdateMapAnimDitheredCircleScanline @ JP 0x08084A70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global UpdateMapAnimDitheredCircleScanline
	.thumb_func
UpdateMapAnimDitheredCircleScanline:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r4, _08084AA0 @ =0x0203E750
	ldr r0, [r4, #4]
	bl InitScanlineBuf
	ldr r0, [r4, #4]
	adds r1, r5, #0
	adds r2, r6, #0
	mov r3, r8
	bl MapAnimDitheredCircleScanlineCore
	bl SwapScanlineBufs
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08084AA0: .4byte 0x0203E750


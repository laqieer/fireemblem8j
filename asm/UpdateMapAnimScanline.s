	.syntax unified
	.set InitScanlineBuf, 0x080846E0 + 1
	.set MapAnimScanlineCore, 0x0808473C + 1
	.set SwapScanlineBufs, 0x080846D0 + 1
	.section .text.UpdateMapAnimScanline, "ax", %progbits
@ UpdateMapAnimScanline @ JP 0x08084264 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global UpdateMapAnimScanline
	.thumb_func
UpdateMapAnimScanline:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r4, _08084294 @ =0x0203E750
	ldr r0, [r4, #4]
	bl InitScanlineBuf
	ldr r0, [r4, #4]
	adds r1, r5, #0
	adds r2, r6, #0
	mov r3, r8
	bl MapAnimScanlineCore
	bl SwapScanlineBufs
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08084294: .4byte 0x0203E750


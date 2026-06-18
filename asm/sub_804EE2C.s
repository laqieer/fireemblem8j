	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.section .text.sub_804EE2C, "ax", %progbits
@ UnpackUiFramePalette @ JP 0x0804EE2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global UnpackUiFramePalette
	.thumb_func
UnpackUiFramePalette:
	push {lr}
	adds r3, r0, #0
	cmp r3, #0
	bge _0804EE36
	movs r3, #1
_0804EE36:
	ldr r2, _0804EE54 @ =0x085E0630
	ldr r0, _0804EE58 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r1, [r0]
	movs r0, #0xc
	ands r0, r1
	adds r0, r0, r2
	ldr r0, [r0]
	lsls r1, r3, #5
	movs r2, #0x20
	bl sub_8000D68
	pop {r0}
	bx r0
	.align 2, 0
_0804EE54: .4byte 0x085E0630
_0804EE58: .4byte 0x0202BCEC


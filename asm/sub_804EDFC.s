	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.section .text.sub_804EDFC, "ax", %progbits
@ sub_804EDFC @ JP 0x0804EDFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804EDFC
	.thumb_func
sub_804EDFC:
	push {lr}
	adds r3, r0, #0
	cmp r3, #0
	bge _0804EE06
	movs r3, #1
_0804EE06:
	ldr r2, _0804EE24 @ =0x085E0620
	ldr r0, _0804EE28 @ =0x0202BCEC
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
_0804EE24: .4byte 0x085E0620
_0804EE28: .4byte 0x0202BCEC


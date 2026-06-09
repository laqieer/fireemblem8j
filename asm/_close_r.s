	.syntax unified
	.set _close, 0x080DA738 + 1
	.section .text._close_r, "ax", %progbits
@ _close_r @ JP 0x080DA8B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _close_r
	.thumb_func
_close_r:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	ldr r4, _080DA8DC @ =0x03006798
	movs r1, #0
	str r1, [r4]
	bl _close
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080DA8D6
	ldr r0, [r4]
	cmp r0, #0
	beq _080DA8D6
	str r0, [r5]
_080DA8D6:
	adds r0, r1, #0
	pop {r4, r5, pc}
	.align 2, 0
_080DA8DC: .4byte 0x03006798


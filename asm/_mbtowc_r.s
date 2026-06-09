	.syntax unified
	.section .text._mbtowc_r, "ax", %progbits
@ _mbtowc_r @ JP 0x080D982C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _mbtowc_r
	.thumb_func
_mbtowc_r:
	sub sp, #4
	cmp r1, #0
	bne _080D9834
	mov r1, sp
_080D9834:
	cmp r2, #0
	beq _080D9850
	cmp r3, #0
	bne _080D9842
	movs r0, #1
	rsbs r0, r0, #0
	b _080D9852
_080D9842:
	ldrb r0, [r2]
	str r0, [r1]
	ldrb r0, [r2]
	cmp r0, #0
	beq _080D9850
	movs r0, #1
	b _080D9852
_080D9850:
	movs r0, #0
_080D9852:
	add sp, #4
	bx lr
	.align 2, 0


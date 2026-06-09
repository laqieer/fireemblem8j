	.syntax unified
	.section .text.strlen, "ax", %progbits
@ strlen @ JP 0x080D6A08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global strlen
	.thumb_func
strlen:
	push {r4, r5, lr}
	adds r1, r0, #0
	adds r5, r1, #0
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _080D6A40
	adds r2, r1, #0
	ldr r1, [r2]
	ldr r4, _080D6A24 @ =0xFEFEFEFF
	adds r0, r1, r4
	bics r0, r1
	ldr r3, _080D6A28 @ =0x80808080
	b _080D6A34
	.align 2, 0
_080D6A24: .4byte 0xFEFEFEFF
_080D6A28: .4byte 0x80808080
_080D6A2C:
	adds r2, #4
	ldr r1, [r2]
	adds r0, r1, r4
	bics r0, r1
_080D6A34:
	ands r0, r3
	cmp r0, #0
	beq _080D6A2C
	adds r1, r2, #0
	b _080D6A40
_080D6A3E:
	adds r1, #1
_080D6A40:
	ldrb r0, [r1]
	cmp r0, #0
	bne _080D6A3E
	subs r0, r1, r5
	pop {r4, r5, pc}
	.align 2, 0


	.syntax unified
	.section .text.memcpy, "ax", %progbits
@ memcpy @ JP 0x080D6908 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global memcpy
	.thumb_func
memcpy:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r3, r1, #0
	cmp r2, #0xf
	bls _080D6948
	adds r0, r3, #0
	orrs r0, r5
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _080D6948
	adds r1, r5, #0
_080D6922:
	ldm r3!, {r0}
	stm r1!, {r0}
	ldm r3!, {r0}
	stm r1!, {r0}
	ldm r3!, {r0}
	stm r1!, {r0}
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, #0x10
	cmp r2, #0xf
	bhi _080D6922
	cmp r2, #3
	bls _080D6946
_080D693C:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, #4
	cmp r2, #3
	bhi _080D693C
_080D6946:
	adds r4, r1, #0
_080D6948:
	subs r2, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _080D6962
	adds r1, r0, #0
_080D6954:
	ldrb r0, [r3]
	strb r0, [r4]
	adds r3, #1
	adds r4, #1
	subs r2, #1
	cmp r2, r1
	bne _080D6954
_080D6962:
	adds r0, r5, #0
	pop {r4, r5, pc}
	.align 2, 0


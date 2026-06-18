	.syntax unified
	.set _malloc_r, 0x080D946C + 1
	.set memset, 0x080D6968 + 1
	.section .text.sub_80DA85C, "ax", %progbits
@ _calloc_r @ JP 0x080DA85C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _calloc_r
	.thumb_func
_calloc_r:
	push {r4, lr}
	muls r1, r2, r1
	bl _malloc_r
	adds r4, r0, #0
	cmp r4, #0
	bne _080DA86E
	movs r0, #0
	b _080DA8B2
_080DA86E:
	adds r0, r4, #0
	subs r0, #8
	ldr r0, [r0, #4]
	movs r1, #4
	rsbs r1, r1, #0
	ands r0, r1
	subs r2, r0, #4
	cmp r2, #0x24
	bhi _080DA8A8
	adds r1, r4, #0
	cmp r2, #0x13
	bls _080DA89E
	movs r0, #0
	stm r1!, {r0}
	str r0, [r4, #4]
	adds r1, #4
	cmp r2, #0x1b
	bls _080DA89E
	stm r1!, {r0}
	stm r1!, {r0}
	cmp r2, #0x23
	bls _080DA89E
	stm r1!, {r0}
	stm r1!, {r0}
_080DA89E:
	movs r0, #0
	stm r1!, {r0}
	stm r1!, {r0}
	str r0, [r1]
	b _080DA8B0
_080DA8A8:
	adds r0, r4, #0
	movs r1, #0
	bl memset
_080DA8B0:
	adds r0, r4, #0
_080DA8B2:
	pop {r4, pc}


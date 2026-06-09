	.syntax unified
	.section .text.memset, "ax", %progbits
@ memset @ JP 0x080D6968 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global memset
	.thumb_func
memset:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r5, #0
	cmp r2, #3
	bls _080D69AE
	movs r0, #3
	ands r0, r5
	cmp r0, #0
	bne _080D69AE
	adds r1, r5, #0
	movs r0, #0xff
	ands r4, r0
	lsls r3, r4, #8
	orrs r3, r4
	lsls r0, r3, #0x10
	orrs r3, r0
	cmp r2, #0xf
	bls _080D69A2
_080D698E:
	stm r1!, {r3}
	stm r1!, {r3}
	stm r1!, {r3}
	stm r1!, {r3}
	subs r2, #0x10
	cmp r2, #0xf
	bhi _080D698E
	b _080D69A2
_080D699E:
	stm r1!, {r3}
	subs r2, #4
_080D69A2:
	cmp r2, #3
	bhi _080D699E
	adds r3, r1, #0
	b _080D69AE
_080D69AA:
	strb r4, [r3]
	adds r3, #1
_080D69AE:
	adds r0, r2, #0
	subs r2, #1
	cmp r0, #0
	bne _080D69AA
	adds r0, r5, #0
	pop {r4, r5, pc}
	.align 2, 0


	.syntax unified
	.set nullsub_3, 0x080D668C + 1
	.section .text.__modsi3, "ax", %progbits
@ __modsi3 @ JP 0x080D6690 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global __modsi3
	.thumb_func
__modsi3:
	movs r3, #1
	cmp r1, #0
	beq _080D6754
	bpl _080D669A
	rsbs r1, r1, #0
_080D669A:
	push {r4}
	push {r0}
	cmp r0, #0
	bpl _080D66A4
	rsbs r0, r0, #0
_080D66A4:
	cmp r0, r1
	blo _080D6748
	movs r4, #1
	lsls r4, r4, #0x1c
_080D66AC:
	cmp r1, r4
	bhs _080D66BA
	cmp r1, r0
	bhs _080D66BA
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _080D66AC
_080D66BA:
	lsls r4, r4, #3
_080D66BC:
	cmp r1, r4
	bhs _080D66CA
	cmp r1, r0
	bhs _080D66CA
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _080D66BC
_080D66CA:
	movs r2, #0
	cmp r0, r1
	blo _080D66D2
	subs r0, r0, r1
_080D66D2:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _080D66E4
	subs r0, r0, r4
	mov ip, r3
	movs r4, #1
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_080D66E4:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _080D66F6
	subs r0, r0, r4
	mov ip, r3
	movs r4, #2
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_080D66F6:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _080D6708
	subs r0, r0, r4
	mov ip, r3
	movs r4, #3
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_080D6708:
	mov ip, r3
	cmp r0, #0
	beq _080D6716
	lsrs r3, r3, #4
	beq _080D6716
	lsrs r1, r1, #4
	b _080D66CA
_080D6716:
	movs r4, #0xe
	lsls r4, r4, #0x1c
	ands r2, r4
	beq _080D6748
	mov r3, ip
	movs r4, #3
	rors r3, r4
	tst r2, r3
	beq _080D672C
	lsrs r4, r1, #3
	adds r0, r0, r4
_080D672C:
	mov r3, ip
	movs r4, #2
	rors r3, r4
	tst r2, r3
	beq _080D673A
	lsrs r4, r1, #2
	adds r0, r0, r4
_080D673A:
	mov r3, ip
	movs r4, #1
	rors r3, r4
	tst r2, r3
	beq _080D6748
	lsrs r4, r1, #1
	adds r0, r0, r4
_080D6748:
	pop {r4}
	cmp r4, #0
	bpl _080D6750
	rsbs r0, r0, #0
_080D6750:
	pop {r4}
	mov pc, lr
_080D6754:
	push {lr}
	bl nullsub_3
	movs r0, #0
	pop {pc}
	.align 2, 0


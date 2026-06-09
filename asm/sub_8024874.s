	.syntax unified
	.set GetTrapAt, 0x0802E128 + 1
	.section .text.sub_8024874, "ax", %progbits
@ sub_8024874 @ JP 0x08024874 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024874
	.thumb_func
sub_8024874:
	push {lr}
	ldr r0, _080248C0 @ =0x03004DF0
	ldr r2, [r0]
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080248C8
	ldr r0, [r2, #0xc]
	movs r1, #0x83
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	bne _080248C8
	ldr r0, _080248C4 @ =0x0202BCAC
	adds r0, #0x3d
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _080248C8
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetTrapAt
	cmp r0, #0
	beq _080248C8
	ldrb r0, [r0, #2]
	cmp r0, #1
	bne _080248C8
	movs r0, #1
	b _080248CA
	.align 2, 0
_080248C0: .4byte 0x03004DF0
_080248C4: .4byte 0x0202BCAC
_080248C8:
	movs r0, #3
_080248CA:
	pop {r1}
	bx r1
	.align 2, 0


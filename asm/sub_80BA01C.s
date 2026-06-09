	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.section .text.sub_80BA01C, "ax", %progbits
@ sub_80BA01C @ JP 0x080BA01C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BA01C
	.thumb_func
sub_80BA01C:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r7, r2, #0
	cmp r4, #0
	bge _080BA02E
	movs r4, #0
_080BA02E:
	cmp r4, r5
	blt _080BA034
	subs r4, r5, #1
_080BA034:
	mov ip, r4
	ldr r0, _080BA05C @ =0x085775CC
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080BA064
	cmp r4, #0
	bne _080BA060
	cmp r2, #0
	beq _080BA088
	ldrh r1, [r3, #8]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080BA088
	subs r4, r5, #1
	b _080BA088
	.align 2, 0
_080BA05C: .4byte 0x085775CC
_080BA060:
	subs r4, #1
	b _080BA088
_080BA064:
	movs r2, #0x80
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080BA088
	subs r0, r5, #1
	cmp r4, r0
	bne _080BA086
	cmp r7, #0
	beq _080BA088
	ldrh r1, [r3, #8]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080BA088
	movs r4, #0
	b _080BA088
_080BA086:
	adds r4, #1
_080BA088:
	cmp ip, r4
	beq _080BA09E
	ldr r0, _080BA0A8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080BA09E
	movs r0, #0x66
	bl m4aSongNumStart
_080BA09E:
	adds r0, r4, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BA0A8: .4byte 0x0202BCEC


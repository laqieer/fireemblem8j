	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_80BB550, 0x080BB550 + 1
	.set sub_80BB58C, 0x080BB58C + 1
	.set sub_80BB5C0, 0x080BB5C0 + 1
	.section .text.sub_80BB620, "ax", %progbits
@ sub_80BB620 @ JP 0x080BB620 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BB620
	.thumb_func
sub_80BB620:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x3c]
	str r0, [r4, #0x38]
_080BB62A:
	ldr r3, [r4, #0x30]
	ldrb r0, [r3]
	cmp r0, #0
	bne _080BB63C
	adds r0, r4, #0
	movs r1, #0x64
	bl Proc_Goto
	b _080BB712
_080BB63C:
	ldrb r2, [r3, #1]
	lsrs r0, r2, #5
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r6, #0x1f
	adds r1, r6, #0
	ands r1, r2
	ldr r0, [r0, #0x40]
	lsrs r0, r1
	movs r5, #1
	ands r0, r5
	cmp r0, #0
	bne _080BB70A
	ldrb r2, [r3, #2]
	lsls r0, r2, #0x18
	cmp r0, #0
	beq _080BB672
	lsrs r0, r0, #0x1d
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r1, r6, #0
	ands r1, r2
	ldr r0, [r0, #0x40]
	lsrs r0, r1
	ands r0, r5
	cmp r0, #0
	bne _080BB70A
_080BB672:
	ldrb r0, [r3, #1]
	bl sub_80BB550
	adds r1, r0, #0
	str r1, [r4, #0x38]
	cmp r1, #0
	beq _080BB70A
	ldr r0, [r4, #0x30]
	ldrb r2, [r0]
	adds r3, r0, #0
	cmp r2, #1
	beq _080BB690
	cmp r2, #2
	beq _080BB6A0
	b _080BB6D2
_080BB690:
	ldr r0, [r4, #0x34]
	bl sub_80BB5C0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080BB70A
	ldr r3, [r4, #0x30]
	b _080BB6D2
_080BB6A0:
	ldrb r0, [r3, #2]
	bl sub_80BB550
	str r0, [r4, #0x3c]
	cmp r0, #0
	beq _080BB70A
	ldr r0, [r4, #0x38]
	bl sub_80BB58C
	ldr r1, [r4, #0x30]
	ldrb r2, [r1, #2]
	cmp r0, r2
	bne _080BB70A
	ldr r0, [r4, #0x38]
	ldr r0, [r0, #0xc]
	movs r2, #4
	ands r0, r2
	cmp r0, #0
	bne _080BB70A
	ldr r0, [r4, #0x3c]
	ldr r0, [r0, #0xc]
	ands r0, r2
	adds r3, r1, #0
	cmp r0, #0
	bne _080BB70A
_080BB6D2:
	ldrb r1, [r3, #1]
	lsrs r2, r1, #5
	lsls r2, r2, #2
	adds r2, r2, r4
	movs r6, #0x1f
	adds r0, r6, #0
	ands r0, r1
	movs r5, #1
	adds r1, r5, #0
	lsls r1, r0
	ldr r0, [r2, #0x40]
	orrs r0, r1
	str r0, [r2, #0x40]
	ldrb r1, [r3, #2]
	lsls r2, r1, #0x18
	cmp r2, #0
	beq _080BB712
	lsrs r2, r2, #0x1d
	lsls r2, r2, #2
	adds r2, r2, r4
	adds r0, r6, #0
	ands r0, r1
	adds r1, r5, #0
	lsls r1, r0
	ldr r0, [r2, #0x40]
	orrs r0, r1
	str r0, [r2, #0x40]
	b _080BB712
_080BB70A:
	ldr r0, [r4, #0x30]
	adds r0, #8
	str r0, [r4, #0x30]
	b _080BB62A
_080BB712:
	pop {r4, r5, r6}
	pop {r0}
	bx r0


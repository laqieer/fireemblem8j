	.syntax unified
	.set GetClassReelEntry, 0x080B8C80 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set SetNextGameActionId, 0x08009EB0 + 1
	.set sub_80B74B8, 0x080B74B8 + 1
	.set sub_80B7B2C, 0x080B7B2C + 1
	.set sub_80B8A88, 0x080B8A88 + 1
	.section .text.sub_80B751C, "ax", %progbits
@ sub_80B751C @ JP 0x080B751C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B751C
	.thumb_func
sub_80B751C:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x2c
	ldrb r0, [r6]
	cmp r0, #2
	beq _080B753A
	cmp r0, #2
	bgt _080B7534
	cmp r0, #1
	beq _080B7582
	b _080B7596
_080B7534:
	cmp r0, #3
	beq _080B7574
	b _080B7596
_080B753A:
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
	adds r5, r4, #0
	adds r5, #0x34
	ldrb r1, [r5]
	bl GetClassReelEntry
	str r0, [r4, #0x4c]
	cmp r0, #0
	bne _080B7560
	movs r0, #1
	bl SetNextGameActionId
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	b _080B7596
_080B7560:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	movs r0, #1
	strb r0, [r6]
	ldr r1, [r4, #0x4c]
	adds r0, r4, #0
	bl sub_80B7B2C
	b _080B7596
_080B7574:
	ldr r1, [r4, #0x4c]
	adds r0, r4, #0
	bl sub_80B8A88
	movs r0, #1
	strb r0, [r6]
	b _080B7596
_080B7582:
	ldr r0, _080B759C @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _080B7596
	adds r0, r4, #0
	bl sub_80B74B8
_080B7596:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B759C: .4byte 0x085775CC


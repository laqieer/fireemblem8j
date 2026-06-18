	.syntax unified
	.set CheckInLinkArena, 0x08042E1C + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set __umodsi3, 0x080D6848 + 1
	.set sub_8043190, 0x08043190 + 1
	.set sub_804498C, 0x0804498C + 1
	.set sub_80449D4, 0x080449D4 + 1
	.set sub_8044A6C, 0x08044A6C + 1
	.set sub_8044AC8, 0x08044AC8 + 1
	.set sub_8044B14, 0x08044B14 + 1
	.section .text.sub_8044BF0, "ax", %progbits
@ Tactician_LoopCore @ JP 0x08044BF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Tactician_LoopCore
	.thumb_func
Tactician_LoopCore:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, _08044C70 @ =0x085775CC
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08044C0E
	adds r0, r5, #0
	movs r1, #0
	adds r2, r6, #0
	bl sub_804498C
_08044C0E:
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08044C24
	adds r0, r5, #0
	movs r1, #1
	adds r2, r6, #0
	bl sub_804498C
_08044C24:
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08044C3A
	adds r0, r5, #0
	movs r1, #2
	adds r2, r6, #0
	bl sub_804498C
_08044C3A:
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08044C50
	adds r0, r5, #0
	movs r1, #3
	adds r2, r6, #0
	bl sub_804498C
_08044C50:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08044D46
	adds r0, r6, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	cmp r0, #7
	bhi _08044D46
	lsls r0, r0, #2
	ldr r1, _08044C74 @ =_08044C78
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08044C70: .4byte 0x085775CC
_08044C74: .4byte _08044C78
_08044C78: @ jump table
	.4byte _08044C98 @ case 0
	.4byte _08044CCC @ case 1
	.4byte _08044CE8 @ case 2
	.4byte _08044D0E @ case 3
	.4byte _08044CA2 @ case 4
	.4byte _08044CAC @ case 5
	.4byte _08044CB6 @ case 6
	.4byte _08044CBE @ case 7
_08044C98:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_80449D4
	b _08044D46
_08044CA2:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8044A6C
	b _08044D46
_08044CAC:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8044AC8
	b _08044D46
_08044CB6:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	b _08044CC4
_08044CBE:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
_08044CC4:
	movs r3, #0
	bl sub_8044B14
	b _08044D46
_08044CCC:
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	cmp r0, #0
	beq _08044D06
	movs r0, #2
	bl sub_8043190
	movs r0, #0
	strb r0, [r4]
	adds r1, r5, #0
	adds r1, #0x39
	strb r0, [r1]
	b _08044E24
_08044CE8:
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	cmp r0, #1
	beq _08044D06
	movs r0, #2
	bl sub_8043190
	movs r1, #0
	movs r0, #1
	strb r0, [r4]
	adds r0, r5, #0
	adds r0, #0x39
	strb r1, [r0]
	b _08044E24
_08044D06:
	movs r0, #0
	bl sub_8043190
	b _08044D46
_08044D0E:
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _08044D40
	movs r0, #2
	bl sub_8043190
	movs r0, #2
	strb r0, [r4]
	adds r0, r5, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08044D36
	movs r0, #3
	strb r0, [r4]
_08044D36:
	adds r1, r5, #0
	adds r1, #0x39
	movs r0, #0
	strb r0, [r1]
	b _08044E24
_08044D40:
	movs r0, #0
	bl sub_8043190
_08044D46:
	ldr r0, _08044D60 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08044D8E
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r7, [r0]
	adds r4, r0, #0
	b _08044D76
	.align 2, 0
_08044D60: .4byte 0x085775CC
_08044D64:
	ldrb r2, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl sub_8044B14
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08044D8E
_08044D76:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, #3
	bl __umodsi3
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r7, r0
	bne _08044D64
_08044D8E:
	ldr r4, _08044E30 @ =0x085775CC
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08044DA6
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8044A6C
_08044DA6:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08044DBC
	movs r0, #3
	bl sub_8043190
	movs r0, #5
	strh r0, [r5, #0x34]
_08044DBC:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08044E38
	movs r0, #2
	bl sub_8043190
	adds r1, r5, #0
	adds r1, #0x30
	ldrb r0, [r1]
	adds r2, r0, #1
	strb r2, [r1]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	adds r3, r1, #0
	cmp r0, #2
	bne _08044DF0
	adds r0, r5, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08044DF0
	adds r0, r2, #1
	strb r0, [r3]
_08044DF0:
	adds r2, r3, #0
	ldrb r0, [r2]
	movs r1, #3
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r5, #0x30]
	ldr r1, _08044E34 @ =0x00FF00FF
	ands r0, r1
	cmp r0, #3
	bne _08044E08
	movs r0, #0
	strb r0, [r2]
_08044E08:
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r6, r0
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	bne _08044E24
	adds r0, r5, #0
	movs r1, #2
	adds r2, r6, #0
	bl sub_804498C
_08044E24:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _08044E6C
	.align 2, 0
_08044E30: .4byte 0x085775CC
_08044E34: .4byte 0x00FF00FF
_08044E38:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08044E6C
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	beq _08044E54
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8044A6C
	b _08044E6C
_08044E54:
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08044E6C
	movs r0, #1
	bl sub_8043190
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
_08044E6C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0


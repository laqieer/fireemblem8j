	.syntax unified
	.set GetItemAttributes, 0x08017314 + 1
	.set GetItemMaxUses, 0x08017358 + 1
	.set GetItemUses, 0x0801732C + 1
	.set GetUnit, 0x08019108 + 1
	.set SetStaffUseAction, 0x080294C4 + 1
	.set sub_80502F4, 0x080502F4 + 1
	.section .text.sub_8029A6C, "ax", %progbits
@ sub_8029A6C @ JP 0x08029A6C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8029A6C
	.thumb_func
sub_8029A6C:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	bne _08029AF4
	movs r6, #0
	ldr r0, _08029AAC @ =0x0203A954
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r1, r4, #0
	adds r1, #0x3c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r5, [r0]
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #0xc1
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	beq _08029AB4
	ldr r6, _08029AB0 @ =0x000007E1
	b _08029AE4
	.align 2, 0
_08029AAC: .4byte 0x0203A954
_08029AB0: .4byte 0x000007E1
_08029AB4:
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #5
	ands r1, r0
	cmp r1, #0
	bne _08029ACC
	ldr r6, _08029AC8 @ =0x000007D5
	b _08029AE4
	.align 2, 0
_08029AC8: .4byte 0x000007D5
_08029ACC:
	adds r0, r5, #0
	bl GetItemUses
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetItemMaxUses
	cmp r4, r0
	bne _08029AE0
	ldr r6, _08029AF0 @ =0x000007D4
_08029AE0:
	cmp r6, #0
	beq _08029AEC
_08029AE4:
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_80502F4
_08029AEC:
	movs r0, #8
	b _08029B08
	.align 2, 0
_08029AF0: .4byte 0x000007D4
_08029AF4:
	ldr r1, _08029B10 @ =0x0203A954
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	strb r0, [r1, #0x15]
	ldr r0, _08029B14 @ =0x03004DF0
	ldr r0, [r0]
	bl SetStaffUseAction
	movs r0, #0x37
_08029B08:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08029B10: .4byte 0x0203A954
_08029B14: .4byte 0x03004DF0


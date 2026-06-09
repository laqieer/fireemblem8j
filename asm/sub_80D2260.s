	.syntax unified
	.set GetClassData, 0x0801911C + 1
	.set GetItemRequiredExp, 0x08017460 + 1
	.set GetItemType, 0x080172F0 + 1
	.section .text.sub_80D2260, "ax", %progbits
@ sub_80D2260 @ JP 0x080D2260 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D2260
	.thumb_func
sub_80D2260:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	adds r0, r7, #0
	bl GetClassData
	ldr r5, [r0, #0x34]
	adds r0, r6, #0
	bl GetItemType
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r0, #0
	strh r0, [r4]
	movs r2, #0
	b _080D2292
_080D228C:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_080D2292:
	lsls r0, r2, #2
	adds r1, r0, r5
	ldrh r0, [r1]
	cmp r0, r3
	bne _080D22A2
	ldrh r0, [r1, #2]
	subs r0, #1
	strh r0, [r4]
_080D22A2:
	ldrh r0, [r1, #2]
	cmp r0, #0
	bne _080D228C
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080D22D8
	ldr r3, _080D22B8 @ =0x00000109
	movs r2, #0
	b _080D22C2
	.align 2, 0
_080D22B8: .4byte 0x00000109
_080D22BC:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_080D22C2:
	lsls r0, r2, #2
	adds r1, r0, r5
	ldrh r0, [r1]
	cmp r0, r3
	bne _080D22D2
	ldrh r0, [r1, #2]
	subs r0, #1
	strh r0, [r4]
_080D22D2:
	ldrh r0, [r1, #2]
	cmp r0, #0
	bne _080D22BC
_080D22D8:
	cmp r6, #0
	beq _080D22FC
	adds r0, r6, #0
	bl GetItemRequiredExp
	adds r4, r0, #0
	adds r0, r7, #0
	bl GetClassData
	adds r5, r0, #0
	adds r0, r6, #0
	bl GetItemType
	adds r5, #0x2c
	adds r5, r5, r0
	ldrb r5, [r5]
	cmp r4, r5
	bge _080D2300
_080D22FC:
	movs r0, #0
	b _080D2302
_080D2300:
	movs r0, #1
_080D2302:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1


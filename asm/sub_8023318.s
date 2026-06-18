	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetItemAttributes, 0x08017314 + 1
	.set GetItemType, 0x080172F0 + 1
	.set sub_80165F0, 0x080165F0 + 1
	.set sub_8022CFC, 0x08022CFC + 1
	.set sub_802881C, 0x0802881C + 1
	.section .text.sub_8023318, "ax", %progbits
@ ItemSelectMenu_TextDraw @ JP 0x08023318 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ItemSelectMenu_TextDraw
	.thumb_func
ItemSelectMenu_TextDraw:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r7, _08023350 @ =0x03004DF0
	ldr r1, [r7]
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08023354
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_8022CFC
	movs r0, #0
	b _08023390
	.align 2, 0
_08023350: .4byte 0x03004DF0
_08023354:
	adds r0, r5, #0
	bl GetItemType
	cmp r0, #0xc
	bne _08023362
	movs r2, #0
	b _0802336E
_08023362:
	ldr r0, [r7]
	adds r1, r5, #0
	bl sub_802881C
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
_0802336E:
	adds r0, r4, #0
	adds r0, #0x34
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	lsls r3, r3, #5
	movs r6, #0x2a
	ldrsh r1, [r4, r6]
	adds r3, r3, r1
	lsls r3, r3, #1
	ldr r1, _08023398 @ =0x02022CA8
	adds r3, r3, r1
	adds r1, r5, #0
	bl sub_80165F0
	movs r0, #1
	bl BG_EnableSyncByMask
_08023390:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08023398: .4byte 0x02022CA8


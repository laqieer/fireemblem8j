	.syntax unified
	.set ForceMenuItemPanel, 0x0801E2E0 + 1
	.set GetItemType, 0x080172F0 + 1
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set SetFaceBlinkControlById, 0x0800635C + 1
	.set StartOrphanMenu, 0x0804F970 + 1
	.set sub_80034D0, 0x080034D0 + 1
	.set sub_8003508, 0x08003508 + 1
	.set sub_8005544, 0x08005544 + 1
	.set sub_8018FCC, 0x08018FCC + 1
	.set sub_8024AA0, 0x08024AA0 + 1
	.set sub_8025B10, 0x08025B10 + 1
	.set sub_802881C, 0x0802881C + 1
	.section .text.sub_8023198, "ax", %progbits
@ sub_8023198 @ JP 0x08023198 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PlayCommandEffect
	.thumb_func
PlayCommandEffect:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	mov sl, r1
	movs r7, #0
	ldr r6, _08023210 @ =0x03004DF0
	ldr r0, [r6]
	bl sub_8025B10
	bl GetSelectTargetCount
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	mov r8, r1
	movs r5, #0
	ldr r0, [r6]
	ldrh r4, [r0, #0x1e]
	cmp r4, #0
	beq _080231F6
_080231C8:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0xc
	bne _080231E2
	ldr r0, [r6]
	adds r1, r4, #0
	bl sub_802881C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080231E2
	movs r7, #1
_080231E2:
	adds r5, #1
	cmp r5, #4
	bgt _080231F6
	ldr r0, [r6]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _080231C8
_080231F6:
	mov r0, r8
	cmp r0, #1
	bne _08023214
	cmp r7, #0
	bne _08023214
	mov r0, sb
	mov r1, sl
	bl sub_8024AA0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08023254
	.align 2, 0
_08023210: .4byte 0x03004DF0
_08023214:
	ldr r0, _08023264 @ =0x085C561C
	bl StartOrphanMenu
	adds r5, r0, #0
	ldr r4, _08023268 @ =0x03004DF0
	ldr r0, [r4]
	bl sub_8018FCC
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl sub_8005544
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl ForceMenuItemPanel
	bl sub_80034D0
	movs r0, #4
	bl sub_8003508
	movs r0, #0x17
_08023254:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08023264: .4byte 0x085C561C
_08023268: .4byte 0x03004DF0


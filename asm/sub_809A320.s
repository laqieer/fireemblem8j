	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.set GetItemType, 0x080172F0 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set __udivsi3, 0x080D67D0 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_809A320, "ax", %progbits
@ sub_809A320 @ JP 0x0809A320 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809A320
	.thumb_func
sub_809A320:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	ldr r0, _0809A3D8 @ =0x02012914
	mov r8, r0
	ldr r0, _0809A3DC @ =0x02012F56
	movs r1, #0
	strh r1, [r0]
	movs r4, #0
	ldr r1, _0809A3E0 @ =0x02012F54
	mov sl, r0
	adds r2, r1, #0
	ldrh r1, [r2]
	cmp r4, r1
	bge _0809A38C
	ldr r1, _0809A3E4 @ =0x08A94604
	mov r3, sb
	lsls r0, r3, #2
	adds r6, r0, r1
	mov r7, sl
_0809A350:
	ldr r1, _0809A3E8 @ =0x020122D4
	lsls r0, r4, #2
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	str r2, [sp]
	bl GetItemType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp]
	ldrb r1, [r6]
	cmp r0, r1
	blo _0809A382
	ldrb r3, [r6, #1]
	cmp r0, r3
	bhi _0809A382
	ldr r0, [r5]
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	stm r1!, {r0}
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
_0809A382:
	adds r4, #1
	ldr r0, _0809A3E0 @ =0x02012F54
	ldrh r0, [r0]
	cmp r4, r0
	blt _0809A350
_0809A38C:
	movs r4, #0
	ldrh r2, [r2]
	cmp r4, r2
	bge _0809A3CE
	ldr r1, _0809A3E4 @ =0x08A94604
	mov r2, sb
	lsls r0, r2, #2
	adds r6, r0, r1
_0809A39C:
	ldr r1, _0809A3E8 @ =0x020122D4
	lsls r0, r4, #2
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	bl GetItemType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r3, [r6]
	cmp r0, r3
	blo _0809A3B8
	ldrb r1, [r6, #1]
	cmp r0, r1
	bls _0809A3C4
_0809A3B8:
	ldr r0, [r5]
	mov r2, r8
	adds r2, #4
	mov r8, r2
	subs r2, #4
	stm r2!, {r0}
_0809A3C4:
	adds r4, #1
	ldr r0, _0809A3E0 @ =0x02012F54
	ldrh r0, [r0]
	cmp r4, r0
	blt _0809A39C
_0809A3CE:
	movs r2, #1
	ldr r5, _0809A3D8 @ =0x02012914
	ldr r3, _0809A3DC @ =0x02012F56
	mov sl, r3
	b _0809A3F2
	.align 2, 0
_0809A3D8: .4byte 0x02012914
_0809A3DC: .4byte 0x02012F56
_0809A3E0: .4byte 0x02012F54
_0809A3E4: .4byte 0x08A94604
_0809A3E8: .4byte 0x020122D4
_0809A3EC:
	lsls r0, r2, #1
	adds r0, r0, r2
	adds r2, r0, #1
_0809A3F2:
	mov r1, sl
	ldrh r0, [r1]
	movs r1, #3
	str r2, [sp]
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, [sp]
	cmp r2, r0
	blt _0809A3EC
	cmp r2, #0
	ble _0809A494
_0809A40C:
	adds r4, r2, #0
	mov r3, sl
	ldrh r3, [r3]
	cmp r2, r3
	bge _0809A486
	ldr r0, _0809A4B0 @ =0x02012F56
	mov sl, r0
_0809A41A:
	subs r7, r4, r2
	adds r4, #1
	mov sb, r4
	cmp r7, #0
	blt _0809A47A
	ldr r1, _0809A4B4 @ =0x02012914
	mov r8, r1
_0809A428:
	lsls r0, r7, #2
	mov r3, r8
	adds r6, r0, r3
	ldrh r0, [r6, #2]
	str r2, [sp]
	bl GetItemIndex
	adds r4, r0, #0
	ldr r2, [sp]
	adds r0, r7, r2
	lsls r0, r0, #2
	mov r1, r8
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	bl GetItemIndex
	ldr r2, [sp]
	cmp r4, r0
	bgt _0809A46C
	ldrh r0, [r6, #2]
	str r2, [sp]
	bl GetItemIndex
	adds r4, r0, #0
	ldrh r0, [r5, #2]
	bl GetItemIndex
	ldr r2, [sp]
	cmp r4, r0
	bne _0809A47A
	ldrh r0, [r6, #2]
	ldrh r3, [r5, #2]
	cmp r0, r3
	bls _0809A474
_0809A46C:
	ldr r1, [r6]
	ldr r0, [r5]
	str r0, [r6]
	str r1, [r5]
_0809A474:
	subs r7, r7, r2
	cmp r7, #0
	bge _0809A428
_0809A47A:
	mov r4, sb
	ldr r0, _0809A4B0 @ =0x02012F56
	ldr r5, _0809A4B4 @ =0x02012914
	ldrh r0, [r0]
	cmp r4, r0
	blt _0809A41A
_0809A486:
	adds r0, r2, #0
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	cmp r2, #0
	bgt _0809A40C
_0809A494:
	ldr r1, _0809A4B8 @ =0x020122D4
	movs r2, #0xc8
	lsls r2, r2, #1
	adds r0, r5, #0
	bl sub_80D636C
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A4B0: .4byte 0x02012F56
_0809A4B4: .4byte 0x02012914
_0809A4B8: .4byte 0x020122D4


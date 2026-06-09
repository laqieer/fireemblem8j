	.syntax unified
	.set AnimCreate, 0x08004E50 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetBanimDragonStatusType, 0x08072060 + 1
	.set RegisterDataMove, 0x08001F64 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8054304, 0x08054304 + 1
	.set sub_805BD44, 0x0805BD44 + 1
	.set sub_805BDCC, 0x0805BDCC + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80546C8, "ax", %progbits
@ sub_80546C8 @ JP 0x080546C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80546C8
	.thumb_func
sub_80546C8:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov sb, r1
	adds r6, r2, #0
	ldr r0, _0805470C @ =0x02017740
	ldr r7, [r0]
	cmp r7, #0
	beq _080546E0
	b _08054878
_080546E0:
	movs r4, #1
	str r4, [r0]
	ldr r0, _08054710 @ =0x085E3A94
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	mov r0, r8
	str r0, [r5, #0x5c]
	mov r1, sb
	str r1, [r5, #0x60]
	strh r7, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x29
	strb r4, [r0]
	cmp r6, #0
	beq _08054748
	cmp r6, #1
	bne _08054718
	ldr r0, _08054714 @ =0x080DF4C8
	b _0805474A
	.align 2, 0
_0805470C: .4byte 0x02017740
_08054710: .4byte 0x085E3A94
_08054714: .4byte 0x080DF4C8
_08054718:
	cmp r6, #2
	bne _08054724
	ldr r0, _08054720 @ =0x080DF512
	b _0805474A
	.align 2, 0
_08054720: .4byte 0x080DF512
_08054724:
	cmp r6, #3
	bne _08054730
	ldr r0, _0805472C @ =0x080DF55C
	b _0805474A
	.align 2, 0
_0805472C: .4byte 0x080DF55C
_08054730:
	cmp r6, #4
	bne _0805473C
	ldr r0, _08054738 @ =0x080DF9E4
	b _0805474A
	.align 2, 0
_08054738: .4byte 0x080DF9E4
_0805473C:
	cmp r6, #5
	bne _08054748
	ldr r0, _08054744 @ =0x080DFA7A
	b _0805474A
	.align 2, 0
_08054744: .4byte 0x080DFA7A
_08054748:
	ldr r0, _08054760 @ =0x080DF4A6
_0805474A:
	str r0, [r5, #0x44]
	movs r0, #1
	str r0, [r5, #0x48]
	bl GetBanimDragonStatusType
	adds r4, r0, #0
	cmp r4, #0
	beq _08054764
	movs r0, #0
	str r0, [r5, #0x64]
	b _08054878
	.align 2, 0
_08054760: .4byte 0x080DF4A6
_08054764:
	bl sub_805BDCC
	cmp r0, #0
	beq _08054770
	str r4, [r5, #0x64]
	b _08054878
_08054770:
	ldr r0, _08054780 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08054784
	str r0, [r5, #0x64]
	b _08054878
	.align 2, 0
_08054780: .4byte 0x0203E11C
_08054784:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	ldr r1, _080547B4 @ =0x0201FB0C
	ldr r1, [r1]
	ldr r2, _080547B8 @ =0x02000030
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	asrs r4, r1, #0x10
	mov r0, r8
	bl GetAnimPosition
	cmp r0, #0
	bne _080547C0
	movs r0, #0x40
	strh r0, [r5, #0x36]
	movs r0, #0x68
	strh r0, [r5, #0x3e]
	ldr r0, _080547BC @ =0x085F1568
	b _080547CA
	.align 2, 0
_080547B4: .4byte 0x0201FB0C
_080547B8: .4byte 0x02000030
_080547BC: .4byte 0x085F1568
_080547C0:
	movs r0, #0xb0
	strh r0, [r5, #0x36]
	movs r0, #0x68
	strh r0, [r5, #0x3e]
	ldr r0, _080547EC @ =0x085F14DC
_080547CA:
	movs r1, #5
	bl AnimCreate
	adds r1, r0, #0
	ldrh r0, [r5, #0x36]
	subs r0, r0, r4
	strh r0, [r1, #2]
	ldrh r0, [r5, #0x3e]
	strh r0, [r1, #4]
	ldr r0, _080547F0 @ =0x0201775C
	ldr r0, [r0]
	cmp r0, #1
	bne _080547F4
	movs r0, #0xd3
	lsls r0, r0, #6
	b _080547F8
	.align 2, 0
_080547EC: .4byte 0x085F14DC
_080547F0: .4byte 0x0201775C
_080547F4:
	movs r0, #0xf3
	lsls r0, r0, #6
_080547F8:
	strh r0, [r1, #8]
	str r1, [r5, #0x64]
	ldr r4, _08054884 @ =0x0200003C
	mov r0, r8
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _08054888 @ =0x06011800
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterDataMove
	ldr r4, _0805488C @ =0x0203E114
	mov r0, sb
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x39
	bne _0805483E
	ldr r4, _08054890 @ =0x0200004C
	mov r0, sb
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _08054894 @ =0x02016828
	movs r2, #8
	bl sub_80D636C
_0805483E:
	ldr r4, _08054890 @ =0x0200004C
	mov r0, r8
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _08054898 @ =0x02022B08
	movs r2, #8
	bl sub_80D636C
	bl sub_8001EE4
	ldr r0, _0805489C @ =0x0203E11C
	movs r1, #0
	ldrsh r4, [r0, r1]
	mov r0, r8
	bl GetAnimPosition
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_805BD44
	ldr r0, _080548A0 @ =0x0201FB0C
	ldr r0, [r0]
	bl sub_8054304
_08054878:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054884: .4byte 0x0200003C
_08054888: .4byte 0x06011800
_0805488C: .4byte 0x0203E114
_08054890: .4byte 0x0200004C
_08054894: .4byte 0x02016828
_08054898: .4byte 0x02022B08
_0805489C: .4byte 0x0203E11C
_080548A0: .4byte 0x0201FB0C


	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set EkrDispUP_SetPositionSync, 0x08052854 + 1
	.set EkrGauge_Setxy323A, 0x08051F18 + 1
	.set Proc_End, 0x08002CBC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056984, 0x08056984 + 1
	.section .text.sub_8072974, "ax", %progbits
@ sub_8072974 @ JP 0x08072974 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8072974
	.thumb_func
sub_8072974:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	ldr r0, [r0, #0x5c]
	mov sb, r0
	ldr r4, _08072AFC @ =0x02017760
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #2
	bl BG_SetPosition
	ldr r7, _08072B00 @ =0x02000038
	ldrh r1, [r7]
	ldrh r2, [r4]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r7, #2]
	ldrh r3, [r4, #2]
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl BG_SetPosition
	ldrh r0, [r7]
	ldrh r1, [r4]
	adds r0, r0, r1
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r7, #2]
	ldrh r2, [r4, #2]
	adds r1, r1, r2
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_Setxy323A
	ldrh r0, [r7]
	ldrh r3, [r4]
	adds r0, r0, r3
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r7, #2]
	ldrh r2, [r4, #2]
	adds r1, r1, r2
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #3
	bl BG_SetPosition
	ldr r3, _08072B04 @ =0x02000028
	ldrh r0, [r3]
	ldrh r1, [r4]
	subs r0, r0, r1
	ldr r2, _08072B08 @ =0x0201FB0C
	ldr r3, [r2]
	subs r0, r0, r3
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	ldr r2, _08072B0C @ =0x0200002C
	ldrh r0, [r2]
	ldrh r2, [r4, #2]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	ldr r4, _08072B04 @ =0x02000028
	ldrh r4, [r4, #2]
	adds r1, r1, r4
	subs r1, r1, r3
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
	ldr r1, _08072B0C @ =0x0200002C
	ldrh r0, [r1, #2]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	movs r0, #0
	adds r1, r6, #0
	mov r2, r8
	bl sub_8056984
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_8056984
	mov r2, sb
	cmp r2, #0
	beq _08072A44
	strh r6, [r2, #0x32]
	mov r3, r8
	strh r3, [r2, #0x3a]
_08072A44:
	mov r4, sl
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _08072AEC
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldrh r1, [r7]
	ldrh r2, [r7, #2]
	movs r0, #0
	bl BG_SetPosition
	ldrh r0, [r7]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r7, #2]
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_Setxy323A
	ldrh r0, [r7]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r7, #2]
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r3, _08072B08 @ =0x0201FB0C
	ldr r1, [r3]
	ldr r4, _08072B04 @ =0x02000028
	ldrh r0, [r4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	ldr r0, _08072B0C @ =0x0200002C
	movs r2, #0
	ldrsh r7, [r0, r2]
	ldrh r0, [r4, #2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	ldr r3, _08072B0C @ =0x0200002C
	movs r0, #2
	ldrsh r4, [r3, r0]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl sub_8056984
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_8056984
	mov r1, sb
	cmp r1, #0
	beq _08072ADE
	strh r6, [r1, #0x32]
	strh r7, [r1, #0x3a]
_08072ADE:
	mov r2, sl
	ldr r0, [r2, #0x60]
	bl Proc_End
	mov r0, sl
	bl sub_8002DE4
_08072AEC:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072AFC: .4byte 0x02017760
_08072B00: .4byte 0x02000038
_08072B04: .4byte 0x02000028
_08072B08: .4byte 0x0201FB0C
_08072B0C: .4byte 0x0200002C


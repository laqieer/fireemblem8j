	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set EkrDispUP_SetPositionSync, 0x08052854 + 1
	.set EkrGauge_Setxy323A, 0x08051F18 + 1
	.set FillBGRect, 0x080732A0 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetBanimDragonStatusType, 0x08072060 + 1
	.set Proc_End, 0x08002CBC + 1
	.set SetEkrBg2QuakeVec, 0x08052F0C + 1
	.set sub_8054304, 0x08054304 + 1
	.set sub_8056984, 0x08056984 + 1
	.set sub_805BBFC, 0x0805BBFC + 1
	.section .text.sub_80548A4, "ax", %progbits
@ sub_80548A4 @ JP 0x080548A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80548A4
	.thumb_func
sub_80548A4:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, [r7, #0x44]
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, _080548F4 @ =0x00007FFF
	cmp r1, r0
	beq _080548C4
	b _080549D8
_080548C4:
	movs r0, #0
	movs r1, #0
	bl SetEkrBg2QuakeVec
	ldr r0, _080548F8 @ =0x0203E11C
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bne _080548FC
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl GetBanimDragonStatusType
	cmp r0, #0
	beq _0805491E
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	b _0805491E
	.align 2, 0
_080548F4: .4byte 0x00007FFF
_080548F8: .4byte 0x0203E11C
_080548FC:
	cmp r0, #0
	blt _0805491E
	cmp r0, #2
	bgt _0805491E
	bl GetBanimDragonStatusType
	cmp r0, #0
	beq _08054916
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
_08054916:
	ldr r0, _080549C0 @ =0x0201FB0C
	ldr r0, [r0]
	bl sub_8054304
_0805491E:
	ldr r0, [r7, #0x64]
	cmp r0, #0
	beq _0805492E
	bl AnimDelete
	ldr r0, _080549C4 @ =0x0201FADC
	bl sub_805BBFC
_0805492E:
	ldr r3, _080549C8 @ =0x02000028
	movs r4, #0
	ldrsh r2, [r3, r4]
	ldr r0, _080549C0 @ =0x0201FB0C
	ldr r1, [r0]
	subs r6, r2, r1
	ldr r2, _080549CC @ =0x0200002C
	movs r5, #2
	ldrsh r0, [r3, r5]
	subs r4, r0, r1
	movs r0, #2
	ldrsh r5, [r2, r0]
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r2, r3]
	movs r0, #0
	bl sub_8056984
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	adds r2, r5, #0
	movs r0, #1
	bl sub_8056984
	ldr r1, _080549D0 @ =0x02017740
	movs r0, #0
	str r0, [r1]
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _080549B6
	bl GetBanimDragonStatusType
	cmp r0, #0
	beq _08054982
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
_08054982:
	ldr r4, _080549D4 @ =0x02000038
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #0
	bl BG_SetPosition
	ldrh r0, [r4]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_Setxy323A
	ldrh r0, [r4]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
_080549B6:
	adds r0, r7, #0
	bl Proc_End
	b _08054BEA
	.align 2, 0
_080549C0: .4byte 0x0201FB0C
_080549C4: .4byte 0x0201FADC
_080549C8: .4byte 0x02000028
_080549CC: .4byte 0x0200002C
_080549D0: .4byte 0x02017740
_080549D4: .4byte 0x02000038
_080549D8:
	movs r6, #0x2c
	ldrsh r4, [r7, r6]
	cmp r4, #0
	bne _08054A04
	ldr r0, [r7, #0x64]
	cmp r0, #0
	beq _08054A04
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	adds r1, r0, #0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08054A58 @ =0x02023F68
	adds r0, r0, r1
	str r4, [sp]
	movs r1, #0xf
	movs r2, #5
	movs r3, #0
	bl FillBGRect
_08054A04:
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r2, #0
	ldrsh r4, [r0, r2]
	movs r3, #2
	ldrsh r5, [r0, r3]
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetEkrBg2QuakeVec
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	ldr r0, [r7, #0x64]
	cmp r0, #0
	beq _08054A68
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	ldr r1, _08054A5C @ =0x0201FB0C
	ldr r1, [r1]
	ldr r2, _08054A60 @ =0x02000030
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r3, [r7, #0x64]
	ldr r2, _08054A64 @ =0x02017760
	ldrh r0, [r2]
	ldrh r6, [r7, #0x36]
	adds r0, r0, r6
	subs r0, r0, r1
	strh r0, [r3, #2]
	ldrh r0, [r7, #0x3e]
	ldrh r1, [r2, #2]
	subs r0, r0, r1
	strh r0, [r3, #4]
	b _08054A74
	.align 2, 0
_08054A58: .4byte 0x02023F68
_08054A5C: .4byte 0x0201FB0C
_08054A60: .4byte 0x02000030
_08054A64: .4byte 0x02017760
_08054A68:
	ldr r0, _08054B28 @ =0x02017760
	ldrh r1, [r0]
	ldrh r2, [r0, #2]
	movs r0, #2
	bl BG_SetPosition
_08054A74:
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _08054AEC
	bl GetBanimDragonStatusType
	cmp r0, #0
	beq _08054A96
	rsbs r1, r4, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	bl BG_SetPosition
_08054A96:
	ldr r5, _08054B28 @ =0x02017760
	ldr r4, _08054B2C @ =0x02000038
	ldrh r1, [r4]
	ldrh r0, [r5]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r4, #2]
	ldrh r3, [r5, #2]
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl BG_SetPosition
	ldrh r0, [r4]
	ldrh r6, [r5]
	adds r0, r0, r6
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	ldrh r2, [r5, #2]
	adds r1, r1, r2
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_Setxy323A
	ldrh r0, [r4]
	ldrh r3, [r5]
	adds r0, r0, r3
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	ldrh r5, [r5, #2]
	adds r1, r1, r5
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
_08054AEC:
	bl GetBanimDragonStatusType
	cmp r0, #0
	beq _08054B00
	ldr r0, _08054B28 @ =0x02017760
	ldrh r1, [r0]
	ldrh r2, [r0, #2]
	movs r0, #3
	bl BG_SetPosition
_08054B00:
	bl GetBanimDragonStatusType
	cmp r0, #0
	beq _08054B3C
	ldr r4, _08054B30 @ =0x02000028
	mov ip, r4
	movs r5, #0
	ldrsh r1, [r4, r5]
	ldr r2, _08054B28 @ =0x02017760
	movs r6, #0
	ldrsh r0, [r2, r6]
	subs r1, r1, r0
	ldr r4, _08054B34 @ =0x0201FB0C
	ldr r0, [r4]
	subs r6, r1, r0
	ldr r3, _08054B38 @ =0x0200002C
	movs r0, #0
	ldrsh r1, [r3, r0]
	b _08054B58
	.align 2, 0
_08054B28: .4byte 0x02017760
_08054B2C: .4byte 0x02000038
_08054B30: .4byte 0x02000028
_08054B34: .4byte 0x0201FB0C
_08054B38: .4byte 0x0200002C
_08054B3C:
	ldr r6, _08054BA4 @ =0x02000028
	mov ip, r6
	movs r0, #0
	ldrsh r1, [r6, r0]
	ldr r2, _08054BA8 @ =0x02017760
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r1, r1, r0
	ldr r4, _08054BAC @ =0x0201FB0C
	ldr r0, [r4]
	subs r6, r1, r0
	ldr r3, _08054BB0 @ =0x0200002C
	movs r5, #0
	ldrsh r1, [r3, r5]
_08054B58:
	movs r5, #2
	ldrsh r0, [r2, r5]
	subs r1, r1, r0
	mov r8, r1
	mov r5, ip
	movs r1, #2
	ldrsh r0, [r5, r1]
	movs r5, #0
	ldrsh r1, [r2, r5]
	adds r0, r0, r1
	ldr r1, [r4]
	subs r4, r0, r1
	movs r0, #2
	ldrsh r1, [r3, r0]
	movs r3, #2
	ldrsh r0, [r2, r3]
	subs r5, r1, r0
	ldr r0, _08054BB4 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08054BB8
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl sub_8056984
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl sub_8056984
	b _08054BEA
	.align 2, 0
_08054BA4: .4byte 0x02000028
_08054BA8: .4byte 0x02017760
_08054BAC: .4byte 0x0201FB0C
_08054BB0: .4byte 0x0200002C
_08054BB4: .4byte 0x0203E11C
_08054BB8:
	cmp r0, #0
	blt _08054BEA
	cmp r0, #2
	bgt _08054BEA
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08054BDC
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	mov r4, r8
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl sub_8056984
	b _08054BEA
_08054BDC:
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl sub_8056984
_08054BEA:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0


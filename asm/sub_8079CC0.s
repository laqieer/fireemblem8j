	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set EkrDispUP_SetPositionSync, 0x08052854 + 1
	.set EkrGauge_Setxy323A, 0x08051F18 + 1
	.set Proc_End, 0x08002CBC + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8054364, 0x08054364 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.set sub_80799A8, 0x080799A8 + 1
	.set sub_8079AFC, 0x08079AFC + 1
	.set sub_8079B60, 0x08079B60 + 1
	.set sub_8079ED0, 0x08079ED0 + 1
	.set sub_807A2D0, 0x0807A2D0 + 1
	.section .text.sub_8079CC0, "ax", %progbits
@ sub_8079CC0 @ JP 0x08079CC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8079CC0
	.thumb_func
sub_8079CC0:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r7, #0
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	movs r0, #0xc5
	lsls r0, r0, #1
	cmp r1, r0
	bgt _08079CE0
	ldr r1, _08079EB0 @ =0x02017760
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl sub_8079B60
_08079CE0:
	ldr r5, _08079EB0 @ =0x02017760
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #2
	bl BG_SetPosition
	ldr r6, _08079EB4 @ =0x02000038
	ldrh r1, [r6]
	ldrh r0, [r5]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r6, #2]
	ldrh r0, [r5, #2]
	adds r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl BG_SetPosition
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	bl sub_807A2D0
	ldrh r0, [r6]
	ldrh r1, [r5]
	adds r0, r0, r1
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r6, #2]
	ldrh r2, [r5, #2]
	adds r1, r1, r2
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_Setxy323A
	ldrh r0, [r6]
	ldrh r1, [r5]
	adds r0, r0, r1
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r6, #2]
	ldrh r2, [r5, #2]
	adds r1, r1, r2
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _08079D74
	movs r0, #0xc
	movs r1, #0
	bl sub_8054364
	str r0, [r4, #0x54]
	movs r0, #0xa1
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl sub_8074E80
_08079D74:
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0x78
	bne _08079D8C
	ldr r0, [r4, #0x54]
	bl Proc_End
	movs r0, #0xd
	movs r1, #0
	bl sub_8054364
	str r0, [r4, #0x54]
_08079D8C:
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r0, #0xb4
	bne _08079DA4
	ldr r0, [r4, #0x54]
	bl Proc_End
	movs r0, #0xe
	movs r1, #0
	bl sub_8054364
	str r0, [r4, #0x54]
_08079DA4:
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0xe6
	bne _08079DCA
	strh r7, [r4, #0x3a]
	strh r7, [r4, #0x3c]
	ldr r0, [r4, #0x5c]
	bl sub_80799A8
	str r0, [r4, #0x64]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #2]
	strh r1, [r0, #0x32]
	ldr r2, [r4, #0x64]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #4]
	ldrh r1, [r4, #0x3a]
	subs r0, r0, r1
	strh r0, [r2, #0x3a]
_08079DCA:
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r0, #0xe7
	bne _08079DE8
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	movs r1, #8
	rsbs r1, r1, #0
	ldr r2, _08079EB8 @ =0x0884C320
	bl sub_8079AFC
	movs r0, #0
	movs r1, #0
	bl sub_8079B60
_08079DE8:
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r0, #0xe5
	ble _08079E14
	ldr r1, [r4, #0x64]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #0x32]
	ldr r1, [r4, #0x64]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #4]
	strh r0, [r1, #0x3a]
	ldr r2, [r4, #0x64]
	ldrh r0, [r2, #0x32]
	ldrh r1, [r5]
	subs r0, r0, r1
	strh r0, [r2, #0x32]
	ldr r2, [r4, #0x64]
	ldrh r0, [r2, #0x3a]
	ldrh r1, [r5, #2]
	subs r0, r0, r1
	strh r0, [r2, #0x3a]
_08079E14:
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0xf0
	bne _08079E26
	movs r0, #0x7d
	movs r1, #0x1e
	movs r2, #0x78
	bl sub_8079ED0
_08079E26:
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	ldr r0, _08079EBC @ =0x0000018B
	cmp r1, r0
	bne _08079E92
	ldr r0, [r4, #0x64]
	bl Proc_End
	ldr r0, [r4, #0x54]
	bl Proc_End
	strh r7, [r5]
	strh r7, [r5, #2]
	ldr r0, _08079EC0 @ =0x020244A8
	ldr r1, _08079EC4 @ =0x0000601F
	bl sub_80011D0
	movs r0, #8
	bl BG_EnableSyncByMask
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldrh r1, [r6]
	ldrh r2, [r6, #2]
	movs r0, #0
	bl BG_SetPosition
	movs r0, #0
	movs r1, #0
	bl sub_807A2D0
	ldrh r0, [r6]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r6, #2]
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_Setxy323A
	ldrh r0, [r6]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r6, #2]
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
_08079E92:
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	ldr r0, _08079EC8 @ =0x00000203
	cmp r1, r0
	bne _08079EAA
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_08079EAA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079EB0: .4byte 0x02017760
_08079EB4: .4byte 0x02000038
_08079EB8: .4byte 0x0884C320
_08079EBC: .4byte 0x0000018B
_08079EC0: .4byte 0x020244A8
_08079EC4: .4byte 0x0000601F
_08079EC8: .4byte 0x00000203


	.syntax unified
	.set AnimCreate, 0x08004E50 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80D636C, 0x080D636C + 1
	.set sub_80D6390, 0x080D6390 + 1
	.section .text.sub_8057424, "ax", %progbits
@ sub_8057424 @ JP 0x08057424 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8057424
	.thumb_func
sub_8057424:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	ldr r1, _08057480 @ =0x03003020
	adds r1, #0x3d
	ldrb r0, [r1]
	movs r2, #0x20
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _08057484 @ =0x0203E11E
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r4, #4
	ldrsh r2, [r0, r4]
	cmp r3, r2
	bne _08057488
	movs r2, #2
	ldrsh r1, [r0, r2]
	movs r3, #6
	ldrsh r0, [r0, r3]
	movs r4, #2
	cmp r1, r0
	blt _080574B4
	movs r4, #6
	b _080574B4
	.align 2, 0
_08057480: .4byte 0x03003020
_08057484: .4byte 0x0203E11E
_08057488:
	movs r4, #2
	ldrsh r1, [r0, r4]
	movs r4, #6
	ldrsh r0, [r0, r4]
	cmp r1, r0
	bne _0805749E
	movs r4, #4
	cmp r3, r2
	bge _080574B4
	movs r4, #0
	b _080574B4
_0805749E:
	cmp r3, r2
	bge _080574AC
	movs r4, #1
	cmp r1, r0
	blt _080574B4
	movs r4, #7
	b _080574B4
_080574AC:
	movs r4, #3
	cmp r1, r0
	blt _080574B4
	movs r4, #5
_080574B4:
	ldr r0, _080574C8 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #3
	bgt _080574CC
	cmp r0, #1
	bge _080574D8
	cmp r0, #0
	beq _080574D0
	b _080574D8
	.align 2, 0
_080574C8: .4byte 0x0203E11C
_080574CC:
	cmp r0, #4
	bne _080574D8
_080574D0:
	ldr r0, _080574D4 @ =0x085E3DB4
	b _080574DA
	.align 2, 0
_080574D4: .4byte 0x085E3DB4
_080574D8:
	ldr r0, _0805750C @ =0x085E3DD4
_080574DA:
	lsls r1, r4, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r6, r1, #0
	ldr r1, _08057510 @ =0x06010000
	bl sub_80D6390
	ldr r0, _08057514 @ =0x080E186C
	ldr r1, _08057518 @ =0x02022B28
	movs r2, #1
	bl sub_80D636C
	bl sub_8001EE4
	ldr r0, _0805751C @ =0x0203E11C
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #4
	bls _08057502
	b _080577DE
_08057502:
	lsls r0, r0, #2
	ldr r1, _08057520 @ =_08057524
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805750C: .4byte 0x085E3DD4
_08057510: .4byte 0x06010000
_08057514: .4byte 0x080E186C
_08057518: .4byte 0x02022B28
_0805751C: .4byte 0x0203E11C
_08057520: .4byte _08057524
_08057524: @ jump table
	.4byte _08057538 @ case 0
	.4byte _080575D8 @ case 1
	.4byte _080575D8 @ case 2
	.4byte _08057744 @ case 3
	.4byte _08057538 @ case 4
_08057538:
	ldr r0, _08057588 @ =0x085E3D9C
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r7, [r5, #0x44]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x2c]
	movs r0, #0xb
	strh r0, [r5, #0x2e]
	ldr r2, _0805758C @ =0x0203E11E
	movs r3, #0
	ldrsh r0, [r2, r3]
	movs r4, #4
	ldrsh r1, [r2, r4]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r5, #0x32]
	movs r1, #2
	ldrsh r0, [r2, r1]
	movs r3, #6
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r5, #0x3a]
	movs r0, #0x78
	strh r0, [r5, #0x34]
	movs r0, #0x68
	strh r0, [r5, #0x3c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _08057594
	ldr r0, _08057590 @ =0x085E3DF4
	b _08057596
	.align 2, 0
_08057588: .4byte 0x085E3D9C
_0805758C: .4byte 0x0203E11E
_08057590: .4byte 0x085E3DF4
_08057594:
	ldr r0, _080575C4 @ =0x085E3E54
_08057596:
	adds r0, r6, r0
	ldr r0, [r0]
	movs r1, #0x64
	bl AnimCreate
	adds r2, r0, #0
	str r2, [r5, #0x5c]
	movs r0, #0x90
	lsls r0, r0, #7
	strh r0, [r2, #8]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _080575C8
	ldrh r0, [r5, #0x32]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3a]
	b _080575CE
	.align 2, 0
_080575C4: .4byte 0x085E3E54
_080575C8:
	ldrh r0, [r5, #0x34]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3c]
_080575CE:
	strh r0, [r2, #4]
	ldr r0, _080575D4 @ =0x085E3EB4
	b _080577D2
	.align 2, 0
_080575D4: .4byte 0x085E3EB4
_080575D8:
	ldr r0, _08057634 @ =0x085E3D9C
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r7, [r5, #0x44]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x2c]
	movs r0, #0xb
	strh r0, [r5, #0x2e]
	ldr r1, _08057638 @ =0x0203E11E
	movs r4, #0
	ldrsh r0, [r1, r4]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x32]
	movs r2, #2
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x3a]
	movs r2, #0x48
	strh r2, [r5, #0x34]
	movs r0, #0x68
	strh r0, [r5, #0x3c]
	ldr r0, _0805763C @ =0x02017744
	ldr r0, [r0]
	cmp r0, #1
	bne _0805762A
	ldr r1, _08057640 @ =0x080DFF38
	ldr r0, _08057644 @ =0x0203E11C
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, r2, r0
	strh r0, [r5, #0x34]
_0805762A:
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _0805764C
	ldr r0, _08057648 @ =0x085E3E14
	b _0805764E
	.align 2, 0
_08057634: .4byte 0x085E3D9C
_08057638: .4byte 0x0203E11E
_0805763C: .4byte 0x02017744
_08057640: .4byte 0x080DFF38
_08057644: .4byte 0x0203E11C
_08057648: .4byte 0x085E3E14
_0805764C:
	ldr r0, _0805767C @ =0x085E3E74
_0805764E:
	adds r0, r6, r0
	ldr r0, [r0]
	movs r1, #0x64
	bl AnimCreate
	adds r2, r0, #0
	str r2, [r5, #0x5c]
	movs r0, #0x90
	lsls r0, r0, #7
	strh r0, [r2, #8]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _08057680
	ldrh r0, [r5, #0x32]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3a]
	b _08057686
	.align 2, 0
_0805767C: .4byte 0x085E3E74
_08057680:
	ldrh r0, [r5, #0x34]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3c]
_08057686:
	strh r0, [r2, #4]
	ldr r0, _080576F4 @ =0x085E3ED4
	adds r0, r6, r0
	ldr r0, [r0]
	str r0, [r5, #0x60]
	movs r4, #0
	strh r4, [r5, #0x3e]
	strh r4, [r5, #0x36]
	ldr r0, _080576F8 @ =0x085E3D9C
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r7, [r5, #0x44]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	strh r4, [r5, #0x2c]
	movs r0, #0xb
	strh r0, [r5, #0x2e]
	ldr r1, _080576FC @ =0x0203E11E
	movs r4, #4
	ldrsh r0, [r1, r4]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x32]
	movs r2, #6
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x3a]
	movs r0, #0xa8
	strh r0, [r5, #0x34]
	movs r0, #0x68
	strh r0, [r5, #0x3c]
	ldr r0, _08057700 @ =0x02017744
	ldr r0, [r0]
	cmp r0, #0
	bne _080576E8
	ldr r1, _08057704 @ =0x080DFF38
	ldr r0, _08057708 @ =0x0203E11C
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #0xa8
	strh r0, [r5, #0x34]
_080576E8:
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _08057710
	ldr r0, _0805770C @ =0x085E3E34
	b _08057712
	.align 2, 0
_080576F4: .4byte 0x085E3ED4
_080576F8: .4byte 0x085E3D9C
_080576FC: .4byte 0x0203E11E
_08057700: .4byte 0x02017744
_08057704: .4byte 0x080DFF38
_08057708: .4byte 0x0203E11C
_0805770C: .4byte 0x085E3E34
_08057710:
	ldr r0, _08057740 @ =0x085E3E94
_08057712:
	adds r0, r6, r0
	ldr r0, [r0]
	movs r1, #0x64
	bl AnimCreate
	adds r2, r0, #0
	str r2, [r5, #0x5c]
	movs r0, #0x90
	lsls r0, r0, #7
	strh r0, [r2, #8]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _080577C8
	ldrh r0, [r5, #0x32]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3a]
	b _080577CE
	.align 2, 0
_08057740: .4byte 0x085E3E94
_08057744:
	ldr r0, _08057788 @ =0x085E3D9C
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r7, [r5, #0x44]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x2c]
	movs r0, #0xb
	strh r0, [r5, #0x2e]
	ldr r1, _0805778C @ =0x0203E11E
	movs r4, #4
	ldrsh r0, [r1, r4]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x32]
	movs r2, #6
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x3a]
	movs r0, #0x78
	strh r0, [r5, #0x34]
	movs r0, #0x68
	strh r0, [r5, #0x3c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _08057794
	ldr r0, _08057790 @ =0x085E3E34
	b _08057796
	.align 2, 0
_08057788: .4byte 0x085E3D9C
_0805778C: .4byte 0x0203E11E
_08057790: .4byte 0x085E3E34
_08057794:
	ldr r0, _080577C4 @ =0x085E3E94
_08057796:
	adds r0, r6, r0
	ldr r0, [r0]
	movs r1, #0x64
	bl AnimCreate
	adds r2, r0, #0
	str r2, [r5, #0x5c]
	movs r0, #0x90
	lsls r0, r0, #7
	strh r0, [r2, #8]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _080577C8
	ldrh r0, [r5, #0x32]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3a]
	b _080577CE
	.align 2, 0
_080577C4: .4byte 0x085E3E94
_080577C8:
	ldrh r0, [r5, #0x34]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3c]
_080577CE:
	strh r0, [r2, #4]
	ldr r0, _080577E8 @ =0x085E3EF4
_080577D2:
	adds r0, r6, r0
	ldr r0, [r0]
	str r0, [r5, #0x60]
	movs r0, #0
	strh r0, [r5, #0x3e]
	strh r0, [r5, #0x36]
_080577DE:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080577E8: .4byte 0x085E3EF4


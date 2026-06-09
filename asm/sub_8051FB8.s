	.syntax unified
	.set AnimDisplay, 0x08004F3C + 1
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set CheckEkrHitNow, 0x08052FEC + 1
	.set EfxTmCpyBG, 0x080733B8 + 1
	.set EfxTmReplacePal, 0x08073228 + 1
	.set EkrBuildGaugeBarTiles, 0x0807356C + 1
	.set EkrGauge_BuildHpBarGfx, 0x08051B74 + 1
	.set EkrGauge_SetWtaArrowSprite, 0x08051F6C + 1
	.set FillBGRect, 0x080732A0 + 1
	.set RegisterDataMove, 0x08001F64 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8073D00, 0x08073D00 + 1
	.set sub_80D636C, 0x080D636C + 1
	.set sub_80D6370, 0x080D6370 + 1
	.set sub_80D6374, 0x080D6374 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_8051FB8, "ax", %progbits
@ sub_8051FB8 @ JP 0x08051FB8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8051FB8
	.thumb_func
sub_8051FB8:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x124
	mov sl, r0
	movs r0, #0
	str r0, [sp, #0xe4]
	bl sub_8000CD8
	lsrs r0, r0, #3
	movs r1, #3
	bl sub_80D637C
	str r0, [sp, #0xf4]
	mov r0, sl
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	bne _08051FE4
	b _08052778
_08051FE4:
	mov r0, sl
	adds r0, #0x29
	ldrb r1, [r0]
	str r0, [sp, #0x110]
	cmp r1, #0
	beq _08051FF2
	b _080520F8
_08051FF2:
	mov r1, sl
	ldrh r0, [r1, #0x3a]
	lsls r0, r0, #0x10
	asrs r4, r0, #0x13
	lsls r0, r4, #5
	movs r2, #0xd0
	lsls r2, r2, #1
	adds r7, r0, r2
	cmp r7, #0
	bge _08052008
	movs r7, #0
_08052008:
	adds r6, r4, #7
	cmp r6, #7
	ble _08052010
	movs r6, #7
_08052010:
	movs r0, #7
	subs r0, r0, r6
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	mov r8, r1
	ldr r0, _08052034 @ =0x0203E11C
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	blt _08052038
	cmp r0, #2
	bgt _08052038
	movs r4, #0
	mov sb, r4
	movs r5, #0xf
	str r5, [sp, #0xe8]
	b _0805203E
	.align 2, 0
_08052034: .4byte 0x0203E11C
_08052038:
	movs r0, #8
	str r0, [sp, #0xe8]
	mov sb, r0
_0805203E:
	ldr r4, _080520A8 @ =0x02022FE8
	movs r1, #0x80
	str r1, [sp]
	adds r0, r4, #0
	movs r1, #0x1e
	movs r2, #8
	movs r3, #0
	bl FillBGRect
	mov r2, sl
	ldr r0, [r2, #0x4c]
	cmp r0, #0
	bne _08052090
	ldr r0, _080520AC @ =0x088567CC
	add r0, r8
	lsls r5, r7, #1
	mov r3, sb
	lsls r1, r3, #1
	ldr r3, _080520B0 @ =0xFFFFFCC0
	adds r2, r4, r3
	adds r1, r1, r2
	adds r5, r5, r1
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	movs r2, #0xf
	adds r3, r4, #0
	bl EfxTmCpyBG
	movs r0, #0x80
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xf
	adds r2, r4, #0
	movs r3, #2
	bl EfxTmReplacePal
_08052090:
	mov r1, sl
	ldr r0, [r1, #0x50]
	cmp r0, #0
	bne _080520F2
	ldr r0, [r1, #0x4c]
	cmp r0, #0
	bne _080520B8
	ldr r0, _080520B4 @ =0x088568A0
	mov r3, r8
	adds r2, r3, r0
	b _080520BE
	.align 2, 0
_080520A8: .4byte 0x02022FE8
_080520AC: .4byte 0x088567CC
_080520B0: .4byte 0xFFFFFCC0
_080520B4: .4byte 0x088568A0
_080520B8:
	ldr r0, _0805215C @ =0x08856980
	mov r4, r8
	adds r2, r4, r0
_080520BE:
	lsls r5, r7, #1
	ldr r1, [sp, #0xe8]
	lsls r0, r1, #1
	ldr r1, _08052160 @ =0x02022CA8
	adds r0, r0, r1
	adds r5, r5, r0
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	adds r1, r5, #0
	movs r2, #0x10
	adds r3, r4, #0
	bl EfxTmCpyBG
	movs r0, #0x80
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x10
	adds r2, r4, #0
	movs r3, #3
	bl EfxTmReplacePal
_080520F2:
	movs r0, #1
	bl BG_EnableSyncByMask
_080520F8:
	ldr r3, _08052164 @ =0x0203E1B0
	ldr r0, _08052168 @ =0x0203E1A8
	movs r4, #0
	ldrsh r2, [r3, r4]
	ldrh r4, [r0]
	movs r5, #0
	ldrsh r1, [r0, r5]
	adds r5, r0, #0
	cmp r2, r1
	beq _08052110
	movs r6, #1
	str r6, [sp, #0xe4]
_08052110:
	movs r0, #2
	ldrsh r1, [r3, r0]
	ldrh r2, [r5, #2]
	movs r6, #2
	ldrsh r0, [r5, r6]
	cmp r1, r0
	beq _08052122
	movs r0, #1
	str r0, [sp, #0xe4]
_08052122:
	strh r4, [r3]
	strh r2, [r3, #2]
	movs r2, #0
	ldrsh r1, [r5, r2]
	str r1, [sp, #0xd4]
	ldr r0, _0805216C @ =0x0203E1AC
	movs r4, #0
	ldrsh r3, [r0, r4]
	str r3, [sp, #0xd8]
	movs r1, #2
	ldrsh r6, [r5, r1]
	str r6, [sp, #0xdc]
	movs r3, #2
	ldrsh r2, [r0, r3]
	str r2, [sp, #0xe0]
	ldr r0, _08052170 @ =0x0203E11C
	movs r4, #0
	ldrsh r0, [r0, r4]
	cmp r0, #3
	beq _08052174
	cmp r0, #3
	bgt _08052194
	cmp r0, #0
	blt _08052194
	mov r6, sl
	movs r0, #0x32
	ldrsh r6, [r6, r0]
	str r6, [sp, #0xec]
	b _0805219E
	.align 2, 0
_0805215C: .4byte 0x08856980
_08052160: .4byte 0x02022CA8
_08052164: .4byte 0x0203E1B0
_08052168: .4byte 0x0203E1A8
_0805216C: .4byte 0x0203E1AC
_08052170: .4byte 0x0203E11C
_08052174:
	ldr r0, _08052188 @ =0x0203E100
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _0805218C
	mov r2, sl
	movs r3, #0x32
	ldrsh r0, [r2, r3]
	adds r0, #0x38
	b _0805219C
	.align 2, 0
_08052188: .4byte 0x0203E100
_0805218C:
	mov r4, sl
	movs r6, #0x32
	ldrsh r0, [r4, r6]
	b _0805219A
_08052194:
	mov r1, sl
	movs r2, #0x32
	ldrsh r0, [r1, r2]
_0805219A:
	subs r0, #0x38
_0805219C:
	str r0, [sp, #0xec]
_0805219E:
	ldr r3, [sp, #0x110]
	ldrb r0, [r3]
	cmp r0, #0
	bne _080521B8
	mov r4, sl
	movs r6, #0x3a
	ldrsh r4, [r4, r6]
	ldr r0, _080521B4 @ =0x0000FFF8
	ands r4, r0
	str r4, [sp, #0xf0]
	b _080521C0
	.align 2, 0
_080521B4: .4byte 0x0000FFF8
_080521B8:
	mov r0, sl
	movs r1, #0x3a
	ldrsh r0, [r0, r1]
	str r0, [sp, #0xf0]
_080521C0:
	adds r4, r5, #0
	movs r2, #0
	ldrsh r0, [r4, r2]
	movs r1, #0xa
	bl sub_80D6374
	add r3, sp, #0x68
	strh r0, [r3]
	ldrh r1, [r3]
	lsls r2, r1, #2
	adds r2, r2, r1
	lsls r2, r2, #1
	ldrh r1, [r4]
	subs r1, r1, r2
	strh r1, [r3, #2]
	lsls r0, r0, #0x10
	mov sb, r3
	cmp r0, #0
	bne _080521EA
	movs r0, #0xb
	strh r0, [r3]
_080521EA:
	movs r3, #2
	ldrsh r0, [r4, r3]
	movs r1, #0xa
	bl sub_80D6374
	mov r6, sb
	strh r0, [r6, #4]
	ldrh r1, [r6, #4]
	lsls r2, r1, #2
	adds r2, r2, r1
	lsls r2, r2, #1
	ldrh r1, [r4, #2]
	subs r1, r1, r2
	strh r1, [r6, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08052210
	movs r0, #0xb
	strh r0, [r6, #4]
_08052210:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x50
	ble _08052220
	movs r0, #0xc
	mov r2, sb
	strh r0, [r2]
	strh r0, [r2, #2]
_08052220:
	movs r3, #2
	ldrsh r0, [r5, r3]
	cmp r0, #0x50
	ble _08052230
	movs r0, #0xc
	mov r4, sb
	strh r0, [r4, #4]
	strh r0, [r4, #6]
_08052230:
	ldr r5, [sp, #0xec]
	adds r5, #9
	str r5, [sp, #0x10c]
	ldr r6, [sp, #0xf0]
	adds r6, #0x91
	str r6, [sp, #0x11c]
	ldr r0, [sp, #0xec]
	adds r0, #0x81
	str r0, [sp, #0x118]
	ldr r1, [sp, #0xd4]
	subs r1, #0x28
	str r1, [sp, #0xfc]
	ldr r2, [sp, #0xd8]
	subs r2, #0x28
	str r2, [sp, #0x100]
	ldr r3, [sp, #0xec]
	adds r3, #0x1d
	str r3, [sp, #0x114]
	ldr r4, [sp, #0xdc]
	subs r4, #0x28
	str r4, [sp, #0x104]
	ldr r5, [sp, #0xe0]
	subs r5, #0x28
	str r5, [sp, #0x108]
	ldr r6, [sp, #0xec]
	adds r6, #0x95
	str r6, [sp, #0x120]
	ldr r0, [sp, #0xe4]
	cmp r0, #1
	bne _080522C2
	add r0, sp, #0xd0
	movs r1, #0
	str r1, [r0]
	ldr r1, _080522FC @ =0x02016DC8
	ldr r2, _08052300 @ =0x01000020
	bl sub_80D636C
	movs r0, #0
_0805227C:
	adds r1, r0, #1
	mov r8, r1
	lsls r5, r0, #6
	lsls r0, r0, #2
	mov r2, sb
	adds r4, r0, r2
	movs r6, #1
_0805228A:
	ldrh r0, [r4]
	lsls r0, r0, #5
	ldr r1, _08052304 @ =0x08856C3C
	adds r0, r0, r1
	ldr r7, _080522FC @ =0x02016DC8
	adds r1, r5, r7
	movs r2, #0x10
	bl sub_80D6370
	adds r5, #0x20
	adds r4, #2
	subs r6, #1
	cmp r6, #0
	bge _0805228A
	mov r0, r8
	cmp r0, #1
	ble _0805227C
	ldr r1, _08052308 @ =0x060139C0
	adds r0, r7, #0
	movs r2, #0x40
	bl RegisterDataMove
	adds r0, r7, #0
	adds r0, #0x40
	ldr r1, _0805230C @ =0x06013DC0
	movs r2, #0x40
	bl RegisterDataMove
_080522C2:
	add r0, sp, #8
	movs r4, #0
	ldr r1, _08052310 @ =0x0000B1CE
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sl
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	add r5, sp, #0x10c
	ldrh r5, [r5]
	strh r5, [r0, #2]
	add r6, sp, #0x11c
	ldrh r6, [r6]
	strh r6, [r0, #4]
	strh r4, [r0, #0xc]
	movs r0, #0
	bl CheckEkrHitNow
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	beq _08052318
	ldr r0, _08052314 @ =0x085E35EC
	str r0, [sp, #0x44]
	str r4, [sp, #0x24]
	b _08052342
	.align 2, 0
_080522FC: .4byte 0x02016DC8
_08052300: .4byte 0x01000020
_08052304: .4byte 0x08856C3C
_08052308: .4byte 0x060139C0
_0805230C: .4byte 0x06013DC0
_08052310: .4byte 0x0000B1CE
_08052314: .4byte 0x085E35EC
_08052318:
	add r1, sp, #0x70
	str r1, [sp, #0x44]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #0x24]
	add r2, sp, #8
	adds r0, r2, #0
	ldrh r0, [r0, #2]
	subs r0, #8
	strh r0, [r2, #2]
	adds r0, r2, #0
	ldrh r0, [r0, #4]
	subs r0, #8
	strh r0, [r2, #4]
	ldr r0, _0805238C @ =0x085E35EC
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	movs r3, #0x80
	bl sub_8073D00
_08052342:
	mov r1, sl
	ldr r0, [r1, #0x4c]
	cmp r0, #0
	bne _08052350
	add r0, sp, #8
	bl AnimDisplay
_08052350:
	movs r4, #0
	str r4, [sp, #0x24]
	add r0, sp, #8
	ldr r1, _08052390 @ =0x0000C1EE
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sl
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	add r5, sp, #0x118
	ldrh r5, [r5]
	strh r5, [r0, #2]
	add r6, sp, #0x11c
	ldrh r6, [r6]
	strh r6, [r0, #4]
	strh r4, [r0, #0xc]
	movs r0, #1
	bl CheckEkrHitNow
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	beq _08052394
	ldr r0, _0805238C @ =0x085E35EC
	str r0, [sp, #0x44]
	str r4, [sp, #0x24]
	b _080523BE
	.align 2, 0
_0805238C: .4byte 0x085E35EC
_08052390: .4byte 0x0000C1EE
_08052394:
	add r1, sp, #0x70
	str r1, [sp, #0x44]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #0x24]
	add r2, sp, #8
	adds r0, r2, #0
	ldrh r0, [r0, #2]
	subs r0, #8
	strh r0, [r2, #2]
	adds r0, r2, #0
	ldrh r0, [r0, #4]
	subs r0, #8
	strh r0, [r2, #4]
	ldr r0, _08052498 @ =0x085E35EC
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	movs r3, #0x80
	bl sub_8073D00
_080523BE:
	mov r1, sl
	ldr r0, [r1, #0x50]
	cmp r0, #0
	bne _080523CC
	add r0, sp, #8
	bl AnimDisplay
_080523CC:
	ldr r2, [sp, #0xfc]
	lsls r0, r2, #0x10
	asrs r5, r0, #0x10
	ldr r3, [sp, #0x100]
	lsls r0, r3, #0x10
	asrs r6, r0, #0x10
	ldr r7, [sp, #0xd4]
	ldr r4, [sp, #0xd8]
	mov r8, r4
	cmp r5, #0x28
	ble _080523E4
	movs r5, #0x28
_080523E4:
	cmp r6, #0x28
	ble _080523EA
	movs r6, #0x28
_080523EA:
	cmp r5, #0
	bge _080523F0
	movs r5, #0
_080523F0:
	cmp r6, #0
	bge _080523F6
	movs r6, #0
_080523F6:
	cmp r7, #0x28
	ble _080523FC
	movs r7, #0x28
_080523FC:
	mov r0, r8
	cmp r0, #0x28
	ble _08052406
	movs r1, #0x28
	mov r8, r1
_08052406:
	add r0, sp, #8
	movs r3, #0
	movs r1, #0xb0
	lsls r1, r1, #8
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r4, sl
	ldr r0, [r4, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	str r3, [sp, #0x24]
	adds r0, r2, #0
	add r1, sp, #0x114
	ldrh r1, [r1]
	strh r1, [r0, #2]
	ldr r0, _0805249C @ =0x085E35B0
	str r0, [sp, #0x44]
	ldr r2, [r4, #0x4c]
	mov sb, r2
	cmp r2, #0
	bne _080524CC
	add r4, sp, #0x50
	cmp r6, #0
	beq _08052472
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl EkrBuildGaugeBarTiles
	ldr r3, [sp, #0xe4]
	cmp r3, #1
	bne _0805244E
	ldr r1, _080524A0 @ =0x02016E48
	adds r0, r4, #0
	bl EkrGauge_BuildHpBarGfx
_0805244E:
	add r1, sp, #8
	ldr r0, [sp, #0xf0]
	adds r0, #0x8e
	strh r0, [r1, #4]
	adds r2, r1, #0
	adds r0, r1, #0
	ldrh r1, [r0, #8]
	movs r0, #0xfc
	lsls r0, r0, #8
	ands r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	strh r0, [r1, #8]
	adds r0, r1, #0
	mov r5, sb
	strh r5, [r0, #0xc]
	bl AnimDisplay
_08052472:
	adds r0, r4, #0
	adds r1, r7, #0
	mov r2, r8
	bl EkrBuildGaugeBarTiles
	ldr r0, [sp, #0xe4]
	cmp r0, #1
	bne _0805248A
	ldr r1, _080524A4 @ =0x02017248
	adds r0, r4, #0
	bl EkrGauge_BuildHpBarGfx
_0805248A:
	cmp r6, #0
	beq _080524A8
	add r1, sp, #8
	ldr r0, [sp, #0xf0]
	adds r0, #0x95
	strh r0, [r1, #4]
	b _080524B0
	.align 2, 0
_08052498: .4byte 0x085E35EC
_0805249C: .4byte 0x085E35B0
_080524A0: .4byte 0x02016E48
_080524A4: .4byte 0x02017248
_080524A8:
	add r0, sp, #8
	add r1, sp, #0x11c
	ldrh r1, [r1]
	strh r1, [r0, #4]
_080524B0:
	add r2, sp, #8
	adds r0, r2, #0
	ldrh r1, [r0, #8]
	movs r0, #0xfc
	lsls r0, r0, #8
	ands r0, r1
	movs r3, #0
	movs r1, #0x20
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	strh r3, [r0, #0xc]
	bl AnimDisplay
_080524CC:
	ldr r2, [sp, #0x104]
	lsls r0, r2, #0x10
	asrs r5, r0, #0x10
	ldr r3, [sp, #0x108]
	lsls r0, r3, #0x10
	asrs r6, r0, #0x10
	ldr r7, [sp, #0xdc]
	ldr r4, [sp, #0xe0]
	mov r8, r4
	cmp r5, #0x28
	ble _080524E4
	movs r5, #0x28
_080524E4:
	cmp r6, #0x28
	ble _080524EA
	movs r6, #0x28
_080524EA:
	cmp r5, #0
	bge _080524F0
	movs r5, #0
_080524F0:
	cmp r6, #0
	bge _080524F6
	movs r6, #0
_080524F6:
	cmp r7, #0x28
	ble _080524FC
	movs r7, #0x28
_080524FC:
	mov r0, r8
	cmp r0, #0x28
	ble _08052506
	movs r1, #0x28
	mov r8, r1
_08052506:
	add r0, sp, #8
	movs r2, #0
	mov sb, r2
	movs r1, #0xc0
	lsls r1, r1, #8
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sl
	ldr r0, [r3, #0x44]
	movs r4, #0
	add r3, sp, #0xf8
	strh r4, [r3]
	orrs r0, r1
	strh r0, [r2, #8]
	mov r4, sb
	str r4, [sp, #0x24]
	adds r0, r2, #0
	add r1, sp, #0x120
	ldrh r1, [r1]
	strh r1, [r0, #2]
	ldr r0, _080525A4 @ =0x085E35B0
	str r0, [sp, #0x44]
	mov r2, sl
	ldr r2, [r2, #0x50]
	mov sb, r2
	cmp r2, #0
	bne _080525D4
	add r4, sp, #0x50
	cmp r6, #0
	beq _0805257E
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl EkrBuildGaugeBarTiles
	ldr r3, [sp, #0xe4]
	cmp r3, #1
	bne _0805255A
	ldr r1, _080525A8 @ =0x02017048
	adds r0, r4, #0
	bl EkrGauge_BuildHpBarGfx
_0805255A:
	add r1, sp, #8
	ldr r0, [sp, #0xf0]
	adds r0, #0x8e
	strh r0, [r1, #4]
	adds r2, r1, #0
	adds r0, r1, #0
	ldrh r1, [r0, #8]
	movs r0, #0xfc
	lsls r0, r0, #8
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	mov r5, sb
	strh r5, [r0, #0xc]
	bl AnimDisplay
_0805257E:
	adds r0, r4, #0
	adds r1, r7, #0
	mov r2, r8
	bl EkrBuildGaugeBarTiles
	ldr r0, [sp, #0xe4]
	cmp r0, #1
	bne _08052596
	ldr r1, _080525AC @ =0x02017448
	adds r0, r4, #0
	bl EkrGauge_BuildHpBarGfx
_08052596:
	cmp r6, #0
	beq _080525B0
	add r1, sp, #8
	ldr r0, [sp, #0xf0]
	adds r0, #0x95
	strh r0, [r1, #4]
	b _080525B8
	.align 2, 0
_080525A4: .4byte 0x085E35B0
_080525A8: .4byte 0x02017048
_080525AC: .4byte 0x02017448
_080525B0:
	add r0, sp, #8
	add r1, sp, #0x11c
	ldrh r1, [r1]
	strh r1, [r0, #4]
_080525B8:
	add r2, sp, #8
	adds r0, r2, #0
	ldrh r1, [r0, #8]
	movs r0, #0xfc
	lsls r0, r0, #8
	ands r0, r1
	movs r3, #0
	movs r1, #0x30
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	strh r3, [r0, #0xc]
	bl AnimDisplay
_080525D4:
	ldr r2, [sp, #0xe4]
	cmp r2, #1
	bne _080525E6
	ldr r0, _08052788 @ =0x02016E48
	ldr r1, _0805278C @ =0x06013000
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterDataMove
_080525E6:
	mov r3, sl
	ldr r4, [r3, #0x4c]
	cmp r4, #0
	bne _08052644
	str r4, [sp, #0x24]
	ldr r0, _08052790 @ =0x085E3604
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _08052794 @ =0x0000B1D0
	strh r1, [r0, #8]
	adds r2, r0, #0
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xec]
	adds r0, #0x12
	strh r0, [r1, #2]
	ldr r0, [sp, #0xf0]
	adds r0, #0x70
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl AnimDisplay
	str r4, [sp, #0x24]
	ldr r0, _08052798 @ =0x085E367C
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _0805279C @ =0x0000B1C0
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r5, sl
	ldr r0, [r5, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xec]
	adds r0, #0x65
	strh r0, [r1, #2]
	ldr r0, [sp, #0xf0]
	adds r0, #0x78
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl AnimDisplay
_08052644:
	mov r6, sl
	ldr r4, [r6, #0x50]
	cmp r4, #0
	bne _080526A0
	str r4, [sp, #0x24]
	ldr r0, _08052790 @ =0x085E3604
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _080527A0 @ =0x0000C1F0
	strh r1, [r0, #8]
	adds r2, r0, #0
	ldr r0, [r6, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xec]
	adds r0, #0xd8
	strh r0, [r1, #2]
	ldr r0, [sp, #0xf0]
	adds r0, #0x70
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl AnimDisplay
	str r4, [sp, #0x24]
	ldr r0, _080527A4 @ =0x085E36D0
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _080527A8 @ =0x0000C1C0
	strh r1, [r0, #8]
	adds r2, r0, #0
	ldr r0, [r6, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xec]
	adds r0, #0x87
	strh r0, [r1, #2]
	ldr r0, [sp, #0xf0]
	adds r0, #0x78
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl AnimDisplay
_080526A0:
	mov r0, sl
	ldr r4, [r0, #0x4c]
	cmp r4, #0
	bne _0805270C
	str r4, [sp, #0x24]
	ldr r1, _080527AC @ =0x0203E1D0
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r5, [sp, #0xf0]
	adds r5, #0x79
	cmp r0, #0
	beq _080526E6
	adds r1, r0, #0
	add r0, sp, #8
	ldr r2, [sp, #0xf4]
	bl EkrGauge_SetWtaArrowSprite
	add r0, sp, #8
	movs r1, #0xe5
	lsls r1, r1, #1
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r6, sl
	ldr r0, [r6, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xec]
	adds r0, #0x36
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl AnimDisplay
_080526E6:
	ldr r0, _080527B0 @ =0x085E3724
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _080527B4 @ =0x0000D1DC
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sl
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xec]
	adds r0, #0x2c
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl AnimDisplay
_0805270C:
	mov r5, sl
	ldr r4, [r5, #0x50]
	cmp r4, #0
	bne _08052778
	str r4, [sp, #0x24]
	ldr r1, _080527AC @ =0x0203E1D0
	movs r6, #2
	ldrsh r0, [r1, r6]
	ldr r5, [sp, #0xf0]
	adds r5, #0x79
	cmp r0, #0
	beq _08052752
	adds r1, r0, #0
	add r0, sp, #8
	ldr r2, [sp, #0xf4]
	bl EkrGauge_SetWtaArrowSprite
	add r0, sp, #8
	movs r1, #0xe5
	lsls r1, r1, #1
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sl
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xec]
	adds r0, #0x85
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl AnimDisplay
_08052752:
	ldr r0, _080527B0 @ =0x085E3724
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _080527B8 @ =0x0000E1DE
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r6, sl
	ldr r0, [r6, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xec]
	adds r0, #0x7b
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl AnimDisplay
_08052778:
	add sp, #0x124
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052788: .4byte 0x02016E48
_0805278C: .4byte 0x06013000
_08052790: .4byte 0x085E3604
_08052794: .4byte 0x0000B1D0
_08052798: .4byte 0x085E367C
_0805279C: .4byte 0x0000B1C0
_080527A0: .4byte 0x0000C1F0
_080527A4: .4byte 0x085E36D0
_080527A8: .4byte 0x0000C1C0
_080527AC: .4byte 0x0203E1D0
_080527B0: .4byte 0x085E3724
_080527B4: .4byte 0x0000D1DC
_080527B8: .4byte 0x0000E1DE


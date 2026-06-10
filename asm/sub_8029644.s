	.syntax unified
	.set AP_SwitchAnimation, 0x08009408 + 1
	.set AP_Update, 0x080091AC + 1
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set SetStaffUseAction, 0x080294C4 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_801C514, 0x0801C514 + 1
	.section .text.sub_8029644, "ax", %progbits
@ sub_8029644 @ JP 0x08029644 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8029644
	.thumb_func
sub_8029644:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _080296BC @ =0x0202BCAC
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	ldr r1, _080296C0 @ =0x0202E4DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	mvns r1, r1
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r6, r0, #0x1f
	bl sub_801C514
	ldr r0, _080296C4 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080296EA
	cmp r6, #0
	beq _080296D8
	adds r0, r5, #0
	bl sub_8002DE4
	ldr r1, _080296C8 @ =0x0203A954
	ldrh r0, [r4, #0x14]
	strb r0, [r1, #0x13]
	ldrh r0, [r4, #0x16]
	strb r0, [r1, #0x14]
	ldr r0, _080296CC @ =0x03004DF0
	ldr r0, [r0]
	bl SetStaffUseAction
	ldr r0, _080296D0 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r0, _080296D4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802975A
	movs r0, #0x6a
	bl m4aSongNumStart
	b _0802975A
	.align 2, 0
_080296BC: .4byte 0x0202BCAC
_080296C0: .4byte 0x0202E4DC
_080296C4: .4byte 0x085775CC
_080296C8: .4byte 0x0203A954
_080296CC: .4byte 0x03004DF0
_080296D0: .4byte 0x02023CA8
_080296D4: .4byte 0x0202BCEC
_080296D8:
	ldr r0, _08029760 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080296EA
	movs r0, #0x6c
	bl m4aSongNumStart
_080296EA:
	ldr r0, _08029764 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08029720
	adds r0, r5, #0
	movs r1, #0x63
	bl Proc_Goto
	ldr r0, _08029768 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r0, _08029760 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08029720
	movs r0, #0x6b
	bl m4aSongNumStart
_08029720:
	adds r0, r5, #0
	adds r0, #0x4a
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r4, r0, #0
	cmp r6, r1
	beq _0802973C
	ldr r0, [r5, #0x54]
	movs r1, #0
	cmp r6, #0
	bne _08029738
	movs r1, #1
_08029738:
	bl AP_SwitchAnimation
_0802973C:
	ldr r0, [r5, #0x54]
	ldr r3, _0802976C @ =0x0202BCAC
	movs r5, #0x20
	ldrsh r1, [r3, r5]
	movs r5, #0xc
	ldrsh r2, [r3, r5]
	subs r1, r1, r2
	movs r5, #0x22
	ldrsh r2, [r3, r5]
	movs r5, #0xe
	ldrsh r3, [r3, r5]
	subs r2, r2, r3
	bl AP_Update
	strh r6, [r4]
_0802975A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08029760: .4byte 0x0202BCEC
_08029764: .4byte 0x085775CC
_08029768: .4byte 0x02023CA8
_0802976C: .4byte 0x0202BCAC


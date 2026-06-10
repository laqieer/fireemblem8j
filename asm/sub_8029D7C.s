	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set SetStaffUseAction, 0x080294C4 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8015AB4, 0x08015AB4 + 1
	.set sub_801C514, 0x0801C514 + 1
	.section .text.sub_8029D7C, "ax", %progbits
@ sub_8029D7C @ JP 0x08029D7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8029D7C
	.thumb_func
sub_8029D7C:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _08029DDC @ =0x0202BCAC
	movs r0, #0x14
	ldrsh r2, [r5, r0]
	movs r1, #0x16
	ldrsh r0, [r5, r1]
	ldr r1, _08029DE0 @ =0x0202E4E0
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	movs r4, #0
	ldrsb r4, [r0, r4]
	bl sub_801C514
	ldr r0, _08029DE4 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08029E06
	cmp r4, #0
	beq _08029DF4
	ldr r0, _08029DE8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08029DC2
	movs r0, #0x6a
	bl m4aSongNumStart
_08029DC2:
	adds r0, r6, #0
	bl sub_8002DE4
	ldr r1, _08029DEC @ =0x0203A954
	ldrh r0, [r5, #0x14]
	strb r0, [r1, #0x13]
	ldrh r0, [r5, #0x16]
	strb r0, [r1, #0x14]
	ldr r0, _08029DF0 @ =0x03004DF0
	ldr r0, [r0]
	bl SetStaffUseAction
	b _08029E4C
	.align 2, 0
_08029DDC: .4byte 0x0202BCAC
_08029DE0: .4byte 0x0202E4E0
_08029DE4: .4byte 0x085775CC
_08029DE8: .4byte 0x0202BCEC
_08029DEC: .4byte 0x0203A954
_08029DF0: .4byte 0x03004DF0
_08029DF4:
	ldr r0, _08029E54 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08029E06
	movs r0, #0x6c
	bl m4aSongNumStart
_08029E06:
	ldr r0, _08029E58 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08029E3C
	ldr r0, _08029E5C @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #4
	bl BG_EnableSyncByMask
	adds r0, r6, #0
	movs r1, #0x63
	bl Proc_Goto
	ldr r0, _08029E54 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08029E3C
	movs r0, #0x6b
	bl m4aSongNumStart
_08029E3C:
	ldr r1, _08029E60 @ =0x0202BCAC
	movs r2, #0x20
	ldrsh r0, [r1, r2]
	movs r2, #0x22
	ldrsh r1, [r1, r2]
	movs r2, #1
	bl sub_8015AB4
_08029E4C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08029E54: .4byte 0x0202BCEC
_08029E58: .4byte 0x085775CC
_08029E5C: .4byte 0x02023CA8
_08029E60: .4byte 0x0202BCAC


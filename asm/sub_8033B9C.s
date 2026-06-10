	.syntax unified
	.set AP_Delete, 0x08009194 + 1
	.set AP_SwitchAnimation, 0x08009408 + 1
	.set AP_Update, 0x080091AC + 1
	.set GetUnit, 0x08019108 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set PutSprite, 0x080052F0 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_801C514, 0x0801C514 + 1
	.set sub_801D180, 0x0801D180 + 1
	.set sub_8035848, 0x08035848 + 1
	.section .text.sub_8033B9C, "ax", %progbits
@ sub_8033B9C @ JP 0x08033B9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8033B9C
	.thumb_func
sub_8033B9C:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r6, _08033C38 @ =0x0202BCAC
	movs r0, #0x16
	ldrsh r1, [r6, r0]
	ldr r0, _08033C3C @ =0x0202E4E0
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r0, r1, r0
	movs r3, #0x14
	ldrsh r2, [r6, r3]
	ldr r0, [r0]
	adds r0, r0, r2
	movs r7, #0
	ldrsb r7, [r0, r7]
	ldr r0, _08033C40 @ =0x0202E4D4
	ldr r0, [r0]
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	bl GetUnit
	bl sub_801D180
	cmp r0, #4
	bne _08033BD6
	movs r7, #0
_08033BD6:
	bl sub_801C514
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #4
	movs r2, #0xc
	ldrsh r1, [r6, r2]
	subs r5, r0, r1
	ldr r0, [r4, #0x40]
	lsls r0, r0, #4
	movs r3, #0xe
	ldrsh r1, [r6, r3]
	subs r2, r0, r1
	adds r1, r5, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08033C12
	adds r0, r2, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _08033C12
	subs r2, #0xc
	ldr r3, _08033C44 @ =0x085B8CE4
	movs r0, #6
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	bl PutSprite
_08033C12:
	ldr r0, _08033C48 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08033C64
	cmp r7, #0
	beq _08033C4C
	ldr r0, [r4, #0x54]
	bl AP_Delete
	adds r0, r4, #0
	bl sub_8002DE4
	bl sub_8035848
	b _08033CD2
	.align 2, 0
_08033C38: .4byte 0x0202BCAC
_08033C3C: .4byte 0x0202E4E0
_08033C40: .4byte 0x0202E4D4
_08033C44: .4byte 0x085B8CE4
_08033C48: .4byte 0x085775CC
_08033C4C:
	ldr r0, _08033C60 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08033CD2
	movs r0, #0x6c
	bl m4aSongNumStart
	b _08033CD2
	.align 2, 0
_08033C60: .4byte 0x0202BCEC
_08033C64:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08033C98
	ldr r0, [r4, #0x54]
	bl AP_Delete
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	bl sub_8035848
	ldr r0, _08033C94 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08033CD2
	movs r0, #0x6b
	bl m4aSongNumStart
	b _08033CD2
	.align 2, 0
_08033C94: .4byte 0x0202BCEC
_08033C98:
	adds r0, r4, #0
	adds r0, #0x4a
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r5, r0, #0
	cmp r7, r1
	beq _08033CB4
	ldr r0, [r4, #0x54]
	movs r1, #0
	cmp r7, #0
	bne _08033CB0
	movs r1, #1
_08033CB0:
	bl AP_SwitchAnimation
_08033CB4:
	ldr r0, [r4, #0x54]
	ldr r3, _08033CDC @ =0x0202BCAC
	movs r4, #0x20
	ldrsh r1, [r3, r4]
	movs r4, #0xc
	ldrsh r2, [r3, r4]
	subs r1, r1, r2
	movs r4, #0x22
	ldrsh r2, [r3, r4]
	movs r4, #0xe
	ldrsh r3, [r3, r4]
	subs r2, r2, r3
	bl AP_Update
	strh r7, [r5]
_08033CD2:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033CDC: .4byte 0x0202BCAC


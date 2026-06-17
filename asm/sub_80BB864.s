	.syntax unified
	.set ArchivePalette, 0x080135D8 + 1
	.set GetPidTitleTextId, 0x080BB1F8 + 1
	.set PutNumber, 0x08004A90 + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8003EAC, 0x08003EAC + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_80063F8, 0x080063F8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8013608, 0x08013608 + 1
	.set sub_80BB460, 0x080BB460 + 1
	.set sub_80BB7E8, 0x080BB7E8 + 1
	.section .text.sub_80BB864, "ax", %progbits
@ sub_80BB864 @ JP 0x080BB864 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SoloEndingBattleDisp_Init
	.thumb_func
SoloEndingBattleDisp_Init:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r7, r0, #0
	bl sub_80BB460
	adds r0, r7, #0
	bl sub_80BB7E8
	ldr r4, _080BB9B0 @ =0x08AC0B80
	ldr r0, [r4]
	movs r1, #0
	bl sub_80011D0
	ldr r0, [r4, #4]
	movs r1, #0
	bl sub_80011D0
	ldr r0, [r4, #8]
	movs r1, #0
	bl sub_80011D0
	ldr r0, [r4, #8]
	ldr r1, _080BB9B4 @ =0x08AC3F5C
	ldr r5, _080BB9B8 @ =0x0000C260
	adds r2, r5, #0
	bl j_TmApplyTsa
	ldr r0, [r4, #4]
	ldr r1, _080BB9BC @ =0x08AC3AA8
	adds r2, r5, #0
	bl j_TmApplyTsa
	ldr r0, [r7, #0x38]
	ldrb r0, [r0, #1]
	bl GetPidTitleTextId
	bl sub_8009FA8
	adds r5, r0, #0
	movs r0, #0x78
	adds r1, r5, #0
	bl sub_8003EAC
	adds r3, r0, #0
	ldr r6, _080BB9C0 @ =0x08AC0B90
	ldr r0, [r6]
	adds r0, #0x28
	ldr r1, [r4]
	adds r1, #0xc2
	movs r2, #0
	mov r8, r2
	str r2, [sp]
	str r5, [sp, #4]
	bl sub_8004374
	ldr r0, _080BB9C4 @ =0x000004CC
	bl sub_8009FA8
	adds r2, r0, #0
	ldr r0, [r6]
	adds r0, #0x40
	ldr r1, [r4]
	adds r1, #0x68
	mov r3, r8
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl sub_8004374
	ldr r0, _080BB9C8 @ =0x000004CD
	bl sub_8009FA8
	adds r2, r0, #0
	ldr r0, [r6]
	adds r0, #0x40
	ldr r1, [r4]
	adds r1, #0x68
	mov r3, r8
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0x20
	bl sub_8004374
	ldr r0, _080BB9CC @ =0x000004CE
	bl sub_8009FA8
	adds r2, r0, #0
	ldr r0, [r6]
	adds r0, #0x40
	ldr r1, [r4]
	adds r1, #0x68
	mov r3, r8
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0x40
	bl sub_8004374
	ldr r0, [r4]
	adds r0, #0x66
	ldrh r2, [r7, #0x3c]
	movs r1, #2
	bl PutNumber
	ldr r0, [r4]
	adds r0, #0x6e
	adds r1, r7, #0
	adds r1, #0x40
	ldrh r2, [r1]
	movs r1, #2
	bl PutNumber
	ldr r0, [r4]
	adds r0, #0x76
	adds r1, r7, #0
	adds r1, #0x44
	ldrh r2, [r1]
	movs r1, #2
	bl PutNumber
	ldr r2, _080BB9D0 @ =0x088582BC
	ldr r0, [r7, #0x38]
	ldrb r0, [r0, #1]
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r1, [r0, #6]
	movs r2, #0xd0
	lsls r2, r2, #1
	ldr r0, _080BB9D4 @ =0x00000502
	str r0, [sp]
	movs r0, #0
	movs r3, #0x38
	bl sub_80063F8
	ldr r0, [r7, #0x2c]
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080BB99C
	movs r0, #0x16
	bl ArchivePalette
	movs r3, #0x80
	lsls r3, r3, #0xf
	movs r0, #0xc0
	movs r1, #0xc0
	movs r2, #0xc0
	bl sub_8013608
_080BB99C:
	mov r0, r8
	str r0, [r7, #0x34]
	bl SetDefaultColorEffects
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BB9B0: .4byte 0x08AC0B80
_080BB9B4: .4byte 0x08AC3F5C
_080BB9B8: .4byte 0x0000C260
_080BB9BC: .4byte 0x08AC3AA8
_080BB9C0: .4byte 0x08AC0B90
_080BB9C4: .4byte 0x000004CC
_080BB9C8: .4byte 0x000004CD
_080BB9CC: .4byte 0x000004CE
_080BB9D0: .4byte 0x088582BC
_080BB9D4: .4byte 0x00000502


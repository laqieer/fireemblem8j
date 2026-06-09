	.syntax unified
	.set GetPidTitleTextId, 0x080BB1F8 + 1
	.set PutNumber, 0x08004A90 + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8003EAC, 0x08003EAC + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_80063F8, 0x080063F8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_80BB460, 0x080BB460 + 1
	.set sub_80BB7E8, 0x080BB7E8 + 1
	.section .text.sub_80BBA3C, "ax", %progbits
@ sub_80BBA3C @ JP 0x080BBA3C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BBA3C
	.thumb_func
sub_80BBA3C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	bl sub_80BB460
	mov r0, sl
	bl sub_80BB7E8
	ldr r4, _080BBC5C @ =0x08AC0B80
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
	ldr r1, _080BBC60 @ =0x08AC484C
	ldr r5, _080BBC64 @ =0x0000C260
	adds r2, r5, #0
	bl j_TmApplyTsa
	ldr r0, [r4, #4]
	ldr r1, _080BBC68 @ =0x08AC4398
	adds r2, r5, #0
	bl j_TmApplyTsa
	mov r1, sl
	ldr r0, [r1, #0x38]
	ldrb r0, [r0, #1]
	bl GetPidTitleTextId
	bl sub_8009FA8
	adds r7, r0, #0
	movs r0, #0x78
	adds r1, r7, #0
	bl sub_8003EAC
	adds r3, r0, #0
	ldr r6, _080BBC6C @ =0x08AC0B90
	ldr r0, [r6]
	adds r0, #0x28
	ldr r1, [r4]
	adds r1, #0xc2
	movs r2, #0
	mov r8, r2
	str r2, [sp]
	str r7, [sp, #4]
	bl sub_8004374
	ldr r5, _080BBC70 @ =0x000004CC
	adds r0, r5, #0
	bl sub_8009FA8
	adds r2, r0, #0
	ldr r0, [r6]
	adds r0, #0x38
	ldr r1, [r4]
	adds r1, #0x68
	mov r3, r8
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl sub_8004374
	ldr r0, _080BBC74 @ =0x000004CD
	bl sub_8009FA8
	adds r2, r0, #0
	ldr r0, [r6]
	adds r0, #0x38
	ldr r1, [r4]
	adds r1, #0x68
	mov r3, r8
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0x20
	bl sub_8004374
	ldr r0, _080BBC78 @ =0x000004CE
	mov sb, r0
	bl sub_8009FA8
	adds r2, r0, #0
	ldr r0, [r6]
	adds r0, #0x38
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
	mov r1, sl
	ldrh r2, [r1, #0x3c]
	movs r1, #2
	bl PutNumber
	ldr r0, [r4]
	adds r0, #0x6e
	mov r1, sl
	adds r1, #0x40
	ldrh r2, [r1]
	movs r1, #2
	bl PutNumber
	ldr r0, [r4]
	adds r0, #0x76
	mov r1, sl
	adds r1, #0x44
	ldrh r2, [r1]
	movs r1, #2
	bl PutNumber
	mov r2, sl
	ldr r0, [r2, #0x38]
	ldrb r0, [r0, #2]
	bl GetPidTitleTextId
	bl sub_8009FA8
	adds r7, r0, #0
	movs r0, #0x78
	adds r1, r7, #0
	bl sub_8003EAC
	adds r3, r0, #0
	ldr r0, [r6]
	adds r0, #0x30
	ldr r1, [r4]
	ldr r2, _080BBC7C @ =0x0000045C
	adds r1, r1, r2
	mov r2, r8
	str r2, [sp]
	str r7, [sp, #4]
	movs r2, #0
	bl sub_8004374
	adds r0, r5, #0
	bl sub_8009FA8
	adds r2, r0, #0
	ldr r0, [r6]
	adds r0, #0x40
	ldr r1, [r4]
	subs r5, #0x86
	adds r1, r1, r5
	mov r3, r8
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl sub_8004374
	ldr r0, _080BBC74 @ =0x000004CD
	bl sub_8009FA8
	adds r2, r0, #0
	ldr r0, [r6]
	adds r0, #0x40
	ldr r1, [r4]
	adds r1, r1, r5
	mov r3, r8
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0x20
	bl sub_8004374
	mov r0, sb
	bl sub_8009FA8
	adds r2, r0, #0
	ldr r0, [r6]
	adds r0, #0x40
	ldr r1, [r4]
	adds r1, r1, r5
	mov r3, r8
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0x40
	bl sub_8004374
	ldr r0, [r4]
	ldr r1, _080BBC80 @ =0x00000444
	adds r0, r0, r1
	mov r3, sl
	ldrh r2, [r3, #0x3e]
	movs r1, #2
	bl PutNumber
	ldr r0, [r4]
	ldr r1, _080BBC84 @ =0x0000044C
	adds r0, r0, r1
	mov r1, sl
	adds r1, #0x42
	ldrh r2, [r1]
	movs r1, #2
	bl PutNumber
	ldr r0, [r4]
	ldr r2, _080BBC88 @ =0x00000454
	adds r0, r0, r2
	mov r1, sl
	adds r1, #0x46
	ldrh r2, [r1]
	movs r1, #2
	bl PutNumber
	mov r3, r8
	mov r0, sl
	str r3, [r0, #0x34]
	bl SetDefaultColorEffects
	ldr r5, _080BBC8C @ =0x088582BC
	mov r1, sl
	ldr r0, [r1, #0x38]
	ldrb r0, [r0, #1]
	subs r0, #1
	movs r4, #0x34
	muls r0, r4, r0
	adds r0, r0, r5
	ldrh r1, [r0, #6]
	movs r2, #0x98
	lsls r2, r2, #1
	ldr r0, _080BBC90 @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r3, #0x30
	bl sub_80063F8
	mov r2, sl
	ldr r0, [r2, #0x38]
	ldrb r0, [r0, #2]
	subs r0, #1
	muls r0, r4, r0
	adds r0, r0, r5
	ldrh r1, [r0, #6]
	movs r2, #0xd0
	lsls r2, r2, #1
	ldr r0, _080BBC94 @ =0x00000502
	str r0, [sp]
	movs r0, #1
	movs r3, #0x30
	bl sub_80063F8
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BBC5C: .4byte 0x08AC0B80
_080BBC60: .4byte 0x08AC484C
_080BBC64: .4byte 0x0000C260
_080BBC68: .4byte 0x08AC4398
_080BBC6C: .4byte 0x08AC0B90
_080BBC70: .4byte 0x000004CC
_080BBC74: .4byte 0x000004CD
_080BBC78: .4byte 0x000004CE
_080BBC7C: .4byte 0x0000045C
_080BBC80: .4byte 0x00000444
_080BBC84: .4byte 0x0000044C
_080BBC88: .4byte 0x00000454
_080BBC8C: .4byte 0x088582BC
_080BBC90: .4byte 0x00000503
_080BBC94: .4byte 0x00000502


	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetFacePosition, 0x0800651C + 1
	.set __divsi3, 0x080D65F8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80A3DC8, 0x080A3DC8 + 1
	.section .text.sub_80A3F68, "ax", %progbits
@ sub_80A3F68 @ JP 0x080A3F68 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A3F68
	.thumb_func
sub_80A3F68:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	movs r5, #0xa
	subs r5, r5, r0
	lsls r0, r5, #3
	muls r0, r5, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #8
	subs r4, r4, r0
	lsls r0, r5, #4
	muls r0, r5, r0
	movs r1, #0x64
	bl __divsi3
	movs r2, #0x10
	subs r2, r2, r0
	lsls r4, r4, #3
	subs r4, #0x40
	adds r0, r6, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r4, #0
	muls r1, r0, r1
	mov r8, r1
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r7, r4, #0
	muls r7, r0, r7
	movs r1, #0x10
	subs r1, r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetBlendConfig
	mov r0, r8
	lsls r5, r0, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r7, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl BG_SetPosition
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl BG_SetPosition
	movs r0, #2
	adds r1, r5, #0
	adds r2, r4, #0
	bl BG_SetPosition
	mov r1, r8
	rsbs r0, r1, #0
	adds r1, r6, #0
	adds r1, #0x52
	strh r0, [r1]
	rsbs r1, r7, #0
	adds r2, r6, #0
	adds r2, #0x54
	strh r1, [r2]
	bl sub_80A3DC8
	adds r0, r6, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A4024
	movs r1, #0xd8
	mov r0, r8
	subs r1, r1, r0
	movs r2, #0x58
	subs r2, r2, r7
	movs r0, #0
	bl SetFacePosition
_080A4024:
	ldr r0, [r6, #0x2c]
	cmp r0, #0xa
	bne _080A407A
	adds r0, r6, #0
	bl sub_8002DE4
	ldr r4, _080A4084 @ =0x03003020
	ldrb r1, [r4, #0xc]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #0xc]
	ldrb r0, [r4, #0x10]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r2, r0
	movs r0, #2
	orrs r2, r0
	strb r2, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	ldrb r1, [r4, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
_080A407A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A4084: .4byte 0x03003020


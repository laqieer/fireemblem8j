	.syntax unified
	.set FormatTime, 0x08000D14 + 1
	.set PutSpriteExt, 0x08005330 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set __udivsi3, 0x080D67D0 + 1
	.set __umodsi3, 0x080D6848 + 1
	.section .text.sub_80AF2CC, "ax", %progbits
@ sub_80AF2CC @ JP 0x080AF2CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AF2CC
	.thumb_func
sub_80AF2CC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r4, [r0, #0x14]
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #5
	movs r1, #0xdc
	bl __divsi3
	movs r1, #0x20
	subs r1, r1, r0
	lsls r1, r1, #0x18
	movs r0, #0x92
	lsls r0, r0, #0x18
	adds r1, r1, r0
	lsrs r1, r1, #0x18
	mov sb, r1
	movs r1, #0x8f
	mov r8, r1
	adds r0, r4, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #1
	bne _080AF31A
	ldr r0, [r4, #0x54]
	mov r4, sp
	adds r4, #6
	add r5, sp, #8
	add r1, sp, #4
	adds r2, r4, #0
	adds r3, r5, #0
	bl FormatTime
	b _080AF338
_080AF31A:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	lsls r1, r1, #2
	adds r0, #0x1c
	adds r0, r0, r1
	ldr r0, [r0]
	mov r4, sp
	adds r4, #6
	add r5, sp, #8
	add r1, sp, #4
	adds r2, r4, #0
	adds r3, r5, #0
	bl FormatTime
_080AF338:
	mov sl, r4
	mov r1, r8
	adds r1, #6
	mov r2, sb
	subs r2, #0xe
	ldr r3, _080AF4AC @ =0x08A9D4BC
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
	add r0, sp, #4
	ldrh r0, [r0]
	mov r7, sb
	subs r7, #8
	cmp r0, #0x63
	bls _080AF39E
	mov r5, r8
	adds r5, #0xa
	ldr r4, _080AF4B0 @ =0x08A9D5A8
	add r0, sp, #4
	ldrh r0, [r0]
	movs r6, #0x64
	movs r1, #0x64
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	movs r0, #0xe0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	bl PutSpriteExt
	add r5, sp, #4
	adds r0, r5, #0
	ldrh r4, [r0]
	adds r0, r4, #0
	movs r1, #0x64
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	muls r0, r6, r0
	subs r4, r4, r0
	strh r4, [r5]
_080AF39E:
	add r0, sp, #4
	ldrh r0, [r0]
	cmp r0, #9
	bls _080AF3CE
	mov r5, r8
	adds r5, #0x12
	ldr r4, _080AF4B0 @ =0x08A9D5A8
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	movs r0, #0xe0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	bl PutSpriteExt
_080AF3CE:
	mov r6, r8
	adds r6, #0x1a
	ldr r5, _080AF4B0 @ =0x08A9D5A8
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r5
	ldr r3, [r0]
	movs r4, #0xe0
	lsls r4, r4, #7
	str r4, [sp]
	movs r0, #0xd
	adds r1, r6, #0
	adds r2, r7, #0
	bl PutSpriteExt
	mov r1, r8
	adds r1, #0x22
	mov r2, sb
	subs r2, #7
	ldr r3, [r5, #0x28]
	str r4, [sp]
	movs r0, #0xd
	bl PutSpriteExt
	adds r6, #0x10
	mov r1, sl
	ldrh r0, [r1]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r5
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #0xd
	adds r1, r6, #0
	adds r2, r7, #0
	bl PutSpriteExt
	adds r6, #8
	mov r1, sl
	ldrh r0, [r1]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r5
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #0xd
	adds r1, r6, #0
	adds r2, r7, #0
	bl PutSpriteExt
	mov r1, r8
	adds r1, #0x3a
	mov r2, sb
	adds r2, #1
	ldr r5, _080AF4B4 @ =0x08A9D57C
	ldr r3, [r5, #0x28]
	str r4, [sp]
	movs r0, #0xd
	bl PutSpriteExt
	adds r6, #0x10
	mov r1, sp
	ldrh r0, [r1, #8]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r5
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #0xd
	adds r1, r6, #0
	mov r2, sb
	bl PutSpriteExt
	adds r6, #8
	mov r1, sp
	ldrh r0, [r1, #8]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r5
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #0xd
	adds r1, r6, #0
	mov r2, sb
	bl PutSpriteExt
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF4AC: .4byte 0x08A9D4BC
_080AF4B0: .4byte 0x08A9D5A8
_080AF4B4: .4byte 0x08A9D57C


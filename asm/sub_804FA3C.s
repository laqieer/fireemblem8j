	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set InitText, 0x08003C8C + 1
	.set LockGame, 0x08015384 + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8050520, 0x08050520 + 1
	.set sub_80D65C4, 0x080D65C4 + 1
	.section .text.sub_804FA3C, "ax", %progbits
@ sub_804FA3C @ JP 0x0804FA3C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804FA3C
	.thumb_func
sub_804FA3C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	mov r8, r0
	mov sl, r1
	str r2, [sp]
	str r3, [sp, #4]
	ldr r4, [sp, #0x58]
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	adds r0, #1
	str r0, [sp, #0xc]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x18
	adds r0, #1
	mov sb, r0
	ldr r1, [sp, #0x50]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r2, [sp]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _0804FAA8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804FA90
	movs r0, #0x68
	bl m4aSongNumStart
_0804FA90:
	cmp r4, #0
	beq _0804FAB0
	ldr r0, _0804FAAC @ =0x085E06B0
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x63
	movs r0, #0
	b _0804FAC4
	.align 2, 0
_0804FAA8: .4byte 0x0202BCEC
_0804FAAC: .4byte 0x085E06B0
_0804FAB0:
	bl LockGame
	ldr r0, _0804FC28 @ =0x085E06B0
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x63
	movs r0, #1
_0804FAC4:
	strb r0, [r1]
	mov r1, sl
	asrs r0, r1, #0x18
	str r0, [sp, #0x2c]
	cmp r0, #0
	bge _0804FADC
	adds r2, r5, #0
	adds r2, #0x63
	ldrb r1, [r2]
	movs r0, #8
	orrs r0, r1
	strb r0, [r2]
_0804FADC:
	movs r7, #0
	movs r2, #0
	str r2, [sp, #8]
	mov r0, r8
	ldr r1, [r0, #8]
	ldr r0, [r1, #0xc]
	mov r2, sl
	lsls r2, r2, #0x10
	str r2, [sp, #0x28]
	adds r2, r5, #0
	adds r2, #0x60
	str r2, [sp, #0x10]
	adds r2, #1
	str r2, [sp, #0x14]
	adds r2, #1
	str r2, [sp, #0x18]
	adds r2, #2
	str r2, [sp, #0x1c]
	adds r2, #2
	str r2, [sp, #0x20]
	adds r2, #2
	str r2, [sp, #0x24]
	cmp r0, #0
	beq _0804FB9E
	movs r6, #0
_0804FB0E:
	adds r0, r1, r6
	adds r1, r7, #0
	bl sub_8050520
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0804FB30
	mov r1, r8
	ldr r0, [r1, #8]
	adds r0, r6, r0
	ldr r2, [r0, #0xc]
	adds r1, r7, #0
	bl sub_80D65C4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0804FB30:
	cmp r4, #3
	beq _0804FB8E
	ldr r0, _0804FC2C @ =0x085E06F0
	adds r1, r5, #0
	bl sub_8002BCC
	adds r2, r0, #0
	ldr r0, [sp, #8]
	lsls r1, r0, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	str r2, [r0]
	ldr r1, [sp, #8]
	adds r1, #1
	str r1, [sp, #8]
	mov r1, r8
	ldr r0, [r1, #8]
	adds r0, r0, r6
	str r0, [r2, #0x30]
	adds r0, r2, #0
	adds r0, #0x3c
	strb r7, [r0]
	adds r0, #1
	strb r4, [r0]
	mov r0, sp
	ldrh r0, [r0, #0xc]
	strh r0, [r2, #0x2a]
	mov r1, sb
	strh r1, [r2, #0x2c]
	adds r0, r5, #0
	adds r0, #0x63
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0804FB8A
	adds r0, r2, #0
	adds r0, #0x34
	mov r2, sl
	lsls r1, r2, #8
	asrs r1, r1, #0x18
	subs r1, #2
	bl InitText
_0804FB8A:
	movs r0, #2
	add sb, r0
_0804FB8E:
	adds r6, #0x24
	adds r7, #1
	mov r2, r8
	ldr r1, [r2, #8]
	adds r0, r6, r1
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _0804FB0E
_0804FB9E:
	mov r0, r8
	str r0, [r5, #0x30]
	mov r1, sl
	str r1, [r5, #0x2c]
	movs r3, #0
	mov r2, sp
	ldrb r0, [r2, #8]
	ldr r2, [sp, #0x10]
	strb r0, [r2]
	ldr r1, [sp, #0x14]
	strb r3, [r1]
	movs r0, #0xff
	ldr r2, [sp, #0x18]
	strb r0, [r2]
	ldr r0, [sp, #0x28]
	asrs r1, r0, #0x18
	ldr r2, [sp, #0x2c]
	adds r0, r1, r2
	cmp r0, sb
	bge _0804FBD2
	subs r0, r1, #1
	mov r1, sb
	subs r0, r1, r0
	adds r1, r5, #0
	adds r1, #0x2f
	strb r0, [r1]
_0804FBD2:
	movs r2, #3
	ldr r0, [sp]
	ands r0, r2
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	ldrb r1, [r0]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	ldr r1, [sp]
	orrs r0, r1
	ldr r1, [sp, #0x1c]
	strb r0, [r1]
	mov r0, sp
	ldrh r1, [r0, #4]
	ldr r0, [sp, #0x20]
	strh r1, [r0]
	ldr r0, [sp, #0x50]
	ands r0, r2
	lsls r2, r0, #2
	ldr r0, [sp, #0x1c]
	ldrb r1, [r0]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r2
	ldr r1, [sp, #0x1c]
	strb r0, [r1]
	ldr r0, [sp, #0x54]
	ldr r2, [sp, #0x24]
	strh r0, [r2]
	ldr r0, _0804FC30 @ =0x085775CC
	ldr r0, [r0]
	strh r3, [r0, #8]
	adds r0, r5, #0
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804FC28: .4byte 0x085E06B0
_0804FC2C: .4byte 0x085E06F0
_0804FC30: .4byte 0x085775CC


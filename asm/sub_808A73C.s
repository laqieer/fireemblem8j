	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set memcpy, 0x080D6908 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_80011F0, 0x080011F0 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8003508, 0x08003508 + 1
	.set sub_8003520, 0x08003520 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80156F0, 0x080156F0 + 1
	.set sub_80265CC, 0x080265CC + 1
	.set sub_804EE2C, 0x0804EE2C + 1
	.set sub_804EEBC, 0x0804EEBC + 1
	.set sub_808A0B4, 0x0808A0B4 + 1
	.section .text.sub_808A73C, "ax", %progbits
@ sub_808A73C @ JP 0x0808A73C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808A73C
	.thumb_func
sub_808A73C:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	mov sb, r0
	ldr r1, _0808A8A0 @ =0x081F54F2
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	mov r0, sp
	bl sub_8001ACC
	movs r0, #3
	bl sub_804EE2C
	movs r0, #0x80
	lsls r0, r0, #3
	bl sub_80011F0
	ldr r0, _0808A8A4 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #4
	bl BG_EnableSyncByMask
	bl sub_80156F0
	bl sub_80265CC
	ldr r0, _0808A8A8 @ =0x03003020
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r5, #0x20
	orrs r0, r5
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	adds r1, #0x2d
	movs r0, #0
	mov r8, r0
	movs r0, #0x60
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x31
	mov r1, r8
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x2c
	movs r0, #0x62
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x34
	ldrb r1, [r6]
	subs r0, #0xa2
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	mov r7, ip
	adds r7, #0x36
	ldrb r1, [r7]
	movs r2, #1
	orrs r1, r2
	movs r2, #2
	orrs r1, r2
	movs r2, #4
	orrs r1, r2
	orrs r1, r4
	orrs r1, r3
	orrs r0, r5
	strb r0, [r6]
	mov r2, ip
	adds r2, #0x35
	ldrb r0, [r2]
	orrs r0, r5
	strb r0, [r2]
	orrs r1, r5
	strb r1, [r7]
	ldr r0, _0808A8AC @ =0x08A78598
	ldr r1, _0808A8B0 @ =0x06004400
	bl sub_8013008
	ldr r0, _0808A8B4 @ =0x08A793D4
	movs r1, #0x20
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _0808A8B8 @ =0x08A792B4
	ldr r4, _0808A8BC @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _0808A8C0 @ =0x020234C0
	movs r2, #0x91
	lsls r2, r2, #5
	adds r1, r4, #0
	bl j_TmApplyTsa
	ldr r0, _0808A8C4 @ =0x08A75420
	ldr r1, _0808A8C8 @ =0x0600B000
	bl sub_8013008
	ldr r0, _0808A8CC @ =0x08A78518
	movs r1, #0xc0
	lsls r1, r1, #1
	movs r2, #0x80
	bl sub_8000D68
	ldr r0, _0808A8D0 @ =0x08A77FC8
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _0808A8D4 @ =0x020244A8
	ldr r2, _0808A8D8 @ =0x0000C180
	adds r1, r4, #0
	bl j_TmApplyTsa
	ldr r0, _0808A8DC @ =0x08A7432C
	ldr r1, _0808A8E0 @ =0x06014800
	bl sub_8013008
	movs r0, #4
	bl sub_8003508
	movs r0, #6
	bl sub_804EEBC
	movs r0, #1
	movs r1, #0x13
	bl sub_8003520
	ldr r0, _0808A8E4 @ =0x08A73FDC
	ldr r1, _0808A8E8 @ =0x06008800
	bl sub_8013008
	ldr r0, _0808A8EC @ =0x08A7429C
	movs r1, #0xe0
	movs r2, #0x20
	bl sub_8000D68
	movs r0, #1
	movs r1, #0x14
	bl sub_8003520
	ldr r0, _0808A8F0 @ =0x08A741A8
	ldr r1, _0808A8F4 @ =0x06000C00
	bl sub_8013008
	ldr r0, _0808A8F8 @ =0x02003BFC
	mov r1, r8
	str r1, [r0, #0x10]
	mov r0, sb
	bl sub_808A0B4
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808A8A0: .4byte 0x081F54F2
_0808A8A4: .4byte 0x02023CA8
_0808A8A8: .4byte 0x03003020
_0808A8AC: .4byte 0x08A78598
_0808A8B0: .4byte 0x06004400
_0808A8B4: .4byte 0x08A793D4
_0808A8B8: .4byte 0x08A792B4
_0808A8BC: .4byte 0x02020188
_0808A8C0: .4byte 0x020234C0
_0808A8C4: .4byte 0x08A75420
_0808A8C8: .4byte 0x0600B000
_0808A8CC: .4byte 0x08A78518
_0808A8D0: .4byte 0x08A77FC8
_0808A8D4: .4byte 0x020244A8
_0808A8D8: .4byte 0x0000C180
_0808A8DC: .4byte 0x08A7432C
_0808A8E0: .4byte 0x06014800
_0808A8E4: .4byte 0x08A73FDC
_0808A8E8: .4byte 0x06008800
_0808A8EC: .4byte 0x08A7429C
_0808A8F0: .4byte 0x08A741A8
_0808A8F4: .4byte 0x06000C00
_0808A8F8: .4byte 0x02003BFC


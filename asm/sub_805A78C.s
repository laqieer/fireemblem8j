	.syntax unified
	.set ApplyBanimUniquePalette, 0x0805A714 + 1
	.set GetBanimPalette, 0x0805A740 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8058AF8, 0x08058AF8 + 1
	.set sub_807395C, 0x0807395C + 1
	.set sub_80D636C, 0x080D636C + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_805A78C, "ax", %progbits
@ UpdateBanimFrame @ JP 0x0805A78C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global UpdateBanimFrame
	.thumb_func
UpdateBanimFrame:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _0805A97C @ =0x08C00008
	mov sl, r0
	ldr r1, _0805A980 @ =0x0201FB1C
	movs r0, #0
	str r0, [r1, #4]
	str r0, [r1]
	ldr r0, _0805A984 @ =0x0203E100
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _0805A882
	ldr r0, _0805A988 @ =0x0203E17E
	movs r2, #0
	ldrsh r7, [r0, r2]
	ldr r0, _0805A98C @ =0x0203E110
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r1
	ldr r0, _0805A990 @ =0x0203E10C
	movs r1, #0
	ldrsh r5, [r0, r1]
	lsls r4, r7, #5
	add r4, sl
	ldr r0, [r4, #0x10]
	ldr r1, _0805A994 @ =0x0200F1C8
	bl sub_80D6394
	ldr r1, _0805A998 @ =0x0200005C
	ldr r0, [r4, #0xc]
	str r0, [r1]
	adds r0, r7, #0
	movs r1, #0
	bl GetBanimPalette
	lsls r0, r0, #5
	add r0, sl
	ldr r0, [r0, #0x1c]
	ldr r4, _0805A99C @ =0x02004088
	adds r1, r4, #0
	bl sub_80D6394
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	beq _0805A808
	lsls r0, r5, #4
	ldr r2, _0805A9A0 @ =0x08EF8008
	adds r0, r0, r2
	ldr r0, [r0, #0xc]
	adds r1, r4, #0
	bl sub_80D6394
	adds r0, r4, #0
	movs r1, #0
	bl ApplyBanimUniquePalette
_0805A808:
	ldr r1, _0805A9A4 @ =0x02000054
	mov r2, r8
	lsls r0, r2, #5
	adds r0, r0, r4
	str r0, [r1]
	ldr r4, _0805A9A8 @ =0x02022B88
	adds r1, r4, #0
	movs r2, #8
	bl sub_80D636C
	ldr r0, _0805A9AC @ =0x0203E198
	ldr r0, [r0]
	adds r1, r4, #0
	adds r1, #0x20
	movs r2, #8
	bl sub_80D636C
	ldr r0, _0805A9B0 @ =0x0203A4E8
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xb
	beq _0805A83C
	cmp r1, #0xd
	bne _0805A848
_0805A83C:
	ldr r1, _0805A9B4 @ =0xFFFFFD20
	adds r0, r4, r1
	adds r1, r4, #0
	movs r2, #1
	bl sub_807395C
_0805A848:
	ldr r0, _0805A9B8 @ =0x0203A568
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xb
	beq _0805A85A
	cmp r1, #0xd
	bne _0805A868
_0805A85A:
	ldr r0, _0805A9BC @ =0x020228A8
	movs r2, #0xc0
	lsls r2, r2, #2
	adds r1, r0, r2
	movs r2, #1
	bl sub_807395C
_0805A868:
	bl sub_8001EE4
	lsls r0, r7, #5
	add r0, sl
	ldr r0, [r0, #0x18]
	ldr r4, _0805A9C0 @ =0x020041C8
	adds r1, r4, #0
	bl sub_80D6394
	ldr r0, _0805A9C4 @ =0x000057F0
	adds r4, r4, r0
	movs r0, #1
	str r0, [r4]
_0805A882:
	ldr r0, _0805A984 @ =0x0203E100
	movs r2, #2
	ldrsh r1, [r0, r2]
	mov sb, r1
	cmp r1, #1
	bne _0805A922
	ldr r0, _0805A988 @ =0x0203E17E
	movs r1, #2
	ldrsh r7, [r0, r1]
	ldr r0, _0805A98C @ =0x0203E110
	movs r1, #2
	ldrsh r2, [r0, r1]
	mov r8, r2
	ldr r0, _0805A990 @ =0x0203E10C
	movs r2, #2
	ldrsh r5, [r0, r2]
	lsls r0, r7, #5
	mov r1, sl
	adds r6, r0, r1
	ldr r0, [r6, #0x10]
	ldr r1, _0805A9C8 @ =0x02011BC8
	bl sub_80D6394
	ldr r1, _0805A9CC @ =0x02000060
	ldr r0, [r6, #0xc]
	str r0, [r1]
	adds r0, r7, #0
	movs r1, #1
	bl GetBanimPalette
	lsls r0, r0, #5
	add r0, sl
	ldr r0, [r0, #0x1c]
	ldr r4, _0805A9D0 @ =0x02004128
	adds r1, r4, #0
	bl sub_80D6394
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	beq _0805A8EA
	lsls r0, r5, #4
	ldr r2, _0805A9A0 @ =0x08EF8008
	adds r0, r0, r2
	ldr r0, [r0, #0xc]
	adds r1, r4, #0
	bl sub_80D6394
	adds r0, r4, #0
	movs r1, #1
	bl ApplyBanimUniquePalette
_0805A8EA:
	ldr r1, _0805A9A4 @ =0x02000054
	mov r2, r8
	lsls r0, r2, #5
	adds r0, r0, r4
	str r0, [r1, #4]
	ldr r4, _0805A9D4 @ =0x02022BC8
	adds r1, r4, #0
	movs r2, #8
	bl sub_80D636C
	ldr r0, _0805A9AC @ =0x0203E198
	ldr r0, [r0, #4]
	adds r4, #0x20
	adds r1, r4, #0
	movs r2, #8
	bl sub_80D636C
	bl sub_8001EE4
	ldr r0, [r6, #0x14]
	ldr r4, _0805A9D8 @ =0x020099C8
	adds r1, r4, #0
	bl sub_80D6394
	ldr r0, _0805A9C4 @ =0x000057F0
	adds r4, r4, r0
	mov r1, sb
	str r1, [r4]
_0805A922:
	ldr r4, _0805A9DC @ =0x0203E190
	ldr r2, [r4]
	cmp r2, #0
	bne _0805A92C
	b _0805AAAA
_0805A92C:
	ldr r0, [r2, #4]
	ldr r1, [r0, #0x34]
	adds r0, r2, #0
	movs r2, #0
	mov r3, sp
	bl sub_8058AF8
	lsls r0, r0, #0x10
	ldr r2, _0805A9AC @ =0x0203E198
	lsrs r0, r0, #0xb
	add r0, sl
	ldr r0, [r0, #0x1c]
	str r0, [r2]
	ldr r1, [r4]
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [r1, #4]
	ldrb r5, [r0, #4]
	movs r3, #0
	ldr r0, _0805A9E0 @ =0x089CDE18
	lsls r1, r4, #3
	subs r1, r1, r4
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, r5
	bne _0805A9E8
	ldr r0, _0805A9E4 @ =0x089CEC18
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #4
	ldr r1, _0805A9A0 @ =0x08EF8008
	adds r0, r0, r1
	subs r0, #0x10
	ldr r0, [r0, #0xc]
	str r0, [r2]
	b _0805AA16
	.align 2, 0
_0805A97C: .4byte 0x08C00008
_0805A980: .4byte 0x0201FB1C
_0805A984: .4byte 0x0203E100
_0805A988: .4byte 0x0203E17E
_0805A98C: .4byte 0x0203E110
_0805A990: .4byte 0x0203E10C
_0805A994: .4byte 0x0200F1C8
_0805A998: .4byte 0x0200005C
_0805A99C: .4byte 0x02004088
_0805A9A0: .4byte 0x08EF8008
_0805A9A4: .4byte 0x02000054
_0805A9A8: .4byte 0x02022B88
_0805A9AC: .4byte 0x0203E198
_0805A9B0: .4byte 0x0203A4E8
_0805A9B4: .4byte 0xFFFFFD20
_0805A9B8: .4byte 0x0203A568
_0805A9BC: .4byte 0x020228A8
_0805A9C0: .4byte 0x020041C8
_0805A9C4: .4byte 0x000057F0
_0805A9C8: .4byte 0x02011BC8
_0805A9CC: .4byte 0x02000060
_0805A9D0: .4byte 0x02004128
_0805A9D4: .4byte 0x02022BC8
_0805A9D8: .4byte 0x020099C8
_0805A9DC: .4byte 0x0203E190
_0805A9E0: .4byte 0x089CDE18
_0805A9E4: .4byte 0x089CEC18
_0805A9E8:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #6
	bhi _0805AA16
	ldr r0, _0805AA68 @ =0x089CDE18
	lsls r1, r4, #3
	subs r1, r1, r4
	adds r2, r3, r1
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, r5
	bne _0805A9E8
	ldr r1, _0805AA6C @ =0x0203E198
	ldr r0, _0805AA70 @ =0x089CEC18
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #4
	ldr r2, _0805AA74 @ =0x08EF8008
	adds r0, r0, r2
	subs r0, #0x10
	ldr r0, [r0, #0xc]
	str r0, [r1]
_0805AA16:
	ldr r4, _0805AA78 @ =0x0203E190
	ldr r0, [r4, #4]
	ldr r1, [r0, #4]
	ldr r1, [r1, #0x34]
	movs r2, #0
	mov r3, sp
	bl sub_8058AF8
	lsls r0, r0, #0x10
	ldr r2, _0805AA6C @ =0x0203E198
	lsrs r0, r0, #0xb
	add r0, sl
	ldr r0, [r0, #0x1c]
	str r0, [r2, #4]
	ldr r1, [r4, #4]
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [r1, #4]
	ldrb r5, [r0, #4]
	movs r3, #0
	ldr r0, _0805AA68 @ =0x089CDE18
	lsls r1, r4, #3
	subs r1, r1, r4
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, r5
	bne _0805AA7C
	ldr r0, _0805AA70 @ =0x089CEC18
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #4
	ldr r1, _0805AA74 @ =0x08EF8008
	adds r0, r0, r1
	subs r0, #0x10
	ldr r0, [r0, #0xc]
	str r0, [r2, #4]
	b _0805AAAA
	.align 2, 0
_0805AA68: .4byte 0x089CDE18
_0805AA6C: .4byte 0x0203E198
_0805AA70: .4byte 0x089CEC18
_0805AA74: .4byte 0x08EF8008
_0805AA78: .4byte 0x0203E190
_0805AA7C:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #6
	bhi _0805AAAA
	ldr r0, _0805AABC @ =0x089CDE18
	lsls r1, r4, #3
	subs r1, r1, r4
	adds r2, r3, r1
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, r5
	bne _0805AA7C
	ldr r1, _0805AAC0 @ =0x0203E198
	ldr r0, _0805AAC4 @ =0x089CEC18
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #4
	ldr r2, _0805AAC8 @ =0x08EF8008
	adds r0, r0, r2
	subs r0, #0x10
	ldr r0, [r0, #0xc]
	str r0, [r1, #4]
_0805AAAA:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805AABC: .4byte 0x089CDE18
_0805AAC0: .4byte 0x0203E198
_0805AAC4: .4byte 0x089CEC18
_0805AAC8: .4byte 0x08EF8008


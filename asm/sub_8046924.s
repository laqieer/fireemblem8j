	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set DrawChapterTitleBG, 0x0808BA30 + 1
	.set DrawChapterTitleStrEx, 0x0808B99C + 1
	.set GetChapterTitleExtra, 0x0808BA78 + 1
	.set InitText, 0x08003C8C + 1
	.set IsGameNotFirstChapter, 0x080A9CD4 + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set sub_80042E0, 0x080042E0 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8042FC8, 0x08042FC8 + 1
	.set sub_8043084, 0x08043084 + 1
	.set sub_804D08C, 0x0804D08C + 1
	.set sub_804D0DC, 0x0804D0DC + 1
	.set sub_804D23C, 0x0804D23C + 1
	.set sub_804D2A8, 0x0804D2A8 + 1
	.set sub_8088FA4, 0x08088FA4 + 1
	.set sub_808B824, 0x0808B824 + 1
	.set sub_808B894, 0x0808B894 + 1
	.set sub_808B93C, 0x0808B93C + 1
	.set sub_80A9C30, 0x080A9C30 + 1
	.set sub_80A9C44, 0x080A9C44 + 1
	.section .text.sub_8046924, "ax", %progbits
@ sub_8046924 @ JP 0x08046924 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8046924
	.thumb_func
sub_8046924:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x6c
	adds r7, r0, #0
	movs r0, #0
	str r0, [sp, #0x54]
	bl sub_8042FC8
	bl sub_804D0DC
	ldr r1, [sp, #0x54]
	str r1, [sp]
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #4
	bl sub_8088FA4
	ldr r0, _08046A1C @ =0x085D6004
	ldr r1, _08046A20 @ =0x06014800
	bl sub_8013008
	ldr r0, _08046A24 @ =0x0203DB60
	bl SetTextFont
	bl sub_80042E0
	bl ResetTextFont
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r7, #0
	bl sub_804D08C
	ldr r4, _08046A28 @ =0x0203DD08
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	adds r4, #8
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	ldr r0, _08046A2C @ =0x000006D7
	movs r1, #0
	bl sub_8043084
	movs r0, #0xdb
	lsls r0, r0, #3
	movs r1, #1
	bl sub_8043084
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x4c]
	movs r2, #2
	mov sb, r2
	mov r3, sp
	adds r3, #0x50
	str r3, [sp, #0x58]
	add r6, sp, #4
	movs r5, #8
	mov r4, sp
	adds r4, #0x52
_080469AC:
	movs r0, #0
	strb r0, [r4]
	mov r0, sb
	bl sub_80A9C30
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08046A94
	mov r0, sb
	add r1, sp, #4
	bl sub_80A9C44
	add r0, sp, #4
	bl GetChapterTitleExtra
	adds r2, r7, #0
	adds r2, #0x2c
	adds r1, r2, r5
	str r0, [r1]
	ldrb r1, [r6, #0x14]
	movs r0, #0x40
	ands r0, r1
	mov sl, r2
	cmp r0, #0
	beq _080469E6
	ldrb r0, [r4]
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
_080469E6:
	mov r0, sp
	adds r0, #0x46
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	blt _08046A30
	ldrb r0, [r6, #0x1b]
	cmp r0, #1
	bne _08046A00
	ldrb r0, [r4]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4]
_08046A00:
	ldrb r0, [r6, #0x1b]
	cmp r0, #2
	bne _08046A0E
	ldrb r0, [r4]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r4]
_08046A0E:
	ldrb r0, [r6, #0x1b]
	cmp r0, #3
	bne _08046A44
	ldrb r0, [r4]
	movs r1, #0x40
	b _08046A40
	.align 2, 0
_08046A1C: .4byte 0x085D6004
_08046A20: .4byte 0x06014800
_08046A24: .4byte 0x0203DB60
_08046A28: .4byte 0x0203DD08
_08046A2C: .4byte 0x000006D7
_08046A30:
	ldrb r0, [r6, #0x1b]
	cmp r0, #3
	bne _08046A3C
	ldrb r0, [r4]
	movs r1, #0x40
	b _08046A40
_08046A3C:
	ldrb r0, [r4]
	movs r1, #0x20
_08046A40:
	orrs r0, r1
	strb r0, [r4]
_08046A44:
	add r0, sp, #4
	bl IsGameNotFirstChapter
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08046A62
	adds r2, r7, #0
	adds r2, #0x38
	adds r1, r2, r5
	mov r3, sl
	adds r0, r3, r5
	ldr r0, [r0]
	str r0, [r1]
	mov r8, r2
	b _08046A70
_08046A62:
	adds r1, r7, #0
	adds r1, #0x38
	adds r0, r1, r5
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r0]
	mov r8, r1
_08046A70:
	mov r3, r8
	adds r0, r3, r5
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08046AB0
	ldr r2, [sp, #0x54]
	cmp r2, #0
	bne _08046A8E
	mov r3, sb
	str r3, [r7, #0x50]
	movs r0, #1
	str r0, [sp, #0x54]
	b _08046AB0
_08046A8E:
	mov r1, sb
	str r1, [r7, #0x4c]
	b _08046AB0
_08046A94:
	adds r2, r7, #0
	adds r2, #0x2c
	adds r3, r2, r5
	mov r8, r3
	adds r1, r7, #0
	adds r1, #0x38
	adds r0, r1, r5
	movs r3, #1
	rsbs r3, r3, #0
	str r3, [r0]
	mov r0, r8
	str r3, [r0]
	mov sl, r2
	mov r8, r1
_08046AB0:
	subs r5, #4
	subs r4, #1
	movs r1, #1
	rsbs r1, r1, #0
	add sb, r1
	mov r2, sb
	cmp r2, #0
	blt _08046AC2
	b _080469AC
_08046AC2:
	adds r0, r1, #0
	ldr r1, [r7, #0x4c]
	cmp r1, r0
	bne _08046AD2
	ldr r0, [r7, #0x50]
	str r0, [r7, #0x4c]
	str r0, [r7, #0x48]
	b _08046AD4
_08046AD2:
	str r1, [r7, #0x48]
_08046AD4:
	movs r0, #0xd0
	lsls r0, r0, #1
	bl sub_808B93C
	movs r3, #0
	mov sb, r3
	movs r0, #0xa0
	lsls r0, r0, #1
	str r0, [sp, #0x5c]
	mov r1, sl
	str r1, [sp, #0x60]
	movs r2, #0x80
	lsls r2, r2, #1
	str r2, [sp, #0x64]
	ldr r6, [sp, #0x58]
	str r3, [sp, #0x68]
	movs r0, #0x88
	lsls r0, r0, #7
	mov sl, r0
_08046AFA:
	ldr r0, [sp, #0x68]
	add r0, r8
	ldr r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08046B10
	ldrb r1, [r6]
	movs r0, #2
	orrs r0, r1
	strb r0, [r6]
_08046B10:
	ldrb r1, [r6]
	movs r0, #1
	orrs r0, r1
	mov r4, sb
	adds r4, #4
	adds r1, r4, #0
	bl sub_808B824
	ldrb r0, [r6]
	mov r5, sb
	adds r5, #7
	adds r1, r5, #0
	bl sub_808B824
	ldr r0, _08046BB8 @ =0x020234AE
	ldr r1, [sp, #0x64]
	adds r0, r1, r0
	adds r1, r4, #0
	bl DrawChapterTitleBG
	mov r2, sl
	lsls r0, r2, #0xf
	lsrs r0, r0, #0x14
	ldr r3, [sp, #0x60]
	ldm r3!, {r1}
	str r3, [sp, #0x60]
	bl sub_808B894
	ldr r0, _08046BBC @ =0x02022CAE
	ldr r1, [sp, #0x5c]
	adds r0, r1, r0
	adds r1, r5, #0
	bl DrawChapterTitleStrEx
	ldr r2, [sp, #0x5c]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r2, r3
	str r2, [sp, #0x5c]
	ldr r0, [sp, #0x64]
	adds r0, r0, r3
	str r0, [sp, #0x64]
	adds r6, #1
	ldr r1, [sp, #0x68]
	adds r1, #4
	str r1, [sp, #0x68]
	movs r2, #0x80
	lsls r2, r2, #4
	add sl, r2
	movs r3, #1
	add sb, r3
	mov r0, sb
	cmp r0, #2
	ble _08046AFA
	ldr r2, _08046BC0 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r7, #0
	movs r1, #1
	movs r2, #0
	bl sub_804D23C
	bl sub_804D2A8
	movs r0, #0xf
	bl BG_EnableSyncByMask
	add sp, #0x6c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046BB8: .4byte 0x020234AE
_08046BBC: .4byte 0x02022CAE
_08046BC0: .4byte 0x03003020


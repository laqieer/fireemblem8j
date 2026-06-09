	.syntax unified
	.set GetSupportScreenCharIdAt, 0x080A492C + 1
	.set InitSpriteText, 0x080044E0 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003EAC, 0x08003EAC + 1
	.set sub_800407C, 0x0800407C + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_80044A4, 0x080044A4 + 1
	.set sub_80045BC, 0x080045BC + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80A5C54, "ax", %progbits
@ sub_80A5C54 @ JP 0x080A5C54 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A5C54
	.thumb_func
sub_80A5C54:
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r5, r0, #0
	ldr r1, _080A5D20 @ =0x06015000
	mov r0, sp
	movs r2, #0xe
	bl sub_80044A4
	ldr r0, _080A5D24 @ =0x085C7420
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	add r6, sp, #0x18
	adds r0, r6, #0
	bl InitSpriteText
	mov r0, sp
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r6, #0
	movs r1, #0
	bl sub_80045BC
	ldr r4, _080A5D28 @ =0x088582BC
	ldr r0, [r5, #0x2c]
	bl GetSupportScreenCharIdAt
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r4
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r4, r0, #0
	movs r0, #0x28
	adds r1, r4, #0
	bl sub_8003EAC
	adds r1, r0, #0
	adds r0, r6, #0
	movs r2, #0
	adds r3, r4, #0
	bl sub_80043B8
	movs r4, #0
	adds r5, #0x3d
	ldrb r0, [r5]
	cmp r0, #0
	bne _080A5CC4
	movs r4, #1
_080A5CC4:
	ldr r0, _080A5D2C @ =0x00000536
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x30
	adds r2, r4, #0
	bl sub_80043B8
	adds r0, r6, #0
	movs r1, #0x60
	bl sub_8003D84
	ldrb r0, [r5]
	movs r1, #2
	cmp r0, #0
	bne _080A5CE8
	movs r1, #1
_080A5CE8:
	adds r0, r6, #0
	bl sub_8003D90
	ldrb r1, [r5]
	adds r0, r6, #0
	bl sub_800407C
	movs r4, #0
	ldrb r0, [r5]
	cmp r0, #0
	bne _080A5D00
	movs r4, #1
_080A5D00:
	ldr r0, _080A5D30 @ =0x00000537
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x68
	adds r2, r4, #0
	bl sub_80043B8
	movs r0, #0
	bl SetTextFont
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A5D20: .4byte 0x06015000
_080A5D24: .4byte 0x085C7420
_080A5D28: .4byte 0x088582BC
_080A5D2C: .4byte 0x00000536
_080A5D30: .4byte 0x00000537


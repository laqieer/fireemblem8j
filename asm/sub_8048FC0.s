	.syntax unified
	.set InitSpriteText, 0x080044E0 + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80044A4, 0x080044A4 + 1
	.set sub_80045BC, 0x080045BC + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8048F24, 0x08048F24 + 1
	.set sub_8048F78, 0x08048F78 + 1
	.section .text.sub_8048FC0, "ax", %progbits
@ sub_8048FC0 @ JP 0x08048FC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8048FC0
	.thumb_func
sub_8048FC0:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, _080490A4 @ =0x085DFA68
	ldr r1, _080490A8 @ =0x06012800
	bl sub_8013008
	ldr r0, _080490AC @ =0x085E04C4
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0xc0
	bl sub_8000D68
	ldr r0, _080490B0 @ =0x02000C60
	ldr r1, _080490B4 @ =0x06015000
	movs r2, #0xe
	bl sub_80044A4
	ldr r0, _080490B8 @ =0x085C7420
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	movs r0, #0
	bl SetTextFontGlyphs
	bl ResetTextFont
	movs r5, #0
	ldr r0, _080490BC @ =0x02000C04
	mov r8, r0
	movs r1, #5
	add r1, r8
	mov sb, r1
_0804900A:
	lsls r0, r5, #2
	adds r3, r6, #0
	adds r3, #0x2c
	adds r3, r3, r0
	mov r0, r8
	adds r0, #9
	adds r0, r5, r0
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, #1
	mov r2, r8
	adds r2, #1
	adds r2, r5, r2
	ldrb r1, [r2]
	subs r0, r0, r1
	str r0, [r3]
	ldrb r0, [r2]
	movs r7, #1
	cmp r0, #0
	beq _08049034
	movs r7, #0
_08049034:
	lsls r4, r5, #3
	ldr r0, _080490C0 @ =0x02000C40
	adds r4, r4, r0
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl sub_80045BC
	mov r1, sb
	adds r0, r5, r1
	ldrb r2, [r0]
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_8048F24
	lsls r2, r5, #1
	adds r0, r6, #0
	adds r0, #0x38
	adds r0, r0, r2
	movs r1, #0x18
	strh r1, [r0]
	adds r1, r6, #0
	adds r1, #0x3e
	adds r1, r1, r2
	lsls r0, r5, #5
	adds r0, #0x20
	strh r0, [r1]
	adds r5, #1
	cmp r5, #2
	ble _0804900A
	ldr r4, _080490C4 @ =0x02000C58
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl sub_80045BC
	adds r0, r4, #0
	bl sub_8048F78
	movs r0, #0
	str r0, [r6, #0x48]
	str r0, [r6, #0x44]
	str r0, [r6, #0x54]
	str r0, [r6, #0x50]
	str r0, [r6, #0x4c]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080490A4: .4byte 0x085DFA68
_080490A8: .4byte 0x06012800
_080490AC: .4byte 0x085E04C4
_080490B0: .4byte 0x02000C60
_080490B4: .4byte 0x06015000
_080490B8: .4byte 0x085C7420
_080490BC: .4byte 0x02000C04
_080490C0: .4byte 0x02000C40
_080490C4: .4byte 0x02000C58


	.syntax unified
	.set InitSpriteText, 0x080044E0 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8003E0C, 0x08003E0C + 1
	.set sub_8003EAC, 0x08003EAC + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_80044A4, 0x080044A4 + 1
	.set sub_80045BC, 0x080045BC + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_8011C88, "ax", %progbits
@ sub_8011C88 @ JP 0x08011C88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8011C88
	.thumb_func
sub_8011C88:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	mov r8, r0
	mov sb, r1
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r1, [sp, #0x44]
	movs r6, #0
	ldr r0, _08011D60 @ =0x085BA254
	bl sub_8002BCC
	adds r7, r0, #0
	adds r0, r4, #0
	bl sub_8009FA8
	mov sl, r0
	mov r0, r8
	str r0, [r7, #0x30]
	mov r2, sb
	str r2, [r7, #0x34]
	str r5, [r7, #0x38]
	ldr r0, [sp, #0x40]
	str r0, [r7, #0x3c]
	str r4, [r7, #0x40]
	adds r0, r7, #0
	adds r0, #0x48
	strh r6, [r0]
	ldr r0, _08011D64 @ =0x08AD1424
	ldr r1, [r7, #0x3c]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _08011D68 @ =0x085C7420
	ldr r1, [r7, #0x3c]
	adds r1, #0x11
	lsls r1, r1, #5
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _08011D6C @ =0x08AD1284
	ldr r1, [r7, #0x38]
	ldr r2, _08011D70 @ =0x06010000
	adds r1, r1, r2
	bl sub_8013008
	mov r0, sl
	bl sub_8003E0C
	adds r6, r0, #0
	adds r4, r6, #0
	cmp r6, #0
	bge _08011CFE
	adds r4, r6, #7
_08011CFE:
	asrs r4, r4, #3
	adds r6, r4, #5
	str r6, [r7, #0x44]
	ldr r1, [r7, #0x38]
	ldr r0, _08011D74 @ =0x06010400
	adds r1, r1, r0
	ldr r2, [r7, #0x3c]
	adds r2, #0x12
	mov r0, sp
	bl sub_80044A4
	mov r0, sp
	bl SetTextFont
	add r5, sp, #0x18
	adds r0, r5, #0
	bl InitSpriteText
	adds r0, r5, #0
	movs r1, #0
	bl sub_80045BC
	movs r0, #0
	bl SetTextFontGlyphs
	adds r4, #3
	lsls r4, r4, #3
	adds r0, r4, #0
	mov r1, sl
	bl sub_8003EAC
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0
	mov r3, sl
	bl sub_80043B8
	movs r0, #0
	bl SetTextFont
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011D60: .4byte 0x085BA254
_08011D64: .4byte 0x08AD1424
_08011D68: .4byte 0x085C7420
_08011D6C: .4byte 0x08AD1284
_08011D70: .4byte 0x06010000
_08011D74: .4byte 0x06010400


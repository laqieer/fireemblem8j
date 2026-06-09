	.syntax unified
	.set InitSpriteText, 0x080044E0 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80044A4, 0x080044A4 + 1
	.set sub_80045BC, 0x080045BC + 1
	.section .text.sub_80B27C4, "ax", %progbits
@ sub_80B27C4 @ JP 0x080B27C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B27C4
	.thumb_func
sub_80B27C4:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	mov sb, r1
	mov r8, r2
	adds r5, r3, #0
	ldr r4, _080B2868 @ =0x08A9DCF4
	adds r0, r4, #0
	bl Proc_Find
	adds r6, r0, #0
	cmp r6, #0
	bne _080B27EC
	adds r0, r4, #0
	ldr r1, [sp, #0x24]
	bl Proc_StartBlocking
	adds r6, r0, #0
_080B27EC:
	adds r0, r6, #0
	adds r0, #0x2c
	ldr r2, _080B286C @ =0x06010000
	adds r1, r7, r2
	mov r2, sb
	bl sub_80044A4
	mov r0, r8
	str r0, [r6, #0x54]
	adds r0, r6, #0
	adds r0, #0x58
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r0, #1
	strh r1, [r0]
	adds r1, r6, #0
	adds r1, #0x5c
	ldr r0, [sp, #0x1c]
	strh r0, [r1]
	adds r1, #2
	ldr r0, [sp, #0x20]
	strh r0, [r1]
	mov r7, sb
	adds r7, #0x10
	cmp r5, #0
	ble _080B283E
	adds r4, r6, #0
	adds r4, #0x44
_080B2828:
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl sub_80045BC
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _080B2828
_080B283E:
	ldr r0, _080B2870 @ =0x085C7420
	lsls r1, r7, #5
	movs r2, #0x20
	bl sub_8000D68
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0
	bl SetTextFont
	adds r0, r6, #0
	movs r1, #0
	bl Proc_Goto
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2868: .4byte 0x08A9DCF4
_080B286C: .4byte 0x06010000
_080B2870: .4byte 0x085C7420


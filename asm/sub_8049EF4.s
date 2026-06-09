	.syntax unified
	.set InitSpriteText, 0x080044E0 + 1
	.set InitTextDb, 0x08003CB4 + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set Sio_IsPlayerConnected, 0x08042114 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80044A4, 0x080044A4 + 1
	.set sub_80045BC, 0x080045BC + 1
	.section .text.sub_8049EF4, "ax", %progbits
@ sub_8049EF4 @ JP 0x08049EF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8049EF4
	.thumb_func
sub_8049EF4:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	mov sb, r3
	movs r0, #0
	mov sl, r0
	ldr r0, _08049FCC @ =0x085C7420
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _08049FD0 @ =0x02000C60
	ldr r1, _08049FD4 @ =0x06016800
	movs r2, #3
	bl sub_80044A4
	movs r0, #0
	bl SetTextFontGlyphs
	bl ResetTextFont
	ldr r4, _08049FD8 @ =0x02000C78
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl sub_80045BC
	movs r0, #0
	bl SetTextFont
	movs r1, #0
	mov r8, r1
_08049F4A:
	ldr r0, _08049FDC @ =0x085D31E8
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	add r0, r8
	ldr r1, _08049FE0 @ =0x080DEF14
	adds r0, r0, r1
	ldrb r4, [r0]
	adds r0, r4, #0
	bl Sio_IsPlayerConnected
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08049FF8
	ldr r6, _08049FE4 @ =0x0203DD8C
	lsls r5, r4, #3
	adds r0, r6, #0
	adds r0, #0x30
	adds r7, r5, r0
	ldr r0, [r7]
	cmp r0, #0
	beq _08049FF0
	ldr r0, _08049FE8 @ =0x085D4194
	ldr r1, [sp, #0x34]
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r0, #0x32
	strb r4, [r0]
	adds r0, r5, r6
	adds r0, #0x2c
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x33
	strb r0, [r1]
	lsls r1, r4, #2
	adds r0, r6, #0
	adds r0, #0x14
	adds r3, r1, r0
	ldr r1, [r3]
	ldr r0, [r7]
	adds r1, r1, r0
	str r1, [r2, #0x38]
	ldr r0, _08049FEC @ =0x0000270F
	cmp r1, r0
	bls _08049FAC
	str r0, [r2, #0x38]
_08049FAC:
	ldr r0, [r2, #0x38]
	ldr r1, [r3]
	subs r0, r0, r1
	str r0, [r2, #0x34]
	adds r0, r2, #0
	adds r0, #0x40
	mov r1, sb
	strb r1, [r0]
	adds r0, #8
	movs r1, #4
	bl InitTextDb
	movs r0, #1
	add sl, r0
	b _08049FF8
	.align 2, 0
_08049FCC: .4byte 0x085C7420
_08049FD0: .4byte 0x02000C60
_08049FD4: .4byte 0x06016800
_08049FD8: .4byte 0x02000C78
_08049FDC: .4byte 0x085D31E8
_08049FE0: .4byte 0x080DEF14
_08049FE4: .4byte 0x0203DD8C
_08049FE8: .4byte 0x085D4194
_08049FEC: .4byte 0x0000270F
_08049FF0:
	mov r0, sp
	movs r1, #4
	bl InitTextDb
_08049FF8:
	movs r1, #1
	add r8, r1
	mov r0, r8
	cmp r0, #3
	ble _08049F4A
	mov r1, sl
	cmp r1, #0
	beq _0804A02C
	mov r0, sb
	cmp r0, #0
	beq _0804A022
	ldr r0, _0804A028 @ =0x085D41D4
	ldr r1, [sp, #0x34]
	bl Proc_StartBlocking
	ldr r1, [sp, #8]
	str r1, [r0, #0x2c]
	ldr r1, [sp, #0xc]
	str r1, [r0, #0x30]
	ldr r1, [sp, #0x10]
	str r1, [r0, #0x54]
_0804A022:
	movs r0, #1
	b _0804A02E
	.align 2, 0
_0804A028: .4byte 0x085D41D4
_0804A02C:
	movs r0, #0
_0804A02E:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0


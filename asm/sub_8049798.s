	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set InitTextDb, 0x08003CB4 + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set Sio_IsPlayerConnected, 0x08042114 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8049744, 0x08049744 + 1
	.section .text.sub_8049798, "ax", %progbits
@ sub_8049798 @ JP 0x08049798 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8049798
	.thumb_func
sub_8049798:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08049858 @ =0x085D7AB0
	ldr r1, _0804985C @ =0x06002800
	bl sub_8013008
	ldr r0, _08049860 @ =0x085D7EE8
	movs r1, #0x40
	movs r2, #0x80
	bl sub_8000D68
	movs r0, #0
	bl SetTextFont
	bl ResetTextFont
	movs r0, #0
	mov sb, r0
	ldr r0, _08049864 @ =0x080DEF04
	mov sl, r0
	adds r6, r4, #0
	adds r6, #0x2c
	ldr r7, _08049868 @ =0x080DEF74
_080497D0:
	ldr r0, _0804986C @ =0x085D31E8
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	add r0, sb
	add r0, sl
	ldrb r5, [r0]
	adds r0, r5, #0
	bl Sio_IsPlayerConnected
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08049834
	ldr r0, _08049870 @ =0x0203DD8C
	mov r8, r0
	adds r0, #0xa
	adds r0, r5, r0
	ldrb r0, [r0]
	adds r4, r5, #2
	cmp r0, #0
	bne _08049808
	lsls r1, r4, #5
	ldr r0, _08049874 @ =0x085D8048
	movs r2, #0x20
	bl sub_8000D68
_08049808:
	movs r0, #0xf
	ands r4, r0
	lsls r4, r4, #0xc
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r4, r4, r0
	adds r0, r6, #0
	movs r1, #4
	bl InitTextDb
	ldrb r1, [r7]
	ldrb r2, [r7, #1]
	lsls r0, r5, #2
	mov r3, r8
	adds r3, #0x14
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [sp]
	adds r0, r6, #0
	adds r3, r4, #0
	bl sub_8049744
_08049834:
	adds r6, #8
	adds r7, #2
	movs r0, #1
	add sb, r0
	mov r0, sb
	cmp r0, #3
	ble _080497D0
	movs r0, #3
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049858: .4byte 0x085D7AB0
_0804985C: .4byte 0x06002800
_08049860: .4byte 0x085D7EE8
_08049864: .4byte 0x080DEF04
_08049868: .4byte 0x080DEF74
_0804986C: .4byte 0x085D31E8
_08049870: .4byte 0x0203DD8C
_08049874: .4byte 0x085D8048


	.syntax unified
	.set NewPopup_Simple, 0x08011560 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set SioStrCpy, 0x08042D4C + 1
	.set sub_8042720, 0x08042720 + 1
	.set sub_80498A4, 0x080498A4 + 1
	.set sub_804A1CC, 0x0804A1CC + 1
	.set sub_804B844, 0x0804B844 + 1
	.section .text.sub_804B89C, "ax", %progbits
@ sub_804B89C @ JP 0x0804B89C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804B89C
	.thumb_func
sub_804B89C:
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _0804B8C4 @ =0x0300182C
	ldr r2, _0804B8C8 @ =LABattleMap_IsAttackOrSurrenderMsg
	adds r0, r4, #0
	add r1, sp, #4
	bl sub_8042720
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0804B944
	ldrb r0, [r4]
	cmp r0, #6
	beq _0804B8F4
	cmp r0, #6
	bgt _0804B8CC
	cmp r0, #1
	beq _0804B8D2
	b _0804B944
	.align 2, 0
_0804B8C4: .4byte 0x0300182C
_0804B8C8: .4byte 0x0804B87D  @ LABattleMap_IsAttackOrSurrenderMsg
_0804B8CC:
	cmp r0, #7
	beq _0804B92C
	b _0804B944
_0804B8D2:
	ldrb r0, [r4, #1]
	ldr r2, _0804B8F0 @ =0x0203DD90
	adds r3, r5, #0
	adds r3, #0x2c
	adds r1, r5, #0
	adds r1, #0x30
	str r1, [sp]
	movs r1, #0
	bl sub_804A1CC
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _0804B944
	.align 2, 0
_0804B8F0: .4byte 0x0203DD90
_0804B8F4:
	bl sub_80498A4
	add r0, sp, #4
	ldrb r1, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	ldr r1, _0804B920 @ =0x0203DAC1
	adds r0, r0, r1
	ldr r1, _0804B924 @ =0x03001848
	bl SioStrCpy
	ldr r0, _0804B928 @ =0x085D42A0
	movs r1, #0x60
	movs r2, #0
	movs r3, #0
	bl NewPopup_Simple
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _0804B944
	.align 2, 0
_0804B920: .4byte 0x0203DAC1
_0804B924: .4byte 0x03001848
_0804B928: .4byte 0x085D42A0
_0804B92C:
	bl sub_80498A4
	ldr r0, _0804B950 @ =0x085D42C0
	movs r1, #0x60
	movs r2, #0
	movs r3, #0
	bl NewPopup_Simple
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
_0804B944:
	bl sub_804B844
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804B950: .4byte 0x085D42C0


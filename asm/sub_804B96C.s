	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_8042720, 0x08042720 + 1
	.set sub_804A1CC, 0x0804A1CC + 1
	.set sub_804B844, 0x0804B844 + 1
	.set sub_807B4C8, 0x0807B4C8 + 1
	.section .text.sub_804B96C, "ax", %progbits
@ sub_804B96C @ JP 0x0804B96C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804B96C
	.thumb_func
sub_804B96C:
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _0804B990 @ =0x0300182C
	ldr r2, _0804B994 @ =LABattleMap_IsSelectOrCancelMsg
	adds r0, r4, #0
	add r1, sp, #4
	bl sub_8042720
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0804B9F8
	ldrb r0, [r4]
	cmp r0, #2
	beq _0804B998
	cmp r0, #3
	beq _0804B9DC
	b _0804B9F8
	.align 2, 0
_0804B990: .4byte 0x0300182C
_0804B994: .4byte 0x0804B955  @ LABattleMap_IsSelectOrCancelMsg
_0804B998:
	ldrb r0, [r4, #2]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0804B9BC
	ldr r0, _0804B9B8 @ =0x03001830
	ldr r0, [r0]
	bl sub_807B4C8
	b _0804B9C4
	.align 2, 0
_0804B9B8: .4byte 0x03001830
_0804B9BC:
	ldr r0, [r5, #0x2c]
	strb r0, [r4, #0x10]
	ldr r0, [r5, #0x30]
	strb r0, [r4, #0x11]
_0804B9C4:
	ldr r0, [r4, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
	bl sub_8027144
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b _0804B9F8
_0804B9DC:
	ldrb r0, [r4, #1]
	ldr r2, _0804BA04 @ =0x0203DD91
	adds r3, r5, #0
	adds r3, #0x34
	adds r1, r5, #0
	adds r1, #0x38
	str r1, [sp]
	movs r1, #1
	bl sub_804A1CC
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
_0804B9F8:
	bl sub_804B844
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804BA04: .4byte 0x0203DD91


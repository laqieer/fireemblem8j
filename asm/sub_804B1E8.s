	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_804A14C, 0x0804A14C + 1
	.set sub_804AD2C, 0x0804AD2C + 1
	.set sub_804F610, 0x0804F610 + 1
	.set sub_807A888, 0x0807A888 + 1
	.set sub_807B4C8, 0x0807B4C8 + 1
	.section .text.sub_804B1E8, "ax", %progbits
@ sub_804B1E8 @ JP 0x0804B1E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804B1E8
	.thumb_func
sub_804B1E8:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r1, _0804B21C @ =0x03001810
	ldr r6, _0804B220 @ =0x0203DD8C
	ldrb r0, [r6, #5]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	bl sub_804F610
	ldrb r0, [r6, #6]
	cmp r0, #0
	bne _0804B274
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0804B228
	ldr r0, _0804B224 @ =0x03001830
	ldr r0, [r0, #4]
	bl sub_807B4C8
	b _0804B230
	.align 2, 0
_0804B21C: .4byte 0x03001810
_0804B220: .4byte 0x0203DD8C
_0804B224: .4byte 0x03001830
_0804B228:
	ldr r0, [r5, #0x34]
	strb r0, [r4, #0x10]
	ldr r0, [r5, #0x38]
	strb r0, [r4, #0x11]
_0804B230:
	ldr r0, [r4, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
	bl sub_8027144
	ldr r1, _0804B26C @ =0x0203DD8C
	ldrb r0, [r1, #5]
	strb r0, [r1, #2]
	adds r0, #1
	strb r0, [r1, #3]
	ldr r2, _0804B270 @ =0x03001810
	ldrb r0, [r1, #5]
	adds r0, r0, r2
	ldrb r2, [r0]
	movs r0, #4
	movs r1, #0
	movs r3, #0
	bl sub_804A14C
	adds r0, r5, #0
	bl sub_804AD2C
	adds r0, r5, #0
	movs r1, #5
	bl Proc_Goto
	b _0804B2AA
	.align 2, 0
_0804B26C: .4byte 0x0203DD8C
_0804B270: .4byte 0x03001810
_0804B274:
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0804B29E
	adds r0, r4, #0
	bl sub_807A888
	ldr r1, _0804B2B0 @ =0x03001830
	str r0, [r1, #4]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	str r0, [r5, #0x34]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	str r0, [r5, #0x38]
	ldr r0, [r4, #0xc]
	ldr r1, _0804B2B4 @ =0xFFFFFDFF
	ands r0, r1
	str r0, [r4, #0xc]
_0804B29E:
	ldrb r2, [r6, #6]
	ldrb r3, [r6, #7]
	movs r0, #5
	movs r1, #0
	bl sub_804A14C
_0804B2AA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804B2B0: .4byte 0x03001830
_0804B2B4: .4byte 0xFFFFFDFF


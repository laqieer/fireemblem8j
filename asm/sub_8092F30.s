	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set IsUnitInCurrentRoster, 0x08097740 + 1
	.set sub_8092E20, 0x08092E20 + 1
	.section .text.sub_8092F30, "ax", %progbits
@ sub_8092F30 @ JP 0x08092F30 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8092F30
	.thumb_func
sub_8092F30:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08092F84 @ =0x0200F158
	movs r1, #0
	strb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _08092F8C
	ldr r0, _08092F88 @ =0x0202BCEC
	ldrb r0, [r0, #0xf]
	adds r5, r0, #1
	adds r0, #0x40
	cmp r5, r0
	bge _08092FC8
_08092F50:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08092F76
	ldr r0, [r4]
	cmp r0, #0
	beq _08092F76
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08092F76
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8092E20
_08092F76:
	adds r5, #1
	ldr r0, _08092F88 @ =0x0202BCEC
	ldrb r0, [r0, #0xf]
	adds r0, #0x40
	cmp r5, r0
	blt _08092F50
	b _08092FC8
	.align 2, 0
_08092F84: .4byte 0x0200F158
_08092F88: .4byte 0x0202BCEC
_08092F8C:
	ldr r0, _08092F94 @ =0x0202BCEC
	ldrb r0, [r0, #0xf]
	adds r4, r0, #1
	b _08092FC2
	.align 2, 0
_08092F94: .4byte 0x0202BCEC
_08092F98:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08092FBC
	ldr r0, [r2]
	cmp r0, #0
	beq _08092FBC
	ldr r0, [r2, #0xc]
	ldr r1, _08092FD0 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _08092FBC
	adds r0, r2, #0
	adds r1, r6, #0
	bl sub_8092E20
_08092FBC:
	adds r4, #1
	ldr r0, _08092FD4 @ =0x0202BCEC
	ldrb r0, [r0, #0xf]
_08092FC2:
	adds r0, #0x40
	cmp r4, r0
	blt _08092F98
_08092FC8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08092FD0: .4byte 0x0001000C
_08092FD4: .4byte 0x0202BCEC


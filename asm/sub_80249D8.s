	.syntax unified
	.set GetBallistaItemUses, 0x08037BA8 + 1
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set GetTrapAt, 0x0802E128 + 1
	.set IsBallista, 0x08037B40 + 1
	.set sub_8025164, 0x08025164 + 1
	.section .text.sub_80249D8, "ax", %progbits
@ sub_80249D8 @ JP 0x080249D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80249D8
	.thumb_func
sub_80249D8:
	push {r4, r5, lr}
	ldr r5, _08024A1C @ =0x03004DF0
	ldr r2, [r5]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08024A16
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetTrapAt
	adds r4, r0, #0
	bl IsBallista
	cmp r0, #0
	beq _08024A16
	ldr r0, [r5]
	ldrb r1, [r4, #3]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	bl sub_8025164
	bl GetSelectTargetCount
	cmp r0, #0
	bne _08024A20
_08024A16:
	movs r0, #3
	b _08024A30
	.align 2, 0
_08024A1C: .4byte 0x03004DF0
_08024A20:
	adds r0, r4, #0
	bl GetBallistaItemUses
	cmp r0, #0
	beq _08024A2E
	movs r0, #1
	b _08024A30
_08024A2E:
	movs r0, #2
_08024A30:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0


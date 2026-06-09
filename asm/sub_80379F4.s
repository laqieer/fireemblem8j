	.syntax unified
	.set GetTrapAt, 0x0802E128 + 1
	.section .text.sub_80379F4, "ax", %progbits
@ sub_80379F4 @ JP 0x080379F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80379F4
	.thumb_func
sub_80379F4:
	push {lr}
	bl GetTrapAt
	adds r1, r0, #0
	cmp r1, #0
	beq _08037A06
	ldrb r0, [r1, #2]
	cmp r0, #1
	beq _08037A0A
_08037A06:
	movs r0, #0
	b _08037A0C
_08037A0A:
	movs r0, #1
_08037A0C:
	cmp r0, #0
	beq _08037A18
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08037A1C
_08037A18:
	movs r0, #0
	b _08037A1E
_08037A1C:
	adds r0, r1, #0
_08037A1E:
	pop {r1}
	bx r1
	.align 2, 0


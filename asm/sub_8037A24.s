	.syntax unified
	.set GetTrapAt, 0x0802E128 + 1
	.section .text.sub_8037A24, "ax", %progbits
@ sub_8037A24 @ JP 0x08037A24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8037A24
	.thumb_func
sub_8037A24:
	push {lr}
	bl GetTrapAt
	adds r1, r0, #0
	cmp r1, #0
	beq _08037A36
	ldrb r0, [r1, #2]
	cmp r0, #1
	beq _08037A3A
_08037A36:
	movs r0, #0
	b _08037A3C
_08037A3A:
	movs r0, #1
_08037A3C:
	cmp r0, #0
	beq _08037A5C
	movs r2, #6
	ldrsb r2, [r1, r2]
	cmp r2, #0
	beq _08037A5C
	cmp r1, #0
	beq _08037A52
	ldrb r0, [r1, #2]
	cmp r0, #1
	beq _08037A56
_08037A52:
	movs r0, #0
	b _08037A58
_08037A56:
	movs r0, #1
_08037A58:
	cmp r0, #0
	bne _08037A60
_08037A5C:
	movs r0, #0
	b _08037A66
_08037A60:
	ldrb r1, [r1, #3]
	lsls r0, r2, #8
	adds r0, r1, r0
_08037A66:
	pop {r1}
	bx r1
	.align 2, 0


	.syntax unified
	.set GetTrapAt, 0x0802E128 + 1
	.section .text.sub_8037A6C, "ax", %progbits
@ GetSomeBallistaItemAt @ JP 0x08037A6C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetSomeBallistaItemAt
	.thumb_func
GetSomeBallistaItemAt:
	push {lr}
	bl GetTrapAt
	adds r1, r0, #0
	cmp r1, #0
	beq _08037A7E
	ldrb r0, [r1, #2]
	cmp r0, #1
	beq _08037A82
_08037A7E:
	movs r0, #0
	b _08037A84
_08037A82:
	movs r0, #1
_08037A84:
	cmp r0, #0
	beq _08037A8E
	ldrb r1, [r1, #3]
	cmp r1, #0
	bne _08037A92
_08037A8E:
	movs r0, #0
	b _08037A98
_08037A92:
	movs r0, #0x80
	lsls r0, r0, #1
	adds r0, r1, r0
_08037A98:
	pop {r1}
	bx r1


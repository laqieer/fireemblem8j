	.syntax unified
	.set sub_8027144, 0x08027144 + 1
	.set sub_802EAC4, 0x0802EAC4 + 1
	.section .text.sub_8037B04, "ax", %progbits
@ sub_8037B04 @ JP 0x08037B04 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8037B04
	.thumb_func
sub_8037B04:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08037B34
	ldrb r0, [r4, #0x1c]
	bl sub_802EAC4
	ldr r1, [r4, #0xc]
	ldr r2, _08037B3C @ =0xFFFFF7FF
	ands r1, r2
	str r1, [r4, #0xc]
	movs r1, #0
	strb r1, [r0, #5]
	strb r1, [r4, #0x1c]
	ldrb r1, [r4, #0x10]
	strb r1, [r0]
	ldrb r1, [r4, #0x11]
	strb r1, [r0, #1]
	bl sub_8027144
_08037B34:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037B3C: .4byte 0xFFFFF7FF


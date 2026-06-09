	.syntax unified
	.set GetTrapAt, 0x0802E128 + 1
	.section .text.sub_8029CC4, "ax", %progbits
@ sub_8029CC4 @ JP 0x08029CC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8029CC4
	.thumb_func
sub_8029CC4:
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _08029CF0
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetTrapAt
	cmp r0, #0
	bne _08029CF0
	movs r0, #1
	b _08029CF2
_08029CF0:
	movs r0, #0
_08029CF2:
	pop {r1}
	bx r1
	.align 2, 0


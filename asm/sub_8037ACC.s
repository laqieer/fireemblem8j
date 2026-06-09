	.syntax unified
	.set GetTrapAt, 0x0802E128 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_802EAC4, 0x0802EAC4 + 1
	.section .text.sub_8037ACC, "ax", %progbits
@ sub_8037ACC @ JP 0x08037ACC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8037ACC
	.thumb_func
sub_8037ACC:
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl GetTrapAt
	adds r4, r0, #0
	movs r0, #1
	strb r0, [r4, #5]
	bl sub_8027144
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r5, #0xc]
	movs r0, #0
	bl sub_802EAC4
	subs r4, r4, r0
	asrs r4, r4, #3
	strb r4, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0


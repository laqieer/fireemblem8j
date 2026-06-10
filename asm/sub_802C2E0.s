	.syntax unified
	.set GetClassData, 0x0801911C + 1
	.section .text.sub_802C2E0, "ax", %progbits
@ sub_802C2E0 @ JP 0x0802C2E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802C2E0
	.thumb_func
sub_802C2E0:
	push {r4, lr}
	movs r2, #8
	ldrsb r2, [r0, r2]
	ldr r3, [r0, #4]
	movs r1, #0x1a
	ldrsb r1, [r3, r1]
	adds r4, r2, #0
	muls r4, r1, r4
	ldr r0, [r0]
	ldr r0, [r0, #0x28]
	ldr r1, [r3, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0802C318
	ldrb r0, [r3, #5]
	cmp r0, #0
	beq _0802C318
	bl GetClassData
	movs r1, #0x1a
	ldrsb r1, [r0, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r4, r0
_0802C318:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1


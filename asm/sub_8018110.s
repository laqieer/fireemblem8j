	.syntax unified
	.set InitUnitsupports, 0x08028374 + 1
	.section .text.sub_8018110, "ax", %progbits
@ sub_8018110 @ JP 0x08018110 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8018110
	.thumb_func
sub_8018110:
	push {lr}
	adds r2, r0, #0
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	movs r0, #0xc0
	ands r1, r0
	cmp r1, #0
	bne _0801813C
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	bne _0801812C
	str r1, [r2]
	b _08018140
_0801812C:
	ldr r0, [r2, #0xc]
	movs r1, #5
	orrs r0, r1
	str r0, [r2, #0xc]
	adds r0, r2, #0
	bl InitUnitsupports
	b _08018140
_0801813C:
	movs r0, #0
	str r0, [r2]
_08018140:
	pop {r0}
	bx r0


	.syntax unified
	.set sub_803BA10, 0x0803BA10 + 1
	.section .text.sub_803CB18, "ax", %progbits
@ sub_803CB18 @ JP 0x0803CB18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803CB18
	.thumb_func
sub_803CB18:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _0803CB5C @ =0x030017C8
	ldr r2, [r4]
	ldrb r0, [r2, #1]
	ldrb r1, [r2, #3]
	ldrb r3, [r2, #2]
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	bl sub_803BA10
	ldr r1, _0803CB60 @ =0x0203AA90
	movs r0, #0xa
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bne _0803CB54
	ldr r2, [r4]
	ldrb r0, [r1, #2]
	ldrb r3, [r2, #1]
	cmp r0, r3
	bne _0803CB54
	ldrb r0, [r1, #3]
	ldrb r2, [r2, #3]
	cmp r0, r2
	bne _0803CB54
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_0803CB54:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803CB5C: .4byte 0x030017C8
_0803CB60: .4byte 0x0203AA90


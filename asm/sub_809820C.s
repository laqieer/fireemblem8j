	.syntax unified
	.set sub_8097304, 0x08097304 + 1
	.set sub_8097EE0, 0x08097EE0 + 1
	.set sub_80993F0, 0x080993F0 + 1
	.section .text.sub_809820C, "ax", %progbits
@ sub_809820C @ JP 0x0809820C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809820C
	.thumb_func
sub_809820C:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_80993F0
	adds r6, r0, #0
	adds r4, r5, #0
	adds r4, #0x35
	ldrb r0, [r4]
	cmp r0, r6
	beq _0809822C
	bl sub_8097304
	adds r1, r5, #0
	bl sub_8097EE0
	strb r6, [r4]
_0809822C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0


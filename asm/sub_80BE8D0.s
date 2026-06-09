	.syntax unified
	.set sub_80B2D4C, 0x080B2D4C + 1
	.section .text.sub_80BE8D0, "ax", %progbits
@ sub_80BE8D0 @ JP 0x080BE8D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BE8D0
	.thumb_func
sub_80BE8D0:
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x2c]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080BE8EE
	movs r0, #0x45
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2, #0x2c]
	movs r0, #4
	movs r1, #0
	bl sub_80B2D4C
_080BE8EE:
	pop {r0}
	bx r0
	.align 2, 0


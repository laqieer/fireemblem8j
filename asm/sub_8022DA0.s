	.syntax unified
	.set sub_801D730, 0x0801D730 + 1
	.section .text.sub_8022DA0, "ax", %progbits
@ sub_8022DA0 @ JP 0x08022DA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8022DA0
	.thumb_func
sub_8022DA0:
	push {lr}
	adds r0, #0x63
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08022DB2
	bl sub_801D730
_08022DB2:
	movs r0, #0
	pop {r1}
	bx r1


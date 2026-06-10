	.syntax unified
	.set sub_801D730, 0x0801D730 + 1
	.section .text.sub_8023C2C, "ax", %progbits
@ sub_8023C2C @ JP 0x08023C2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023C2C
	.thumb_func
sub_8023C2C:
	push {lr}
	adds r0, #0x63
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08023C3E
	bl sub_801D730
_08023C3E:
	movs r0, #0
	pop {r1}
	bx r1


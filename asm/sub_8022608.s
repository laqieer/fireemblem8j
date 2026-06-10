	.syntax unified
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_8022608, "ax", %progbits
@ sub_8022608 @ JP 0x08022608 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8022608
	.thumb_func
sub_8022608:
	push {lr}
	bl sub_80C1E74
	cmp r0, #1
	beq _08022616
	movs r0, #1
	b _08022618
_08022616:
	movs r0, #3
_08022618:
	pop {r1}
	bx r1


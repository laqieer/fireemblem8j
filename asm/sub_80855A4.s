	.syntax unified
	.set MaybeCallEndEvent, 0x08085620 + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_80855A4, "ax", %progbits
@ sub_80855A4 @ JP 0x080855A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80855A4
	.thumb_func
sub_80855A4:
	push {lr}
	bl sub_80C1E74
	cmp r0, #2
	beq _080855B2
	bl MaybeCallEndEvent
_080855B2:
	pop {r0}
	bx r0
	.align 2, 0


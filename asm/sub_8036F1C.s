	.syntax unified
	.set sub_804EEEC, 0x0804EEEC + 1
	.section .text.sub_8036F1C, "ax", %progbits
@ sub_8036F1C @ JP 0x08036F1C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8036F1C
	.thumb_func
sub_8036F1C:
	push {lr}
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_804EEEC
	pop {r0}
	bx r0
	.align 2, 0


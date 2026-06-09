	.syntax unified
	.set sub_8027144, 0x08027144 + 1
	.set sub_804A390, 0x0804A390 + 1
	.section .text.sub_804A0D4, "ax", %progbits
@ sub_804A0D4 @ JP 0x0804A0D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804A0D4
	.thumb_func
sub_804A0D4:
	push {lr}
	bl sub_804A390
	bl sub_8027144
	pop {r0}
	bx r0
	.align 2, 0


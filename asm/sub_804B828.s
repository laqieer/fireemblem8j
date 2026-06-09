	.syntax unified
	.set sub_8027144, 0x08027144 + 1
	.set sub_804A390, 0x0804A390 + 1
	.set sub_804A3F0, 0x0804A3F0 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.section .text.sub_804B828, "ax", %progbits
@ sub_804B828 @ JP 0x0804B828 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804B828
	.thumb_func
sub_804B828:
	push {lr}
	bl sub_807B4B8
	bl sub_807B4B8
	bl sub_804A390
	bl sub_804A3F0
	bl sub_8027144
	pop {r0}
	bx r0
	.align 2, 0


	.syntax unified
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.section .text.sub_807F0FC, "ax", %progbits
@ sub_807F0FC @ JP 0x0807F0FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807F0FC
	.thumb_func
sub_807F0FC:
	push {lr}
	bl RefreshEntityBmMaps
	bl sub_8019914
	bl sub_8027144
	bl sub_807B4B8
	pop {r0}
	bx r0
	.align 2, 0


	.syntax unified
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_8026F38, 0x08026F38 + 1
	.set sub_8027144, 0x08027144 + 1
	.section .text.sub_8032114, "ax", %progbits
@ sub_8032114 @ JP 0x08032114 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8032114
	.thumb_func
sub_8032114:
	push {lr}
	bl RefreshEntityBmMaps
	bl sub_8019914
	bl sub_8027144
	bl sub_8026F38
	pop {r1}
	bx r1
	.align 2, 0


	.syntax unified
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.section .text.sub_80841A0, "ax", %progbits
@ sub_80841A0 @ JP 0x080841A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80841A0
	.thumb_func
sub_80841A0:
	push {lr}
	bl RefreshEntityBmMaps
	bl sub_8019914
	bl sub_8027144
	bl sub_807B4B8
	pop {r0}
	bx r0
	.align 2, 0


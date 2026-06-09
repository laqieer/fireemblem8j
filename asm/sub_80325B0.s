	.syntax unified
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_8027144, 0x08027144 + 1
	.section .text.sub_80325B0, "ax", %progbits
@ sub_80325B0 @ JP 0x080325B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80325B0
	.thumb_func
sub_80325B0:
	push {lr}
	bl RefreshEntityBmMaps
	bl sub_8027144
	pop {r0}
	bx r0
	.align 2, 0


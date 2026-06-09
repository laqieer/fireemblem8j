	.syntax unified
	.set SetFlag, 0x080860A8 + 1
	.section .text.sub_80868F4, "ax", %progbits
@ sub_80868F4 @ JP 0x080868F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80868F4
	.thumb_func
sub_80868F4:
	push {lr}
	movs r0, #0x82
	bl SetFlag
	pop {r0}
	bx r0


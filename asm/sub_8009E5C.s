	.syntax unified
	.set SetGameEndFlag, 0x080A971C + 1
	.section .text.sub_8009E5C, "ax", %progbits
@ sub_8009E5C @ JP 0x08009E5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009E5C
	.thumb_func
sub_8009E5C:
	push {lr}
	bl SetGameEndFlag
	pop {r0}
	bx r0
	.align 2, 0


	.syntax unified
	.set AnimClearAll, 0x08004DC0 + 1
	.set SetMainUpdateRoutine, 0x080012D8 + 1
	.set sub_8078890, 0x08078890 + 1
	.section .text.sub_8078774, "ax", %progbits
@ sub_8078774 @ JP 0x08078774 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8078774
	.thumb_func
sub_8078774:
	push {lr}
	bl AnimClearAll
	bl sub_8078890
	ldr r0, _08078788 @ =sub_8056BF0
	bl SetMainUpdateRoutine
	pop {r0}
	bx r0
	.align 2, 0
_08078788: .4byte 0x08056BF1  @ sub_8056BF0


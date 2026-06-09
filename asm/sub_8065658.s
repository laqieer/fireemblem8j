	.syntax unified
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056214, 0x08056214 + 1
	.section .text.sub_8065658, "ax", %progbits
@ sub_8065658 @ JP 0x08065658 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8065658
	.thumb_func
sub_8065658:
	push {lr}
	bl sub_8056130
	ldr r1, _08065670 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_8056214
	pop {r0}
	bx r0
	.align 2, 0
_08065670: .4byte 0x0201774C


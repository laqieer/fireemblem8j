	.syntax unified
	.section .text.sub_8061CC4, "ax", %progbits
@ sub_8061CC4 @ JP 0x08061CC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8061CC4
	.thumb_func
sub_8061CC4:
	ldr r1, _08061CD0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08061CD0: .4byte 0x0201774C


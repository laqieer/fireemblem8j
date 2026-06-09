	.syntax unified
	.section .text.sub_800773C, "ax", %progbits
@ sub_800773C @ JP 0x0800773C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800773C
	.thumb_func
sub_800773C:
	ldr r1, _08007744 @ =0x085B90D4
	ldr r1, [r1]
	strb r0, [r1, #0x11]
	bx lr
	.align 2, 0
_08007744: .4byte 0x085B90D4


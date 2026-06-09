	.syntax unified
	.section .text.sub_805BDCC, "ax", %progbits
@ sub_805BDCC @ JP 0x0805BDCC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805BDCC
	.thumb_func
sub_805BDCC:
	ldr r0, _0805BDD4 @ =0x0203E1E0
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0805BDD4: .4byte 0x0203E1E0


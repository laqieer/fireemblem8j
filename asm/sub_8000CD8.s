	.syntax unified
	.section .text.sub_8000CD8, "ax", %progbits
@ sub_8000CD8 @ JP 0x08000CD8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8000CD8
	.thumb_func
sub_8000CD8:
	ldr r0, _08000CE0 @ =0x03000010
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08000CE0: .4byte 0x03000010


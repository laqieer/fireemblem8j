	.syntax unified
	.section .text.sub_8001BC0, "ax", %progbits
@ sub_8001BC0 @ JP 0x08001BC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8001BC0
	.thumb_func
sub_8001BC0:
	ldr r1, _08001BCC @ =0x085775E8
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08001BCC: .4byte 0x085775E8


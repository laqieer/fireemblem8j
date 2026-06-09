	.syntax unified
	.section .text.sub_800219C, "ax", %progbits
@ sub_800219C @ JP 0x0800219C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800219C
	.thumb_func
sub_800219C:
	ldr r0, _080021A4 @ =0x03000028
	ldrh r0, [r0, #0xa]
	bx lr
	.align 2, 0
_080021A4: .4byte 0x03000028


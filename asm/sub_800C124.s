	.syntax unified
	.section .text.sub_800C124, "ax", %progbits
@ sub_800C124 @ JP 0x0800C124 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800C124
	.thumb_func
sub_800C124:
	ldr r0, [r0, #0x38]
	movs r1, #6
	ldrsh r2, [r0, r1]
	ldr r1, _0800C138 @ =0x03005270
	ldrh r0, [r0, #4]
	strh r0, [r1, #2]
	strh r2, [r1, #4]
	movs r0, #0
	bx lr
	.align 2, 0
_0800C138: .4byte 0x03005270


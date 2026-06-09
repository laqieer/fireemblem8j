	.syntax unified
	.section .text.sub_800C3AC, "ax", %progbits
@ sub_800C3AC @ JP 0x0800C3AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800C3AC
	.thumb_func
sub_800C3AC:
	ldr r1, [r0, #0x38]
	movs r2, #4
	ldrsh r0, [r1, r2]
	movs r2, #6
	ldrsh r1, [r1, r2]
	ldr r2, _0800C3C4 @ =0x03005270
	lsls r0, r0, #8
	str r0, [r2, #8]
	lsls r1, r1, #8
	str r1, [r2, #0xc]
	movs r0, #0
	bx lr
	.align 2, 0
_0800C3C4: .4byte 0x03005270


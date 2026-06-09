	.syntax unified
	.section .text.sub_8059994, "ax", %progbits
@ sub_8059994 @ JP 0x08059994 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8059994
	.thumb_func
sub_8059994:
	ldr r1, _0805999C @ =0x0203E1DC
	movs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0805999C: .4byte 0x0203E1DC


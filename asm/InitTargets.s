	.syntax unified
	.section .text.InitTargets, "ax", %progbits
@ InitTargets @ JP 0x08050618 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global InitTargets
	.thumb_func
InitTargets:
	ldr r2, _08050628 @ =0x0203DDE4
	movs r3, #0
	strh r0, [r2]
	strh r1, [r2, #2]
	ldr r0, _0805062C @ =0x0203E0E8
	str r3, [r0]
	bx lr
	.align 2, 0
_08050628: .4byte 0x0203DDE4
_0805062C: .4byte 0x0203E0E8


	.syntax unified
	.section .text.efxCrimsonEyeOBJ_GetOffsetX, "ax", %progbits
@ efxCrimsonEyeOBJ_GetOffsetX @ JP 0x0806C958 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global efxCrimsonEyeOBJ_GetOffsetX
	.thumb_func
efxCrimsonEyeOBJ_GetOffsetX:
	ldr r2, _0806C96C @ =0x08602EFC
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	muls r0, r1, r0
	asrs r0, r0, #8
	bx lr
	.align 2, 0
_0806C96C: .4byte 0x08602EFC


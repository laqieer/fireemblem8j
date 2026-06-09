	.syntax unified
	.section .text.efxCrimsonEyeOBJ_GetOffsetY, "ax", %progbits
@ efxCrimsonEyeOBJ_GetOffsetY @ JP 0x0806C970 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global efxCrimsonEyeOBJ_GetOffsetY
	.thumb_func
efxCrimsonEyeOBJ_GetOffsetY:
	ldr r2, _0806C984 @ =0x08602EFC
	lsls r0, r0, #1
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	muls r0, r1, r0
	asrs r0, r0, #0xa
	bx lr
	.align 2, 0
_0806C984: .4byte 0x08602EFC


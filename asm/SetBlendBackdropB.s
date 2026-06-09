	.syntax unified
	.section .text.SetBlendBackdropB, "ax", %progbits
@ SetBlendBackdropB @ JP 0x08001EB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SetBlendBackdropB
	.thumb_func
SetBlendBackdropB:
	ldr r2, _08001ECC @ =0x03003020
	adds r2, #0x3d
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #5
	ldrb r3, [r2]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r0
	strb r1, [r2]
	bx lr
	.align 2, 0
_08001ECC: .4byte 0x03003020


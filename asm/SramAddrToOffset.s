	.syntax unified
	.section .text.SramAddrToOffset, "ax", %progbits
@ SramAddrToOffset @ JP 0x080A792C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SramAddrToOffset
	.thumb_func
SramAddrToOffset:
	ldr r1, _080A7938 @ =0x08A9CA20
	ldr r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
_080A7938: .4byte 0x08A9CA20


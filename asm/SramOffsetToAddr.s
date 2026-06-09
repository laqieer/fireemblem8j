	.syntax unified
	.section .text.SramOffsetToAddr, "ax", %progbits
@ SramOffsetToAddr @ JP 0x080A7918 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SramOffsetToAddr
	.thumb_func
SramOffsetToAddr:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _080A7928 @ =0x08A9CA20
	ldr r1, [r1]
	adds r1, r1, r0
	adds r0, r1, #0
	bx lr
	.align 2, 0
_080A7928: .4byte 0x08A9CA20


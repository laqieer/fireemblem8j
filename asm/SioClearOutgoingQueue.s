	.syntax unified
	.section .text.SioClearOutgoingQueue, "ax", %progbits
@ SioClearOutgoingQueue @ JP 0x08042A78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SioClearOutgoingQueue
	.thumb_func
SioClearOutgoingQueue:
	ldr r0, _08042A84 @ =0x030017EA
	ldr r1, _08042A88 @ =0x030017E8
	ldrh r1, [r1]
	strh r1, [r0]
	bx lr
	.align 2, 0
_08042A84: .4byte 0x030017EA
_08042A88: .4byte 0x030017E8


	.syntax unified
	.section .text.BG_EnableSyncByMask, "ax", %progbits
@ BG_EnableSyncByMask @ JP 0x08001EFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BG_EnableSyncByMask
	.thumb_func
BG_EnableSyncByMask:
	ldr r2, _08001F08 @ =0x0300000C
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_08001F08: .4byte 0x0300000C


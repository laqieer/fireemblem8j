	.syntax unified
	.section .text.ClearModM, "ax", %progbits
@ ClearModM @ JP 0x080D5FE0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ClearModM
	.thumb_func
ClearModM:
	adds r1, r0, #0
	movs r2, #0
	movs r0, #0
	strb r0, [r1, #0x1a]
	strb r0, [r1, #0x16]
	ldrb r0, [r1, #0x18]
	cmp r0, #0
	bne _080D5FF4
	movs r0, #0xc
	b _080D5FF6
_080D5FF4:
	movs r0, #3
_080D5FF6:
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0


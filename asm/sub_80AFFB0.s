	.syntax unified
	.section .text.sub_80AFFB0, "ax", %progbits
@ SaveDraw_SetCursorBox @ JP 0x080AFFB0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SaveDraw_SetCursorBox
	.thumb_func
SaveDraw_SetCursorBox:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r3, [r3, #0x34]
	subs r2, #0xc
	strh r2, [r3, #0x32]
	subs r1, #2
	strh r1, [r3, #0x2e]
	adds r2, r3, #0
	adds r2, #0x36
	movs r1, #1
	strb r1, [r2]
	adds r3, #0x3a
	strb r0, [r3]
	bx lr


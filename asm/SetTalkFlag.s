	.syntax unified
	.section .text.SetTalkFlag, "ax", %progbits
@ SetTalkFlag @ JP 0x080069AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SetTalkFlag
	.thumb_func
SetTalkFlag:
	ldr r1, _080069BC @ =0x085B90D4
	ldr r1, [r1]
	adds r1, #0x80
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	bx lr
	.align 2, 0
_080069BC: .4byte 0x085B90D4


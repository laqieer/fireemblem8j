	.syntax unified
	.section .text.ClearAllTalkFlags, "ax", %progbits
@ ClearAllTalkFlags @ JP 0x0800699C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ClearAllTalkFlags
	.thumb_func
ClearAllTalkFlags:
	ldr r0, _080069A8 @ =0x085B90D4
	ldr r0, [r0]
	adds r0, #0x80
	movs r1, #0
	strh r1, [r0]
	bx lr
	.align 2, 0
_080069A8: .4byte 0x085B90D4


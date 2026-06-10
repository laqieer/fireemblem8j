	.syntax unified
	.section .text.sub_8019F18, "ax", %progbits
@ sub_8019F18 @ JP 0x08019F18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8019F18
	.thumb_func
sub_8019F18:
	ldr r1, _08019F24 @ =0x088617C8
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08019F24: .4byte 0x088617C8


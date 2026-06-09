	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80AEB98, "ax", %progbits
@ sub_80AEB98 @ JP 0x080AEB98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AEB98
	.thumb_func
sub_80AEB98:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080AEBA8 @ =0x08A9CFC4
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080AEBA8: .4byte 0x08A9CFC4


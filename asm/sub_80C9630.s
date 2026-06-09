	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80C9630, "ax", %progbits
@ sub_80C9630 @ JP 0x080C9630 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C9630
	.thumb_func
sub_80C9630:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080C9640 @ =0x08B3B414
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080C9640: .4byte 0x08B3B414


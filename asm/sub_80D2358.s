	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80D2358, "ax", %progbits
@ sub_80D2358 @ JP 0x080D2358 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D2358
	.thumb_func
sub_80D2358:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080D2368 @ =0x08BAB85C
	bl Proc_StartBlocking
	pop {r1}
	bx r1
	.align 2, 0
_080D2368: .4byte 0x08BAB85C


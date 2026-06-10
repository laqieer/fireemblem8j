	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_8038320, "ax", %progbits
@ sub_8038320 @ JP 0x08038320 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8038320
	.thumb_func
sub_8038320:
	push {lr}
	adds r1, r0, #0
	ldr r0, _08038330 @ =0x085C6C14
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_08038330: .4byte 0x085C6C14


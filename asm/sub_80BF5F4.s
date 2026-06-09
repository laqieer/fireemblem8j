	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_80BF5F4, "ax", %progbits
@ sub_80BF5F4 @ JP 0x080BF5F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BF5F4
	.thumb_func
sub_80BF5F4:
	push {lr}
	ldr r0, [r0, #0x48]
	bl Proc_End
	pop {r0}
	bx r0


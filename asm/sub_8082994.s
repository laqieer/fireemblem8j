	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_8082994, "ax", %progbits
@ sub_8082994 @ JP 0x08082994 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8082994
	.thumb_func
sub_8082994:
	push {lr}
	ldr r0, [r0, #0x50]
	bl Proc_End
	pop {r0}
	bx r0


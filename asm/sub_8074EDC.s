	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_8074EDC, "ax", %progbits
@ sub_8074EDC @ JP 0x08074EDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8074EDC
	.thumb_func
sub_8074EDC:
	push {lr}
	ldr r0, _08074EEC @ =0x020200B0
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08074EEC: .4byte 0x020200B0


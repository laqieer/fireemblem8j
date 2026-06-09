	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_8051EA0, "ax", %progbits
@ sub_8051EA0 @ JP 0x08051EA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8051EA0
	.thumb_func
sub_8051EA0:
	push {lr}
	ldr r0, _08051EB0 @ =0x02000068
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08051EB0: .4byte 0x02000068


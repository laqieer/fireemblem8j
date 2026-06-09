	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_8006980, "ax", %progbits
@ sub_8006980 @ JP 0x08006980 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8006980
	.thumb_func
sub_8006980:
	push {lr}
	ldr r0, _0800698C @ =0x085B90F0
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0800698C: .4byte 0x085B90F0


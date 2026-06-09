	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_8006DC8, "ax", %progbits
@ sub_8006DC8 @ JP 0x08006DC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8006DC8
	.thumb_func
sub_8006DC8:
	push {lr}
	adds r1, r0, #0
	ldr r0, _08006DD8 @ =0x085B9120
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_08006DD8: .4byte 0x085B9120


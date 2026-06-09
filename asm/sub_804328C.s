	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_804328C, "ax", %progbits
@ sub_804328C @ JP 0x0804328C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804328C
	.thumb_func
sub_804328C:
	push {lr}
	adds r1, r0, #0
	ldr r0, _0804329C @ =0x085D33B4
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0804329C: .4byte 0x085D33B4


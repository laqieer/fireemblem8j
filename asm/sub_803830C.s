	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_803830C, "ax", %progbits
@ sub_803830C @ JP 0x0803830C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803830C
	.thumb_func
sub_803830C:
	push {lr}
	adds r1, r0, #0
	ldr r0, _0803831C @ =0x085C6B74
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0803831C: .4byte 0x085C6B74


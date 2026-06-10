	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_800D4A8, "ax", %progbits
@ sub_800D4A8 @ JP 0x0800D4A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D4A8
	.thumb_func
sub_800D4A8:
	push {lr}
	adds r1, r0, #0
	ldr r0, _0800D4B8 @ =0x085B9BBC
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0800D4B8: .4byte 0x085B9BBC


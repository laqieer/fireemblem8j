	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_802E064, "ax", %progbits
@ sub_802E064 @ JP 0x0802E064 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802E064
	.thumb_func
sub_802E064:
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802E074 @ =0x085C411C
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0802E074: .4byte 0x085C411C


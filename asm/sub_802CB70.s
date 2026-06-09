	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_802C5D8, 0x0802C5D8 + 1
	.section .text.sub_802CB70, "ax", %progbits
@ sub_802CB70 @ JP 0x0802CB70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802CB70
	.thumb_func
sub_802CB70:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_802C5D8
	ldr r0, _0802CB88 @ =0x085C3FA4
	adds r1, r4, #0
	bl Proc_StartBlocking
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802CB88: .4byte 0x085C3FA4


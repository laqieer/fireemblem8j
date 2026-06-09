	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_8090A70, "ax", %progbits
@ sub_8090A70 @ JP 0x08090A70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8090A70
	.thumb_func
sub_8090A70:
	push {lr}
	adds r1, r0, #0
	ldr r0, _08090A84 @ =0x08A73CBC
	bl Proc_StartBlocking
	adds r0, #0x3f
	movs r1, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08090A84: .4byte 0x08A73CBC


	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_809EF94, "ax", %progbits
@ sub_809EF94 @ JP 0x0809EF94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809EF94
	.thumb_func
sub_809EF94:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809EFA8 @ =0x08A94DA8
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809EFA8: .4byte 0x08A94DA8


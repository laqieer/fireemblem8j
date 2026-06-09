	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80A29A8, "ax", %progbits
@ sub_80A29A8 @ JP 0x080A29A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A29A8
	.thumb_func
sub_80A29A8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A29BC @ =0x08A9526C
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A29BC: .4byte 0x08A9526C


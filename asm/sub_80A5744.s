	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80A5744, "ax", %progbits
@ sub_80A5744 @ JP 0x080A5744 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A5744
	.thumb_func
sub_80A5744:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A5758 @ =0x08A95B70
	bl Proc_StartBlocking
	adds r0, #0x42
	movs r1, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080A5758: .4byte 0x08A95B70


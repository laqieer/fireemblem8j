	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80A575C, "ax", %progbits
@ sub_80A575C @ JP 0x080A575C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A575C
	.thumb_func
sub_80A575C:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A5770 @ =0x08A95B70
	bl Proc_StartBlocking
	adds r0, #0x42
	movs r1, #0
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080A5770: .4byte 0x08A95B70


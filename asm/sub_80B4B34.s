	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80B4B34, "ax", %progbits
@ sub_80B4B34 @ JP 0x080B4B34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B4B34
	.thumb_func
sub_80B4B34:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B4B44 @ =0x08A9E2A0
	bl Proc_StartBlocking
	pop {r1}
	bx r1
	.align 2, 0
_080B4B44: .4byte 0x08A9E2A0


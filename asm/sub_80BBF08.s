	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_80BBF08, "ax", %progbits
@ sub_80BBF08 @ JP 0x080BBF08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BBF08
	.thumb_func
sub_80BBF08:
	push {lr}
	ldr r0, _080BBF14 @ =0x08AC0CB0
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080BBF14: .4byte 0x08AC0CB0


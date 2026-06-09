	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80A4868, "ax", %progbits
@ sub_80A4868 @ JP 0x080A4868 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A4868
	.thumb_func
sub_80A4868:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A4878 @ =0x08A95AD8
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A4878: .4byte 0x08A95AD8


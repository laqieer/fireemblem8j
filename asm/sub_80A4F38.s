	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80A4F38, "ax", %progbits
@ sub_80A4F38 @ JP 0x080A4F38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A4F38
	.thumb_func
sub_80A4F38:
	push {lr}
	ldr r0, _080A4F48 @ =0x08A95B50
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080A4F48: .4byte 0x08A95B50


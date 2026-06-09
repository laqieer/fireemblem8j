	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B2730, "ax", %progbits
@ sub_80B2730 @ JP 0x080B2730 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B2730
	.thumb_func
sub_80B2730:
	push {lr}
	ldr r0, _080B2740 @ =0x08A9DCD4
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080B2740: .4byte 0x08A9DCD4


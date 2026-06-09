	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B320C, "ax", %progbits
@ sub_80B320C @ JP 0x080B320C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B320C
	.thumb_func
sub_80B320C:
	push {lr}
	ldr r0, _080B321C @ =0x08A9DD64
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080B321C: .4byte 0x08A9DD64


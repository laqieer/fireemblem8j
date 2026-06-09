	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B15A0, "ax", %progbits
@ sub_80B15A0 @ JP 0x080B15A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B15A0
	.thumb_func
sub_80B15A0:
	push {lr}
	ldr r0, _080B15B0 @ =0x08A9DAB4
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080B15B0: .4byte 0x08A9DAB4


	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B2F30, "ax", %progbits
@ sub_80B2F30 @ JP 0x080B2F30 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B2F30
	.thumb_func
sub_80B2F30:
	push {lr}
	ldr r0, _080B2F4C @ =0x08A9DD0C
	bl Proc_Find
	bl Proc_End
	ldr r0, _080B2F50 @ =0x08A9DD34
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080B2F4C: .4byte 0x08A9DD0C
_080B2F50: .4byte 0x08A9DD34


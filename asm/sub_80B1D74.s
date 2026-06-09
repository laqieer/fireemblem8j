	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B1D74, "ax", %progbits
@ sub_80B1D74 @ JP 0x080B1D74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B1D74
	.thumb_func
sub_80B1D74:
	push {lr}
	ldr r0, _080B1D84 @ =0x08A9DB3C
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080B1D84: .4byte 0x08A9DB3C


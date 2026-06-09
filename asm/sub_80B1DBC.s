	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B1DBC, "ax", %progbits
@ sub_80B1DBC @ JP 0x080B1DBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B1DBC
	.thumb_func
sub_80B1DBC:
	push {lr}
	b _080B1DC4
_080B1DC0:
	bl Proc_End
_080B1DC4:
	ldr r0, _080B1DD4 @ =0x08A9DB6C
	bl Proc_Find
	cmp r0, #0
	bne _080B1DC0
	pop {r0}
	bx r0
	.align 2, 0
_080B1DD4: .4byte 0x08A9DB6C


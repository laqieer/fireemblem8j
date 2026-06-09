	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80B1D2C, "ax", %progbits
@ sub_80B1D2C @ JP 0x080B1D2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B1D2C
	.thumb_func
sub_80B1D2C:
	push {lr}
	ldr r0, _080B1D44 @ =0x08A9DB3C
	bl Proc_Find
	cmp r0, #0
	beq _080B1D3E
	movs r1, #1
	bl Proc_Goto
_080B1D3E:
	pop {r0}
	bx r0
	.align 2, 0
_080B1D44: .4byte 0x08A9DB3C


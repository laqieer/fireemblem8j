	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80B2004, "ax", %progbits
@ sub_80B2004 @ JP 0x080B2004 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B2004
	.thumb_func
sub_80B2004:
	push {lr}
	ldr r0, _080B201C @ =0x08A9DB84
	bl Proc_Find
	cmp r0, #0
	beq _080B2016
	movs r1, #0
	bl Proc_Goto
_080B2016:
	pop {r0}
	bx r0
	.align 2, 0
_080B201C: .4byte 0x08A9DB84


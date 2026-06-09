	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80B1584, "ax", %progbits
@ sub_80B1584 @ JP 0x080B1584 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B1584
	.thumb_func
sub_80B1584:
	push {lr}
	ldr r0, _080B159C @ =0x08A9DAB4
	bl Proc_Find
	cmp r0, #0
	beq _080B1596
	movs r1, #0
	bl Proc_Goto
_080B1596:
	pop {r0}
	bx r0
	.align 2, 0
_080B159C: .4byte 0x08A9DAB4


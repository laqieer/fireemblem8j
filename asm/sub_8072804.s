	.syntax unified
	.set GetBanimDragonStatusType, 0x08072060 + 1
	.set SetAnimStateHidden, 0x0805B0FC + 1
	.section .text.sub_8072804, "ax", %progbits
@ sub_8072804 @ JP 0x08072804 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8072804
	.thumb_func
sub_8072804:
	push {lr}
	bl GetBanimDragonStatusType
	cmp r0, #1
	beq _08072818
	cmp r0, #1
	blo _08072826
	cmp r0, #2
	beq _08072820
	b _08072826
_08072818:
	movs r0, #0
	bl SetAnimStateHidden
	b _08072826
_08072820:
	movs r0, #0
	bl SetAnimStateHidden
_08072826:
	pop {r0}
	bx r0
	.align 2, 0


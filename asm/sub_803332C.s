	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_803332C, "ax", %progbits
@ sub_803332C @ JP 0x0803332C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803332C
	.thumb_func
sub_803332C:
	push {lr}
	movs r1, #8
	str r1, [r0, #0x58]
	movs r1, #0x39
	bl Proc_Goto
	pop {r0}
	bx r0


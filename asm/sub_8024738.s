	.syntax unified
	.set ChangeActiveUnitFacing, 0x0801F164 + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_80034D0, 0x080034D0 + 1
	.set sub_8034B44, 0x08034B44 + 1
	.section .text.sub_8024738, "ax", %progbits
@ sub_8024738 @ JP 0x08024738 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024738
	.thumb_func
sub_8024738:
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	bl sub_80034D0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_8034B44
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0


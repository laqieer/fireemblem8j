	.syntax unified
	.set ChangeActiveUnitFacing, 0x0801F164 + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_8034EB8, 0x08034EB8 + 1
	.section .text.sub_8024608, "ax", %progbits
@ sub_8024608 @ JP 0x08024608 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024608
	.thumb_func
sub_8024608:
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_8034EB8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0


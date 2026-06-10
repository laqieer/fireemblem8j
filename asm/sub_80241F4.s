	.syntax unified
	.set ChangeActiveUnitFacing, 0x0801F164 + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_8034C54, 0x08034C54 + 1
	.section .text.sub_80241F4, "ax", %progbits
@ sub_80241F4 @ JP 0x080241F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80241F4
	.thumb_func
sub_80241F4:
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
	bl sub_8034C54
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0


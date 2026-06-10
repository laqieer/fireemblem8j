	.syntax unified
	.set ChangeActiveUnitFacing, 0x0801F164 + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_8034D64, 0x08034D64 + 1
	.section .text.sub_8029994, "ax", %progbits
@ sub_8029994 @ JP 0x08029994 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8029994
	.thumb_func
sub_8029994:
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
	bl sub_8034D64
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0


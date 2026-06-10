	.syntax unified
	.set ChangeActiveUnitFacing, 0x0801F164 + 1
	.set GetUnit, 0x08019108 + 1
	.set RefreshUnitRescueInfoWindows, 0x0803510C + 1
	.section .text.sub_802464C, "ax", %progbits
@ sub_802464C @ JP 0x0802464C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802464C
	.thumb_func
sub_802464C:
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
	bl RefreshUnitRescueInfoWindows
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0


	.syntax unified
	.set ChangeActiveUnitFacing, 0x0801F164 + 1
	.set GetUnit, 0x08019108 + 1
	.set RefreshUnitGiveInfoWindows, 0x080352C0 + 1
	.section .text.sub_80246B0, "ax", %progbits
@ sub_80246B0 @ JP 0x080246B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80246B0
	.thumb_func
sub_80246B0:
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
	bl RefreshUnitGiveInfoWindows
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0


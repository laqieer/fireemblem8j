	.syntax unified
	.set ChangeActiveUnitFacing, 0x0801F164 + 1
	.set GetUnit, 0x08019108 + 1
	.set RefreshUnitResChangeInfoWindow, 0x08034FAC + 1
	.section .text.sub_8029C08, "ax", %progbits
@ sub_8029C08 @ JP 0x08029C08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8029C08
	.thumb_func
sub_8029C08:
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
	bl RefreshUnitResChangeInfoWindow
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0


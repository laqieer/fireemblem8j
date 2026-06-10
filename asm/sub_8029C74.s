	.syntax unified
	.set ChangeActiveUnitFacing, 0x0801F164 + 1
	.set GetUnit, 0x08019108 + 1
	.set RefreshUnitStaffOffenseInfoWindow, 0x08035024 + 1
	.set sub_802CC14, 0x0802CC14 + 1
	.section .text.sub_8029C74, "ax", %progbits
@ sub_8029C74 @ JP 0x08029C74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8029C74
	.thumb_func
sub_8029C74:
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r6, r0, #0
	ldr r0, _08029CB0 @ =0x03004DF0
	ldr r5, [r0]
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_802CC14
	adds r1, r0, #0
	adds r0, r6, #0
	bl RefreshUnitStaffOffenseInfoWindow
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08029CB0: .4byte 0x03004DF0


	.syntax unified
	.set CanUnitUseWeapon, 0x0801631C + 1
	.set sub_802881C, 0x0802881C + 1
	.section .text.sub_8016D24, "ax", %progbits
@ CanUnitUse_unused @ JP 0x08016D24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CanUnitUse_unused
	.thumb_func
CanUnitUse_unused:
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	movs r1, #0xff
	ands r1, r2
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08016D4C @ =0x0885E068
	adds r0, r0, r1
	ldr r0, [r0, #8]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08016D50
	adds r0, r3, #0
	adds r1, r2, #0
	bl sub_802881C
	b _08016D58
	.align 2, 0
_08016D4C: .4byte 0x0885E068
_08016D50:
	adds r0, r3, #0
	adds r1, r2, #0
	bl CanUnitUseWeapon
_08016D58:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1


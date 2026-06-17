	.syntax unified
	.set CanUnitUseWeapon, 0x0801631C + 1
	.set IsUnitMagicSealed, 0x08018A1C + 1
	.section .text.sub_80164F8, "ax", %progbits
@ CanUnitUseWeaponNow @ JP 0x080164F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CanUnitUseWeaponNow
	.thumb_func
CanUnitUseWeaponNow:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	beq _0801652E
	movs r1, #0xff
	ands r1, r4
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08016534 @ =0x0885E068
	adds r0, r0, r1
	ldr r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801652E
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _08016538
	adds r0, r5, #0
	bl IsUnitMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08016538
_0801652E:
	movs r0, #0
	b _08016544
	.align 2, 0
_08016534: .4byte 0x0885E068
_08016538:
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_08016544:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0


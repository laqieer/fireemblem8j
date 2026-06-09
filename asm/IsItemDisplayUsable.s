	.syntax unified
	.set CanUnitUseStaff, 0x0801654C + 1
	.set CanUnitUseWeapon, 0x0801631C + 1
	.set IsItemDanceRing, 0x08016C70 + 1
	.section .text.IsItemDisplayUsable, "ax", %progbits
@ IsItemDisplayUsable @ JP 0x08016C8C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global IsItemDisplayUsable
	.thumb_func
IsItemDisplayUsable:
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	movs r5, #0xff
	ands r5, r4
	lsls r0, r5, #3
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _08016CB4 @ =0x0885E068
	adds r2, r0, r1
	ldr r1, [r2, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08016CB8
	adds r0, r3, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	b _08016CC8
	.align 2, 0
_08016CB4: .4byte 0x0885E068
_08016CB8:
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _08016CCE
	adds r0, r3, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
_08016CC8:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08016D1C
_08016CCE:
	ldrb r0, [r2, #0x1e]
	cmp r0, #0
	beq _08016D1A
	adds r0, r3, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #2
	beq _08016D16
	cmp r1, #4
	beq _08016D16
	ldr r2, [r3]
	ldr r3, [r3, #4]
	ldr r1, [r2, #0x28]
	ldr r0, [r3, #0x28]
	orrs r1, r0
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	bne _08016CFC
	cmp r5, #0x6b
	beq _08016D16
_08016CFC:
	ldr r0, [r2, #0x28]
	ldr r1, [r3, #0x28]
	orrs r0, r1
	movs r1, #0x30
	ands r0, r1
	cmp r0, #0
	bne _08016D1A
	adds r0, r4, #0
	bl IsItemDanceRing
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08016D1A
_08016D16:
	movs r0, #0
	b _08016D1C
_08016D1A:
	movs r0, #1
_08016D1C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0


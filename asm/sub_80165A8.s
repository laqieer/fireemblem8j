	.syntax unified
	.set CanUnitUseStaff, 0x0801654C + 1
	.set IsUnitMagicSealed, 0x08018A1C + 1
	.section .text.sub_80165A8, "ax", %progbits
@ CanUnitUseStaffNow @ JP 0x080165A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CanUnitUseStaffNow
	.thumb_func
CanUnitUseStaffNow:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	beq _080165E8
	movs r1, #0xff
	ands r1, r4
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080165E4 @ =0x0885E068
	adds r0, r0, r1
	ldr r0, [r0, #8]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080165E8
	adds r0, r5, #0
	bl IsUnitMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080165E8
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080165EA
	.align 2, 0
_080165E4: .4byte 0x0885E068
_080165E8:
	movs r0, #0
_080165EA:
	pop {r4, r5}
	pop {r1}
	bx r1


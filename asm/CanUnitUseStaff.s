	.syntax unified
	.section .text.CanUnitUseStaff, "ax", %progbits
@ CanUnitUseStaff @ JP 0x0801654C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CanUnitUseStaff
	.thumb_func
CanUnitUseStaff:
	push {lr}
	adds r3, r0, #0
	cmp r1, #0
	beq _08016582
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016588 @ =0x0885E068
	adds r2, r1, r0
	ldr r0, [r2, #8]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08016582
	adds r0, r3, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #2
	beq _08016582
	cmp r1, #4
	beq _08016582
	cmp r1, #3
	bne _0801658C
_08016582:
	movs r0, #0
	b _080165A2
	.align 2, 0
_08016588: .4byte 0x0885E068
_0801658C:
	adds r0, r3, #0
	adds r0, #0x28
	ldrb r1, [r2, #7]
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0
	ldrb r2, [r2, #0x1c]
	cmp r0, r2
	blt _080165A0
	movs r1, #1
_080165A0:
	adds r0, r1, #0
_080165A2:
	pop {r1}
	bx r1
	.align 2, 0


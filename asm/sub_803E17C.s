	.syntax unified
	.set GetItemMaxRange, 0x0801742C + 1
	.set GetItemMinRange, 0x08017414 + 1
	.set GetUnitEquippedWeapon, 0x080168D0 + 1
	.section .text.sub_803E17C, "ax", %progbits
@ sub_803E17C @ JP 0x0803E17C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803E17C
	.thumb_func
sub_803E17C:
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	subs r3, r4, r0
	cmp r3, #0
	bge _0803E18A
	subs r3, r0, r4
_0803E18A:
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	subs r4, r0, r1
	cmp r4, #0
	blt _0803E198
	adds r5, r3, r4
	b _0803E19C
_0803E198:
	subs r0, r1, r0
	adds r5, r3, r0
_0803E19C:
	adds r0, r2, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _0803E1C2
	adds r0, r4, #0
	bl GetItemMaxRange
	cmp r5, r0
	bgt _0803E1BE
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r5, r0
	bge _0803E1C2
_0803E1BE:
	movs r0, #0x32
	b _0803E1C4
_0803E1C2:
	movs r0, #0
_0803E1C4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0


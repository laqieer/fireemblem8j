	.syntax unified
	.set GetItemMaxRange, 0x0801742C + 1
	.set GetItemMinRange, 0x08017414 + 1
	.set GetUnitEquippedWeapon, 0x080168D0 + 1
	.section .text.sub_804BCCC, "ax", %progbits
@ sub_804BCCC @ JP 0x0804BCCC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804BCCC
	.thumb_func
sub_804BCCC:
	push {r4, lr}
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r0, #0
	cmp r0, #0
	beq _0804BCF0
	bl GetItemMaxRange
	cmp r0, #1
	beq _0804BCF0
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r0, #1
	bgt _0804BCF4
_0804BCF0:
	movs r0, #1
	b _0804BCF6
_0804BCF4:
	movs r0, #2
_0804BCF6:
	pop {r4}
	pop {r1}
	bx r1


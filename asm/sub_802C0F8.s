	.syntax unified
	.set GetWeaponLevelFromExp, 0x08016B04 + 1
	.set sub_802BFFC, 0x0802BFFC + 1
	.section .text.sub_802C0F8, "ax", %progbits
@ sub_802C0F8 @ JP 0x0802C0F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802C0F8
	.thumb_func
sub_802C0F8:
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r2, #0x50
	adds r1, r0, #0
	adds r1, #0x28
	ldrb r2, [r2]
	adds r1, r1, r2
	ldrb r4, [r1]
	bl sub_802BFFC
	adds r5, r0, #0
	cmp r5, #0
	blt _0802C12C
	adds r0, r4, #0
	bl GetWeaponLevelFromExp
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetWeaponLevelFromExp
	adds r1, r0, #0
	eors r1, r4
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	b _0802C12E
_0802C12C:
	movs r0, #0
_0802C12E:
	pop {r4, r5}
	pop {r1}
	bx r1


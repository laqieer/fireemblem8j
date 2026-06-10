	.syntax unified
	.set CanUnitUseStaff, 0x0801654C + 1
	.set CanUnitUseWeapon, 0x0801631C + 1
	.set GetItemAttributes, 0x08017314 + 1
	.section .text.sub_8040228, "ax", %progbits
@ sub_8040228 @ JP 0x08040228 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8040228
	.thumb_func
sub_8040228:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
_0804022E:
	lsls r0, r6, #1
	adds r1, r5, #0
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r4, r0, #0
	cmp r4, #0
	beq _08040276
	adds r0, r4, #0
	bl GetItemAttributes
	ldr r1, _0804026C @ =0x00000405
	ands r1, r0
	cmp r1, #0
	beq _08040270
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040268
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040270
_08040268:
	movs r0, #1
	b _08040278
	.align 2, 0
_0804026C: .4byte 0x00000405
_08040270:
	adds r6, #1
	cmp r6, #4
	ble _0804022E
_08040276:
	movs r0, #0
_08040278:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0


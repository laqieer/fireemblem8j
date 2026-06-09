	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set CanUnitUseWeapon, 0x0801631C + 1
	.set GetItemMinRange, 0x08017414 + 1
	.set sub_80165F0, 0x080165F0 + 1
	.section .text.sub_804E670, "ax", %progbits
@ sub_804E670 @ JP 0x0804E670 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804E670
	.thumb_func
sub_804E670:
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	ldr r0, _0804E6C8 @ =0x03004DF0
	ldr r0, [r0]
	adds r1, #0x3c
	movs r2, #0
	ldrsb r2, [r1, r2]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r5, [r1]
	adds r1, r5, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	asrs r6, r0, #0x18
	adds r0, r5, #0
	bl GetItemMinRange
	cmp r0, #2
	ble _0804E69E
	movs r6, #0
_0804E69E:
	adds r0, r4, #0
	adds r0, #0x34
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	lsls r3, r3, #5
	movs r2, #0x2a
	ldrsh r1, [r4, r2]
	adds r3, r3, r1
	lsls r3, r3, #1
	ldr r1, _0804E6CC @ =0x02022CA8
	adds r3, r3, r1
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_80165F0
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804E6C8: .4byte 0x03004DF0
_0804E6CC: .4byte 0x02022CA8


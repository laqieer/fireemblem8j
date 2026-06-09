	.syntax unified
	.set CheckInLinkArena, 0x08042E1C + 1
	.set CountUnitUsableWeapons, 0x0809A0E0 + 1
	.set IsWeaponUsable, 0x0809A0B8 + 1
	.section .text.sub_809A178, "ax", %progbits
@ sub_809A178 @ JP 0x0809A178 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809A178
	.thumb_func
sub_809A178:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	cmp r4, r5
	beq _0809A212
	bl CheckInLinkArena
	cmp r0, #0
	beq _0809A212
	ldr r0, [r4, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _0809A1CE
	lsls r1, r7, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl IsWeaponUsable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809A1CE
	adds r0, r4, #0
	bl CountUnitUsableWeapons
	cmp r0, #1
	bgt _0809A1CE
	lsls r1, r6, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl IsWeaponUsable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809A20E
_0809A1CE:
	ldr r0, [r5, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _0809A212
	lsls r1, r6, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl IsWeaponUsable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809A212
	adds r0, r5, #0
	bl CountUnitUsableWeapons
	cmp r0, #1
	bgt _0809A212
	lsls r1, r7, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl IsWeaponUsable
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809A212
_0809A20E:
	movs r0, #0
	b _0809A214
_0809A212:
	movs r0, #1
_0809A214:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0


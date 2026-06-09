	.syntax unified
	.set CheckInLinkArena, 0x08042E1C + 1
	.set CountUnitUsableWeapons, 0x0809A0E0 + 1
	.set IsWeaponUsable, 0x0809A0B8 + 1
	.section .text.sub_809A21C, "ax", %progbits
@ sub_809A21C @ JP 0x0809A21C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809A21C
	.thumb_func
sub_809A21C:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl CheckInLinkArena
	cmp r0, #0
	beq _0809A268
	ldr r0, [r4, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _0809A268
	lsls r1, r5, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl IsWeaponUsable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809A268
	adds r0, r4, #0
	bl CountUnitUsableWeapons
	cmp r0, #1
	bne _0809A268
	adds r0, r4, #0
	adds r1, r6, #0
	bl IsWeaponUsable
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809A268
	movs r0, #0
	b _0809A26A
_0809A268:
	movs r0, #1
_0809A26A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1


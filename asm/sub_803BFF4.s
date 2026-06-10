	.syntax unified
	.set CanUnitUseStaff, 0x0801654C + 1
	.set CanUnitUseWeapon, 0x0801631C + 1
	.set GetItemAttributes, 0x08017314 + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_803C0B0, 0x0803C0B0 + 1
	.set sub_803C0F8, 0x0803C0F8 + 1
	.set sub_803C144, 0x0803C144 + 1
	.section .text.sub_803BFF4, "ax", %progbits
@ sub_803BFF4 @ JP 0x0803BFF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803BFF4
	.thumb_func
sub_803BFF4:
	push {r4, r5, r6, r7, lr}
	ldr r0, _0803C0A8 @ =0x0203AA00
	adds r0, #0x85
	movs r1, #0
	strb r1, [r0]
	movs r4, #1
_0803C000:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r7, r4, #1
	cmp r5, #0
	beq _0803C09A
	ldr r0, [r5]
	cmp r0, #0
	beq _0803C09A
	ldr r0, [r5, #0xc]
	ldr r1, _0803C0AC @ =0x00010005
	ands r0, r1
	cmp r0, #0
	bne _0803C09A
	ldr r0, [r5, #4]
	ldrb r0, [r0, #0x12]
	ldrb r1, [r5, #0x1d]
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _0803C0A8 @ =0x0203AA00
	adds r0, #0x85
	ldrb r2, [r0]
	cmp r1, r2
	bls _0803C036
	strb r1, [r0]
_0803C036:
	movs r6, #0
	ldrh r4, [r5, #0x1e]
	cmp r4, #0
	beq _0803C094
_0803C03E:
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803C05A
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C080
_0803C05A:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _0803C070
	ldrb r1, [r5, #0xa]
	movs r0, #1
	orrs r0, r1
	strb r0, [r5, #0xa]
_0803C070:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_803C0B0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_803C0F8
_0803C080:
	adds r6, #1
	cmp r6, #4
	bgt _0803C094
	lsls r1, r6, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _0803C03E
_0803C094:
	adds r0, r5, #0
	bl sub_803C144
_0803C09A:
	adds r4, r7, #0
	cmp r4, #0x3f
	ble _0803C000
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C0A8: .4byte 0x0203AA00
_0803C0AC: .4byte 0x00010005


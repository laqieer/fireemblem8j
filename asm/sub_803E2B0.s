	.syntax unified
	.set AreUnitsAllied, 0x08024D3C + 1
	.set CanUnitUseWeapon, 0x0801631C + 1
	.set GetItemMight, 0x08017384 + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_8018EC4, 0x08018EC4 + 1
	.set sub_803ACB0, 0x0803ACB0 + 1
	.set sub_803B560, 0x0803B560 + 1
	.section .text.sub_803E2B0, "ax", %progbits
@ sub_803E2B0 @ JP 0x0803E2B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803E2B0
	.thumb_func
sub_803E2B0:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #0
	mov r8, r0
	mov sb, r0
	movs r4, #1
_0803E2C2:
	adds r0, r4, #0
	bl GetUnit
	adds r6, r0, #0
	adds r4, #1
	mov sl, r4
	cmp r6, #0
	beq _0803E3AC
	ldr r0, [r6]
	cmp r0, #0
	beq _0803E3AC
	ldr r0, [r6, #0xc]
	ldr r1, _0803E3C0 @ =0x0001000D
	ands r0, r1
	cmp r0, #0
	bne _0803E3AC
	ldr r0, _0803E3C4 @ =0x0202BE40
	ldrb r0, [r0]
	movs r1, #0xb
	ldrsb r1, [r6, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803E3AC
	movs r5, #0
	ldrh r4, [r6, #0x1e]
	cmp r4, #0
	beq _0803E336
_0803E2FC:
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803E322
	adds r0, r4, #0
	bl GetItemMight
	cmp r0, sb
	ble _0803E322
	mov r8, r4
	mov r0, r8
	bl GetItemMight
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_0803E322:
	adds r5, #1
	cmp r5, #4
	bgt _0803E336
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _0803E2FC
_0803E336:
	mov r1, r8
	cmp r1, #0
	beq _0803E3AC
	ldr r0, _0803E3C8 @ =0x03004DF0
	ldr r0, [r0]
	adds r1, r6, #0
	mov r2, r8
	bl sub_803ACB0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803E3AC
	adds r0, r6, #0
	mov r1, r8
	bl sub_803B560
	ldr r0, _0803E3CC @ =0x0202E4D0
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r1, r0, #1
	cmp r1, #0
	blt _0803E3AC
_0803E362:
	ldr r0, _0803E3CC @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt _0803E3A6
	lsls r5, r1, #2
_0803E372:
	ldr r0, _0803E3D0 @ =0x0202E4E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803E3A0
	adds r0, r6, #0
	bl sub_8018EC4
	ldr r1, _0803E3D4 @ =0x0202E4EC
	ldr r1, [r1]
	adds r1, r5, r1
	ldr r1, [r1]
	adds r1, r1, r4
	add r0, sb
	asrs r0, r0, #1
	ldrb r2, [r1]
	adds r0, r0, r2
	strb r0, [r1]
_0803E3A0:
	subs r4, #1
	cmp r4, #0
	bge _0803E372
_0803E3A6:
	adds r1, r7, #0
	cmp r1, #0
	bge _0803E362
_0803E3AC:
	mov r4, sl
	cmp r4, #0xbf
	ble _0803E2C2
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803E3C0: .4byte 0x0001000D
_0803E3C4: .4byte 0x0202BE40
_0803E3C8: .4byte 0x03004DF0
_0803E3CC: .4byte 0x0202E4D0
_0803E3D0: .4byte 0x0202E4E0
_0803E3D4: .4byte 0x0202E4EC


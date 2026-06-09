	.syntax unified
	.set AiSetDecision, 0x08039C98 + 1
	.set AreUnitsAllied, 0x08024D3C + 1
	.set GetItemMaxRange, 0x0801742C + 1
	.set GetItemMinRange, 0x08017414 + 1
	.set GetUnit, 0x08019108 + 1
	.set GetUnitEquippedWeapon, 0x080168D0 + 1
	.set GetUnitEquippedWeaponSlot, 0x08016900 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_801B674, 0x0801B674 + 1
	.set sub_803E17C, 0x0803E17C + 1
	.section .text.sub_803EE40, "ax", %progbits
@ sub_803EE40 @ JP 0x0803EE40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803EE40
	.thumb_func
sub_803EE40:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #0xc]
	mov sl, r1
	ldr r0, _0803EE64 @ =0x03004DF0
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0
	bne _0803EE98
	b _0803EF4E
	.align 2, 0
_0803EE64: .4byte 0x03004DF0
_0803EE68:
	ldr r0, _0803EE94 @ =0x03004DF0
	ldr r0, [r0]
	bl GetUnitEquippedWeaponSlot
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sb
	asrs r2, r1, #0x10
	mov r3, r8
	asrs r1, r3, #0x10
	ldrb r3, [r5, #0xb]
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	movs r2, #1
	bl AiSetDecision
	movs r0, #1
	b _0803EF50
	.align 2, 0
_0803EE94: .4byte 0x03004DF0
_0803EE98:
	ldr r0, _0803EF60 @ =0x0202E4DC
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	ldr r0, [sp, #0xc]
	lsls r0, r0, #0x10
	mov sb, r0
	asrs r6, r0, #0x10
	mov r1, sl
	lsls r1, r1, #0x10
	mov r8, r1
	asrs r5, r1, #0x10
	adds r0, r7, #0
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r7, #0
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_801B674
	ldr r0, _0803EF64 @ =0x0202E4D0
	movs r3, #2
	ldrsh r0, [r0, r3]
	subs r7, r0, #1
	cmp r7, #0
	blt _0803EF4E
_0803EEE0:
	ldr r0, _0803EF64 @ =0x0202E4D0
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	cmp r4, #0
	blt _0803EF48
	lsls r6, r7, #2
_0803EEEE:
	ldr r0, _0803EF60 @ =0x0202E4DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803EF42
	ldr r5, _0803EF68 @ =0x0202E4D4
	ldr r0, [r5]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803EF42
	ldr r0, _0803EF6C @ =0x0202BE40
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803EF42
	ldr r0, [r5]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r5, r0, #0
	ldr r0, [sp, #0xc]
	mov r1, sl
	adds r2, r5, #0
	bl sub_803E17C
	cmp r0, #0
	bne _0803EE68
_0803EF42:
	subs r4, #1
	cmp r4, #0
	bge _0803EEEE
_0803EF48:
	subs r7, #1
	cmp r7, #0
	bge _0803EEE0
_0803EF4E:
	movs r0, #0
_0803EF50:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803EF60: .4byte 0x0202E4DC
_0803EF64: .4byte 0x0202E4D0
_0803EF68: .4byte 0x0202E4D4
_0803EF6C: .4byte 0x0202BE40


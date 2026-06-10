	.syntax unified
	.set GenerateExtendedMovementMapOnRange, 0x0801A108 + 1
	.set GetUnitMovementCost, 0x08018A60 + 1
	.set sub_803AD58, 0x0803AD58 + 1
	.set sub_803BA10, 0x0803BA10 + 1
	.section .text.sub_803D268, "ax", %progbits
@ sub_803D268 @ JP 0x0803D268 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803D268
	.thumb_func
sub_803D268:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _0803D2B8 @ =0x03004DF0
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl GenerateExtendedMovementMapOnRange
	ldr r6, _0803D2BC @ =0x030017C8
	ldr r0, [r6]
	adds r0, #3
	add r5, sp, #4
	movs r1, #0
	adds r2, r5, #0
	bl sub_803AD58
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _0803D2C0
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl sub_803BA10
	b _0803D2CE
	.align 2, 0
_0803D2B8: .4byte 0x03004DF0
_0803D2BC: .4byte 0x030017C8
_0803D2C0:
	ldr r0, _0803D2DC @ =0x0203AA00
	adds r0, #0x86
	movs r2, #0
	movs r1, #4
	strb r1, [r0]
	ldr r0, _0803D2E0 @ =0x030017C0
	strb r2, [r0]
_0803D2CE:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D2DC: .4byte 0x0203AA00
_0803D2E0: .4byte 0x030017C0


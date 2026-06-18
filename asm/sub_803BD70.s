	.syntax unified
	.set GenerateExtendedMovementMapOnRange, 0x0801A108 + 1
	.set GetUnitMovementCost, 0x08018A60 + 1
	.set sub_801A0D4, 0x0801A0D4 + 1
	.section .text.sub_803BD70, "ax", %progbits
@ AiGetUnitClosestValidPosition @ JP 0x0803BD70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AiGetUnitClosestValidPosition
	.thumb_func
AiGetUnitClosestValidPosition:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r5, r3, #0
	lsls r1, r1, #0x10
	asrs r4, r1, #0x10
	lsls r2, r2, #0x10
	asrs r6, r2, #0x10
	ldr r0, _0803BDC0 @ =0x0202E4D4
	ldr r0, [r0]
	lsls r2, r6, #2
	adds r0, r2, r0
	ldr r1, [r0]
	adds r1, r1, r4
	ldr r3, _0803BDC4 @ =0x0202E4EC
	ldr r0, [r3]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r1]
	ldrb r0, [r0]
	orrs r1, r0
	ldr r0, _0803BDC8 @ =0x0202E4E8
	mov r8, r0
	ldr r0, [r0]
	adds r2, r2, r0
	ldr r0, [r2]
	adds r0, r0, r4
	ldrb r0, [r0]
	orrs r1, r0
	cmp r1, #0
	bne _0803BDCC
	strh r4, [r5]
	strh r6, [r5, #2]
	b _0803BEC8
	.align 2, 0
_0803BDC0: .4byte 0x0202E4D4
_0803BDC4: .4byte 0x0202E4EC
_0803BDC8: .4byte 0x0202E4E8
_0803BDCC:
	adds r0, r7, #0
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl GenerateExtendedMovementMapOnRange
	adds r0, r7, #0
	bl sub_801A0D4
	movs r1, #0x7c
	str r1, [sp]
	ldr r0, _0803BDF4 @ =0x0000FFFF
	strh r0, [r5]
	ldr r2, _0803BDF8 @ =0x0202E4D0
	ldrh r0, [r2, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _0803BE94
	.align 2, 0
_0803BDF4: .4byte 0x0000FFFF
_0803BDF8: .4byte 0x0202E4D0
_0803BDFC:
	ldr r2, _0803BEAC @ =0x0202E4D0
	ldrh r0, [r2]
	subs r0, #1
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	subs r3, r1, #1
	str r3, [sp, #4]
	cmp r2, #0
	blt _0803BE90
	lsls r3, r1, #2
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r7, _0803BEB0 @ =0x0202E4DC
	mov sb, r7
	ldr r0, _0803BEB4 @ =0x0202E4D4
	mov r8, r0
	ldr r1, _0803BEB8 @ =0x0202E4EC
	mov ip, r1
	ldr r7, _0803BEBC @ =0x0202E4E8
	str r7, [sp, #8]
	ldr r6, _0803BEC0 @ =0x0202E4E0
	lsls r0, r2, #0x10
	ldr r1, _0803BEC4 @ =0xFFFF0000
	adds r4, r0, r1
_0803BE2E:
	mov r7, sb
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803BE84
	mov r1, r8
	ldr r0, [r1]
	adds r0, r3, r0
	ldr r1, [r0]
	adds r1, r1, r2
	mov r7, ip
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r1, [r1]
	ldrb r0, [r0]
	orrs r1, r0
	ldr r7, [sp, #8]
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	orrs r1, r0
	cmp r1, #0
	bne _0803BE84
	ldr r0, [r6]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r1, r0, r2
	ldrb r0, [r1]
	ldr r7, [sp]
	cmp r0, r7
	bhi _0803BE84
	adds r1, r0, #0
	str r1, [sp]
	strh r2, [r5]
	mov r0, sl
	strh r0, [r5, #2]
_0803BE84:
	adds r0, r4, #0
	ldr r1, _0803BEC4 @ =0xFFFF0000
	adds r4, r4, r1
	asrs r2, r0, #0x10
	cmp r2, #0
	bge _0803BE2E
_0803BE90:
	ldr r2, [sp, #4]
	lsls r0, r2, #0x10
_0803BE94:
	asrs r1, r0, #0x10
	cmp r1, #0
	bge _0803BDFC
	movs r3, #0
	ldrsh r1, [r5, r3]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0803BEC8
	movs r0, #0
	b _0803BECA
	.align 2, 0
_0803BEAC: .4byte 0x0202E4D0
_0803BEB0: .4byte 0x0202E4DC
_0803BEB4: .4byte 0x0202E4D4
_0803BEB8: .4byte 0x0202E4EC
_0803BEBC: .4byte 0x0202E4E8
_0803BEC0: .4byte 0x0202E4E0
_0803BEC4: .4byte 0xFFFF0000
_0803BEC8:
	movs r0, #1
_0803BECA:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0


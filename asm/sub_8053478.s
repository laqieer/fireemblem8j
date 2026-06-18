	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetEfxHp, 0x08059890 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8053478, "ax", %progbits
@ EfxHpBarResire_SetAnotherSide @ JP 0x08053478 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global EfxHpBarResire_SetAnotherSide
	.thumb_func
EfxHpBarResire_SetAnotherSide:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r6, r2]
	cmp r0, r1
	ble _08053512
	ldr r4, _080534F4 @ =0x0203E14E
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r5, [r0, r1]
	adds r4, r5, #1
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r5, r5, #1
	adds r5, r5, r0
	adds r0, r5, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x4c]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r4, r4, #1
	adds r4, r4, r0
	adds r0, r4, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x50]
	strh r7, [r6, #0x2c]
	ldr r1, [r6, #0x4c]
	strh r1, [r6, #0x2e]
	str r7, [r6, #0x54]
	str r7, [r6, #0x58]
	cmp r1, r0
	bne _080534E4
	movs r0, #1
	str r0, [r6, #0x58]
_080534E4:
	ldr r1, [r6, #0x4c]
	ldr r0, [r6, #0x50]
	cmp r1, r0
	ble _080534F8
	movs r0, #1
	rsbs r0, r0, #0
	b _080534FA
	.align 2, 0
_080534F4: .4byte 0x0203E14E
_080534F8:
	movs r0, #1
_080534FA:
	str r0, [r6, #0x48]
	adds r0, r6, #0
	bl sub_8002DE4
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	ldr r1, _08053518 @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #2
	strh r1, [r0]
_08053512:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053518: .4byte 0x02017780


	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_8037FA8, 0x08037FA8 + 1
	.set sub_80A93E8, 0x080A93E8 + 1
	.section .text.sub_8037FDC, "ax", %progbits
@ sub_8037FDC @ JP 0x08037FDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8037FDC
	.thumb_func
sub_8037FDC:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r4, [r6]
	bl sub_80A93E8
	ldr r1, _080380D8 @ =0x0202BCEC
	ldr r1, [r1, #0x38]
	lsls r1, r1, #4
	lsrs r1, r1, #0xc
	subs r0, r0, r1
	adds r4, r4, r0
	ldr r0, _080380DC @ =0x0000C350
	cmp r4, r0
	ble _08037FFA
	adds r4, r0, #0
_08037FFA:
	strh r4, [r6]
	ldrb r4, [r6, #2]
	movs r5, #1
_08038000:
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0803801E
	ldr r0, [r1]
	cmp r0, #0
	beq _0803801E
	ldr r0, [r1, #0xc]
	ldr r1, _080380E0 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0803801E
	adds r4, #1
_0803801E:
	adds r5, #1
	cmp r5, #0x3f
	ble _08038000
	strb r4, [r6, #2]
	ldrb r0, [r6, #3]
	ldrb r1, [r6, #4]
	movs r2, #1
	ands r1, r2
	lsls r4, r1, #8
	orrs r4, r0
	ldr r5, _080380D8 @ =0x0202BCEC
	ldrh r0, [r5, #0x10]
	adds r4, r4, r0
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r4, r0
	ble _08038042
	adds r4, r0, #0
_08038042:
	strb r4, [r6, #3]
	lsrs r1, r4, #8
	ands r1, r2
	ldrb r2, [r6, #4]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, #4]
	adds r0, r6, #0
	bl sub_8037FA8
	ldr r1, _080380E4 @ =0x0003FFFF
	ands r1, r0
	lsls r1, r1, #1
	ldr r0, [r6, #4]
	ldr r2, _080380E8 @ =0xFFF80001
	ands r0, r2
	orrs r0, r1
	str r0, [r6, #4]
	ldrh r3, [r6, #6]
	lsrs r1, r3, #3
	ldrb r0, [r6, #8]
	movs r2, #7
	ands r0, r2
	lsls r0, r0, #0xd
	adds r7, r5, #0
	adds r7, #0x48
	orrs r0, r1
	ldrh r1, [r7]
	adds r4, r0, r1
	ldr r0, _080380DC @ =0x0000C350
	cmp r4, r0
	ble _08038088
	adds r4, r0, #0
_08038088:
	ldr r1, _080380EC @ =0x00001FFF
	ands r1, r4
	lsls r1, r1, #3
	adds r0, r2, #0
	ands r0, r3
	orrs r0, r1
	strh r0, [r6, #6]
	lsrs r1, r4, #0xd
	ands r1, r2
	ldrb r2, [r6, #8]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, #8]
	ldrb r1, [r5, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080380D2
	ldr r2, [r6, #8]
	lsls r0, r2, #0xc
	lsrs r0, r0, #0x16
	ldrh r7, [r7]
	adds r4, r0, r7
	movs r0, #0xfa
	lsls r0, r0, #2
	cmp r4, r0
	ble _080380C4
	adds r4, r0, #0
_080380C4:
	ldr r1, _080380F0 @ =0x000003FF
	ands r1, r4
	lsls r1, r1, #0xa
	ldr r0, _080380F4 @ =0xFFF003FF
	ands r0, r2
	orrs r0, r1
	str r0, [r6, #8]
_080380D2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080380D8: .4byte 0x0202BCEC
_080380DC: .4byte 0x0000C350
_080380E0: .4byte 0x0001000C
_080380E4: .4byte 0x0003FFFF
_080380E8: .4byte 0xFFF80001
_080380EC: .4byte 0x00001FFF
_080380F0: .4byte 0x000003FF
_080380F4: .4byte 0xFFF003FF


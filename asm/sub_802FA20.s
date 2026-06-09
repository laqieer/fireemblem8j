	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set LoadUnits, 0x080177DC + 1
	.set StartLightRuneAnim2, 0x08021510 + 1
	.set sub_802CA5C, 0x0802CA5C + 1
	.set sub_802CB8C, 0x0802CB8C + 1
	.section .text.sub_802FA20, "ax", %progbits
@ sub_802FA20 @ JP 0x0802FA20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802FA20
	.thumb_func
sub_802FA20:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802FAC8 @ =0x0203A954
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl sub_802CA5C
	adds r0, r6, #0
	bl sub_802CB8C
	ldrb r5, [r4, #0x13]
	ldrb r4, [r4, #0x14]
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl StartLightRuneAnim2
	movs r2, #0
	ldr r6, _0802FACC @ =0x03001780
	movs r0, #0x80
	strb r0, [r6]
	movs r0, #0x43
	strb r0, [r6, #1]
	movs r0, #1
	strb r0, [r6, #2]
	movs r0, #8
	strb r0, [r6, #3]
	movs r0, #0x3f
	ands r5, r0
	ldrb r1, [r6, #4]
	movs r0, #0x40
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r5
	strb r0, [r6, #4]
	movs r0, #0x3f
	ands r4, r0
	lsls r4, r4, #6
	ldrh r1, [r6, #4]
	ldr r0, _0802FAD0 @ =0xFFFFF03F
	ands r0, r1
	orrs r0, r4
	strh r0, [r6, #4]
	strb r2, [r6, #7]
	str r2, [r6, #8]
	ldrb r1, [r6, #5]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r6, #5]
	movs r0, #0x20
	strb r0, [r6, #0xc]
	movs r0, #0x21
	strb r0, [r6, #0xd]
	movs r0, #0x27
	strb r0, [r6, #0xe]
	movs r0, #0x29
	strb r0, [r6, #0xf]
	strb r2, [r6, #0x10]
	strb r2, [r6, #0x11]
	strb r2, [r6, #0x12]
	strb r2, [r6, #0x13]
	movs r0, #1
	bl GetUnitFromCharId
	adds r2, r0, #0
	cmp r2, #0
	bne _0802FAB8
	adds r0, r6, #0
	bl LoadUnits
_0802FAB8:
	ldr r0, _0802FAD4 @ =0x0203A568
	adds r0, #0x6f
	movs r1, #0xff
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802FAC8: .4byte 0x0203A954
_0802FACC: .4byte 0x03001780
_0802FAD0: .4byte 0xFFFFF03F
_0802FAD4: .4byte 0x0203A568


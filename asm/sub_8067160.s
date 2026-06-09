	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetEkrDragonStatusType, 0x0807201C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056828, 0x08056828 + 1
	.set sub_8056890, 0x08056890 + 1
	.section .text.sub_8067160, "ax", %progbits
@ sub_8067160 @ JP 0x08067160 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8067160
	.thumb_func
sub_8067160:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	ldr r4, _08067208 @ =0x02000010
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r4, [r0]
	cmp r4, #0
	beq _0806718E
	ldrh r0, [r4, #8]
	ldr r1, _0806720C @ =0x0000F3FF
	ands r1, r0
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r1, r0
	strh r1, [r4, #8]
_0806718E:
	adds r0, r5, #0
	adds r0, #0x2c
	adds r1, r5, #0
	adds r1, #0x44
	ldr r2, [r5, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _080671B4
	ldr r0, [r5, #0x4c]
	ldr r1, _08067210 @ =0x020228AA
	movs r2, #0xf
	str r2, [sp]
	adds r2, r3, #0
	movs r3, #0xf
	bl sub_8056828
_080671B4:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r7, #0x30
	ldrsh r1, [r5, r7]
	cmp r0, r1
	ble _08067284
	ldr r1, _08067214 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r0, _08067218 @ =0x02000000
	ldr r0, [r0]
	bl GetEkrDragonStatusType
	cmp r0, #0
	bne _08067220
	ldr r3, _0806721C @ =0x03003020
	ldrb r2, [r3, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	b _0806724C
	.align 2, 0
_08067208: .4byte 0x02000010
_0806720C: .4byte 0x0000F3FF
_08067210: .4byte 0x020228AA
_08067214: .4byte 0x0201774C
_08067218: .4byte 0x02000000
_0806721C: .4byte 0x03003020
_08067220:
	ldr r3, _0806728C @ =0x03003020
	ldrb r2, [r3, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x18]
	ldrb r0, [r3, #0x14]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x14]
_0806724C:
	ldr r2, [r5, #0x5c]
	ldrh r1, [r2, #8]
	ldr r3, _08067290 @ =0x0000F3FF
	adds r0, r3, #0
	ands r0, r1
	strh r0, [r2, #8]
	ldr r1, [r5, #0x5c]
	ldrh r0, [r1, #8]
	movs r7, #0x80
	lsls r7, r7, #4
	adds r2, r7, #0
	orrs r0, r2
	strh r0, [r1, #8]
	ldrh r1, [r6, #8]
	adds r0, r3, #0
	ands r0, r1
	orrs r0, r2
	strh r0, [r6, #8]
	cmp r4, #0
	beq _0806727E
	ldrh r1, [r4, #8]
	adds r0, r3, #0
	ands r0, r1
	orrs r0, r2
	strh r0, [r4, #8]
_0806727E:
	adds r0, r5, #0
	bl sub_8002DE4
_08067284:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806728C: .4byte 0x03003020
_08067290: .4byte 0x0000F3FF


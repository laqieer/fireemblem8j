	.syntax unified
	.set AP_Create, 0x0800916C + 1
	.set AP_Delete, 0x08009194 + 1
	.set AP_SwitchAnimation, 0x08009408 + 1
	.set GetMapUnitMMSGfxBuffer, 0x080BFA94 + 1
	.set MMS_GetGfx, 0x080BFA6C + 1
	.set MMS_GetROMTCS2, 0x080BFA80 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80BFF10, "ax", %progbits
@ sub_80BFF10 @ JP 0x080BFF10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BFF10
	.thumb_func
sub_80BFF10:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	adds r7, r1, #0
	adds r4, r2, #0
	lsls r0, r7, #2
	mov sb, r0
	mov r0, r8
	adds r0, #0x34
	add r0, sb
	ldr r5, [r0]
	ldr r0, [r5, #0x40]
	cmp r0, #0
	beq _080BFF34
	bl AP_Delete
_080BFF34:
	adds r2, r4, #0
	cmp r2, #0
	bne _080BFF3C
	ldrh r2, [r5, #0x38]
_080BFF3C:
	ldrh r1, [r5, #0x3a]
	cmp r2, r1
	beq _080BFFAA
	strh r2, [r5, #0x3a]
	lsls r0, r2, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	bl MMS_GetROMTCS2
	movs r1, #8
	bl AP_Create
	adds r6, r0, #0
	cmp r6, #0
	bne _080BFF5E
	movs r0, #0
	b _080BFFAC
_080BFF5E:
	adds r0, r5, #0
	adds r0, #0x37
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r6, #0
	bl AP_SwitchAnimation
	adds r0, r4, #0
	bl MMS_GetGfx
	adds r4, r0, #0
	adds r0, r7, #0
	bl GetMapUnitMMSGfxBuffer
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8013008
	adds r0, r7, #0
	bl GetMapUnitMMSGfxBuffer
	str r0, [r6, #0x24]
	mov r1, r8
	ldr r0, [r1, #0x2c]
	str r0, [r5, #0x30]
	ldr r1, [r1, #0x2c]
	add r1, sb
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r2, [r0]
	movs r0, #0xf
	ands r0, r2
	lsls r0, r0, #0xc
	adds r1, r1, r0
	ldrh r0, [r5, #0x2e]
	adds r1, r1, r0
	strh r1, [r6, #0x22]
	str r6, [r5, #0x40]
_080BFFAA:
	movs r0, #1
_080BFFAC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1


	.syntax unified
	.set AP_Create, 0x0800916C + 1
	.set AP_SwitchAnimation, 0x08009408 + 1
	.set GetClassSMSId, 0x08018AA4 + 1
	.set GetMapUnitMMSGfxBuffer, 0x080BFA94 + 1
	.set GetPaletteIdForAllegience, 0x080BFC04 + 1
	.set MMS_GetGfx, 0x080BFA6C + 1
	.set MMS_GetROMTCS2, 0x080BFA80 + 1
	.set Proc_End, 0x08002CBC + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8026720, 0x08026720 + 1
	.section .text.sub_80BFC20, "ax", %progbits
@ sub_80BFC20 @ JP 0x080BFC20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BFC20
	.thumb_func
sub_80BFC20:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	adds r4, r2, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	movs r7, #0
	ldr r0, [r0, #0x34]
	cmp r0, #0
	beq _080BFC4E
	mov r1, sb
	adds r1, #0x34
_080BFC40:
	adds r1, #4
	adds r7, #1
	cmp r7, #6
	bgt _080BFC4E
	ldr r0, [r1]
	cmp r0, #0
	bne _080BFC40
_080BFC4E:
	cmp r7, #7
	bne _080BFC58
	movs r0, #1
	rsbs r0, r0, #0
	b _080BFD2A
_080BFC58:
	mov r0, sb
	ldr r1, [r0, #0x14]
	ldr r0, _080BFC70 @ =0x08AC188C
	bl sub_8002BCC
	adds r5, r0, #0
	cmp r5, #0
	bne _080BFC74
	movs r0, #2
	rsbs r0, r0, #0
	b _080BFD2A
	.align 2, 0
_080BFC70: .4byte 0x08AC188C
_080BFC74:
	movs r0, #0x80
	lsls r0, r0, #4
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	adds r0, #0x35
	strb r4, [r0]
	ldrb r0, [r0]
	bl GetPaletteIdForAllegience
	movs r1, #0x36
	adds r1, r1, r5
	mov sl, r1
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x34
	strb r7, [r4]
	mov r0, r8
	strh r0, [r5, #0x38]
	strh r0, [r5, #0x3a]
	mov r0, r8
	bl GetClassSMSId
	movs r1, #0
	ldrsb r1, [r4, r1]
	ldr r2, _080BFD1C @ =0x081F5C48
	adds r2, r1, r2
	ldrb r2, [r2]
	bl sub_8026720
	movs r0, #8
	strh r0, [r5, #0x2c]
	mov r0, r8
	bl MMS_GetROMTCS2
	movs r1, #8
	bl AP_Create
	adds r6, r0, #0
	cmp r6, #0
	beq _080BFD20
	adds r0, r5, #0
	adds r0, #0x37
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r6, #0
	bl AP_SwitchAnimation
	mov r0, r8
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
	mov r1, sb
	ldr r0, [r1, #0x2c]
	str r0, [r5, #0x30]
	lsls r3, r7, #2
	ldr r1, [r1, #0x2c]
	adds r1, r1, r3
	mov r0, sl
	ldrb r2, [r0]
	movs r0, #0xf
	ands r0, r2
	lsls r0, r0, #0xc
	adds r1, r1, r0
	ldrh r0, [r5, #0x2e]
	adds r1, r1, r0
	strh r1, [r6, #0x22]
	str r6, [r5, #0x40]
	mov r0, sb
	adds r0, #0x34
	adds r0, r0, r3
	str r5, [r0]
	adds r0, r7, #0
	b _080BFD2A
	.align 2, 0
_080BFD1C: .4byte 0x081F5C48
_080BFD20:
	ldr r0, _080BFD38 @ =0x08AC188C
	bl Proc_End
	movs r0, #3
	rsbs r0, r0, #0
_080BFD2A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BFD38: .4byte 0x08AC188C


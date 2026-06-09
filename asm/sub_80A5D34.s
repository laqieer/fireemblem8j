	.syntax unified
	.set GetSupportScreenPartnerCharId, 0x080A4908 + 1
	.set GetSupportScreenPartnerIsAlive, 0x080A48EC + 1
	.set GetSupportScreenPartnerSupportLevel, 0x080A48BC + 1
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_80A5D34, "ax", %progbits
@ sub_80A5D34 @ JP 0x080A5D34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A5D34
	.thumb_func
sub_80A5D34:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080A5DC0
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	mov r8, r0
	ldrb r0, [r0]
	cmp r4, r0
	bge _080A5E0A
	movs r1, #0x3f
	adds r1, r1, r6
	mov sl, r1
_080A5D60:
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl GetSupportScreenPartnerCharId
	adds r7, r0, #0
	mov r2, sl
	adds r1, r2, r4
	movs r0, #0
	strb r0, [r1]
	movs r5, #1
	adds r4, #1
	mov sb, r4
	adds r4, r1, #0
_080A5D7A:
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _080A5DAE
	ldr r0, [r1]
	cmp r0, #0
	beq _080A5DAE
	ldrb r0, [r0, #4]
	cmp r0, r7
	bne _080A5DAE
	ldr r1, [r1, #0xc]
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	bne _080A5DAE
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _080A5DAA
	movs r0, #2
	b _080A5DAC
_080A5DAA:
	movs r0, #1
_080A5DAC:
	strb r0, [r4]
_080A5DAE:
	adds r5, #1
	cmp r5, #0x3f
	ble _080A5D7A
	mov r4, sb
	mov r0, r8
	ldrb r0, [r0]
	cmp r4, r0
	blt _080A5D60
	b _080A5E0A
_080A5DC0:
	adds r1, r6, #0
	adds r1, #0x3b
	strb r0, [r1]
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	mov r8, r0
	ldrb r2, [r0]
	cmp r4, r2
	bge _080A5E0A
	adds r7, r1, #0
_080A5DD6:
	adds r0, r6, #0
	adds r0, #0x3f
	adds r5, r0, r4
	movs r0, #0
	strb r0, [r5]
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl GetSupportScreenPartnerIsAlive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A5E00
	movs r0, #1
	strb r0, [r5]
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl GetSupportScreenPartnerSupportLevel
	ldrb r1, [r7]
	adds r1, r1, r0
	strb r1, [r7]
_080A5E00:
	adds r4, #1
	mov r0, r8
	ldrb r0, [r0]
	cmp r4, r0
	blt _080A5DD6
_080A5E0A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0


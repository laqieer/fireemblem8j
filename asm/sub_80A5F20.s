	.syntax unified
	.set GetSupportScreenPartnerSupportLevel, 0x080A48BC + 1
	.section .text.sub_80A5F20, "ax", %progbits
@ sub_80A5F20 @ JP 0x080A5F20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A5F20
	.thumb_func
sub_80A5F20:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
_080A5F28:
	cmp r5, #0
	blt _080A5F94
	adds r0, r7, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	subs r0, #1
	cmp r5, r0
	bgt _080A5F94
	adds r0, r7, #0
	adds r0, #0x3f
	adds r0, r0, r5
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A5F90
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl GetSupportScreenPartnerSupportLevel
	cmp r0, #0
	ble _080A5F90
	adds r6, r7, #0
	adds r6, #0x39
	ldrb r0, [r6]
	movs r1, #0xe3
	ands r1, r0
	movs r2, #7
	adds r0, r5, #0
	ands r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	strb r1, [r6]
	movs r4, #3
	ands r4, r1
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl GetSupportScreenPartnerSupportLevel
	cmp r4, r0
	blt _080A5F94
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl GetSupportScreenPartnerSupportLevel
	ldrb r2, [r6]
	movs r1, #0xfc
	ands r1, r2
	subs r0, #1
	adds r1, r1, r0
	strb r1, [r6]
	b _080A5F94
_080A5F90:
	adds r5, r5, r4
	b _080A5F28
_080A5F94:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0


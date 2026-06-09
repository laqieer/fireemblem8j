	.syntax unified
	.set GetSupportScreenCharIdAt, 0x080A492C + 1
	.set GetSupportScreenPartnerCharId, 0x080A4908 + 1
	.set GetTotalSupportLevel, 0x080A4D18 + 1
	.set GetUnitsAverageSupportValue, 0x080A7EAC + 1
	.section .text.sub_80A5E48, "ax", %progbits
@ sub_80A5E48 @ JP 0x080A5E48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A5E48
	.thumb_func
sub_80A5E48:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r0, #0x38
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #0
	beq _080A5E6E
	ldr r0, [r4, #0x2c]
	bl GetTotalSupportLevel
	movs r1, #5
	subs r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x3d
	strb r1, [r0]
	b _080A5EBA
_080A5E6E:
	ldr r0, [r4, #0x2c]
	bl GetSupportScreenCharIdAt
	mov sb, r0
	adds r1, r4, #0
	adds r1, #0x3d
	strb r5, [r1]
	movs r5, #0
	adds r0, r4, #0
	adds r0, #0x3c
	mov r8, r1
	adds r7, r0, #0
	ldrb r0, [r7]
	cmp r5, r0
	bge _080A5EAC
	mov r6, r8
_080A5E8E:
	ldr r0, [r4, #0x2c]
	adds r1, r5, #0
	bl GetSupportScreenPartnerCharId
	adds r1, r0, #0
	mov r0, sb
	bl GetUnitsAverageSupportValue
	ldrb r1, [r6]
	adds r1, r1, r0
	strb r1, [r6]
	adds r5, #1
	ldrb r2, [r7]
	cmp r5, r2
	blt _080A5E8E
_080A5EAC:
	ldr r0, [r4, #0x2c]
	bl GetTotalSupportLevel
	mov r2, r8
	ldrb r1, [r2]
	subs r1, r1, r0
	strb r1, [r2]
_080A5EBA:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0


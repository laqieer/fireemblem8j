	.syntax unified
	.set GetSupportScreenCharIdAt, 0x080A492C + 1
	.set GetSupportScreenPartnerCharId, 0x080A4908 + 1
	.set GetSupportScreenPartnerCount, 0x080A5944 + 1
	.set GetTotalSupportLevel, 0x080A4D18 + 1
	.set GetUnitsAverageSupportValue, 0x080A7EAC + 1
	.section .text.sub_80A4D54, "ax", %progbits
@ sub_80A4D54 @ JP 0x080A4D54 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A4D54
	.thumb_func
sub_80A4D54:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A4D70
	adds r0, r6, #0
	bl GetTotalSupportLevel
	cmp r0, #5
	beq _080A4DB2
	b _080A4DB8
_080A4D70:
	movs r0, #0
	mov r8, r0
	adds r0, r6, #0
	bl GetTotalSupportLevel
	mov sb, r0
	adds r0, r6, #0
	bl GetSupportScreenCharIdAt
	bl GetSupportScreenPartnerCount
	adds r7, r0, #0
	movs r5, #0
	cmp r8, r7
	bge _080A4DAE
_080A4D8E:
	adds r0, r6, #0
	bl GetSupportScreenCharIdAt
	adds r4, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl GetSupportScreenPartnerCharId
	adds r1, r0, #0
	adds r0, r4, #0
	bl GetUnitsAverageSupportValue
	add r8, r0
	adds r5, #1
	cmp r5, r7
	blt _080A4D8E
_080A4DAE:
	cmp r8, sb
	bne _080A4DB6
_080A4DB2:
	movs r0, #2
	b _080A4DC2
_080A4DB6:
	mov r0, sb
_080A4DB8:
	cmp r0, #0
	beq _080A4DC0
	movs r0, #1
	b _080A4DC2
_080A4DC0:
	movs r0, #0
_080A4DC2:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0


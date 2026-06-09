	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set InitUnits, 0x0801756C + 1
	.set SetUnitAllItemsUsesToMax, 0x0804E1A0 + 1
	.set SetUnitStatus, 0x08017680 + 1
	.set memcpy, 0x080D6908 + 1
	.set sub_8018FEC, 0x08018FEC + 1
	.set sub_8043138, 0x08043138 + 1
	.set sub_80AB354, 0x080AB354 + 1
	.section .text.sub_8045A94, "ax", %progbits
@ sub_8045A94 @ JP 0x08045A94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8045A94
	.thumb_func
sub_8045A94:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, _08045B18 @ =0x080DEE1A
	mov r0, sp
	movs r2, #3
	bl memcpy
	bl InitUnits
	movs r6, #0
	ldr r1, _08045B1C @ =0x0203DA20
	ldrb r0, [r1, #5]
	adds r0, #2
	cmp r6, r0
	bge _08045B6C
	mov sb, r1
_08045ABC:
	lsls r4, r6, #6
	adds r4, #1
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	mov r0, sb
	adds r0, #6
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r2, r6, #4
	subs r2, r2, r6
	ldr r1, _08045B20 @ =0x0203DAC1
	adds r2, r2, r1
	adds r1, r5, #0
	bl sub_80AB354
	movs r7, #0
	adds r0, r6, #1
	mov sl, r0
	lsls r0, r6, #1
	ldr r1, _08045B24 @ =0x0203DDB0
	adds r0, r0, r1
	mov r8, r0
_08045AEC:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	movs r0, #0
	strb r0, [r5, #9]
	adds r0, r5, #0
	movs r1, #0
	bl SetUnitStatus
	movs r1, #0
	strb r1, [r5, #0x1b]
	ldr r0, _08045B28 @ =0x0203DB0C
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08045B2C
	adds r0, r5, #0
	bl sub_8043138
	b _08045B32
	.align 2, 0
_08045B18: .4byte 0x080DEE1A
_08045B1C: .4byte 0x0203DA20
_08045B20: .4byte 0x0203DAC1
_08045B24: .4byte 0x0203DDB0
_08045B28: .4byte 0x0203DB0C
_08045B2C:
	adds r0, r5, #0
	bl SetUnitAllItemsUsesToMax
_08045B32:
	cmp r7, #0
	bne _08045B40
	adds r0, r5, #0
	bl sub_8018FEC
	mov r1, r8
	strh r0, [r1]
_08045B40:
	strb r4, [r5, #0xb]
	cmp r6, #0
	beq _08045B58
	ldr r0, _08045BA4 @ =0x0203DB0C
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08045B58
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [r5, #0xc]
_08045B58:
	adds r4, #1
	adds r7, #1
	cmp r7, #4
	ble _08045AEC
	mov r6, sl
	mov r1, sb
	ldrb r0, [r1, #5]
	adds r0, #2
	cmp r6, r0
	blt _08045ABC
_08045B6C:
	ldr r0, _08045BA8 @ =0x0203DD8C
	movs r1, #0
	strb r1, [r0]
	ldr r2, _08045BAC @ =0x085D31E8
	ldr r0, [r2]
	strb r1, [r0, #6]
	ldr r3, [r2]
	ldr r1, _08045BB0 @ =0x0203DA20
	ldrb r0, [r1, #5]
	add r0, sp
	ldrb r0, [r0]
	strb r0, [r3, #9]
	ldr r2, [r2]
	ldrb r0, [r1, #5]
	adds r0, #2
	strb r0, [r2, #7]
	ldrb r0, [r1, #5]
	adds r0, #2
	adds r1, #0xa0
	strb r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045BA4: .4byte 0x0203DB0C
_08045BA8: .4byte 0x0203DD8C
_08045BAC: .4byte 0x085D31E8
_08045BB0: .4byte 0x0203DA20


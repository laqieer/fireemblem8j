	.syntax unified
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_801759C, 0x0801759C + 1
	.set sub_8027144, 0x08027144 + 1
	.section .text.sub_8018BCC, "ax", %progbits
@ ClearTemporaryUnits @ JP 0x08018BCC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ClearTemporaryUnits
	.thumb_func
ClearTemporaryUnits:
	push {r4, r5, lr}
	movs r4, #1
	ldr r5, _08018C58 @ =0x085C2A50
_08018BD2:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	cmp r2, #0
	beq _08018BFC
	ldr r0, [r2]
	cmp r0, #0
	beq _08018BFC
	ldr r0, [r2, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0xc]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	bne _08018BFC
	adds r0, r2, #0
	bl sub_801759C
_08018BFC:
	adds r4, #1
	cmp r4, #0x3f
	ble _08018BD2
	movs r4, #0x81
	ldr r5, _08018C58 @ =0x085C2A50
_08018C06:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	cmp r1, #0
	beq _08018C20
	ldr r0, [r1]
	cmp r0, #0
	beq _08018C20
	adds r0, r1, #0
	bl sub_801759C
_08018C20:
	adds r4, #1
	cmp r4, #0xbf
	ble _08018C06
	movs r4, #0x41
	ldr r5, _08018C58 @ =0x085C2A50
_08018C2A:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	cmp r1, #0
	beq _08018C44
	ldr r0, [r1]
	cmp r0, #0
	beq _08018C44
	adds r0, r1, #0
	bl sub_801759C
_08018C44:
	adds r4, #1
	cmp r4, #0x7f
	ble _08018C2A
	bl RefreshEntityBmMaps
	bl sub_8027144
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08018C58: .4byte 0x085C2A50


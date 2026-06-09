	.syntax unified
	.set GetCharacterData, 0x0801913C + 1
	.section .text.sub_80A9478, "ax", %progbits
@ sub_80A9478 @ JP 0x080A9478 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A9478
	.thumb_func
sub_80A9478:
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r0, #0x45
	bhi _080A94DA
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A94DA
	lsls r1, r4, #4
	ldr r0, _080A94B4 @ =0x0203E880
	adds r3, r1, r0
	cmp r3, #0
	beq _080A94DA
	ldr r2, [r3]
	lsls r0, r2, #8
	lsrs r0, r0, #0x10
	adds r1, r0, r5
	movs r0, #0x80
	lsls r0, r0, #7
	cmp r1, r0
	ble _080A94BC
	ldr r0, _080A94B8 @ =0xFF0000FF
	ands r0, r2
	movs r1, #0x80
	lsls r1, r1, #0xf
	b _080A94D6
	.align 2, 0
_080A94B4: .4byte 0x0203E880
_080A94B8: .4byte 0xFF0000FF
_080A94BC:
	cmp r1, #0
	bge _080A94CC
	ldr r0, _080A94C8 @ =0xFF0000FF
	ands r2, r0
	str r2, [r3]
	b _080A94DA
	.align 2, 0
_080A94C8: .4byte 0xFF0000FF
_080A94CC:
	ldr r0, _080A94E0 @ =0x0000FFFF
	ands r1, r0
	lsls r1, r1, #8
	ldr r0, _080A94E4 @ =0xFF0000FF
	ands r0, r2
_080A94D6:
	orrs r0, r1
	str r0, [r3]
_080A94DA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A94E0: .4byte 0x0000FFFF
_080A94E4: .4byte 0xFF0000FF


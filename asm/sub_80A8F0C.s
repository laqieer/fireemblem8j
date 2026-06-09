	.syntax unified
	.set GetCharacterData, 0x0801913C + 1
	.set sub_80A9478, 0x080A9478 + 1
	.section .text.sub_80A8F0C, "ax", %progbits
@ sub_80A8F0C @ JP 0x080A8F0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A8F0C
	.thumb_func
sub_80A8F0C:
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _080A8F62
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	adds r5, r0, #0
	cmp r0, #0x45
	bhi _080A8F62
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A8F62
	lsls r1, r5, #4
	ldr r0, _080A8F68 @ =0x0203E880
	adds r2, r1, r0
	cmp r2, #0
	beq _080A8F62
	ldrh r3, [r2, #0xc]
	lsls r0, r3, #0x12
	lsrs r1, r0, #0x14
	ldr r0, _080A8F6C @ =0x00000F9F
	cmp r1, r0
	bgt _080A8F58
	adds r0, r1, #1
	ldr r5, _080A8F70 @ =0x00000FFF
	adds r1, r5, #0
	ands r0, r1
	lsls r0, r0, #2
	ldr r1, _080A8F74 @ =0xFFFFC003
	ands r1, r3
	orrs r1, r0
	strh r1, [r2, #0xc]
_080A8F58:
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	movs r1, #4
	bl sub_80A9478
_080A8F62:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8F68: .4byte 0x0203E880
_080A8F6C: .4byte 0x00000F9F
_080A8F70: .4byte 0x00000FFF
_080A8F74: .4byte 0xFFFFC003


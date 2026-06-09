	.syntax unified
	.set GetCharacterData, 0x0801913C + 1
	.set sub_80A9478, 0x080A9478 + 1
	.section .text.sub_80A8F78, "ax", %progbits
@ sub_80A8F78 @ JP 0x080A8F78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A8F78
	.thumb_func
sub_80A8F78:
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	cmp r4, #0x45
	bhi _080A8FC8
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A8FC8
	lsls r1, r4, #4
	ldr r0, _080A8FD0 @ =0x0203E880
	adds r3, r1, r0
	cmp r3, #0
	beq _080A8FC8
	ldrb r0, [r3, #0xb]
	ldrb r1, [r3, #0xc]
	movs r2, #3
	ands r1, r2
	lsls r1, r1, #8
	orrs r1, r0
	ldr r0, _080A8FD4 @ =0x000003E7
	cmp r1, r0
	bgt _080A8FC0
	adds r0, r1, #1
	strb r0, [r3, #0xb]
	lsrs r0, r0, #8
	ands r0, r2
	ldrb r2, [r3, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0xc]
_080A8FC0:
	adds r0, r5, #0
	movs r1, #0x10
	bl sub_80A9478
_080A8FC8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8FD0: .4byte 0x0203E880
_080A8FD4: .4byte 0x000003E7


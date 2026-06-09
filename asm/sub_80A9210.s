	.syntax unified
	.set GetCharacterData, 0x0801913C + 1
	.set sub_80A9478, 0x080A9478 + 1
	.section .text.sub_80A9210, "ax", %progbits
@ sub_80A9210 @ JP 0x080A9210 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A9210
	.thumb_func
sub_80A9210:
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	cmp r4, #0x45
	bhi _080A9254
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A9254
	lsls r1, r4, #4
	ldr r0, _080A925C @ =0x0203E880
	adds r2, r1, r0
	cmp r2, #0
	beq _080A9254
	ldrb r3, [r2, #7]
	lsls r0, r3, #0x1a
	lsrs r0, r0, #0x1a
	cmp r0, #0x3b
	bgt _080A924C
	adds r1, r0, #1
	movs r0, #0x3f
	ands r1, r0
	movs r0, #0x40
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #7]
_080A924C:
	adds r0, r5, #0
	movs r1, #0x40
	bl sub_80A9478
_080A9254:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A925C: .4byte 0x0203E880


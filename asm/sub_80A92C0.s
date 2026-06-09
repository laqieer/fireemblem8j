	.syntax unified
	.set GetCharacterData, 0x0801913C + 1
	.set sub_80A9478, 0x080A9478 + 1
	.section .text.sub_80A92C0, "ax", %progbits
@ sub_80A92C0 @ JP 0x080A92C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A92C0
	.thumb_func
sub_80A92C0:
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	cmp r4, #0x45
	bhi _080A930C
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A930C
	lsls r1, r4, #4
	ldr r0, _080A9314 @ =0x0203E880
	adds r2, r1, r0
	cmp r2, #0
	beq _080A930C
	ldr r3, [r2, #8]
	lsls r0, r3, #8
	lsrs r0, r0, #0x14
	adds r0, r0, r5
	movs r1, #0xfa
	lsls r1, r1, #4
	cmp r0, r1
	ble _080A92F6
	adds r0, r1, #0
_080A92F6:
	ldr r1, _080A9318 @ =0x00000FFF
	ands r1, r0
	lsls r1, r1, #0xc
	ldr r0, _080A931C @ =0xFF000FFF
	ands r0, r3
	orrs r0, r1
	str r0, [r2, #8]
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_80A9478
_080A930C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A9314: .4byte 0x0203E880
_080A9318: .4byte 0x00000FFF
_080A931C: .4byte 0xFF000FFF


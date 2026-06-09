	.syntax unified
	.set GetCharacterData, 0x0801913C + 1
	.set sub_80A9478, 0x080A9478 + 1
	.section .text.sub_80A91D0, "ax", %progbits
@ sub_80A91D0 @ JP 0x080A91D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A91D0
	.thumb_func
sub_80A91D0:
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	cmp r4, #0x45
	bhi _080A9204
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A9204
	lsls r1, r4, #4
	ldr r0, _080A920C @ =0x0203E880
	adds r1, r1, r0
	cmp r1, #0
	beq _080A9204
	ldrb r0, [r1, #4]
	cmp r0, #0xc7
	bhi _080A91FC
	adds r0, #1
	strb r0, [r1, #4]
_080A91FC:
	adds r0, r5, #0
	movs r1, #2
	bl sub_80A9478
_080A9204:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A920C: .4byte 0x0203E880


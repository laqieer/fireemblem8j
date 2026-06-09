	.syntax unified
	.set GetCharacterData, 0x0801913C + 1
	.set sub_80A9478, 0x080A9478 + 1
	.section .text.sub_80A9190, "ax", %progbits
@ sub_80A9190 @ JP 0x080A9190 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A9190
	.thumb_func
sub_80A9190:
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	cmp r4, #0x45
	bhi _080A91C4
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A91C4
	lsls r1, r4, #4
	ldr r0, _080A91CC @ =0x0203E880
	adds r1, r1, r0
	cmp r1, #0
	beq _080A91C4
	ldrb r0, [r1, #3]
	cmp r0, #0xc7
	bhi _080A91BC
	adds r0, #1
	strb r0, [r1, #3]
_080A91BC:
	adds r0, r5, #0
	movs r1, #2
	bl sub_80A9478
_080A91C4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A91CC: .4byte 0x0203E880


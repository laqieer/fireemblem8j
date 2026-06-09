	.syntax unified
	.set CheckFlag, 0x080860D0 + 1
	.set RegisterEventActivation, 0x08086884 + 1
	.set SetFlag, 0x080860A8 + 1
	.set sub_800D340, 0x0800D340 + 1
	.set sub_8018E1C, 0x08018E1C + 1
	.section .text.sub_80851B8, "ax", %progbits
@ sub_80851B8 @ JP 0x080851B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80851B8
	.thumb_func
sub_80851B8:
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _080851F6
	ldr r0, [r4, #8]
	bl SetFlag
	ldr r0, [r4, #4]
	cmp r0, #1
	beq _080851F6
	ldrh r1, [r4, #8]
	bl RegisterEventActivation
	ldr r0, [r4, #4]
	adds r1, r5, #0
	bl sub_800D340
	movs r0, #3
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080851F6
	bl sub_8018E1C
	movs r0, #0x84
	bl SetFlag
_080851F6:
	pop {r4, r5}
	pop {r0}
	bx r0


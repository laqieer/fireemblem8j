	.syntax unified
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set __modsi3, 0x080D6690 + 1
	.section .text.sub_80C3864, "ax", %progbits
@ sub_80C3864 @ JP 0x080C3864 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C3864
	.thumb_func
sub_80C3864:
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	cmp r0, #0
	beq _080C387C
	bl GetUnitFromCharId
	movs r5, #8
	ldrsb r5, [r0, r5]
	b _080C3888
_080C387C:
	adds r0, r2, #0
	adds r0, #0x60
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C3888
	movs r5, #0
_080C3888:
	ldr r4, _080C38C4 @ =0x0201B864
	ldr r1, _080C38C8 @ =0x00005233
	adds r0, r1, #0
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x40
	ldr r2, _080C38CC @ =0x00005253
	adds r0, r2, #0
	strh r0, [r1]
	ldr r3, _080C38D0 @ =0x00005234
	adds r0, r3, #0
	strh r0, [r4, #2]
	adds r1, #2
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	cmp r5, #0
	bne _080C38D4
	adds r3, #0xb
	adds r2, r3, #0
	strh r2, [r4, #4]
	adds r0, r4, #0
	adds r0, #0x44
	adds r3, #0x20
	adds r1, r3, #0
	strh r1, [r0]
	strh r2, [r4, #6]
	adds r0, #2
	strh r1, [r0]
	b _080C3908
	.align 2, 0
_080C38C4: .4byte 0x0201B864
_080C38C8: .4byte 0x00005233
_080C38CC: .4byte 0x00005253
_080C38D0: .4byte 0x00005234
_080C38D4:
	cmp r5, #9
	ble _080C38F0
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	ldr r2, _080C3910 @ =0x00005235
	adds r1, r0, r2
	strh r1, [r4, #4]
	adds r1, r4, #0
	adds r1, #0x44
	ldr r3, _080C3914 @ =0x00005255
	adds r0, r0, r3
	strh r0, [r1]
_080C38F0:
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	ldr r2, _080C3910 @ =0x00005235
	adds r1, r0, r2
	strh r1, [r4, #6]
	adds r1, r4, #0
	adds r1, #0x46
	ldr r3, _080C3914 @ =0x00005255
	adds r0, r0, r3
	strh r0, [r1]
_080C3908:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C3910: .4byte 0x00005235
_080C3914: .4byte 0x00005255


	.syntax unified
	.set RegisterDataMove, 0x08001F64 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8055800, 0x08055800 + 1
	.set sub_805A78C, 0x0805A78C + 1
	.set sub_807395C, 0x0807395C + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_80578FC, "ax", %progbits
@ sub_80578FC @ JP 0x080578FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80578FC
	.thumb_func
sub_80578FC:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, _08057A68 @ =0x080DFF28
	ldr r0, _08057A6C @ =0x0203E11C
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r0, r1
	ldrb r2, [r0]
	ldr r1, _08057A70 @ =0x080DFF00
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r6, [r0]
	bl sub_805A78C
	ldr r0, _08057A74 @ =0x02017724
	ldr r0, [r0]
	cmp r0, #0
	beq _08057936
	ldr r5, _08057A78 @ =0x02000000
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _0805792C
	bl sub_8055800
_0805792C:
	ldr r0, [r5]
	cmp r0, #0
	beq _08057936
	bl sub_8055800
_08057936:
	ldr r0, _08057A7C @ =0x0203E188
	ldr r0, [r0]
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xb
	beq _0805794A
	cmp r1, #0xd
	bne _08057954
_0805794A:
	ldr r0, _08057A80 @ =0x020228A8
	movs r1, #0x19
	movs r2, #1
	bl sub_807395C
_08057954:
	ldr r0, _08057A84 @ =0x0203E184
	ldr r0, [r0]
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xb
	beq _08057968
	cmp r1, #0xd
	bne _08057972
_08057968:
	ldr r0, _08057A80 @ =0x020228A8
	movs r1, #0x17
	movs r2, #1
	bl sub_807395C
_08057972:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _0805798E
	ldr r0, _08057A88 @ =0x0203A4D0
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0805798E
	ldr r0, _08057A80 @ =0x020228A8
	movs r1, #0x17
	movs r2, #1
	bl sub_807395C
_0805798E:
	ldr r5, _08057A8C @ =0x0203E100
	movs r3, #0
	ldrsh r0, [r5, r3]
	cmp r0, #1
	bne _080579B6
	ldr r0, _08057A90 @ =0x0200005C
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r0, _08057A94 @ =0x0200F1C8
	adds r2, r2, r0
	ldr r0, [r2, #4]
	ldr r1, [r2, #8]
	ldr r2, _08057A98 @ =0x020041C8
	adds r1, r1, r2
	str r1, [r4, #0x54]
	ldr r1, _08057A9C @ =0x02000088
	bl sub_80D6394
_080579B6:
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bne _080579DC
	ldr r0, _08057AA0 @ =0x02000060
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r0, _08057AA4 @ =0x02011BC8
	adds r2, r2, r0
	ldr r0, [r2, #4]
	ldr r1, [r2, #8]
	ldr r2, _08057AA8 @ =0x020099C8
	adds r1, r1, r2
	str r1, [r4, #0x58]
	ldr r1, _08057AAC @ =0x02002088
	bl sub_80D6394
_080579DC:
	ldr r5, _08057AB0 @ =0x0203E1A0
	ldr r0, [r5]
	cmp r0, #0
	beq _080579EA
	ldr r1, _08057AB4 @ =0x02001088
	bl sub_80D6394
_080579EA:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _080579F6
	ldr r1, _08057AB8 @ =0x02003088
	bl sub_80D6394
_080579F6:
	ldr r1, _08057ABC @ =0x06014000
	ldr r0, _08057A9C @ =0x02000088
	movs r2, #0x80
	lsls r2, r2, #7
	bl RegisterDataMove
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0xb
	strh r0, [r4, #0x2e]
	ldr r1, _08057AC0 @ =0x0203E11E
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r4, #0x32]
	movs r3, #2
	ldrsh r0, [r1, r3]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r4, #0x3a]
	movs r5, #4
	ldrsh r0, [r1, r5]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r4, #0x34]
	movs r2, #6
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r4, #0x3c]
	ldr r1, _08057AC4 @ =0x080DFF2D
	ldr r2, _08057A6C @ =0x0203E11C
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r0, r0, r1
	ldrb r5, [r0]
	strh r5, [r4, #0x36]
	ldr r1, _08057AC8 @ =0x080DFF32
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r0, r0, r1
	ldrb r3, [r0]
	strh r3, [r4, #0x38]
	ldr r0, _08057ACC @ =0x02017744
	ldr r0, [r0]
	cmp r0, #0
	bne _08057AD4
	ldr r0, _08057AD0 @ =0x080DFF38
	movs r5, #0
	ldrsh r1, [r2, r5]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, r3, r0
	strh r0, [r4, #0x38]
	b _08057AE4
	.align 2, 0
_08057A68: .4byte 0x080DFF28
_08057A6C: .4byte 0x0203E11C
_08057A70: .4byte 0x080DFF00
_08057A74: .4byte 0x02017724
_08057A78: .4byte 0x02000000
_08057A7C: .4byte 0x0203E188
_08057A80: .4byte 0x020228A8
_08057A84: .4byte 0x0203E184
_08057A88: .4byte 0x0203A4D0
_08057A8C: .4byte 0x0203E100
_08057A90: .4byte 0x0200005C
_08057A94: .4byte 0x0200F1C8
_08057A98: .4byte 0x020041C8
_08057A9C: .4byte 0x02000088
_08057AA0: .4byte 0x02000060
_08057AA4: .4byte 0x02011BC8
_08057AA8: .4byte 0x020099C8
_08057AAC: .4byte 0x02002088
_08057AB0: .4byte 0x0203E1A0
_08057AB4: .4byte 0x02001088
_08057AB8: .4byte 0x02003088
_08057ABC: .4byte 0x06014000
_08057AC0: .4byte 0x0203E11E
_08057AC4: .4byte 0x080DFF2D
_08057AC8: .4byte 0x080DFF32
_08057ACC: .4byte 0x02017744
_08057AD0: .4byte 0x080DFF38
_08057AD4:
	ldr r0, _08057AF0 @ =0x080DFF38
	movs r3, #0
	ldrsh r1, [r2, r3]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	subs r0, r5, r0
	strh r0, [r4, #0x36]
_08057AE4:
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08057AF0: .4byte 0x080DFF38


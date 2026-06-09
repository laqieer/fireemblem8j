	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set GetGameOption, 0x080B6A00 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8097C50, 0x08097C50 + 1
	.set sub_80B6DA0, 0x080B6DA0 + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_80B6E24, "ax", %progbits
@ sub_80B6E24 @ JP 0x080B6E24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B6E24
	.thumb_func
sub_80B6E24:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r3, #0
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #6
	bls _080B6E34
	b _080B7064
_080B6E34:
	lsls r0, r0, #2
	ldr r1, _080B6E40 @ =_080B6E44
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B6E40: .4byte _080B6E44
_080B6E44: @ jump table
	.4byte _080B6E60 @ case 0
	.4byte _080B7028 @ case 1
	.4byte _080B7028 @ case 2
	.4byte _080B7028 @ case 3
	.4byte _080B7044 @ case 4
	.4byte _080B7044 @ case 5
	.4byte _080B7044 @ case 6
_080B6E60:
	ldr r0, _080B6E84 @ =0x085775CC
	ldr r2, [r0]
	ldrh r1, [r2, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B6E8C
	ldr r0, _080B6E88 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B6EEC
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080B6EEC
	.align 2, 0
_080B6E84: .4byte 0x085775CC
_080B6E88: .4byte 0x0202BCEC
_080B6E8C:
	movs r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080B6F00
	ldr r5, _080B6EF4 @ =0x08AAF6D8
	ldr r0, [r5]
	adds r0, #0x37
	ldrb r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080B6EB0
	bl sub_8097C50
	cmp r0, #0
	bne _080B6EB0
	b _080B7064
_080B6EB0:
	ldr r1, _080B6EF8 @ =0x08AAF6DC
	ldr r0, [r5]
	movs r2, #0x2a
	ldrsh r0, [r0, r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B6EC2
	b _080B7064
_080B6EC2:
	movs r0, #0
	bl GetGameOption
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	beq _080B6ED2
	b _080B7064
_080B6ED2:
	ldr r0, _080B6EFC @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B6EE4
	movs r0, #0x6a
	bl m4aSongNumStart
_080B6EE4:
	adds r1, r4, #0
	adds r1, #0x36
	movs r0, #1
	strb r0, [r1]
_080B6EEC:
	adds r0, r4, #0
	bl sub_8002DE4
	b _080B7064
	.align 2, 0
_080B6EF4: .4byte 0x08AAF6D8
_080B6EF8: .4byte 0x08AAF6DC
_080B6EFC: .4byte 0x0202BCEC
_080B6F00:
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _080B6FE4
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080B6F60
	ldr r5, _080B6F5C @ =0x08AAF6D8
	ldr r2, [r5]
	ldrh r1, [r2, #0x2a]
	movs r7, #0x2a
	ldrsh r0, [r2, r7]
	cmp r0, #0
	beq _080B6FB0
	subs r0, r1, #1
	strh r0, [r2, #0x2a]
	movs r1, #0x2a
	ldrsh r0, [r2, r1]
	movs r3, #0x2c
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmp r0, #0
	bgt _080B6FAE
	ldrh r1, [r2, #0x2c]
	movs r7, #0x2c
	ldrsh r0, [r2, r7]
	cmp r0, #0
	beq _080B6FAE
	subs r0, r1, #1
	strh r0, [r2, #0x2c]
	movs r0, #0x2a
	ldrsh r1, [r2, r0]
	subs r1, #1
	adds r0, r4, #0
	movs r2, #0
	bl sub_80B6DA0
	ldr r1, [r5]
	ldrh r0, [r1, #0x2e]
	subs r0, #4
	strh r0, [r1, #0x2e]
	strh r6, [r4, #0x30]
	b _080B6FAE
	.align 2, 0
_080B6F5C: .4byte 0x08AAF6D8
_080B6F60:
	ldr r5, _080B6FD8 @ =0x08AAF6D8
	ldr r2, [r5]
	movs r6, #0x2a
	ldrsh r1, [r2, r6]
	movs r7, #0x34
	ldrsh r0, [r2, r7]
	subs r0, #1
	cmp r1, r0
	bge _080B6FB0
	ldrh r0, [r2, #0x2a]
	adds r0, #1
	strh r0, [r2, #0x2a]
	movs r0, #0x2a
	ldrsh r1, [r2, r0]
	movs r3, #0x2c
	ldrsh r0, [r2, r3]
	subs r0, r1, r0
	cmp r0, #4
	ble _080B6FAE
	movs r6, #0x34
	ldrsh r0, [r2, r6]
	subs r0, #1
	cmp r1, r0
	bge _080B6FAE
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	adds r1, #1
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r4, #0
	bl sub_80B6DA0
	ldr r1, [r5]
	ldrh r0, [r1, #0x2e]
	adds r0, #4
	strh r0, [r1, #0x2e]
	movs r0, #4
	strh r0, [r4, #0x30]
_080B6FAE:
	movs r3, #1
_080B6FB0:
	cmp r3, #1
	bne _080B6FE4
	ldr r0, _080B6FDC @ =0x08AAF9EC
	adds r1, r4, #0
	bl sub_8002BCC
	movs r0, #3
	bl BG_EnableSyncByMask
	ldr r0, _080B6FE0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B7064
	movs r0, #0x66
	bl m4aSongNumStart
	b _080B7064
	.align 2, 0
_080B6FD8: .4byte 0x08AAF6D8
_080B6FDC: .4byte 0x08AAF9EC
_080B6FE0: .4byte 0x0202BCEC
_080B6FE4:
	ldr r0, _080B7018 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _080B7064
	ldr r2, _080B701C @ =0x08AAF700
	ldr r1, _080B7020 @ =0x08AAF6DC
	ldr r0, _080B7024 @ =0x08AAF6D8
	ldr r0, [r0]
	movs r3, #0x2a
	ldrsh r0, [r0, r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x2c
	muls r0, r1, r0
	adds r2, #0x28
	adds r0, r0, r2
	ldr r1, [r0]
	cmp r1, #0
	beq _080B7064
	adds r0, r4, #0
	bl sub_80D65C0
	b _080B7064
	.align 2, 0
_080B7018: .4byte 0x085775CC
_080B701C: .4byte 0x08AAF700
_080B7020: .4byte 0x08AAF6DC
_080B7024: .4byte 0x08AAF6D8
_080B7028:
	ldr r0, _080B7040 @ =0x08AAF6D8
	ldr r1, [r0]
	ldrh r0, [r1, #0x2e]
	subs r0, #4
	strh r0, [r1, #0x2e]
	ldrh r1, [r4, #0x30]
	movs r6, #0x30
	ldrsh r0, [r4, r6]
	cmp r0, #3
	bne _080B7060
	movs r0, #0
	b _080B7062
	.align 2, 0
_080B7040: .4byte 0x08AAF6D8
_080B7044:
	ldr r0, _080B705C @ =0x08AAF6D8
	ldr r1, [r0]
	ldrh r0, [r1, #0x2e]
	adds r0, #4
	strh r0, [r1, #0x2e]
	ldrh r1, [r4, #0x30]
	movs r7, #0x30
	ldrsh r0, [r4, r7]
	cmp r0, #6
	bne _080B7060
	movs r0, #0
	b _080B7062
	.align 2, 0
_080B705C: .4byte 0x08AAF6D8
_080B7060:
	adds r0, r1, #1
_080B7062:
	strh r0, [r4, #0x30]
_080B7064:
	ldr r0, _080B7078 @ =0x08AAF6D8
	ldr r0, [r0]
	ldrh r2, [r0, #0x2e]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B7078: .4byte 0x08AAF6D8


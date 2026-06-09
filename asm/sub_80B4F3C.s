	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.set PutSpriteExt, 0x08005330 + 1
	.set SoundRoom_DrawVolumeGraphSprites, 0x080B4E1C + 1
	.set __divsi3, 0x080D65F8 + 1
	.set sub_80B4CA0, 0x080B4CA0 + 1
	.set sub_80B4E58, 0x080B4E58 + 1
	.section .text.sub_80B4F3C, "ax", %progbits
@ sub_80B4F3C @ JP 0x080B4F3C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B4F3C
	.thumb_func
sub_80B4F3C:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r6, [r7, #0x14]
	adds r4, r6, #0
	adds r4, #0x3c
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #3
	adds r0, #6
	movs r1, #0x80
	lsls r1, r1, #1
	bl sub_80B4CA0
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080B4FE2
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r5, r0, #3
	adds r5, #0x24
	movs r4, #0xff
	ands r5, r4
	movs r2, #0xc
	subs r2, r2, r0
	lsls r2, r2, #3
	adds r2, #4
	ands r2, r4
	movs r0, #0x80
	lsls r0, r0, #3
	adds r2, r2, r0
	ldr r3, _080B503C @ =0x08A9E3D2
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0
	movs r1, #4
	bl PutSpriteExt
	adds r2, r5, #1
	ands r2, r4
	ldr r3, _080B5040 @ =0x08A9E3F2
	movs r4, #0x80
	lsls r4, r4, #7
	str r4, [sp]
	movs r0, #0
	movs r1, #0x7c
	bl PutSpriteExt
	ldrh r1, [r6, #0x2c]
	lsls r0, r1, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r2, _080B5044 @ =0x08A9DDDC
	adds r1, r6, #0
	adds r1, #0x32
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #4
	adds r2, #4
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, #0x78
	bl __divsi3
	adds r1, r0, #0
	adds r1, #0x7c
	ldr r3, _080B5048 @ =0x08A9E406
	str r4, [sp]
	movs r0, #0
	adds r2, r5, #0
	bl PutSpriteExt
	ldrh r2, [r6, #0x2c]
	movs r0, #0x30
	adds r1, r5, #0
	bl sub_80B4E58
_080B4FE2:
	adds r6, #0x3d
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r1, r1, #3
	adds r1, #0x11
	ldr r5, _080B504C @ =0x000001FF
	ands r1, r5
	ldr r3, _080B5050 @ =0x08A9E3A8
	movs r4, #0xc0
	lsls r4, r4, #6
	str r4, [sp]
	movs r0, #0xb
	movs r2, #0x58
	bl PutSprite
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r1, r1, #3
	adds r1, #0x11
	ands r1, r5
	ldr r3, _080B5054 @ =0x08A9E3B6
	str r4, [sp]
	movs r0, #0xb
	movs r2, #0x68
	bl PutSprite
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r1, r1, #3
	adds r1, #0x11
	ands r1, r5
	ldr r3, _080B5058 @ =0x08A9E3C4
	str r4, [sp]
	movs r0, #0xb
	movs r2, #0x78
	bl PutSprite
	adds r0, r7, #0
	bl SoundRoom_DrawVolumeGraphSprites
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B503C: .4byte 0x08A9E3D2
_080B5040: .4byte 0x08A9E3F2
_080B5044: .4byte 0x08A9DDDC
_080B5048: .4byte 0x08A9E406
_080B504C: .4byte 0x000001FF
_080B5050: .4byte 0x08A9E3A8
_080B5054: .4byte 0x08A9E3B6
_080B5058: .4byte 0x08A9E3C4


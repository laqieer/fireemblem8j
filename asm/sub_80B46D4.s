	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BlitClippedTileMapToBg, 0x080B12E4 + 1
	.set PutMenuScrollBarAt, 0x08099990 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.section .text.sub_80B46D4, "ax", %progbits
@ sub_80B46D4 @ JP 0x080B46D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B46D4
	.thumb_func
sub_80B46D4:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x3b
	ldrb r0, [r5]
	rsbs r0, r0, #0
	movs r1, #3
	bl __divsi3
	adds r1, r4, #0
	adds r1, #0x3c
	movs r6, #0
	strb r0, [r1]
	ldrb r0, [r5]
	rsbs r0, r0, #0
	lsls r0, r0, #1
	movs r1, #3
	bl __divsi3
	adds r7, r4, #0
	adds r7, #0x3d
	strb r0, [r7]
	ldrb r0, [r5]
	adds r5, #3
	strb r0, [r5]
	ldr r0, _080B47C0 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080B47C4 @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080B47C8 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	ldr r4, _080B47CC @ =0x08A9E23C
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r7, r1]
	adds r1, #1
	str r1, [sp]
	movs r1, #7
	str r1, [sp, #4]
	movs r1, #0xa
	str r1, [sp, #8]
	movs r1, #0xb
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #7
	movs r3, #1
	bl BlitClippedTileMapToBg
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r1, #0xb
	str r1, [sp]
	movs r1, #5
	str r1, [sp, #4]
	movs r1, #0x12
	str r1, [sp, #8]
	movs r1, #0xe
	str r1, [sp, #0xc]
	movs r1, #0xa
	movs r2, #5
	movs r3, #1
	bl BlitClippedTileMapToBg
	ldr r4, _080B47D0 @ =0x08A9E240
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r1, #0xc
	str r1, [sp]
	str r6, [sp, #4]
	movs r1, #0x10
	str r1, [sp, #8]
	movs r1, #0x20
	str r1, [sp, #0xc]
	movs r1, #0xc
	movs r2, #0
	movs r3, #2
	bl BlitClippedTileMapToBg
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r1, #0xf
	str r1, [sp]
	movs r1, #6
	str r1, [sp, #4]
	movs r1, #9
	str r1, [sp, #8]
	movs r1, #2
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl BlitClippedTileMapToBg
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	adds r0, #0xd8
	movs r1, #0x48
	bl PutMenuScrollBarAt
	movs r0, #7
	bl BG_EnableSyncByMask
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B47C0: .4byte 0x02022CA8
_080B47C4: .4byte 0x020234A8
_080B47C8: .4byte 0x02023CA8
_080B47CC: .4byte 0x08A9E23C
_080B47D0: .4byte 0x08A9E240


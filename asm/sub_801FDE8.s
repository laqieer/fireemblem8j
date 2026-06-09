	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set ColorFadeSetupRange, 0x08001740 + 1
	.set MaybeResetSomePal, 0x0800169C + 1
	.set SetBackgroundTileDataOffset, 0x08000F8C + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set j_ColorFadeTick, 0x080DC0EC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001508, 0x08001508 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_801FD08, 0x0801FD08 + 1
	.section .text.sub_801FDE8, "ax", %progbits
@ sub_801FDE8 @ JP 0x0801FDE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801FDE8
	.thumb_func
sub_801FDE8:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	movs r0, #0
	bl sub_8001ACC
	ldr r7, _0801FF84 @ =0x03003020
	ldrb r1, [r7]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	mov sb, r1
	mov r2, sb
	orrs r0, r2
	strb r0, [r7]
	ldrb r2, [r7, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r7, #0xc]
	ldrb r2, [r7, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r4, #2
	mov r8, r4
	mov r2, r8
	orrs r0, r2
	strb r0, [r7, #0x10]
	ldrb r2, [r7, #0x14]
	adds r0, r1, #0
	ands r0, r2
	mov r4, sb
	orrs r0, r4
	strb r0, [r7, #0x14]
	ldrb r0, [r7, #0x18]
	ands r1, r0
	mov r0, r8
	orrs r1, r0
	strb r1, [r7, #0x18]
	ldrb r1, [r7, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r6, #0x10
	orrs r0, r6
	strb r0, [r7, #1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _0801FF88 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _0801FF8C @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _0801FF90 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundTileDataOffset
	ldrb r0, [r7, #1]
	movs r5, #0x20
	orrs r0, r5
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	ldr r2, _0801FF94 @ =0x03003054
	ldrb r1, [r2]
	orrs r1, r4
	mov r4, r8
	orrs r1, r4
	movs r3, #4
	orrs r1, r3
	movs r2, #8
	orrs r1, r2
	orrs r1, r6
	movs r0, #0x36
	adds r0, r0, r7
	mov ip, r0
	ldrb r0, [r0]
	mov r4, sb
	orrs r0, r4
	mov r4, r8
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	orrs r0, r6
	orrs r1, r5
	ldr r2, _0801FF94 @ =0x03003054
	strb r1, [r2]
	orrs r0, r5
	mov r4, ip
	strb r0, [r4]
	adds r0, r7, #0
	adds r0, #0x2d
	movs r4, #0
	strb r4, [r0]
	adds r0, #4
	strb r4, [r0]
	subs r0, #5
	strb r4, [r0]
	adds r0, #4
	strb r4, [r0]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	bl MaybeResetSomePal
	movs r3, #1
	rsbs r3, r3, #0
	movs r0, #0
	movs r1, #2
	movs r2, #0x40
	bl ColorFadeSetupRange
	bl j_ColorFadeTick
	bl sub_8001EE4
	ldrb r1, [r7, #0x15]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	orrs r0, r5
	strb r0, [r7, #0x15]
	ldr r0, _0801FF98 @ =0x08BB0BB8
	ldr r1, _0801FF9C @ =0x06008000
	bl sub_8013008
	ldr r0, _0801FFA0 @ =0x08BB1F28
	movs r1, #0
	movs r2, #0x60
	bl sub_8000D68
	ldr r1, _0801FFA4 @ =0x08BB1DBC
	ldr r0, _0801FF90 @ =0x02023CA8
	movs r2, #0
	movs r3, #5
	bl sub_8001508
	ldr r0, _0801FFA8 @ =0x08BB28C8
	ldr r1, _0801FFAC @ =0x06014000
	bl sub_8013008
	ldr r0, _0801FFB0 @ =0x08BB2E40
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	mov r0, sl
	movs r1, #0
	movs r2, #0xe
	bl sub_801FD08
	movs r0, #6
	bl BG_EnableSyncByMask
	movs r0, #0x52
	add sl, r0
	mov r1, sl
	strh r4, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801FF84: .4byte 0x03003020
_0801FF88: .4byte 0x02022CA8
_0801FF8C: .4byte 0x020234A8
_0801FF90: .4byte 0x02023CA8
_0801FF94: .4byte 0x03003054
_0801FF98: .4byte 0x08BB0BB8
_0801FF9C: .4byte 0x06008000
_0801FFA0: .4byte 0x08BB1F28
_0801FFA4: .4byte 0x08BB1DBC
_0801FFA8: .4byte 0x08BB28C8
_0801FFAC: .4byte 0x06014000
_0801FFB0: .4byte 0x08BB2E40


	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set ResetFaces, 0x08005430 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8002EE8, 0x08002EE8 + 1
	.set sub_8006710, 0x08006710 + 1
	.set sub_800783C, 0x0800783C + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80B99AC, 0x080B99AC + 1
	.set sub_80B9E50, 0x080B9E50 + 1
	.section .text.sub_80BA324, "ax", %progbits
@ sub_80BA324 @ JP 0x080BA324 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BA324
	.thumb_func
sub_80BA324:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _080BA4CC @ =0x08A132D0
	ldr r1, _080BA4D0 @ =HideMu
	bl sub_8002EE8
	bl sub_80B9E50
	ldr r7, _080BA4D4 @ =0x03003020
	ldrb r2, [r7, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r7, #0xc]
	ldrb r2, [r7, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #2
	mov r8, r2
	mov r3, r8
	orrs r0, r3
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	strb r1, [r7, #0x14]
	ldrb r0, [r7, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r7, #0x18]
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #2
	movs r2, #0
	bl sub_8006710
	bl ResetFaces
	movs r0, #1
	str r0, [sp]
	movs r0, #0x68
	movs r1, #0x20
	movs r2, #8
	movs r3, #3
	bl sub_800783C
	ldr r0, _080BA4D8 @ =0x08A1DFBC
	ldr r5, _080BA4DC @ =0x02020188
	adds r1, r5, #0
	bl sub_8013008
	ldr r4, _080BA4E0 @ =0x020234A8
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r4, #0
	adds r1, r5, #0
	bl j_TmApplyTsa
	movs r5, #0x80
	lsls r5, r5, #2
	adds r4, r4, r5
	adds r0, r4, #0
	movs r1, #0x1e
	movs r2, #0xc
	movs r3, #0
	bl j_TmFillRect
	movs r0, #2
	bl BG_EnableSyncByMask
	adds r0, r6, #0
	bl sub_80B99AC
	ldrb r0, [r7, #1]
	movs r6, #0x20
	orrs r0, r6
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	movs r0, #0x34
	adds r0, r0, r7
	mov sb, r0
	ldrb r4, [r0]
	movs r5, #1
	orrs r4, r5
	mov r1, r8
	orrs r4, r1
	movs r0, #4
	orrs r4, r0
	movs r3, #8
	orrs r4, r3
	movs r0, #0x10
	orrs r4, r0
	movs r2, #0x35
	adds r2, r2, r7
	mov sl, r2
	ldrb r2, [r2]
	orrs r2, r5
	orrs r2, r1
	subs r6, #0x25
	ands r2, r6
	orrs r2, r3
	orrs r2, r0
	movs r1, #0x36
	adds r1, r1, r7
	mov ip, r1
	ldrb r1, [r1]
	orrs r1, r5
	mov r5, r8
	orrs r1, r5
	ands r1, r6
	orrs r1, r3
	orrs r1, r0
	adds r3, r7, #0
	adds r3, #0x2d
	movs r6, #0
	movs r0, #0x58
	strb r0, [r3]
	adds r3, #4
	movs r0, #0x48
	strb r0, [r3]
	adds r0, r7, #0
	adds r0, #0x2c
	movs r5, #0xf0
	strb r5, [r0]
	subs r3, #1
	movs r0, #0x98
	strb r0, [r3]
	adds r0, r7, #0
	adds r0, #0x2f
	strb r6, [r0]
	adds r3, #3
	movs r0, #8
	strb r0, [r3]
	adds r0, r7, #0
	adds r0, #0x2e
	strb r5, [r0]
	subs r3, #1
	movs r0, #0x38
	strb r0, [r3]
	subs r0, #0x59
	ands r4, r0
	mov r3, sb
	strb r4, [r3]
	movs r5, #0x20
	orrs r2, r5
	mov r3, sl
	strb r2, [r3]
	ands r1, r0
	mov r5, ip
	strb r1, [r5]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #8
	bl SetBlendConfig
	str r6, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetA
	str r6, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	ldr r4, _080BA4E4 @ =0x08A1961C
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r6, #0xc0
	lsls r6, r6, #0x13
	adds r1, r1, r6
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _080BA4E8 @ =0x020244A8
	ldr r1, _080BA4EC @ =0x08A1C1F8
	movs r2, #0xc0
	lsls r2, r2, #8
	bl j_TmApplyTsa
	ldr r0, _080BA4F0 @ =0x08A1C6AC
	movs r1, #0xc0
	lsls r1, r1, #1
	movs r2, #0x80
	bl sub_8000D68
	movs r0, #8
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA4CC: .4byte 0x08A132D0
_080BA4D0: .4byte 0x0807BBE9  @ HideMu
_080BA4D4: .4byte 0x03003020
_080BA4D8: .4byte 0x08A1DFBC
_080BA4DC: .4byte 0x02020188
_080BA4E0: .4byte 0x020234A8
_080BA4E4: .4byte 0x08A1961C
_080BA4E8: .4byte 0x020244A8
_080BA4EC: .4byte 0x08A1C1F8
_080BA4F0: .4byte 0x08A1C6AC


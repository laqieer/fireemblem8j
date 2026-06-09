	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set StartBgm, 0x08002424 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80C96FC, "ax", %progbits
@ sub_80C96FC @ JP 0x080C96FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C96FC
	.thumb_func
sub_80C96FC:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _080C97E0 @ =0x08B3B4CC
	bl sub_8001ACC
	ldr r3, _080C97E4 @ =0x03003020
	ldrb r1, [r3]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	movs r4, #1
	orrs r0, r4
	strb r0, [r3]
	ldrb r0, [r3, #0xc]
	movs r2, #3
	orrs r0, r2
	strb r0, [r3, #0xc]
	ldrb r0, [r3, #0x10]
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r1, [r3, #0x14]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	orrs r0, r2
	strb r0, [r3, #0x18]
	ldrb r1, [r3, #1]
	orrs r1, r4
	movs r0, #3
	rsbs r0, r0, #0
	ands r1, r0
	subs r0, #2
	ands r1, r0
	subs r0, #4
	ands r1, r0
	movs r0, #0x10
	orrs r1, r0
	ldrb r2, [r3, #0x15]
	movs r0, #0x3f
	ands r0, r2
	movs r2, #0x40
	orrs r0, r2
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r0, r2
	strb r0, [r3, #0x15]
	ands r1, r2
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #0x7f
	ands r1, r0
	strb r1, [r3, #1]
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r5, #0
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	ldr r4, _080C97E8 @ =0x08BB0BB8
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _080C97EC @ =0x08BB1F28
	movs r1, #0
	movs r2, #0x60
	bl sub_8000D68
	ldr r0, _080C97F0 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #3
	movs r1, #0
	bl StartBgm
	adds r0, r6, #0
	adds r0, #0x29
	strb r5, [r0]
	movs r0, #0x3c
	strh r0, [r6, #0x2a]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C97E0: .4byte 0x08B3B4CC
_080C97E4: .4byte 0x03003020
_080C97E8: .4byte 0x08BB0BB8
_080C97EC: .4byte 0x08BB1F28
_080C97F0: .4byte 0x02023CA8


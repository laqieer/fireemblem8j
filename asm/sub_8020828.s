	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set DisableMapPaletteAnimations, 0x08030B74 + 1
	.set GetCameraCenteredX, 0x08015A5C + 1
	.set GetCameraCenteredY, 0x08015A88 + 1
	.set GetROMChapterStruct, 0x08034520 + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set SetBlendBackdropB, 0x08001EB4 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_801569C, 0x0801569C + 1
	.set sub_80195E4, 0x080195E4 + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_80265CC, 0x080265CC + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8020828, "ax", %progbits
@ sub_8020828 @ JP 0x08020828 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8020828
	.thumb_func
sub_8020828:
	push {r4, r5, lr}
	sub sp, #8
	ldr r2, _08020908 @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #1
	bl SetBlendBackdropB
	str r4, [sp, #4]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _0802090C @ =0x01000008
	add r0, sp, #4
	bl sub_80D636C
	ldr r0, _08020910 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _08020914 @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _08020918 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #7
	bl BG_EnableSyncByMask
	bl DisableMapPaletteAnimations
	ldr r4, _0802091C @ =0x0202BCEC
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl sub_80195E4
	bl sub_80265CC
	bl sub_801569C
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #4
	bl GetCameraCenteredX
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #0xf
	movs r1, #0xf8
	lsls r1, r1, #1
	ands r0, r1
	ldr r5, _08020920 @ =0x0202BCAC
	strh r0, [r5, #0xc]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #4
	bl GetCameraCenteredY
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #0xf
	movs r1, #0xfc
	lsls r1, r1, #2
	ands r0, r1
	strh r0, [r5, #0xe]
	bl RefreshEntityBmMaps
	bl sub_8019914
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08020908: .4byte 0x03003020
_0802090C: .4byte 0x01000008
_08020910: .4byte 0x02022CA8
_08020914: .4byte 0x020234A8
_08020918: .4byte 0x02023CA8
_0802091C: .4byte 0x0202BCEC
_08020920: .4byte 0x0202BCAC


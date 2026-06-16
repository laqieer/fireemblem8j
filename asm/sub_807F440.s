	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set GetItemIndex, 0x08017294 + 1
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendBackdropB, 0x08001EB4 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set StartPaletteAnimatorReverse, 0x080144E0 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8080CB8, 0x08080CB8 + 1
	.section .text.sub_807F440, "ax", %progbits
@ MapLatonafx_Init @ JP 0x0807F440 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global MapLatonafx_Init
	.thumb_func
MapLatonafx_Init:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl sub_8080CB8
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _0807F4CC @ =0x08A1FFD8
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807F4D0 @ =0x06002800
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #1
	bl SetBlendBackdropB
	adds r0, r5, #0
	adds r0, #0x40
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	ldr r0, _0807F4D4 @ =0x0203E1EC
	ldr r0, [r0, #4]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x8c
	bne _0807F4DC
	ldr r0, _0807F4D8 @ =0x08A20640
	str r5, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #2
	bl StartPaletteAnimatorReverse
	b _0807F4EA
	.align 2, 0
_0807F4CC: .4byte 0x08A1FFD8
_0807F4D0: .4byte 0x06002800
_0807F4D4: .4byte 0x0203E1EC
_0807F4D8: .4byte 0x08A20640
_0807F4DC:
	ldr r0, _0807F4F4 @ =0x08A20600
	str r5, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #2
	bl StartPaletteAnimatorReverse
_0807F4EA:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F4F4: .4byte 0x08A20600


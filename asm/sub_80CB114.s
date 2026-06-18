	.syntax unified
	.set BlendPaletteToColor, 0x080CB8BC + 1
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80CAEF4, 0x080CAEF4 + 1
	.set sub_80CB054, 0x080CB054 + 1
	.section .text.sub_80CB114, "ax", %progbits
@ Title_Loop_LightExplosionFx @ JP 0x080CB114 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Title_Loop_LightExplosionFx
	.thumb_func
Title_Loop_LightExplosionFx:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldrh r3, [r7, #0x2a]
	movs r0, #0x18
	mov r8, r0
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl sub_8012E84
	ldr r1, _080CB1C4 @ =0x03003020
	adds r1, #0x44
	strb r0, [r1]
	ldrh r3, [r7, #0x2a]
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl sub_8012E84
	adds r5, r0, #0
	ldr r0, _080CB1C8 @ =0x08B43988
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl sub_8000D68
	ldr r4, _080CB1CC @ =0x02022A68
	ldr r6, _080CB1D0 @ =0x00007FFF
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl BlendPaletteToColor
	ldr r0, _080CB1D4 @ =0x08B44B20
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl sub_8000D68
	adds r4, #0x20
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl BlendPaletteToColor
	ldrh r3, [r7, #0x2a]
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x3f
	bl sub_8012E84
	adds r5, r0, #0
	ldr r1, [r7, #0x30]
	bl sub_80CAEF4
	str r5, [r7, #0x30]
	ldr r3, _080CB1D8 @ =0x08B3ED80
	ldr r0, _080CB1DC @ =0x00003230
	str r0, [sp]
	movs r0, #1
	movs r1, #0x38
	movs r2, #0x57
	bl PutSpriteExt
	ldrh r0, [r7, #0x2a]
	cmp r0, #0x16
	bls _080CB1E4
	ldr r3, _080CB1E0 @ =0x08B3ED60
	movs r0, #0x83
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #1
	movs r1, #0x34
	movs r2, #0x1a
	bl PutSpriteExt
	b _080CB1F8
	.align 2, 0
_080CB1C4: .4byte 0x03003020
_080CB1C8: .4byte 0x08B43988
_080CB1CC: .4byte 0x02022A68
_080CB1D0: .4byte 0x00007FFF
_080CB1D4: .4byte 0x08B44B20
_080CB1D8: .4byte 0x08B3ED80
_080CB1DC: .4byte 0x00003230
_080CB1E0: .4byte 0x08B3ED60
_080CB1E4:
	cmp r0, #0x14
	bls _080CB1F8
	ldr r3, _080CB210 @ =0x08B3ED60
	ldr r0, _080CB214 @ =0x000082C0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x34
	movs r2, #0x1a
	bl PutSpriteExt
_080CB1F8:
	ldrh r0, [r7, #0x2a]
	bl sub_80CB054
	ldrh r0, [r7, #0x2a]
	cmp r0, #0x18
	bne _080CB218
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl sub_8002DE4
	b _080CB21C
	.align 2, 0
_080CB210: .4byte 0x08B3ED60
_080CB214: .4byte 0x000082C0
_080CB218:
	adds r0, #1
	strh r0, [r7, #0x2a]
_080CB21C:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0


	.syntax unified
	.set EkrDemonkingObj_SetTilePixel, 0x0807A3C0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_807A334, "ax", %progbits
@ EkrDemonkingObj_DissolveLoop @ JP 0x0807A334 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global EkrDemonkingObj_DissolveLoop
	.thumb_func
EkrDemonkingObj_DissolveLoop:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r4, #0
	adds r7, r5, #0
	adds r7, #0x64
	ldr r6, _0807A3A8 @ =0x0885600C
_0807A340:
	adds r0, r5, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r4, #4
	adds r0, r0, r1
	ldr r1, _0807A3AC @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #5
	ldr r1, _0807A3B0 @ =0x06002000
	adds r0, r0, r1
	ldm r6!, {r1}
	ldr r2, [r5, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl EkrDemonkingObj_SetTilePixel
	adds r4, #1
	cmp r4, #5
	ble _0807A340
	ldr r0, [r5, #0x58]
	cmp r0, #0x3e
	bgt _0807A3A0
	adds r0, #1
	str r0, [r5, #0x58]
	movs r4, #0
	ldr r6, _0807A3A8 @ =0x0885600C
_0807A376:
	movs r1, #0
	ldrsh r0, [r7, r1]
	lsls r1, r4, #4
	adds r0, r0, r1
	ldr r1, _0807A3AC @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #5
	ldr r1, _0807A3B0 @ =0x06002000
	adds r0, r0, r1
	ldm r6!, {r1}
	ldr r2, [r5, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl EkrDemonkingObj_SetTilePixel
	adds r4, #1
	cmp r4, #5
	ble _0807A376
	ldr r0, [r5, #0x58]
	cmp r0, #0x3e
	ble _0807A3B4
_0807A3A0:
	adds r0, r5, #0
	bl sub_8002DE4
	b _0807A3B8
	.align 2, 0
_0807A3A8: .4byte 0x0885600C
_0807A3AC: .4byte 0x000003FF
_0807A3B0: .4byte 0x06002000
_0807A3B4:
	adds r0, #1
	str r0, [r5, #0x58]
_0807A3B8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0


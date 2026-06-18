	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056130, 0x08056130 + 1
	.section .text.sub_8078598, "ax", %progbits
@ ekrPopup_WaitWRankUp2 @ JP 0x08078598 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ekrPopup_WaitWRankUp2
	.thumb_func
ekrPopup_WaitWRankUp2:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	cmp r0, #0
	bne _080785AA
	adds r0, r4, #0
	bl sub_8002DE4
	b _080785CC
_080785AA:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _080785CC
	ldr r0, [r4, #0x60]
	bl AnimDelete
	bl sub_8056130
	adds r0, r4, #0
	bl sub_8002DE4
_080785CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0


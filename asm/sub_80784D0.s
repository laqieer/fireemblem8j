	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056130, 0x08056130 + 1
	.section .text.sub_80784D0, "ax", %progbits
@ ekrPopup_WaitWpnBroke @ JP 0x080784D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ekrPopup_WaitWpnBroke
	.thumb_func
ekrPopup_WaitWpnBroke:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _080784E2
	adds r0, r4, #0
	bl sub_8002DE4
	b _08078504
_080784E2:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _08078504
	ldr r0, [r4, #0x60]
	bl AnimDelete
	bl sub_8056130
	adds r0, r4, #0
	bl sub_8002DE4
_08078504:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0


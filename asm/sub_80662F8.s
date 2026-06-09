	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80662F8, "ax", %progbits
@ sub_80662F8 @ JP 0x080662F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80662F8
	.thumb_func
sub_80662F8:
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	cmp r0, r1
	ble _08066314
	adds r0, r2, #0
	bl sub_8002DE4
_08066314:
	pop {r0}
	bx r0


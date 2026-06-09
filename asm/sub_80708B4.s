	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80708B4, "ax", %progbits
@ sub_80708B4 @ JP 0x080708B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80708B4
	.thumb_func
sub_80708B4:
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r2, #0x48]
	cmp r0, r1
	ble _080708D2
	movs r0, #0
	strh r0, [r2, #0x2c]
	adds r0, r2, #0
	bl sub_8002DE4
_080708D2:
	pop {r0}
	bx r0
	.align 2, 0


	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8071F88, "ax", %progbits
@ sub_8071F88 @ JP 0x08071F88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071F88
	.thumb_func
sub_8071F88:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc8
	ble _08071FA6
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl sub_8002DE4
_08071FA6:
	pop {r4}
	pop {r0}
	bx r0


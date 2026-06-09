	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80714D4, "ax", %progbits
@ sub_80714D4 @ JP 0x080714D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80714D4
	.thumb_func
sub_80714D4:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	ble _080714F2
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl sub_8002DE4
_080714F2:
	pop {r4}
	pop {r0}
	bx r0


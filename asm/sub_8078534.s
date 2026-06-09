	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056130, 0x08056130 + 1
	.section .text.sub_8078534, "ax", %progbits
@ sub_8078534 @ JP 0x08078534 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8078534
	.thumb_func
sub_8078534:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	bne _08078546
	adds r0, r4, #0
	bl sub_8002DE4
	b _08078568
_08078546:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _08078568
	ldr r0, [r4, #0x60]
	bl AnimDelete
	bl sub_8056130
	adds r0, r4, #0
	bl sub_8002DE4
_08078568:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0


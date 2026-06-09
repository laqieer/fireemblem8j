	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8066E40, "ax", %progbits
@ sub_8066E40 @ JP 0x08066E40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8066E40
	.thumb_func
sub_8066E40:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08066E5C
	ldr r1, _08066E58 @ =0x03003020
	ldrh r0, [r1, #0x20]
	adds r0, #0xc
	b _08066E62
	.align 2, 0
_08066E58: .4byte 0x03003020
_08066E5C:
	ldr r1, _08066E84 @ =0x03003020
	ldrh r0, [r1, #0x20]
	subs r0, #0xc
_08066E62:
	strh r0, [r1, #0x20]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _08066E7C
	adds r0, r4, #0
	bl sub_8002DE4
_08066E7C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08066E84: .4byte 0x03003020


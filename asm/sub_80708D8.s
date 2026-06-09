	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_80708D8, "ax", %progbits
@ sub_80708D8 @ JP 0x080708D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80708D8
	.thumb_func
sub_80708D8:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x64]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	ldr r0, [r5, #0x4c]
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	bl sub_8012E84
	str r0, [r4, #0x48]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r5, #0x4c]
	cmp r0, r1
	ble _08070910
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl sub_8002DE4
_08070910:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0


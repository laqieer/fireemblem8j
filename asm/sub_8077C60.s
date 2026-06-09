	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_8077C60, "ax", %progbits
@ sub_8077C60 @ JP 0x08077C60 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8077C60
	.thumb_func
sub_8077C60:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r5, #0x34
	ldrsh r2, [r4, r5]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r5, #0x2e
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #1
	bl sub_8012E84
	ldr r1, [r4, #0x60]
	strh r0, [r1, #2]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _08077CA2
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x14
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_8002DE4
_08077CA2:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0


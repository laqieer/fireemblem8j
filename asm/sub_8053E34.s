	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8053E34, "ax", %progbits
@ sub_8053E34 @ JP 0x08053E34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8053E34
	.thumb_func
sub_8053E34:
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r4, [r3, #0x5c]
	ldr r5, [r3, #0x60]
	ldrh r0, [r3, #0x2c]
	adds r0, #1
	strh r0, [r3, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	ble _08053E6C
	ldrh r2, [r4]
	ldr r1, _08053E68 @ =0x0000FFFD
	adds r0, r1, #0
	ands r0, r2
	strh r0, [r4]
	ldrh r0, [r5]
	ands r1, r0
	strh r1, [r5]
	movs r0, #0
	strh r0, [r3, #0x2c]
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
	b _08053E7A
	.align 2, 0
_08053E68: .4byte 0x0000FFFD
_08053E6C:
	ldrh r0, [r4]
	movs r1, #2
	orrs r0, r1
	strh r0, [r4]
	ldrh r0, [r5]
	orrs r0, r1
	strh r0, [r5]
_08053E7A:
	movs r1, #0x2e
	ldrsh r0, [r3, r1]
	cmp r0, #5
	ble _08053E8E
	movs r0, #0
	strh r0, [r3, #0x2c]
	strh r0, [r3, #0x2e]
	adds r0, r3, #0
	bl sub_8002DE4
_08053E8E:
	pop {r4, r5}
	pop {r0}
	bx r0


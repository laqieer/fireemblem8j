	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_80617D8, "ax", %progbits
@ efxHazymoonOBJ2_Loop_A @ JP 0x080617D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global efxHazymoonOBJ2_Loop_A
	.thumb_func
efxHazymoonOBJ2_Loop_A:
	push {r4, lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	bne _0806181C
	ldr r0, _08061810 @ =0x0867E6BC
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r4, [r2, #6]
	movs r0, #0xa
	strh r0, [r1, #0x2e]
	ldr r0, _08061814 @ =0x0867E214
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _08061818 @ =0x0867D980
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	b _0806182C
	.align 2, 0
_08061810: .4byte 0x0867E6BC
_08061814: .4byte 0x0867E214
_08061818: .4byte 0x0867D980
_0806181C:
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r3, r0
	bne _0806182C
	strh r4, [r1, #0x2c]
	adds r0, r1, #0
	bl sub_8002DE4
_0806182C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0


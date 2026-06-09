	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_80652FC, "ax", %progbits
@ sub_80652FC @ JP 0x080652FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80652FC
	.thumb_func
sub_80652FC:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r6, #0xa
	str r6, [sp]
	movs r0, #1
	movs r1, #0x32
	movs r2, #0
	bl sub_8012E84
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	ldrh r3, [r5, #0x30]
	adds r1, r1, r3
	strh r1, [r5, #0x30]
	ldrh r2, [r5, #0x30]
	lsrs r2, r2, #8
	ldr r3, _08065390 @ =0x080DC15C
	lsls r1, r2, #1
	adds r1, r1, r3
	movs r7, #0
	ldrsh r1, [r1, r7]
	adds r2, #0x40
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r3, #0
	ldrsh r2, [r2, r3]
	muls r1, r0, r1
	lsls r1, r1, #4
	muls r0, r2, r0
	lsls r0, r0, #4
	asrs r1, r1, #0x10
	ldrh r7, [r5, #0x32]
	adds r1, r1, r7
	asrs r0, r0, #0x10
	ldrh r2, [r5, #0x3a]
	adds r0, r0, r2
	strh r1, [r4, #2]
	strh r0, [r4, #4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble _08065366
	strh r6, [r5, #0x2c]
_08065366:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble _08065388
	ldr r0, _08065394 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r5, #0x60]
	bl AnimDelete
	adds r0, r5, #0
	bl sub_8002DE4
_08065388:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08065390: .4byte 0x080DC15C
_08065394: .4byte 0x0201774C


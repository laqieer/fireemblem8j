	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_80651D0, "ax", %progbits
@ sub_80651D0 @ JP 0x080651D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80651D0
	.thumb_func
sub_80651D0:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x60]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r2, #0x14
	mov r8, r2
	str r2, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x32
	bl sub_8012E84
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	ldrh r7, [r4, #0x30]
	adds r1, r1, r7
	movs r6, #0
	strh r1, [r4, #0x30]
	ldrh r2, [r4, #0x30]
	lsrs r2, r2, #8
	ldr r3, _08065270 @ =0x080DC15C
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
	ldrh r7, [r4, #0x32]
	adds r1, r1, r7
	asrs r0, r0, #0x10
	ldrh r2, [r4, #0x3a]
	adds r0, r0, r2
	strh r1, [r5, #2]
	strh r0, [r5, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _08065244
	mov r3, r8
	strh r3, [r4, #0x2c]
_08065244:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _08065264
	strh r6, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r0, _08065274 @ =0x0875AE24
	str r0, [r5, #0x24]
	str r0, [r5, #0x20]
	strh r6, [r5, #6]
	adds r0, r4, #0
	bl sub_8002DE4
_08065264:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08065270: .4byte 0x080DC15C
_08065274: .4byte 0x0875AE24


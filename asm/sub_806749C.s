	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8067514, 0x08067514 + 1
	.section .text.sub_806749C, "ax", %progbits
@ sub_806749C @ JP 0x0806749C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806749C
	.thumb_func
sub_806749C:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r6, #0x44]
	cmp r0, r1
	ble _08067502
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r5, _0806750C @ =0x08601A60
	movs r0, #0x2e
	ldrsh r4, [r6, r0]
	lsls r0, r4, #4
	adds r0, r0, r5
	ldr r1, [r0]
	lsls r4, r4, #2
	adds r0, r4, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	adds r0, r4, #2
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r3, [r0]
	adds r4, #3
	lsls r4, r4, #2
	adds r4, r4, r5
	ldr r4, [r4]
	ldr r0, [r6, #0x60]
	str r4, [sp]
	bl sub_8067514
	ldrh r0, [r6, #0x2e]
	adds r0, #1
	strh r0, [r6, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r6, #0x48]
	cmp r0, r1
	ble _08067502
	ldr r1, _08067510 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl sub_8002DE4
_08067502:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806750C: .4byte 0x08601A60
_08067510: .4byte 0x0201774C


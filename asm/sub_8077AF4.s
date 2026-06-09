	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_8077AF4, "ax", %progbits
@ sub_8077AF4 @ JP 0x08077AF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8077AF4
	.thumb_func
sub_8077AF4:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x20
	movs r2, #0
	bl sub_8012E84
	ldr r2, [r4, #0x60]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #2]
	adds r1, r1, r0
	strh r1, [r2, #2]
	ldr r2, [r4, #0x64]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #2]
	subs r1, r1, r0
	strh r1, [r2, #2]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _08077B46
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r0, [r4, #0x64]
	bl AnimDelete
	adds r0, r4, #0
	bl sub_8002DE4
_08077B46:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0


	.syntax unified
	.set sub_8001EF0, 0x08001EF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_8073820, 0x08073820 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8072B50, "ax", %progbits
@ sub_8072B50 @ JP 0x08072B50 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8072B50
	.thumb_func
sub_8072B50:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	ldr r0, [r7, #0x44]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl sub_8012E84
	adds r6, r0, #0
	ldr r0, _08072BB8 @ =0x020228A8
	ldr r4, _08072BBC @ =0x020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80D636C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl sub_8073820
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl sub_80D636C
	bl sub_8001EF0
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r7, #0x44]
	cmp r0, r1
	ble _08072BB0
	movs r0, #0
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	bl sub_8002DE4
_08072BB0:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072BB8: .4byte 0x020228A8
_08072BBC: .4byte 0x020165C8


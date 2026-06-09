	.syntax unified
	.set EkrDragonPalFade_End, 0x08072E1C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056214, 0x08056214 + 1
	.section .text.sub_8063F44, "ax", %progbits
@ sub_8063F44 @ JP 0x08063F44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8063F44
	.thumb_func
sub_8063F44:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	ldr r1, _08063F9C @ =0x03003020
	ldrh r0, [r1, #0x22]
	subs r0, #1
	strh r0, [r1, #0x22]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _08063F96
	bl sub_8056130
	bl sub_8056214
	bl EkrDragonPalFade_End
	ldr r0, [r5, #0x1c]
	ldr r1, _08063FA0 @ =0xFFFFF7FF
	ands r0, r1
	str r0, [r5, #0x1c]
	ldrh r1, [r5, #8]
	ldr r0, _08063FA4 @ =0x0000F3FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	ldr r1, _08063FA8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_08063F96:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063F9C: .4byte 0x03003020
_08063FA0: .4byte 0xFFFFF7FF
_08063FA4: .4byte 0x0000F3FF
_08063FA8: .4byte 0x0201774C


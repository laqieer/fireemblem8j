	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.section .text.sub_805DBB8, "ax", %progbits
@ sub_805DBB8 @ JP 0x0805DBB8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805DBB8
	.thumb_func
sub_805DBB8:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805DC0C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805DC10 @ =0x085FF4D8
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r7, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _0805DC14 @ =0x08607184
	ldr r2, _0805DC18 @ =0x08607220
	str r2, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	bl sub_80564F0
	adds r6, r0, #0
	str r6, [r4, #0x60]
	ldrh r0, [r6, #4]
	adds r0, #0x10
	strh r0, [r6, #4]
	ldrh r1, [r6, #8]
	movs r0, #0xc0
	lsls r0, r0, #4
	ands r0, r1
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #1
	bne _0805DC1C
	ldrh r0, [r6, #8]
	movs r2, #0xe4
	lsls r2, r2, #7
	b _0805DC22
	.align 2, 0
_0805DC0C: .4byte 0x0201774C
_0805DC10: .4byte 0x085FF4D8
_0805DC14: .4byte 0x08607184
_0805DC18: .4byte 0x08607220
_0805DC1C:
	ldrh r0, [r6, #8]
	movs r2, #0x93
	lsls r2, r2, #8
_0805DC22:
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r6, #8]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0


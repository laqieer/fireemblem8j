	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.efxFimbulvetrOBJ2Fall_Loop, "ax", %progbits
@ efxFimbulvetrOBJ2Fall_Loop @ JP 0x0805F794 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global efxFimbulvetrOBJ2Fall_Loop
	.thumb_func
efxFimbulvetrOBJ2Fall_Loop:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x60]
	ldrh r0, [r4, #0x2c]
	adds r2, r0, #1
	strh r2, [r4, #0x2c]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r5, #0x2e
	ldrsh r1, [r4, r5]
	cmp r0, r1
	ble _0805F7C8
	ldr r1, _0805F7C4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r3, #0
	bl AnimDelete
	adds r0, r4, #0
	bl sub_8002DE4
	b _0805F848
	.align 2, 0
_0805F7C4: .4byte 0x0201774C
_0805F7C8:
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	bne _0805F80C
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805F7E4
	ldr r0, _0805F7E0 @ =0x0864795C
	b _0805F7E6
	.align 2, 0
_0805F7E0: .4byte 0x0864795C
_0805F7E4:
	ldr r0, _0805F808 @ =0x08647964
_0805F7E6:
	str r0, [r3, #0x24]
	str r0, [r3, #0x20]
	movs r0, #0
	strh r0, [r3, #6]
	ldrh r1, [r4, #0x34]
	ldrh r0, [r4, #0x32]
	adds r1, r1, r0
	strh r1, [r4, #0x32]
	ldrh r0, [r4, #0x3c]
	ldrh r2, [r4, #0x3a]
	adds r0, r0, r2
	strh r0, [r4, #0x3a]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x18
	strh r1, [r3, #2]
	ldrh r0, [r4, #0x3a]
	b _0805F844
	.align 2, 0
_0805F808: .4byte 0x08647964
_0805F80C:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805F820
	ldr r0, _0805F81C @ =0x0864795C
	b _0805F822
	.align 2, 0
_0805F81C: .4byte 0x0864795C
_0805F820:
	ldr r0, _0805F850 @ =0x08647964
_0805F822:
	str r0, [r3, #0x24]
	str r0, [r3, #0x20]
	movs r0, #0
	strh r0, [r3, #6]
	ldrh r0, [r4, #0x38]
	ldrh r5, [r4, #0x3e]
	adds r0, r0, r5
	strh r0, [r4, #0x3e]
	adds r1, r4, #0
	adds r1, #0x40
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x36]
	lsrs r0, r0, #8
	strh r0, [r3, #2]
	ldrh r0, [r4, #0x3e]
_0805F844:
	lsrs r0, r0, #8
	strh r0, [r3, #4]
_0805F848:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805F850: .4byte 0x08647964


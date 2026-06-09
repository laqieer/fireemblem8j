	.syntax unified
	.set CheckEkrHitDone, 0x08052FC4 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_806F0C8, "ax", %progbits
@ sub_806F0C8 @ JP 0x0806F0C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806F0C8
	.thumb_func
sub_806F0C8:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	bl CheckEkrHitDone
	cmp r0, #1
	bne _0806F122
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806F0FC
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806F0F4
	ldr r0, _0806F0F0 @ =0x08618AFC
	b _0806F112
	.align 2, 0
_0806F0F0: .4byte 0x08618AFC
_0806F0F4:
	ldr r0, _0806F0F8 @ =0x0861785C
	b _0806F112
	.align 2, 0
_0806F0F8: .4byte 0x0861785C
_0806F0FC:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806F110
	ldr r0, _0806F10C @ =0x0861B09C
	b _0806F112
	.align 2, 0
_0806F10C: .4byte 0x0861B09C
_0806F110:
	ldr r0, _0806F128 @ =0x08619DCC
_0806F112:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl sub_8002DE4
_0806F122:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F128: .4byte 0x08619DCC


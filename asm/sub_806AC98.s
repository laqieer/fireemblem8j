	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_806AC98, "ax", %progbits
@ sub_806AC98 @ JP 0x0806AC98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806AC98
	.thumb_func
sub_806AC98:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806ACBC @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0806ACCA
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806ACC0
	ldr r1, [r4, #0x60]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	adds r0, #0x48
	b _0806ACC8
	.align 2, 0
_0806ACBC: .4byte 0x0203E11C
_0806ACC0:
	ldr r1, [r4, #0x60]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	subs r0, #0x48
_0806ACC8:
	strh r0, [r1, #2]
_0806ACCA:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _0806ACF0
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _0806ACF8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_0806ACF0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806ACF8: .4byte 0x0201774C


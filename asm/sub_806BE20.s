	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_806BE20, "ax", %progbits
@ sub_806BE20 @ JP 0x0806BE20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806BE20
	.thumb_func
sub_806BE20:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x44]
	adds r0, r0, r1
	str r0, [r4, #0x48]
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806BE44
	ldr r2, [r4, #0x60]
	ldr r1, [r4, #0x48]
	asrs r1, r1, #8
	ldrh r0, [r4, #0x32]
	subs r0, r0, r1
	strh r0, [r2, #2]
	b _0806BE50
_0806BE44:
	ldr r1, [r4, #0x60]
	ldr r0, [r4, #0x48]
	asrs r0, r0, #8
	ldrh r2, [r4, #0x32]
	adds r0, r0, r2
	strh r0, [r1, #2]
_0806BE50:
	ldr r1, [r4, #0x60]
	ldr r0, [r4, #0x48]
	asrs r0, r0, #8
	ldrh r2, [r4, #0x3a]
	adds r0, r0, r2
	strh r0, [r1, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _0806BE82
	ldr r0, _0806BE88 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl sub_8002DE4
_0806BE82:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806BE88: .4byte 0x0201774C


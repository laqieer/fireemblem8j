	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_806F038, "ax", %progbits
@ sub_806F038 @ JP 0x0806F038 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806F038
	.thumb_func
sub_806F038:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x45
	bne _0806F096
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806F070
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806F068
	ldr r0, _0806F064 @ =0x08618AD4
	b _0806F086
	.align 2, 0
_0806F064: .4byte 0x08618AD4
_0806F068:
	ldr r0, _0806F06C @ =0x08617834
	b _0806F086
	.align 2, 0
_0806F06C: .4byte 0x08617834
_0806F070:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806F084
	ldr r0, _0806F080 @ =0x0861B074
	b _0806F086
	.align 2, 0
_0806F080: .4byte 0x0861B074
_0806F084:
	ldr r0, _0806F09C @ =0x08619DA4
_0806F086:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl sub_8002DE4
_0806F096:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F09C: .4byte 0x08619DA4


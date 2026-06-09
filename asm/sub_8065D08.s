	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8065D08, "ax", %progbits
@ sub_8065D08 @ JP 0x08065D08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8065D08
	.thumb_func
sub_8065D08:
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bne _08065D2C
	ldr r1, _08065D30 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r2, #0
	bl sub_8002DE4
_08065D2C:
	pop {r0}
	bx r0
	.align 2, 0
_08065D30: .4byte 0x0201774C


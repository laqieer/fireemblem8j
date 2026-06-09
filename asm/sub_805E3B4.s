	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056214, 0x08056214 + 1
	.section .text.sub_805E3B4, "ax", %progbits
@ sub_805E3B4 @ JP 0x0805E3B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805E3B4
	.thumb_func
sub_805E3B4:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _0805E3E0
	bl sub_8056130
	bl sub_8056214
	ldr r1, _0805E3E8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_0805E3E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E3E8: .4byte 0x0201774C


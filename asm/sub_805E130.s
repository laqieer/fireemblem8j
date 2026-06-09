	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_805E130, "ax", %progbits
@ sub_805E130 @ JP 0x0805E130 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805E130
	.thumb_func
sub_805E130:
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
	ble _0805E15A
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _0805E160 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_0805E15A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E160: .4byte 0x0201774C


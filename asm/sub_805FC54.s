	.syntax unified
	.set sub_8001EF0, 0x08001EF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_805FC54, "ax", %progbits
@ sub_805FC54 @ JP 0x0805FC54 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805FC54
	.thumb_func
sub_805FC54:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0805FC90 @ =0x020165C8
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_80D636C
	bl sub_8001EF0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _0805FC8A
	ldr r1, _0805FC94 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_0805FC8A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805FC90: .4byte 0x020165C8
_0805FC94: .4byte 0x0201774C


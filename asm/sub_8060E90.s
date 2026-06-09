	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8060C24, 0x08060C24 + 1
	.set sub_8060EFC, 0x08060EFC + 1
	.section .text.sub_8060E90, "ax", %progbits
@ sub_8060E90 @ JP 0x08060E90 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8060E90
	.thumb_func
sub_8060E90:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r5, #0x44]
	cmp r0, r1
	ble _08060EEC
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r2, _08060EF4 @ =0x0860053C
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	lsls r1, r0, #3
	adds r1, r1, r2
	ldr r4, [r1]
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	ldr r0, [r5, #0x60]
	adds r1, r4, #0
	bl sub_8060EFC
	adds r0, r4, #0
	movs r1, #1
	bl sub_8060C24
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r5, #0x48]
	cmp r0, r1
	ble _08060EEC
	ldr r1, _08060EF8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl sub_8002DE4
_08060EEC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08060EF4: .4byte 0x0860053C
_08060EF8: .4byte 0x0201774C


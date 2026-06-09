	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.set sub_8056890, 0x08056890 + 1
	.section .text.sub_8064FF8, "ax", %progbits
@ sub_8064FF8 @ JP 0x08064FF8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8064FF8
	.thumb_func
sub_8064FF8:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0806501C
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl sub_80567E0
_0806501C:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _08065034
	adds r0, r4, #0
	bl sub_8002DE4
_08065034:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0


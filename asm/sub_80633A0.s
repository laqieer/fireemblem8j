	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_80633A0, "ax", %progbits
@ sub_80633A0 @ JP 0x080633A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80633A0
	.thumb_func
sub_80633A0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080633DC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080633E0 @ =0x08600D18
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _080633E4 @ =0x080E2CFE
	str r1, [r0, #0x48]
	ldr r1, _080633E8 @ =0x08600D30
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _080633EC @ =0x08600D64
	str r1, [r0, #0x54]
	ldr r0, _080633F0 @ =0x086A817C
	movs r1, #0x20
	bl sub_80567E0
	bl sub_8056158
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080633DC: .4byte 0x0201774C
_080633E0: .4byte 0x08600D18
_080633E4: .4byte 0x080E2CFE
_080633E8: .4byte 0x08600D30
_080633EC: .4byte 0x08600D64
_080633F0: .4byte 0x086A817C


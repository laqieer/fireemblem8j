	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_8056214, 0x08056214 + 1
	.section .text.sub_8067F04, "ax", %progbits
@ sub_8067F04 @ JP 0x08067F04 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8067F04
	.thumb_func
sub_8067F04:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8056130
	bl sub_8056214
	ldr r1, _08067F50 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08067F54 @ =0x08601D64
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08067F58 @ =0x080E384E
	str r1, [r0, #0x48]
	ldr r1, _08067F5C @ =0x08601D7C
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08067F60 @ =0x08601DA8
	str r1, [r0, #0x54]
	ldr r1, _08067F64 @ =0x08601DD4
	str r1, [r0, #0x58]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_8056158
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08067F50: .4byte 0x0201774C
_08067F54: .4byte 0x08601D64
_08067F58: .4byte 0x080E384E
_08067F5C: .4byte 0x08601D7C
_08067F60: .4byte 0x08601DA8
_08067F64: .4byte 0x08601DD4


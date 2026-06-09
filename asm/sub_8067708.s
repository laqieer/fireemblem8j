	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_8067708, "ax", %progbits
@ sub_8067708 @ JP 0x08067708 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8067708
	.thumb_func
sub_8067708:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08067750 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08067754 @ =0x08601C00
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _08067758 @ =0x080E3752
	str r1, [r0, #0x48]
	ldr r1, _0806775C @ =0x08601C40
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08067760 @ =0x08601C18
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	ldr r0, _08067764 @ =0x0879F4E0
	movs r1, #0x20
	bl sub_80567E0
	bl sub_8056158
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08067750: .4byte 0x0201774C
_08067754: .4byte 0x08601C00
_08067758: .4byte 0x080E3752
_0806775C: .4byte 0x08601C40
_08067760: .4byte 0x08601C18
_08067764: .4byte 0x0879F4E0


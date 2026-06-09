	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_8066A7C, "ax", %progbits
@ sub_8066A7C @ JP 0x08066A7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8066A7C
	.thumb_func
sub_8066A7C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08066AC4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08066AC8 @ =0x086018E8
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08066ACC @ =0x080E350C
	str r1, [r0, #0x48]
	ldr r1, _08066AD0 @ =0x08601900
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08066AD4 @ =0x08601930
	str r1, [r0, #0x54]
	ldr r0, _08066AD8 @ =0x08774C98
	movs r1, #0x20
	bl sub_80567E0
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_8056158
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08066AC4: .4byte 0x0201774C
_08066AC8: .4byte 0x086018E8
_08066ACC: .4byte 0x080E350C
_08066AD0: .4byte 0x08601900
_08066AD4: .4byte 0x08601930
_08066AD8: .4byte 0x08774C98


	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_8067E38, "ax", %progbits
@ sub_8067E38 @ JP 0x08067E38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8067E38
	.thumb_func
sub_8067E38:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _08067E8C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08067E90 @ =0x08601D38
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetAnimAnotherSide
	str r0, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08067E94 @ =0x080E3822
	str r0, [r4, #0x48]
	ldr r0, _08067E98 @ =0x08601D50
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	ldr r0, _08067E9C @ =0x086C26E8
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	ldr r0, _08067EA0 @ =0x086C3418
	movs r1, #0x20
	bl sub_80567E0
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_8056158
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08067E8C: .4byte 0x0201774C
_08067E90: .4byte 0x08601D38
_08067E94: .4byte 0x080E3822
_08067E98: .4byte 0x08601D50
_08067E9C: .4byte 0x086C26E8
_08067EA0: .4byte 0x086C3418


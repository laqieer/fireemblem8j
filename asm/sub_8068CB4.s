	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.section .text.sub_8068CB4, "ax", %progbits
@ sub_8068CB4 @ JP 0x08068CB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8068CB4
	.thumb_func
sub_8068CB4:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08068CF0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08068CF4 @ =0x08602218
	movs r1, #3
	bl sub_8002BCC
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	ldr r0, _08068CF8 @ =0x080E3A0C
	str r0, [r1, #0x48]
	ldr r0, _08068CFC @ =0x0203E11C
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	beq _08068D0C
	ldr r0, _08068D00 @ =0x0860226C
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	ldr r0, _08068D04 @ =0x08602280
	str r0, [r1, #0x54]
	ldr r0, _08068D08 @ =0x08602294
	b _08068D18
	.align 2, 0
_08068CF0: .4byte 0x0201774C
_08068CF4: .4byte 0x08602218
_08068CF8: .4byte 0x080E3A0C
_08068CFC: .4byte 0x0203E11C
_08068D00: .4byte 0x0860226C
_08068D04: .4byte 0x08602280
_08068D08: .4byte 0x08602294
_08068D0C:
	ldr r0, _08068D30 @ =0x08602230
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	ldr r0, _08068D34 @ =0x08602244
	str r0, [r1, #0x54]
	ldr r0, _08068D38 @ =0x08602258
_08068D18:
	str r0, [r1, #0x58]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_8056158
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068D30: .4byte 0x08602230
_08068D34: .4byte 0x08602244
_08068D38: .4byte 0x08602258


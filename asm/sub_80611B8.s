	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_80611B8, "ax", %progbits
@ sub_80611B8 @ JP 0x080611B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80611B8
	.thumb_func
sub_80611B8:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0806120C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061210 @ =0x086005AC
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08061214 @ =0x080E25C4
	str r0, [r5, #0x48]
	ldr r0, _08061218 @ =0x086006D0
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0806121C @ =0x0860067C
	str r0, [r5, #0x54]
	ldr r0, _08061220 @ =0x0866E93C
	movs r1, #0x20
	bl sub_80567E0
	ldr r0, _08061224 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08061232
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08061228
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _08061232
	.align 2, 0
_0806120C: .4byte 0x0201774C
_08061210: .4byte 0x086005AC
_08061214: .4byte 0x080E25C4
_08061218: .4byte 0x086006D0
_0806121C: .4byte 0x0860067C
_08061220: .4byte 0x0866E93C
_08061224: .4byte 0x0203E11C
_08061228:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_08061232:
	bl sub_8056158
	pop {r4, r5}
	pop {r0}
	bx r0


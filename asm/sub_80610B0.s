	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_80610B0, "ax", %progbits
@ sub_80610B0 @ JP 0x080610B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80610B0
	.thumb_func
sub_80610B0:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08061104 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061108 @ =0x086005AC
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0806110C @ =0x080E2548
	str r0, [r5, #0x48]
	ldr r0, _08061110 @ =0x08600614
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08061114 @ =0x086005C4
	str r0, [r5, #0x54]
	ldr r0, _08061118 @ =0x0866E95C
	movs r1, #0x20
	bl sub_80567E0
	ldr r0, _0806111C @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0806112A
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08061120
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
	b _0806112A
	.align 2, 0
_08061104: .4byte 0x0201774C
_08061108: .4byte 0x086005AC
_0806110C: .4byte 0x080E2548
_08061110: .4byte 0x08600614
_08061114: .4byte 0x086005C4
_08061118: .4byte 0x0866E95C
_0806111C: .4byte 0x0203E11C
_08061120:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
_0806112A:
	bl sub_8056158
	pop {r4, r5}
	pop {r0}
	bx r0


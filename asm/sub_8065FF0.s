	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_8065FF0, "ax", %progbits
@ sub_8065FF0 @ JP 0x08065FF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8065FF0
	.thumb_func
sub_8065FF0:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08066054 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08066058 @ =0x08601700
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0806605C @ =0x080E334E
	str r0, [r5, #0x48]
	ldr r0, _08066060 @ =0x08601718
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08066064 @ =0x0875DF20
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	ldr r0, _08066068 @ =0x0875F138
	movs r1, #0x20
	bl sub_80567E0
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _0806606C @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0806607A
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08066070
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _0806607A
	.align 2, 0
_08066054: .4byte 0x0201774C
_08066058: .4byte 0x08601700
_0806605C: .4byte 0x080E334E
_08066060: .4byte 0x08601718
_08066064: .4byte 0x0875DF20
_08066068: .4byte 0x0875F138
_0806606C: .4byte 0x0203E11C
_08066070:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_0806607A:
	bl sub_8056158
	pop {r4, r5}
	pop {r0}
	bx r0


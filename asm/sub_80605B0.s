	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_80605B0, "ax", %progbits
@ sub_80605B0 @ JP 0x080605B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80605B0
	.thumb_func
sub_80605B0:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08060610 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060614 @ =0x085FFD90
	movs r1, #3
	bl sub_8002BCC
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	adds r1, r6, #0
	adds r1, #0x29
	movs r0, #0
	strb r5, [r1]
	strh r0, [r6, #0x2c]
	str r0, [r6, #0x44]
	ldr r0, _08060618 @ =0x080E21FA
	str r0, [r6, #0x48]
	ldr r0, _0806061C @ =0x085FFEA4
	str r0, [r6, #0x4c]
	str r0, [r6, #0x50]
	ldr r0, _08060620 @ =0x085FFDD8
	str r0, [r6, #0x54]
	ldr r0, _08060624 @ =0x08663218
	movs r1, #0x20
	bl sub_80567E0
	bl sub_8056158
	ldr r0, _08060628 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08060636
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806062C
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _08060636
	.align 2, 0
_08060610: .4byte 0x0201774C
_08060614: .4byte 0x085FFD90
_08060618: .4byte 0x080E21FA
_0806061C: .4byte 0x085FFEA4
_08060620: .4byte 0x085FFDD8
_08060624: .4byte 0x08663218
_08060628: .4byte 0x0203E11C
_0806062C:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_08060636:
	pop {r4, r5, r6}
	pop {r0}
	bx r0


	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.section .text.sub_8060AA8, "ax", %progbits
@ sub_8060AA8 @ JP 0x08060AA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8060AA8
	.thumb_func
sub_8060AA8:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08060AFC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060B00 @ =0x085FFFA0
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08060B04 @ =0x080E22FC
	str r0, [r5, #0x48]
	ldr r0, _08060B08 @ =0x086000C0
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08060B0C @ =0x085FFFB8
	str r0, [r5, #0x54]
	ldr r0, _08060B10 @ =0x0860003C
	str r0, [r5, #0x58]
	bl sub_8056158
	ldr r0, _08060B14 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08060B22
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08060B18
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _08060B22
	.align 2, 0
_08060AFC: .4byte 0x0201774C
_08060B00: .4byte 0x085FFFA0
_08060B04: .4byte 0x080E22FC
_08060B08: .4byte 0x086000C0
_08060B0C: .4byte 0x085FFFB8
_08060B10: .4byte 0x0860003C
_08060B14: .4byte 0x0203E11C
_08060B18:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_08060B22:
	pop {r4, r5}
	pop {r0}
	bx r0


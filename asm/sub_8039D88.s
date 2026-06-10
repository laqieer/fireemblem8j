	.syntax unified
	.set AiTryActionAfterMove, 0x0803EC80 + 1
	.set AiTryDanceOrStealAfterMove, 0x0803EC54 + 1
	.set sub_803BA10, 0x0803BA10 + 1
	.set sub_803E400, 0x0803E400 + 1
	.set sub_803E628, 0x0803E628 + 1
	.set sub_803E6A8, 0x0803E6A8 + 1
	.set sub_803E760, 0x0803E760 + 1
	.section .text.sub_8039D88, "ax", %progbits
@ sub_8039D88 @ JP 0x08039D88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8039D88
	.thumb_func
sub_8039D88:
	push {r4, lr}
	sub sp, #8
	ldr r0, _08039DD4 @ =0x0203AA00
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08039E34
	ldr r4, _08039DD8 @ =0x03004DF0
	ldr r0, [r4]
	bl sub_803E628
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08039E18
	bl sub_803E6A8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08039E34
	ldr r0, [r4]
	ldrb r1, [r0, #0xa]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08039DDC
	bl sub_803E760
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08039DDC
	bl AiTryDanceOrStealAfterMove
	b _08039E34
	.align 2, 0
_08039DD4: .4byte 0x0203AA00
_08039DD8: .4byte 0x03004DF0
_08039DDC:
	add r4, sp, #4
	adds r0, r4, #0
	bl sub_803E400
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #1
	bne _08039E34
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #2
	ldrsh r1, [r4, r3]
	str r2, [sp]
	movs r2, #0
	movs r3, #0
	bl sub_803BA10
	ldr r0, _08039E14 @ =0x0203AA90
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08039E34
	bl AiTryActionAfterMove
	b _08039E34
	.align 2, 0
_08039E14: .4byte 0x0203AA90
_08039E18:
	ldr r0, [r4]
	ldrb r1, [r0, #0xa]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08039E34
	bl sub_803E760
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08039E34
	bl AiTryDanceOrStealAfterMove
_08039E34:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0


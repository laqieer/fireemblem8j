	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set efxDarkGradoGetPieceX, 0x0806BA2C + 1
	.set efxDarkGradoGetPieceY, 0x0806BAA4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_806BB1C, "ax", %progbits
@ sub_806BB1C @ JP 0x0806BB1C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806BB1C
	.thumb_func
sub_806BB1C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806BB3E
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x48]
	bl efxDarkGradoGetPieceX
	ldr r2, [r4, #0x60]
	ldrh r1, [r4, #0x32]
	adds r1, r1, r0
	b _0806BB50
_0806BB3E:
	movs r2, #0x2c
	ldrsh r0, [r4, r2]
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x48]
	bl efxDarkGradoGetPieceX
	ldr r2, [r4, #0x60]
	ldrh r1, [r4, #0x32]
	subs r1, r1, r0
_0806BB50:
	strh r1, [r2, #2]
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x48]
	bl efxDarkGradoGetPieceY
	ldr r2, [r4, #0x60]
	ldrh r1, [r4, #0x3a]
	adds r1, r1, r0
	strh r1, [r2, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	beq _0806BB82
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x4c]
	cmp r1, r0
	bne _0806BB96
_0806BB82:
	ldr r0, _0806BB9C @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl sub_8002DE4
_0806BB96:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806BB9C: .4byte 0x0201774C


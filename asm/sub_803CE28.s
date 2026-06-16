	.syntax unified
	.set sub_803AA9C, 0x0803AA9C + 1
	.set AiTryMoveTowardsNeglectWall, 0x0803BBC0 + 1
	.section .text.sub_803CE28, "ax", %progbits
@ sub_803CE28 @ JP 0x0803CE28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803CE28
	.thumb_func
sub_803CE28:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r6, _0803CE64 @ =0x030017C8
	ldr r0, [r6]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _0803CE6C
	ldr r0, _0803CE68 @ =sub_803C7A8
	add r5, sp, #4
	adds r1, r5, #0
	bl sub_803AA9C
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _0803CE94
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl AiTryMoveTowardsNeglectWall
	b _0803CE94
	.align 2, 0
_0803CE64: .4byte 0x030017C8
_0803CE68: .4byte 0x0803C7A9  @ sub_803C7A8
_0803CE6C:
	ldr r0, _0803CEA4 @ =sub_803C7F4
	add r5, sp, #4
	adds r1, r5, #0
	bl sub_803AA9C
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _0803CE94
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl AiTryMoveTowardsNeglectWall
_0803CE94:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CEA4: .4byte 0x0803C7F5  @ sub_803C7F4


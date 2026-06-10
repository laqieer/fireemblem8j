	.syntax unified
	.set PutText, 0x08003DA0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.section .text.sub_801B8E8, "ax", %progbits
@ sub_801B8E8 @ JP 0x0801B8E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801B8E8
	.thumb_func
sub_801B8E8:
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	ldr r2, _0801B98C @ =0x085775CC
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0801B904
	adds r1, r6, #0
	adds r1, #0x3c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0801B904:
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x20
	ands r0, r1
	adds r5, r6, #0
	adds r5, #0x3c
	cmp r0, #0
	beq _0801B91A
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
_0801B91A:
	adds r1, r5, #0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801B928
	movs r0, #0
	strb r0, [r1]
_0801B928:
	ldr r7, _0801B990 @ =0x08A9DDDC
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	adds r0, r0, r7
	ldr r0, [r0]
	cmp r0, #0
	bge _0801B93E
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
_0801B93E:
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _0801B984
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl sub_8003CF8
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #4
	adds r1, r7, #0
	adds r1, #0xc
	adds r0, r0, r1
	ldr r3, [r0]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl sub_80043B8
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r6, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801B994 @ =0x02022CA8
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
_0801B984:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801B98C: .4byte 0x085775CC
_0801B990: .4byte 0x08A9DDDC
_0801B994: .4byte 0x02022CA8


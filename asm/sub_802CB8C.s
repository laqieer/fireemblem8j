	.syntax unified
	.set GetItemAfterUse, 0x08016894 + 1
	.set GetItemAttributes, 0x08017314 + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_802C4F0, 0x0802C4F0 + 1
	.section .text.sub_802CB8C, "ax", %progbits
@ sub_802CB8C @ JP 0x0802CB8C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802CB8C
	.thumb_func
sub_802CB8C:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0802CC08 @ =0x0203A604
	ldr r2, [r0]
	adds r2, #4
	str r2, [r0]
	ldrb r1, [r2, #2]
	movs r0, #7
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #2]
	bl sub_802C4F0
	ldr r4, _0802CC0C @ =0x0203A4E8
	adds r0, r4, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802CBF8
	adds r5, r4, #0
	adds r5, #0x48
	ldrh r0, [r5]
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _0802CBD2
	adds r1, r4, #0
	adds r1, #0x7d
	movs r0, #1
	strb r0, [r1]
_0802CBD2:
	ldrh r0, [r5]
	bl GetItemAfterUse
	strh r0, [r5]
	adds r1, r4, #0
	adds r1, #0x51
	ldrb r1, [r1]
	lsls r1, r1, #1
	adds r2, r4, #0
	adds r2, #0x1e
	adds r1, r1, r2
	strh r0, [r1]
	ldrh r0, [r5]
	cmp r0, #0
	beq _0802CBF8
	adds r1, r4, #0
	adds r1, #0x7d
	movs r0, #0
	strb r0, [r1]
_0802CBF8:
	ldr r0, _0802CC10 @ =0x085C3FA4
	adds r1, r6, #0
	bl Proc_StartBlocking
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802CC08: .4byte 0x0203A604
_0802CC0C: .4byte 0x0203A4E8
_0802CC10: .4byte 0x085C3FA4


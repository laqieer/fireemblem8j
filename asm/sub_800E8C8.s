	.syntax unified
	.set StartTalk, 0x08006974 + 1
	.set sub_8006710, 0x08006710 + 1
	.set sub_8006980, 0x08006980 + 1
	.set sub_80080A4, 0x080080A4 + 1
	.set sub_800BFC8, 0x0800BFC8 + 1
	.set sub_800E854, 0x0800E854 + 1
	.set sub_8091544, 0x08091544 + 1
	.section .text.sub_800E8C8, "ax", %progbits
@ Event1E_ @ JP 0x0800E8C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Event1E_
	.thumb_func
Event1E_:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x38]
	ldrb r0, [r1]
	movs r5, #0xf
	ands r5, r0
	adds r2, r5, #0
	movs r0, #2
	ldrsh r3, [r1, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne _0800E8E8
	ldr r0, _0800E924 @ =0x030004B0
	movs r1, #8
	ldrsh r3, [r0, r1]
_0800E8E8:
	movs r0, #3
	rsbs r0, r0, #0
	cmp r3, r0
	beq _0800E94C
	adds r0, #1
	cmp r3, r0
	beq _0800E92C
	ldrh r0, [r4, #0x3c]
	lsrs r2, r0, #2
	movs r4, #1
	ands r2, r4
	cmp r2, #0
	bne _0800E980
	ldr r0, _0800E928 @ =0x03000420
	adds r1, r5, #0
	adds r1, #8
	strb r1, [r0]
	movs r1, #0x10
	strb r1, [r0, #1]
	strb r3, [r0, #2]
	strb r4, [r0, #3]
	strb r4, [r0, #4]
	strb r2, [r0, #5]
	movs r0, #0x80
	movs r1, #2
	movs r2, #1
	bl sub_8006710
	b _0800E976
	.align 2, 0
_0800E924: .4byte 0x030004B0
_0800E928: .4byte 0x03000420
_0800E92C:
	ldr r1, _0800E948 @ =0x03000420
	adds r0, r2, #0
	adds r0, #8
	movs r2, #0
	strb r0, [r1]
	movs r0, #0x11
	strb r0, [r1, #1]
	movs r0, #1
	strb r0, [r1, #2]
	strb r2, [r1, #3]
	bl sub_80080A4
	b _0800E976
	.align 2, 0
_0800E948: .4byte 0x03000420
_0800E94C:
	bl sub_8006980
	bl sub_8091544
	bl EndAllBoxDialogue
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800E96C
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl sub_800BFC8
_0800E96C:
	adds r0, r4, #0
	bl sub_800E854
	movs r0, #2
	b _0800E982
_0800E976:
	ldr r2, _0800E988 @ =0x03000420
	movs r0, #0
	movs r1, #0
	bl StartTalk
_0800E980:
	movs r0, #0
_0800E982:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800E988: .4byte 0x03000420


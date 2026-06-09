	.syntax unified
	.section .text.sub_8056890, "ax", %progbits
@ sub_8056890 @ JP 0x08056890 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8056890
	.thumb_func
sub_8056890:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrh r0, [r5]
	adds r1, r0, #0
	cmp r1, #0
	bne _08056904
	ldrh r6, [r4]
	lsls r0, r6, #2
	adds r0, r0, r2
	movs r7, #0
	ldrsh r3, [r0, r7]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	beq _08056900
	movs r0, #6
	rsbs r0, r0, #0
	cmp r3, r0
	beq _08056900
	movs r0, #5
	rsbs r0, r0, #0
	cmp r3, r0
	beq _08056900
	movs r0, #4
	rsbs r0, r0, #0
	cmp r3, r0
	beq _08056900
	movs r0, #2
	rsbs r0, r0, #0
	cmp r3, r0
	bne _080568D8
	strh r1, [r4]
	movs r0, #0
	ldrsh r3, [r2, r0]
	b _080568EE
_080568D8:
	movs r0, #3
	rsbs r0, r0, #0
	cmp r3, r0
	bne _080568EE
	subs r0, r6, #1
	strh r0, [r4]
	ldrh r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0
	ldrsh r3, [r0, r1]
_080568EE:
	ldrh r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #2]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	subs r1, #1
	strh r1, [r5]
_08056900:
	adds r0, r3, #0
	b _0805690C
_08056904:
	subs r0, #1
	strh r0, [r5]
	movs r0, #7
	rsbs r0, r0, #0
_0805690C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0


	.syntax unified
	.set CheckFlag, 0x080860D0 + 1
	.set GetNextUnclearedNode, 0x080C1E20 + 1
	.set InitSaveMenuHelpTextSt, 0x080AF1E0 + 1
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendBackdropB, 0x08001EB4 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set WMLoc_GetChapterId, 0x080C03E0 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_80C2030, 0x080C2030 + 1
	.section .text.sub_80AD508, "ax", %progbits
@ sub_80AD508 @ JP 0x080AD508 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AD508
	.thumb_func
sub_80AD508:
	push {r4, r5, lr}
	sub sp, #4
	ldr r5, _080AD544 @ =0x0202BCEC
	ldrb r1, [r5, #0x14]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _080AD596
	movs r4, #0xe
	ldrsb r4, [r5, r4]
	ldr r2, _080AD548 @ =0x03005270
	ldrb r1, [r2]
	movs r0, #3
	ands r0, r1
	cmp r0, #3
	bne _080AD54C
	cmp r4, #1
	bls _080AD596
	cmp r4, #0x38
	beq _080AD596
	adds r0, r2, #0
	bl GetNextUnclearedNode
	cmp r0, #0
	bge _080AD53C
	movs r0, #0
_080AD53C:
	bl WMLoc_GetChapterId
	strb r0, [r5, #0xe]
	b _080AD596
	.align 2, 0
_080AD544: .4byte 0x0202BCEC
_080AD548: .4byte 0x03005270
_080AD54C:
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	cmp r0, #6
	bne _080AD566
	movs r0, #0x88
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AD566
	movs r0, #0x38
	strb r0, [r5, #0xe]
	b _080AD596
_080AD566:
	cmp r4, #1
	beq _080AD596
	cmp r4, #0xa
	beq _080AD596
	cmp r4, #0x17
	beq _080AD596
	ldr r4, _080AD630 @ =0x0202BCEC
	adds r0, r4, #0
	adds r0, #0x4a
	ldrb r1, [r0]
	movs r0, #0xe
	ands r0, r1
	cmp r0, #4
	beq _080AD596
	ldr r0, _080AD634 @ =0x0202BCAC
	ldrb r1, [r0, #4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _080AD596
	ldr r0, _080AD638 @ =0x03005270
	bl sub_80C2030
	strb r0, [r4, #0xe]
_080AD596:
	bl InitSaveMenuHelpTextSt
	ldr r0, _080AD63C @ =0x08A9CF7C
	bl sub_8001ACC
	ldr r3, _080AD640 @ =0x03003020
	ldrb r1, [r3, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r3, #1]
	ldrb r1, [r3]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3]
	ldrb r2, [r3, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	movs r0, #1
	movs r1, #6
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AD630: .4byte 0x0202BCEC
_080AD634: .4byte 0x0202BCAC
_080AD638: .4byte 0x03005270
_080AD63C: .4byte 0x08A9CF7C
_080AD640: .4byte 0x03003020


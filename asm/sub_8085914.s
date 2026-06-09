	.syntax unified
	.set CallBattleQuoteEventInBattle, 0x0800D548 + 1
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set StartBgm, 0x08002424 + 1
	.set sub_800D404, 0x0800D404 + 1
	.set sub_80858A8, 0x080858A8 + 1
	.set sub_80869B0, 0x080869B0 + 1
	.section .text.sub_8085914, "ax", %progbits
@ sub_8085914 @ JP 0x08085914 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8085914
	.thumb_func
sub_8085914:
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r5, #0
	bl sub_80869B0
	adds r4, r0, #0
	cmp r4, #0
	beq _08085986
	ldrb r0, [r4, #2]
	cmp r0, #1
	bne _0808594C
	ldrh r0, [r4, #4]
	cmp r0, #0x65
	bne _0808594C
	movs r0, #0x3e
	movs r1, #0
	bl StartBgm
	ldr r0, _08085948 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
	b _08085968
	.align 2, 0
_08085948: .4byte 0x0202BCEC
_0808594C:
	adds r0, r5, #0
	bl GetUnitFromCharId
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _08085968
	movs r0, #0x3f
	movs r1, #0
	bl StartBgm
_08085968:
	ldrh r0, [r4, #6]
	cmp r0, #0
	beq _08085974
	bl CallBattleQuoteEventInBattle
	b _0808597E
_08085974:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0808597E
	bl sub_800D404
_0808597E:
	ldrh r1, [r4, #4]
	adds r0, r5, #0
	bl sub_80858A8
_08085986:
	pop {r4, r5}
	pop {r0}
	bx r0


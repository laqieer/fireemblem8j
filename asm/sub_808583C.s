	.syntax unified
	.set CallBattleQuoteEventInBattle, 0x0800D548 + 1
	.set SetFlag, 0x080860A8 + 1
	.set sub_800D404, 0x0800D404 + 1
	.set sub_8086918, 0x08086918 + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_808583C, "ax", %progbits
@ sub_808583C @ JP 0x0808583C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808583C
	.thumb_func
sub_808583C:
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	bl sub_80C1E74
	cmp r0, #2
	beq _080858A0
	ldr r0, _0808588C @ =0x0203A954
	ldrb r0, [r0, #0x11]
	cmp r0, #2
	bne _080858A0
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8086918
	adds r4, r0, #0
	cmp r4, #0
	bne _08085880
	adds r0, r5, #0
	movs r1, #0
	bl sub_8086918
	adds r4, r0, #0
	cmp r4, #0
	bne _08085880
	movs r0, #0
	adds r1, r6, #0
	bl sub_8086918
	adds r4, r0, #0
	cmp r4, #0
	beq _080858A0
_08085880:
	ldrh r0, [r4, #8]
	cmp r0, #0
	beq _08085890
	bl CallBattleQuoteEventInBattle
	b _0808589A
	.align 2, 0
_0808588C: .4byte 0x0203A954
_08085890:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _0808589A
	bl sub_800D404
_0808589A:
	ldrh r0, [r4, #6]
	bl SetFlag
_080858A0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0


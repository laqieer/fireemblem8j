	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.section .text.sub_8062694, "ax", %progbits
@ sub_8062694 @ JP 0x08062694 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8062694
	.thumb_func
sub_8062694:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, _080626DC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080626E0 @ =0x08600BB4
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	cmp r6, #0
	beq _080626F4
	cmp r6, #2
	bhi _08062746
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080626E4 @ =0x080E2946
	str r0, [r5, #0x48]
	ldr r0, _080626E8 @ =0x0869D918
	str r0, [r5, #0x4c]
	ldr r0, _080626EC @ =0x0869E278
	str r0, [r5, #0x50]
	ldr r0, _080626F0 @ =0x0869D120
	movs r1, #0xa8
	lsls r1, r1, #5
	bl sub_80567B8
	b _08062746
	.align 2, 0
_080626DC: .4byte 0x0201774C
_080626E0: .4byte 0x08600BB4
_080626E4: .4byte 0x080E2946
_080626E8: .4byte 0x0869D918
_080626EC: .4byte 0x0869E278
_080626F0: .4byte 0x0869D120
_080626F4:
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0806272C @ =0x080E293A
	str r0, [r5, #0x48]
	ldr r0, _08062730 @ =0x0869C34C
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08062734 @ =0x0869C1BC
	movs r1, #0x80
	lsls r1, r1, #3
	bl sub_80567B8
	ldr r0, _08062738 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08062746
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806273C
	movs r0, #1
	movs r1, #0x18
	b _08062740
	.align 2, 0
_0806272C: .4byte 0x080E293A
_08062730: .4byte 0x0869C34C
_08062734: .4byte 0x0869C1BC
_08062738: .4byte 0x0203E11C
_0806273C:
	movs r0, #1
	movs r1, #0xe8
_08062740:
	movs r2, #0
	bl BG_SetPosition
_08062746:
	bl sub_8056158
	pop {r4, r5, r6}
	pop {r0}
	bx r0


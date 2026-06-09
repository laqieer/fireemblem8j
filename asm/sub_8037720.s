	.syntax unified
	.set GetTrapAt, 0x0802E128 + 1
	.set GetTypedTrapAt, 0x0802E184 + 1
	.set MakeNewItem, 0x080162E8 + 1
	.set NewPopup2_PlanA, 0x0801F654 + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set RemoveTrap, 0x0802E234 + 1
	.set UnitAddItem, 0x080176F0 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_80376A8, 0x080376A8 + 1
	.section .text.sub_8037720, "ax", %progbits
@ sub_8037720 @ JP 0x08037720 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8037720
	.thumb_func
sub_8037720:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	adds r0, r5, #0
	bl sub_80376A8
	cmp r0, #0xb
	beq _08037750
	cmp r0, #0xb
	bgt _0803773C
	cmp r0, #8
	beq _08037746
	b _080377FC
_0803773C:
	cmp r0, #0xf
	beq _08037778
	cmp r0, #0x10
	beq _080377B8
	b _080377FC
_08037746:
	ldr r0, _0803774C @ =0x085C6AD4
	b _08037764
	.align 2, 0
_0803774C: .4byte 0x085C6AD4
_08037750:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	bl GetTypedTrapAt
	bl RemoveTrap
	ldr r0, _08037774 @ =0x085C6B24
_08037764:
	adds r1, r6, #0
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r0, #0x50
	strh r4, [r0]
	str r5, [r1, #0x54]
	b _080377FC
	.align 2, 0
_08037774: .4byte 0x085C6B24
_08037778:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl GetTrapAt
	bl RemoveTrap
	ldr r0, _080377B0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0803779A
	movs r0, #0xb1
	bl m4aSongNumStart
_0803779A:
	movs r4, #1
	rsbs r4, r4, #0
	ldr r0, _080377B4 @ =0x0000081B
	bl sub_8009FA8
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	bl NewPopup2_PlanA
	b _080377FC
	.align 2, 0
_080377B0: .4byte 0x0202BCEC
_080377B4: .4byte 0x0000081B
_080377B8:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl GetTrapAt
	bl RemoveTrap
	ldr r0, _08037804 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080377DA
	movs r0, #0xb1
	bl m4aSongNumStart
_080377DA:
	movs r4, #1
	rsbs r4, r4, #0
	ldr r0, _08037808 @ =0x0000081C
	bl sub_8009FA8
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	bl NewPopup2_PlanA
	movs r0, #0x7a
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r5, #0
	bl UnitAddItem
_080377FC:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08037804: .4byte 0x0202BCEC
_08037808: .4byte 0x0000081C


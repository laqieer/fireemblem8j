	.syntax unified
	.set GetUnitEquippedWeaponSlot, 0x08016900 + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.set IsItemDisplayUsable, 0x08016C8C + 1
	.set PutNumberOrBlank, 0x08004A9C + 1
	.set PutSpecialChar, 0x08004A14 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80167D4, 0x080167D4 + 1
	.set sub_8016A68, 0x08016A68 + 1
	.set sub_80890BC, 0x080890BC + 1
	.section .text.sub_80896EC, "ax", %progbits
@ sub_80896EC @ JP 0x080896EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80896EC
	.thumb_func
sub_80896EC:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0808974C @ =0x08A742BC
	ldr r4, _08089750 @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _08089754 @ =0x020049EE
	movs r2, #0xc1
	lsls r2, r2, #6
	adds r1, r4, #0
	bl j_TmApplyTsa
	ldr r0, _08089758 @ =0x081F53DC
	bl sub_80890BC
	ldr r2, _0808975C @ =0x02003BFC
	ldr r1, [r2, #0xc]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x62
	beq _0808979A
	cmp r0, #0x34
	beq _0808979A
	movs r4, #0
	ldrh r6, [r1, #0x1e]
	cmp r6, #0
	beq _0808979A
	adds r7, r2, #0
	mov r8, r4
	movs r5, #0x40
_0808972C:
	ldr r2, [r7, #0xc]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	ands r0, r1
	cmp r0, #0
	beq _08089760
	adds r0, r2, #0
	bl GetUnitItemCount
	subs r0, #1
	cmp r4, r0
	bne _08089760
	movs r2, #4
	b _08089772
	.align 2, 0
_0808974C: .4byte 0x08A742BC
_08089750: .4byte 0x02020188
_08089754: .4byte 0x020049EE
_08089758: .4byte 0x081F53DC
_0808975C: .4byte 0x02003BFC
_08089760:
	ldr r0, [r7, #0xc]
	adds r1, r6, #0
	bl IsItemDisplayUsable
	movs r2, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08089772
	movs r2, #1
_08089772:
	lsls r0, r4, #3
	ldr r1, _08089858 @ =0x02003C8C
	adds r0, r0, r1
	ldr r3, _0808985C @ =0x02003D2E
	adds r3, r5, r3
	adds r1, r6, #0
	bl sub_80167D4
	movs r0, #2
	add r8, r0
	adds r5, #0x80
	adds r4, #1
	cmp r4, #4
	bgt _0808979A
	ldr r0, [r7, #0xc]
	adds r0, #0x1e
	add r0, r8
	ldrh r6, [r0]
	cmp r6, #0
	bne _0808972C
_0808979A:
	ldr r5, _08089860 @ =0x02003BFC
	ldr r0, [r5, #0xc]
	bl GetUnitEquippedWeaponSlot
	adds r4, r0, #0
	movs r6, #0
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x62
	beq _08089878
	cmp r0, #0x34
	beq _080897E4
	cmp r4, #0
	blt _080897E4
	lsls r4, r4, #1
	adds r0, r4, #1
	lsls r0, r0, #6
	ldr r1, _08089864 @ =0x02003D4C
	adds r0, r0, r1
	movs r1, #0
	movs r2, #0x1f
	bl PutSpecialChar
	adds r0, r4, #2
	lsls r0, r0, #6
	ldr r1, _08089868 @ =0x0200472E
	adds r0, r0, r1
	ldr r1, _0808986C @ =0x08A74308
	movs r2, #0xc1
	lsls r2, r2, #6
	bl j_TmApplyTsa
	ldr r0, [r5, #0xc]
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r6, [r0]
_080897E4:
	ldr r7, _08089860 @ =0x02003BFC
	ldr r0, [r7, #0xc]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x62
	beq _08089878
	cmp r0, #0x34
	beq _08089878
	ldr r4, _08089870 @ =0x0200407C
	ldr r5, _08089874 @ =0x0203A4E8
	adds r0, r5, #0
	adds r0, #0x5a
	movs r1, #0
	ldrsh r2, [r0, r1]
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r4, #0
	adds r0, #0x80
	adds r1, r5, #0
	adds r1, #0x60
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r4, #0
	adds r0, #0xe
	adds r1, r5, #0
	adds r1, #0x66
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberOrBlank
	adds r4, #0x8e
	adds r0, r5, #0
	adds r0, #0x62
	movs r1, #0
	ldrsh r2, [r0, r1]
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
	adds r4, r7, #0
	adds r4, #0xb8
	adds r0, r6, #0
	bl sub_8016A68
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x18
	movs r2, #2
	bl sub_80043B8
	b _080898C2
	.align 2, 0
_08089858: .4byte 0x02003C8C
_0808985C: .4byte 0x02003D2E
_08089860: .4byte 0x02003BFC
_08089864: .4byte 0x02003D4C
_08089868: .4byte 0x0200472E
_0808986C: .4byte 0x08A74308
_08089870: .4byte 0x0200407C
_08089874: .4byte 0x0203A4E8
_08089878:
	ldr r4, _080898F4 @ =0x0200407C
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0xff
	bl PutNumberOrBlank
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #2
	movs r2, #0xff
	bl PutNumberOrBlank
	adds r0, r4, #0
	adds r0, #0xe
	movs r1, #2
	movs r2, #0xff
	bl PutNumberOrBlank
	adds r4, #0x8e
	ldr r0, _080898F8 @ =0x0203A4E8
	adds r0, #0x62
	movs r3, #0
	ldrsh r2, [r0, r3]
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
	ldr r4, _080898FC @ =0x02003CB4
	movs r0, #0
	bl sub_8016A68
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x18
	movs r2, #2
	bl sub_80043B8
_080898C2:
	movs r4, #0
	ldr r0, _08089900 @ =0x02003D2C
	ldr r6, _08089904 @ =0x00007060
	adds r5, r6, #0
	ldr r1, _08089908 @ =0x000002C2
	adds r2, r0, r1
	adds r6, #8
	adds r3, r6, #0
	ldr r6, _0808990C @ =0x00000302
	adds r1, r0, r6
_080898D6:
	adds r0, r4, r5
	strh r0, [r2]
	adds r0, r4, r3
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	adds r4, #1
	cmp r4, #7
	ble _080898D6
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080898F4: .4byte 0x0200407C
_080898F8: .4byte 0x0203A4E8
_080898FC: .4byte 0x02003CB4
_08089900: .4byte 0x02003D2C
_08089904: .4byte 0x00007060
_08089908: .4byte 0x000002C2
_0808990C: .4byte 0x00000302


	.syntax unified
	.set GetSpellAssocFlashColor, 0x0807A6BC + 1
	.set GetSpellAssocReturnBool, 0x0807A69C + 1
	.set MapAnim_BeginWallBreakAnim, 0x0807EF20 + 1
	.set NewBG0Shaker, 0x08081954 + 1
	.set RegisterMapHpChangeAnim, 0x08083C18 + 1
	.set sub_8014B50, 0x08014B50 + 1
	.set sub_807BD58, 0x0807BD58 + 1
	.set sub_807BD84, 0x0807BD84 + 1
	.set sub_807BE88, 0x0807BE88 + 1
	.set sub_807EE68, 0x0807EE68 + 1
	.set sub_807EEC4, 0x0807EEC4 + 1
	.section .text.sub_808395C, "ax", %progbits
@ sub_808395C @ JP 0x0808395C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808395C
	.thumb_func
sub_808395C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, _08083988 @ =0x0203E1EC
	adds r0, r1, #0
	adds r0, #0x58
	ldrb r0, [r0]
	mov sl, r0
	adds r0, r1, #0
	adds r0, #0x5a
	ldrh r2, [r0]
	movs r0, #0x80
	ands r0, r2
	adds r7, r1, #0
	cmp r0, #0
	beq _0808398C
	mov r5, sl
	b _08083992
	.align 2, 0
_08083988: .4byte 0x0203E1EC
_0808398C:
	adds r0, r7, #0
	adds r0, #0x59
	ldrb r5, [r0]
_08083992:
	adds r6, r7, #0
	mov r0, sl
	lsls r4, r0, #2
	adds r0, r4, r0
	lsls r0, r0, #2
	adds r1, r6, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetSpellAssocReturnBool
	lsls r0, r0, #0x18
	str r4, [sp]
	cmp r0, #0
	bne _080839D2
	adds r0, r6, #0
	adds r0, #0x5a
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080839C2
	b _08083C04
_080839C2:
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	bl sub_807EE68
	b _08083C04
_080839D2:
	adds r1, r6, #0
	adds r1, #0x5f
	movs r0, #1
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0xa
	bne _080839FA
	adds r0, r6, #0
	adds r0, #0x5d
	movs r1, #0
	ldrsb r1, [r0, r1]
	rsbs r1, r1, #0
	mov r0, sl
	bl RegisterMapHpChangeAnim
	b _08083A08
_080839FA:
	adds r0, r7, #0
	adds r0, #0x5d
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r5, #0
	bl RegisterMapHpChangeAnim
_08083A08:
	ldr r6, _08083A68 @ =0x0203E1EC
	adds r4, r6, #0
	adds r4, #0x5a
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08083A2A
	adds r0, r6, #0
	adds r0, #0x5d
	movs r1, #0
	ldrsb r1, [r0, r1]
	rsbs r1, r1, #0
	mov r0, sl
	bl RegisterMapHpChangeAnim
_08083A2A:
	adds r0, r6, #0
	adds r0, #0x5d
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r2, #0
	bge _08083A38
	b _08083C04
_08083A38:
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08083A70
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #2
	adds r4, r4, r6
	ldr r0, [r4]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	ldr r0, _08083A6C @ =0x0202BCAC
	movs r2, #0xc
	ldrsh r0, [r0, r2]
	subs r1, r1, r0
	movs r0, #0xc8
	bl sub_8014B50
	ldr r0, [r4]
	bl sub_807EE68
	b _08083C04
	.align 2, 0
_08083A68: .4byte 0x0203E1EC
_08083A6C: .4byte 0x0202BCAC
_08083A70:
	cmp r2, #0
	bne _08083AB0
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _08083A80
	b _08083C04
_08083A80:
	ldr r0, _08083AA8 @ =0x000002CE
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #2
	adds r4, r4, r6
	ldr r1, [r4]
	ldrb r1, [r1, #0x10]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #4
	ldr r2, _08083AAC @ =0x0202BCAC
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	bl sub_8014B50
	ldr r0, [r4]
	bl sub_807EEC4
	b _08083C04
	.align 2, 0
_08083AA8: .4byte 0x000002CE
_08083AAC: .4byte 0x0202BCAC
_08083AB0:
	movs r3, #0
	lsls r2, r5, #2
	adds r0, r2, r5
	lsls r0, r0, #2
	adds r1, r6, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x55
	ldrb r0, [r0]
	adds r4, r2, #0
	cmp r0, #0x1b
	beq _08083ACC
	cmp r0, #0x33
	bne _08083ACE
_08083ACC:
	movs r3, #1
_08083ACE:
	cmp r3, #0
	beq _08083B0A
	ldr r2, _08083AF4 @ =0x0203E1EC
	adds r0, r2, #0
	adds r0, #0x5c
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08083AF8
	movs r6, #0xaf
	adds r0, r4, r5
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #1
	bl MapAnim_BeginWallBreakAnim
	b _08083B3A
	.align 2, 0
_08083AF4: .4byte 0x0203E1EC
_08083AF8:
	movs r6, #0xb0
	adds r0, r4, r5
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #0
	bl MapAnim_BeginWallBreakAnim
	b _08083B3A
_08083B0A:
	ldr r2, _08083B20 @ =0x0203E1EC
	ldr r0, [r2]
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0xa
	bne _08083B28
	ldr r6, _08083B24 @ =0x000003C9
	b _08083B3A
	.align 2, 0
_08083B20: .4byte 0x0203E1EC
_08083B24: .4byte 0x000003C9
_08083B28:
	adds r0, r2, #0
	adds r0, #0x5c
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	movs r6, #0xd2
	cmp r0, #0
	beq _08083B3A
	movs r6, #0xd5
_08083B3A:
	ldr r7, _08083BB8 @ =0x0203E1EC
	adds r0, r7, #0
	adds r0, #0x5a
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08083BC0
	adds r4, r4, r5
	lsls r4, r4, #2
	adds r0, r4, r7
	mov sb, r0
	ldr r0, [r0]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	ldr r2, _08083BBC @ =0x0202BCAC
	mov r8, r2
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r1, r1, r0
	adds r0, r6, #0
	bl sub_8014B50
	adds r6, r7, #0
	adds r6, #8
	adds r4, r4, r6
	ldr r5, [r4]
	ldr r4, [sp]
	add r4, sl
	lsls r4, r4, #2
	adds r0, r7, #4
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetSpellAssocFlashColor
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl sub_807BD84
	bl NewBG0Shaker
	mov r1, sb
	ldr r0, [r1]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	mov r2, r8
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r1, r1, r0
	movs r0, #0xd8
	bl sub_8014B50
	adds r4, r4, r6
	ldr r0, [r4]
	bl sub_807BD58
	b _08083C04
	.align 2, 0
_08083BB8: .4byte 0x0203E1EC
_08083BBC: .4byte 0x0202BCAC
_08083BC0:
	adds r4, r4, r5
	lsls r4, r4, #2
	adds r0, r4, r7
	ldr r0, [r0]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	ldr r0, _08083C14 @ =0x0202BCAC
	movs r2, #0xc
	ldrsh r0, [r0, r2]
	subs r1, r1, r0
	adds r0, r6, #0
	bl sub_8014B50
	adds r0, r7, #0
	adds r0, #8
	adds r4, r4, r0
	ldr r4, [r4]
	ldr r0, [sp]
	add r0, sl
	lsls r0, r0, #2
	adds r1, r7, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetSpellAssocFlashColor
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_807BE88
_08083C04:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083C14: .4byte 0x0202BCAC


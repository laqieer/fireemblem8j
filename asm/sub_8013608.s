	.syntax unified
	.set SetPalFadeStClkEnd1, 0x08013528 + 1
	.set SetPalFadeStClkEnd2, 0x08013538 + 1
	.set SetPalFadeStClkEnd3, 0x0801354C + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8013504, 0x08013504 + 1
	.section .text.sub_8013608, "ax", %progbits
@ sub_8013608 @ JP 0x08013608 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8013608
	.thumb_func
sub_8013608:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	mov r8, r1
	str r2, [sp]
	mov sl, r3
	bl SetPalFadeStClkEnd1
	mov r0, r8
	bl SetPalFadeStClkEnd2
	ldr r0, [sp]
	bl SetPalFadeStClkEnd3
	bl sub_8013504
	mov sb, r0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r7, r0
	ble _0801368C
	ldr r0, _08013684 @ =0xFFFFFF00
	adds r7, r7, r0
	movs r5, #0
	mov ip, r5
_08013642:
	movs r0, #1
	lsls r0, r5
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08013678
	movs r4, #0
	movs r6, #0x1f
	mov r3, ip
	add r3, sb
	lsls r0, r5, #5
	ldr r1, _08013688 @ =0x020228A8
	adds r2, r0, r1
_0801365C:
	ldrh r0, [r3]
	adds r1, r6, #0
	ands r1, r0
	subs r0, r6, r1
	muls r0, r7, r0
	asrs r0, r0, #8
	adds r1, r1, r0
	ands r1, r6
	strh r1, [r2]
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #0xf
	ble _0801365C
_08013678:
	movs r0, #0x30
	add ip, r0
	adds r5, #1
	cmp r5, #0x1f
	ble _08013642
	b _080136CC
	.align 2, 0
_08013684: .4byte 0xFFFFFF00
_08013688: .4byte 0x020228A8
_0801368C:
	movs r5, #0
	mov ip, r5
_08013690:
	movs r0, #1
	lsls r0, r5
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _080136C2
	movs r4, #0
	movs r6, #0x1f
	mov r3, ip
	add r3, sb
	lsls r0, r5, #5
	ldr r1, _08013728 @ =0x020228A8
	adds r2, r0, r1
_080136AA:
	ldrh r1, [r3]
	adds r0, r6, #0
	ands r0, r1
	muls r0, r7, r0
	asrs r0, r0, #8
	ands r0, r6
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #0xf
	ble _080136AA
_080136C2:
	movs r0, #0x30
	add ip, r0
	adds r5, #1
	cmp r5, #0x1f
	ble _08013690
_080136CC:
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r8, r0
	ble _08013730
	ldr r1, _0801372C @ =0xFFFFFF00
	add r8, r1
	movs r5, #0
	mov ip, r5
_080136DC:
	movs r0, #1
	lsls r0, r5
	mov r7, sl
	ands r0, r7
	cmp r0, #0
	beq _0801371C
	movs r4, #0
	movs r6, #0xf8
	lsls r6, r6, #2
	mov r3, ip
	add r3, sb
	lsls r0, r5, #5
	ldr r1, _08013728 @ =0x020228A8
	adds r2, r0, r1
_080136F8:
	ldrh r1, [r3]
	adds r0, r6, #0
	ands r0, r1
	subs r1, r6, r0
	mov r7, r8
	muls r7, r1, r7
	adds r1, r7, #0
	asrs r1, r1, #8
	adds r0, r0, r1
	ands r0, r6
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #0xf
	ble _080136F8
_0801371C:
	movs r0, #0x30
	add ip, r0
	adds r5, #1
	cmp r5, #0x1f
	ble _080136DC
	b _08013778
	.align 2, 0
_08013728: .4byte 0x020228A8
_0801372C: .4byte 0xFFFFFF00
_08013730:
	movs r5, #0
	movs r7, #0
_08013734:
	movs r0, #1
	lsls r0, r5
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08013770
	movs r4, #0
	movs r6, #0xf8
	lsls r6, r6, #2
	mov r0, sb
	adds r3, r7, r0
	lsls r0, r5, #5
	ldr r1, _080137D8 @ =0x020228A8
	adds r2, r0, r1
_08013750:
	ldrh r1, [r3]
	adds r0, r6, #0
	ands r0, r1
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	asrs r0, r0, #8
	ands r0, r6
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #0xf
	ble _08013750
_08013770:
	adds r7, #0x30
	adds r5, #1
	cmp r5, #0x1f
	ble _08013734
_08013778:
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r5, [sp]
	cmp r5, r0
	ble _080137E0
	ldr r7, _080137DC @ =0xFFFFFF00
	adds r5, r5, r7
	str r5, [sp]
	movs r5, #0
_0801378A:
	movs r0, #1
	lsls r0, r5
	mov r1, sl
	ands r0, r1
	adds r7, r5, #1
	cmp r0, #0
	beq _080137D0
	movs r4, #0
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	movs r6, #0xf8
	lsls r6, r6, #7
	mov r1, sb
	adds r3, r0, r1
	lsls r0, r5, #5
	ldr r5, _080137D8 @ =0x020228A8
	adds r2, r0, r5
_080137AE:
	ldrh r1, [r3]
	adds r0, r6, #0
	ands r0, r1
	subs r1, r6, r0
	ldr r5, [sp]
	muls r1, r5, r1
	asrs r1, r1, #8
	adds r0, r0, r1
	ands r0, r6
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #0xf
	ble _080137AE
_080137D0:
	adds r5, r7, #0
	cmp r5, #0x1f
	ble _0801378A
	b _0801382A
	.align 2, 0
_080137D8: .4byte 0x020228A8
_080137DC: .4byte 0xFFFFFF00
_080137E0:
	movs r5, #0
_080137E2:
	movs r0, #1
	lsls r0, r5
	mov r7, sl
	ands r0, r7
	adds r7, r5, #1
	cmp r0, #0
	beq _08013824
	movs r4, #0
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	movs r6, #0xf8
	lsls r6, r6, #7
	mov r1, sb
	adds r3, r0, r1
	lsls r0, r5, #5
	ldr r5, _08013840 @ =0x020228A8
	adds r2, r0, r5
_08013806:
	ldrh r1, [r3]
	adds r0, r6, #0
	ands r0, r1
	ldr r1, [sp]
	muls r0, r1, r0
	asrs r0, r0, #8
	ands r0, r6
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #0xf
	ble _08013806
_08013824:
	adds r5, r7, #0
	cmp r5, #0x1f
	ble _080137E2
_0801382A:
	bl sub_8001EE4
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08013840: .4byte 0x020228A8


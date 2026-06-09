	.syntax unified
	.set CallARM_PushToSecondaryOAM, 0x08002B08 + 1
	.set CheckFlag, 0x080860D0 + 1
	.set GetROMChapterStruct, 0x08034520 + 1
	.set GetUnit, 0x08019108 + 1
	.set GetUnitSpriteHideFlag, 0x080280D8 + 1
	.set __umodsi3, 0x080D6848 + 1
	.set memcpy, 0x080D6908 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_80274D4, 0x080274D4 + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_802758C, "ax", %progbits
@ sub_802758C @ JP 0x0802758C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802758C
	.thumb_func
sub_802758C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r1, _080275BC @ =0x080DC940
	mov r0, sp
	movs r2, #6
	bl memcpy
	bl sub_80C1E74
	cmp r0, #2
	beq _080275C4
	ldr r0, _080275C0 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x8e
	ldrb r0, [r0]
	b _080275C6
	.align 2, 0
_080275BC: .4byte 0x080DC940
_080275C0: .4byte 0x0202BCEC
_080275C4:
	movs r0, #0
_080275C6:
	mov r8, r0
	bl sub_8000CD8
	movs r2, #0
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0x13
	bhi _080275D8
	movs r2, #1
_080275D8:
	adds r7, r2, #0
	bl sub_8000CD8
	lsrs r0, r0, #3
	movs r1, #0xc
	bl __umodsi3
	str r0, [sp, #8]
	bl sub_8000CD8
	lsrs r0, r0, #4
	movs r1, #7
	bl __umodsi3
	str r0, [sp, #0xc]
	bl sub_8000CD8
	lsrs r0, r0, #3
	movs r1, #9
	bl __umodsi3
	mov sl, r0
	bl sub_8000CD8
	lsrs r0, r0, #2
	movs r1, #0x12
	bl __umodsi3
	mov sb, r0
	movs r0, #0x84
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08027620
	b _0802799C
_08027620:
	bl sub_80274D4
	movs r6, #1
_08027626:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	bne _08027634
	b _08027994
_08027634:
	ldr r0, [r4]
	cmp r0, #0
	bne _0802763C
	b _08027994
_0802763C:
	ldr r0, [r4, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08027648
	b _08027994
_08027648:
	adds r0, r4, #0
	bl GetUnitSpriteHideFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08027656
	b _08027994
_08027656:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	subs r0, #1
	cmp r0, #9
	bls _08027668
	b _0802783E
_08027668:
	lsls r0, r0, #2
	ldr r1, _08027674 @ =_08027678
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08027674: .4byte _08027678
_08027678: @ jump table
	.4byte _080276A0 @ case 0
	.4byte _08027748 @ case 1
	.4byte _080276F4 @ case 2
	.4byte _08027798 @ case 3
	.4byte _080277F4 @ case 4
	.4byte _080277F4 @ case 5
	.4byte _080277F4 @ case 6
	.4byte _080277F4 @ case 7
	.4byte _0802783E @ case 8
	.4byte _0802783E @ case 9
_080276A0:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _080276EC @ =0x0202BCAC
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bls _080276C8
	b _0802783E
_080276C8:
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bls _080276D2
	b _0802783E
_080276D2:
	movs r1, #0xff
	lsls r1, r1, #1
	adds r0, r3, r1
	adds r1, #1
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0xfc
	movs r2, #0xff
	ands r1, r2
	ldr r3, _080276F0 @ =0x085C3E18
	ldr r5, [sp, #8]
	b _080277DA
	.align 2, 0
_080276EC: .4byte 0x0202BCAC
_080276F0: .4byte 0x085C3E18
_080276F4:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _08027740 @ =0x0202BCAC
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bls _0802771C
	b _0802783E
_0802771C:
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bls _08027726
	b _0802783E
_08027726:
	movs r1, #0xff
	lsls r1, r1, #1
	adds r0, r3, r1
	adds r1, #1
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0xfc
	movs r2, #0xff
	ands r1, r2
	ldr r3, _08027744 @ =0x085C3D78
	mov r5, sb
	b _080277DA
	.align 2, 0
_08027740: .4byte 0x0202BCAC
_08027744: .4byte 0x085C3D78
_08027748:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _0802778C @ =0x0202BCAC
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r0, r3, #0
	adds r0, #0x10
	movs r5, #0x80
	lsls r5, r5, #1
	cmp r0, r5
	bhi _0802783E
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _0802783E
	ldr r1, _08027790 @ =0x00000202
	adds r0, r3, r1
	subs r1, #3
	ands r0, r1
	adds r1, r2, r5
	movs r2, #0xff
	ands r1, r2
	ldr r3, _08027794 @ =0x085C3CD4
	ldr r5, [sp, #0xc]
	b _080277DA
	.align 2, 0
_0802778C: .4byte 0x0202BCAC
_08027790: .4byte 0x00000202
_08027794: .4byte 0x085C3CD4
_08027798:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _080277E8 @ =0x0202BCAC
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0802783E
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _0802783E
	ldr r1, _080277EC @ =0x00000201
	adds r0, r3, r1
	subs r1, #2
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0xfb
	movs r2, #0xff
	ands r1, r2
	ldr r3, _080277F0 @ =0x085C3D38
	mov r5, sl
_080277DA:
	lsls r2, r5, #2
	adds r2, r2, r3
	ldr r2, [r2]
	movs r3, #0
	bl CallARM_PushToSecondaryOAM
	b _0802783E
	.align 2, 0
_080277E8: .4byte 0x0202BCAC
_080277EC: .4byte 0x00000201
_080277F0: .4byte 0x085C3D38
_080277F4:
	cmp r7, #0
	bne _080277FA
	b _08027994
_080277FA:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _080278AC @ =0x0202BCAC
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0802783E
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _0802783E
	ldr r1, _080278B0 @ =0x000001FF
	adds r0, r3, r1
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0xfb
	movs r2, #0xff
	ands r1, r2
	ldr r2, _080278B4 @ =0x085C3E48
	movs r3, #0
	bl CallARM_PushToSecondaryOAM
_0802783E:
	cmp r7, #0
	bne _08027844
	b _08027994
_08027844:
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080278C8
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _080278AC @ =0x0202BCAC
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bls _08027876
	b _08027994
_08027876:
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bls _08027880
	b _08027994
_08027880:
	ldr r1, _080278B8 @ =0x00000209
	adds r0, r3, r1
	subs r1, #0xa
	ands r0, r1
	ldr r3, _080278BC @ =0x00000107
	adds r1, r2, r3
	movs r2, #0xff
	ands r1, r2
	ldr r2, _080278C0 @ =0x085B8CDC
	ldrb r3, [r4, #0x1b]
	lsrs r3, r3, #6
	lsls r3, r3, #1
	add r3, sp
	ldrh r4, [r3]
	movs r3, #0xf
	ands r3, r4
	lsls r3, r3, #0xc
	ldr r4, _080278C4 @ =0x00000803
	adds r3, r3, r4
	bl CallARM_PushToSecondaryOAM
	b _08027994
	.align 2, 0
_080278AC: .4byte 0x0202BCAC
_080278B0: .4byte 0x000001FF
_080278B4: .4byte 0x085C3E48
_080278B8: .4byte 0x00000209
_080278BC: .4byte 0x00000107
_080278C0: .4byte 0x085B8CDC
_080278C4: .4byte 0x00000803
_080278C8:
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	movs r0, #0xc0
	ands r1, r0
	ldr r2, [r4]
	cmp r1, #0
	beq _08027948
	ldr r0, [r4, #4]
	ldr r1, [r2, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	beq _08027948
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _08027934 @ =0x0202BCAC
	movs r5, #0xc
	ldrsh r0, [r2, r5]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r4, #0xe
	ldrsh r1, [r2, r4]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08027994
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _08027994
	ldr r5, _08027938 @ =0x00000209
	adds r0, r3, r5
	ldr r1, _0802793C @ =0x000001FF
	ands r0, r1
	ldr r3, _08027940 @ =0x00000107
	adds r1, r2, r3
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08027944 @ =0x085B8CDC
	movs r3, #0x81
	lsls r3, r3, #4
	bl CallARM_PushToSecondaryOAM
	b _08027994
	.align 2, 0
_08027934: .4byte 0x0202BCAC
_08027938: .4byte 0x00000209
_0802793C: .4byte 0x000001FF
_08027940: .4byte 0x00000107
_08027944: .4byte 0x085B8CDC
_08027948:
	ldrb r2, [r2, #4]
	cmp r8, r2
	bne _08027994
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _080279AC @ =0x0202BCAC
	movs r5, #0xc
	ldrsh r0, [r2, r5]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r4, #0xe
	ldrsh r1, [r2, r4]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08027994
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _08027994
	ldr r5, _080279B0 @ =0x00000209
	adds r0, r3, r5
	ldr r1, _080279B4 @ =0x000001FF
	ands r0, r1
	ldr r3, _080279B8 @ =0x00000107
	adds r1, r2, r3
	movs r2, #0xff
	ands r1, r2
	ldr r2, _080279BC @ =0x085B8CDC
	ldr r3, _080279C0 @ =0x00000811
	bl CallARM_PushToSecondaryOAM
_08027994:
	adds r6, #1
	cmp r6, #0xbf
	bgt _0802799C
	b _08027626
_0802799C:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080279AC: .4byte 0x0202BCAC
_080279B0: .4byte 0x00000209
_080279B4: .4byte 0x000001FF
_080279B8: .4byte 0x00000107
_080279BC: .4byte 0x085B8CDC
_080279C0: .4byte 0x00000811


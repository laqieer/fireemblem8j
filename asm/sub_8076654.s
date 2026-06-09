	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8073E74, 0x08073E74 + 1
	.set sub_8073F94, 0x08073F94 + 1
	.set sub_8075DA0, 0x08075DA0 + 1
	.set sub_8077190, 0x08077190 + 1
	.section .text.sub_8076654, "ax", %progbits
@ sub_8076654 @ JP 0x08076654 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8076654
	.thumb_func
sub_8076654:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne _08076726
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #8
	beq _0807672E
	ldr r7, _08076700 @ =0x02020114
_0807667A:
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	lsls r0, r0, #1
	adds r3, r0, r7
	ldrh r2, [r3]
	ldr r1, _08076704 @ =0x02020124
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r6, r0, r2
	cmp r6, #0
	beq _08076718
	movs r1, #0
	mov r8, r1
	strh r0, [r3]
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	adds r0, r5, #0
	bl sub_8075DA0
	movs r0, #0x76
	movs r1, #0x80
	lsls r1, r1, #1
	bl sub_8073E74
	movs r0, #0x76
	movs r1, #0x38
	movs r2, #0
	bl sub_8073F94
	ldr r1, _08076708 @ =0x080E69AC
	movs r0, #0x2e
	ldrsh r4, [r5, r0]
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r2, #0x1f
	ands r2, r3
	lsls r2, r2, #3
	adds r2, #0x35
	movs r1, #0xfc
	lsls r1, r1, #3
	adds r0, r1, #0
	ands r3, r0
	lsrs r3, r3, #2
	adds r3, #6
	adds r4, #1
	str r4, [sp]
	str r6, [sp, #4]
	movs r0, #0xa0
	movs r1, #1
	bl sub_8077190
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bne _080766FA
	ldr r1, _0807670C @ =0x0203E1AC
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	strh r0, [r1, #2]
	ldr r1, _08076710 @ =0x0203E1B0
	ldr r0, _08076714 @ =0x0000FFFF
	strh r0, [r1, #2]
_080766FA:
	mov r0, r8
	strh r0, [r5, #0x2c]
	b _08076726
	.align 2, 0
_08076700: .4byte 0x02020114
_08076704: .4byte 0x02020124
_08076708: .4byte 0x080E69AC
_0807670C: .4byte 0x0203E1AC
_08076710: .4byte 0x0203E1B0
_08076714: .4byte 0x0000FFFF
_08076718:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _0807667A
_08076726:
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #8
	bne _08076738
_0807672E:
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl sub_8002DE4
_08076738:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0


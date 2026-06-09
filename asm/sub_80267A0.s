	.syntax unified
	.set sub_8013008, 0x08013008 + 1
	.set sub_802686C, 0x0802686C + 1
	.set sub_80269DC, 0x080269DC + 1
	.set sub_8026ACC, 0x08026ACC + 1
	.section .text.sub_80267A0, "ax", %progbits
@ sub_80267A0 @ JP 0x080267A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80267A0
	.thumb_func
sub_80267A0:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _080267D8 @ =0x02033F3C
	adds r7, r6, r0
	ldrb r1, [r7]
	cmp r1, #0xff
	bne _08026854
	ldr r5, _080267DC @ =0x08903E0C
	movs r4, #0x7f
	ands r4, r6
	lsls r4, r4, #3
	adds r0, r5, #4
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _080267E0 @ =0x085C3B48
	ldr r1, [r1]
	bl sub_8013008
	adds r4, r4, r5
	ldrh r0, [r4, #2]
	cmp r0, #1
	beq _08026808
	cmp r0, #1
	bgt _080267E4
	cmp r0, #0
	beq _080267EA
	b _0802684A
	.align 2, 0
_080267D8: .4byte 0x02033F3C
_080267DC: .4byte 0x08903E0C
_080267E0: .4byte 0x085C3B48
_080267E4:
	cmp r0, #2
	beq _08026824
	b _0802684A
_080267EA:
	ldr r4, _08026804 @ =0x0203A00C
	ldr r0, [r4]
	adds r1, r6, #0
	bl sub_802686C
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r7]
	ldr r0, [r4]
	subs r0, #1
	b _08026848
	.align 2, 0
_08026804: .4byte 0x0203A00C
_08026808:
	ldr r4, _08026820 @ =0x0203A010
	ldr r0, [r4]
	adds r1, r6, #0
	bl sub_80269DC
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r7]
	ldr r0, [r4]
	adds r0, #2
	b _08026848
	.align 2, 0
_08026820: .4byte 0x0203A010
_08026824:
	ldr r4, _08026860 @ =0x0203A010
	ldr r1, [r4]
	movs r0, #0x1e
	ands r0, r1
	cmp r0, #0x1e
	bne _08026834
	adds r0, r1, #2
	str r0, [r4]
_08026834:
	ldr r0, [r4]
	adds r1, r6, #0
	bl sub_8026ACC
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r7]
	ldr r0, [r4]
	adds r0, #4
_08026848:
	str r0, [r4]
_0802684A:
	ldr r1, _08026864 @ =0x0203A4C8
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08026868 @ =0x02033F3C
_08026854:
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r0, r0, #1
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08026860: .4byte 0x0203A010
_08026864: .4byte 0x0203A4C8
_08026868: .4byte 0x02033F3C


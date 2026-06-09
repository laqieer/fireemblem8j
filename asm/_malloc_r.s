	.syntax unified
	.set malloc_extend_top, 0x080D9310 + 1
	.set nullsub_7, 0x080D9960 + 1
	.set nullsub_8, 0x080D9964 + 1
	.section .text._malloc_r, "ax", %progbits
@ _malloc_r @ JP 0x080D946C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _malloc_r
	.thumb_func
_malloc_r:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	adds r1, #0xb
	cmp r1, #0x16
	ble _080D948E
	movs r0, #8
	rsbs r0, r0, #0
	mov r8, r0
	mov r2, r8
	ands r2, r1
	mov r8, r2
	b _080D9492
_080D948E:
	movs r3, #0x10
	mov r8, r3
_080D9492:
	ldr r0, [sp]
	bl nullsub_7
	ldr r0, _080D94D8 @ =0x000001F7
	cmp r8, r0
	bhi _080D94E6
	mov r4, r8
	lsrs r4, r4, #3
	mov ip, r4
	ldr r0, _080D94DC @ =0x08BB8A8C
	mov r7, r8
	adds r2, r7, r0
	ldr r5, [r2, #0xc]
	cmp r5, r2
	bne _080D94BA
	adds r2, r5, #0
	adds r2, #8
	ldr r5, [r2, #0xc]
	cmp r5, r2
	beq _080D94E0
_080D94BA:
	ldr r2, [r5, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r2, r0
	ldr r6, [r5, #0xc]
	ldr r4, [r5, #8]
	str r6, [r4, #0xc]
	str r4, [r6, #8]
	adds r2, r5, r2
	ldr r0, [r2, #4]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	b _080D9812
	.align 2, 0
_080D94D8: .4byte 0x000001F7
_080D94DC: .4byte 0x08BB8A8C
_080D94E0:
	movs r0, #2
	add ip, r0
	b _080D9592
_080D94E6:
	mov r2, r8
	lsrs r1, r2, #9
	cmp r1, #0
	bne _080D94F2
	lsrs r2, r2, #3
	b _080D9542
_080D94F2:
	cmp r1, #4
	bhi _080D9500
	mov r3, r8
	lsrs r0, r3, #6
	adds r0, #0x38
	mov ip, r0
	b _080D9544
_080D9500:
	cmp r1, #0x14
	bhi _080D950A
	adds r1, #0x5b
	mov ip, r1
	b _080D9544
_080D950A:
	cmp r1, #0x54
	bhi _080D9518
	mov r4, r8
	lsrs r0, r4, #0xc
	adds r0, #0x6e
	mov ip, r0
	b _080D9544
_080D9518:
	movs r0, #0xaa
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080D952A
	mov r7, r8
	lsrs r0, r7, #0xf
	adds r0, #0x77
	mov ip, r0
	b _080D9544
_080D952A:
	ldr r0, _080D953C @ =0x00000554
	cmp r1, r0
	bhi _080D9540
	mov r1, r8
	lsrs r0, r1, #0x12
	adds r0, #0x7c
	mov ip, r0
	b _080D9544
	.align 2, 0
_080D953C: .4byte 0x00000554
_080D9540:
	movs r2, #0x7e
_080D9542:
	mov ip, r2
_080D9544:
	mov r3, ip
	lsls r0, r3, #3
	ldr r1, _080D9568 @ =0x08BB8A8C
	adds r4, r0, r1
	ldr r5, [r4, #0xc]
	cmp r5, r4
	beq _080D958E
	ldr r1, [r5, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r1, r0
	mov r7, r8
	subs r3, r1, r7
	cmp r3, #0xf
	ble _080D956C
	adds r0, #3
	add ip, r0
	b _080D958E
	.align 2, 0
_080D9568: .4byte 0x08BB8A8C
_080D956C:
	cmp r3, #0
	blt _080D9572
	b _080D97AC
_080D9572:
	ldr r5, [r5, #0xc]
	cmp r5, r4
	beq _080D958E
	ldr r1, [r5, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r1, r0
	mov r2, r8
	subs r3, r1, r2
	cmp r3, #0xf
	ble _080D956C
	movs r3, #1
	rsbs r3, r3, #0
	add ip, r3
_080D958E:
	movs r4, #1
	add ip, r4
_080D9592:
	ldr r0, _080D95D0 @ =0x08BB8A94
	ldr r5, [r0, #8]
	mov sl, r0
	cmp r5, sl
	bne _080D959E
	b _080D96A0
_080D959E:
	ldr r1, [r5, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r1, r0
	mov r7, r8
	subs r3, r1, r7
	cmp r3, #0xf
	ble _080D95D4
	adds r2, r5, r7
	movs r1, #1
	adds r0, r7, #0
	orrs r0, r1
	str r0, [r5, #4]
	mov r4, sl
	str r2, [r4, #0xc]
	str r2, [r4, #8]
	str r4, [r2, #0xc]
	str r4, [r2, #8]
	adds r0, r3, #0
	orrs r0, r1
	str r0, [r2, #4]
	adds r0, r2, r3
	str r3, [r0]
	b _080D9812
	.align 2, 0
_080D95D0: .4byte 0x08BB8A94
_080D95D4:
	mov r7, sl
	str r7, [r7, #0xc]
	str r7, [r7, #8]
	cmp r3, #0
	blt _080D95EA
	adds r2, r5, r1
	ldr r0, [r2, #4]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	b _080D9812
_080D95EA:
	ldr r0, _080D960C @ =0x000001FF
	cmp r1, r0
	bhi _080D9610
	lsrs r2, r1, #3
	mov r3, sl
	subs r3, #8
	adds r0, r2, #0
	asrs r0, r0, #2
	movs r1, #1
	lsls r1, r0
	ldr r0, [r3, #4]
	orrs r0, r1
	str r0, [r3, #4]
	lsls r0, r2, #3
	adds r6, r0, r3
	ldr r4, [r6, #8]
	b _080D9698
	.align 2, 0
_080D960C: .4byte 0x000001FF
_080D9610:
	lsrs r2, r1, #9
	cmp r2, #0
	bne _080D961A
	lsrs r2, r1, #3
	b _080D965E
_080D961A:
	cmp r2, #4
	bhi _080D9626
	lsrs r0, r1, #6
	adds r2, r0, #0
	adds r2, #0x38
	b _080D965E
_080D9626:
	cmp r2, #0x14
	bhi _080D962E
	adds r2, #0x5b
	b _080D965E
_080D962E:
	cmp r2, #0x54
	bhi _080D963A
	lsrs r0, r1, #0xc
	adds r2, r0, #0
	adds r2, #0x6e
	b _080D965E
_080D963A:
	movs r0, #0xaa
	lsls r0, r0, #1
	cmp r2, r0
	bhi _080D964A
	lsrs r0, r1, #0xf
	adds r2, r0, #0
	adds r2, #0x77
	b _080D965E
_080D964A:
	ldr r0, _080D9658 @ =0x00000554
	cmp r2, r0
	bhi _080D965C
	lsrs r0, r1, #0x12
	adds r2, r0, #0
	adds r2, #0x7c
	b _080D965E
	.align 2, 0
_080D9658: .4byte 0x00000554
_080D965C:
	movs r2, #0x7e
_080D965E:
	lsls r0, r2, #3
	ldr r3, _080D967C @ =0x08BB8A8C
	adds r6, r0, r3
	ldr r4, [r6, #8]
	cmp r4, r6
	bne _080D9680
	adds r0, r2, #0
	asrs r0, r0, #2
	movs r1, #1
	lsls r1, r0
	ldr r7, _080D967C @ =0x08BB8A8C
	ldr r0, [r7, #4]
	orrs r0, r1
	str r0, [r7, #4]
	b _080D9698
	.align 2, 0
_080D967C: .4byte 0x08BB8A8C
_080D9680:
	ldr r0, [r4, #4]
	movs r2, #4
	rsbs r2, r2, #0
	b _080D9690
_080D9688:
	ldr r4, [r4, #8]
	cmp r4, r6
	beq _080D9696
	ldr r0, [r4, #4]
_080D9690:
	ands r0, r2
	cmp r1, r0
	blo _080D9688
_080D9696:
	ldr r6, [r4, #0xc]
_080D9698:
	str r6, [r5, #0xc]
	str r4, [r5, #8]
	str r5, [r6, #8]
	str r5, [r4, #0xc]
_080D96A0:
	mov r0, ip
	cmp r0, #0
	bge _080D96A8
	adds r0, #3
_080D96A8:
	asrs r0, r0, #2
	movs r6, #1
	lsls r6, r0
	ldr r0, _080D96CC @ =0x08BB8A8C
	ldr r1, [r0, #4]
	cmp r6, r1
	bhi _080D976A
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _080D96DE
	movs r0, #4
	rsbs r0, r0, #0
	mov r2, ip
	ands r0, r2
	adds r0, #4
	mov ip, r0
	b _080D96D4
	.align 2, 0
_080D96CC: .4byte 0x08BB8A8C
_080D96D0:
	movs r3, #4
	add ip, r3
_080D96D4:
	lsls r6, r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080D96D0
_080D96DE:
	ldr r4, _080D975C @ =0x08BB8A8C
	mov sb, r4
_080D96E2:
	mov r7, ip
	str r7, [sp, #4]
	mov r1, ip
	lsls r0, r1, #3
	mov r3, sb
	adds r2, r0, r3
	adds r4, r2, #0
_080D96F0:
	ldr r5, [r4, #0xc]
	cmp r5, r4
	beq _080D9710
	movs r0, #4
	rsbs r0, r0, #0
_080D96FA:
	ldr r1, [r5, #4]
	ands r1, r0
	mov r7, r8
	subs r3, r1, r7
	cmp r3, #0xf
	bgt _080D97C0
	cmp r3, #0
	bge _080D97E8
	ldr r5, [r5, #0xc]
	cmp r5, r4
	bne _080D96FA
_080D9710:
	adds r4, #8
	movs r0, #1
	add ip, r0
	mov r0, ip
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _080D96F0
_080D9720:
	ldr r0, [sp, #4]
	ands r0, r1
	cmp r0, #0
	beq _080D9760
	ldr r3, [sp, #4]
	subs r3, #1
	str r3, [sp, #4]
	subs r2, #8
	ldr r0, [r2, #8]
	cmp r0, r2
	beq _080D9720
_080D9736:
	lsls r6, r6, #1
	mov r4, sb
	ldr r1, [r4, #4]
	cmp r6, r1
	bhi _080D976A
	cmp r6, #0
	beq _080D976A
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _080D96E2
_080D974C:
	movs r7, #4
	add ip, r7
	lsls r6, r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080D974C
	b _080D96E2
	.align 2, 0
_080D975C: .4byte 0x08BB8A8C
_080D9760:
	mov r1, sb
	ldr r0, [r1, #4]
	bics r0, r6
	str r0, [r1, #4]
	b _080D9736
_080D976A:
	ldr r2, _080D97A8 @ =0x08BB8A8C
	ldr r0, [r2, #8]
	ldr r0, [r0, #4]
	movs r4, #4
	rsbs r4, r4, #0
	ands r0, r4
	mov r7, r8
	subs r3, r0, r7
	cmp r0, r8
	blo _080D9782
	cmp r3, #0xf
	bgt _080D97FC
_080D9782:
	ldr r0, [sp]
	mov r1, r8
	bl malloc_extend_top
	ldr r1, _080D97A8 @ =0x08BB8A8C
	ldr r0, [r1, #8]
	ldr r0, [r0, #4]
	ands r0, r4
	mov r2, r8
	subs r3, r0, r2
	cmp r0, r8
	blo _080D979E
	cmp r3, #0xf
	bgt _080D97FC
_080D979E:
	ldr r0, [sp]
	bl nullsub_8
	movs r0, #0
	b _080D981C
	.align 2, 0
_080D97A8: .4byte 0x08BB8A8C
_080D97AC:
	ldr r6, [r5, #0xc]
	ldr r4, [r5, #8]
	str r6, [r4, #0xc]
	str r4, [r6, #8]
	adds r2, r5, r1
	ldr r0, [r2, #4]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	b _080D9812
_080D97C0:
	mov r4, r8
	adds r2, r5, r4
	movs r1, #1
	orrs r4, r1
	str r4, [r5, #4]
	ldr r6, [r5, #0xc]
	ldr r4, [r5, #8]
	str r6, [r4, #0xc]
	str r4, [r6, #8]
	mov r7, sl
	str r2, [r7, #0xc]
	str r2, [r7, #8]
	str r7, [r2, #0xc]
	str r7, [r2, #8]
	adds r0, r3, #0
	orrs r0, r1
	str r0, [r2, #4]
	adds r0, r2, r3
	str r3, [r0]
	b _080D9812
_080D97E8:
	adds r2, r5, r1
	ldr r0, [r2, #4]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	ldr r6, [r5, #0xc]
	ldr r4, [r5, #8]
	str r6, [r4, #0xc]
	str r4, [r6, #8]
	b _080D9812
_080D97FC:
	ldr r2, _080D9828 @ =0x08BB8A8C
	ldr r5, [r2, #8]
	movs r1, #1
	mov r0, r8
	orrs r0, r1
	str r0, [r5, #4]
	mov r4, r8
	adds r0, r5, r4
	str r0, [r2, #8]
	orrs r3, r1
	str r3, [r0, #4]
_080D9812:
	ldr r0, [sp]
	bl nullsub_8
	adds r0, r5, #0
	adds r0, #8
_080D981C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D9828: .4byte 0x08BB8A8C


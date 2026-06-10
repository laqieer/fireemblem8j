	.syntax unified
	.set DrawIcon, 0x08003608 + 1
	.set PutNumberOrBlank, 0x08004A9C + 1
	.set PutSpecialChar, 0x08004A14 + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8003D98, 0x08003D98 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_800A118, 0x0800A118 + 1
	.section .text.sub_8016688, "ax", %progbits
@ sub_8016688 @ JP 0x08016688 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8016688
	.thumb_func
sub_8016688:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	adds r7, r3, #0
	lsls r2, r2, #0x18
	asrs r6, r2, #0x18
	movs r2, #0
	cmp r6, #0
	bne _080166A0
	movs r2, #1
_080166A0:
	adds r0, r4, #0
	movs r1, #0
	bl sub_8003D98
	movs r0, #0xff
	mov r1, r8
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016734 @ =0x0885E068
	adds r5, r1, r0
	ldrh r0, [r5]
	bl sub_8009FA8
	bl sub_800A118
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8003F28
	adds r1, r7, #4
	adds r0, r4, #0
	bl PutText
	movs r3, #0x14
	adds r3, r3, r7
	mov ip, r3
	movs r1, #1
	cmp r6, #0
	beq _080166E0
	movs r1, #2
_080166E0:
	ldr r0, [r5, #8]
	movs r4, #8
	ands r0, r4
	mov r3, r8
	asrs r2, r3, #8
	cmp r0, #0
	beq _080166F0
	movs r2, #0xff
_080166F0:
	mov r0, ip
	bl PutNumberOrBlank
	adds r3, r7, #0
	adds r3, #0x1a
	movs r1, #1
	cmp r6, #0
	beq _08016702
	movs r1, #2
_08016702:
	ldr r0, [r5, #8]
	ands r0, r4
	movs r2, #0xff
	cmp r0, #0
	bne _0801670E
	ldrb r2, [r5, #0x14]
_0801670E:
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r0, r7, #0
	adds r0, #0x16
	movs r1, #0
	cmp r6, #0
	bne _08016720
	movs r1, #1
_08016720:
	movs r2, #0x16
	bl PutSpecialChar
	mov r0, r8
	cmp r0, #0
	bne _08016738
	movs r1, #1
	rsbs r1, r1, #0
	b _0801673A
	.align 2, 0
_08016734: .4byte 0x0885E068
_08016738:
	ldrb r1, [r5, #0x1d]
_0801673A:
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r7, #0
	bl DrawIcon
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0


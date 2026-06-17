	.syntax unified
	.set DrawIcon, 0x08003608 + 1
	.set PutNumberOrBlank, 0x08004A9C + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D94, 0x08003D94 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_800A118, 0x0800A118 + 1
	.section .text.sub_8016750, "ax", %progbits
@ DrawItemMenuLineNoColor @ JP 0x08016750 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global DrawItemMenuLineNoColor
	.thumb_func
DrawItemMenuLineNoColor:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	movs r1, #0
	bl sub_8003D84
	movs r0, #0xff
	ands r0, r6
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080167B8 @ =0x0885E068
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
	movs r0, #0x16
	adds r0, r0, r7
	mov r8, r0
	adds r0, r4, #0
	bl sub_8003D94
	adds r3, r0, #0
	ldr r0, [r5, #8]
	movs r1, #8
	ands r0, r1
	asrs r2, r6, #8
	cmp r0, #0
	beq _080167A6
	movs r2, #0xff
_080167A6:
	mov r0, r8
	adds r1, r3, #0
	bl PutNumberOrBlank
	cmp r6, #0
	bne _080167BC
	movs r1, #1
	rsbs r1, r1, #0
	b _080167BE
	.align 2, 0
_080167B8: .4byte 0x0885E068
_080167BC:
	ldrb r1, [r5, #0x1d]
_080167BE:
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


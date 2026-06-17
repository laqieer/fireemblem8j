	.syntax unified
	.set DrawIcon, 0x08003608 + 1
	.set PutNumberOrBlank, 0x08004A9C + 1
	.set PutSpecialChar, 0x08004A14 + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_800A118, 0x0800A118 + 1
	.section .text.sub_80167D4, "ax", %progbits
@ DrawItemStatScreenLine @ JP 0x080167D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global DrawItemStatScreenLine
	.thumb_func
DrawItemStatScreenLine:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov sb, r1
	adds r5, r2, #0
	adds r7, r3, #0
	bl sub_8003CF8
	adds r4, r5, #0
	mov r0, r8
	adds r1, r4, #0
	bl sub_8003D90
	movs r0, #0xff
	mov r1, sb
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016878 @ =0x0885E068
	adds r6, r1, r0
	ldrh r0, [r6]
	bl sub_8009FA8
	bl sub_800A118
	adds r1, r0, #0
	mov r0, r8
	bl sub_8003F28
	movs r4, #0
	cmp r5, #1
	bne _0801681C
	movs r4, #1
_0801681C:
	adds r0, r7, #0
	adds r0, #0x18
	adds r1, r4, #0
	movs r2, #0x16
	bl PutSpecialChar
	movs r4, #1
	cmp r5, #1
	beq _08016830
	movs r4, #2
_08016830:
	adds r1, r7, #0
	adds r1, #0x16
	ldr r0, [r6, #8]
	movs r5, #8
	ands r0, r5
	mov r3, sb
	asrs r2, r3, #8
	cmp r0, #0
	beq _08016844
	movs r2, #0xff
_08016844:
	adds r0, r1, #0
	adds r1, r4, #0
	bl PutNumberOrBlank
	adds r1, r7, #0
	adds r1, #0x1c
	ldr r0, [r6, #8]
	ands r0, r5
	movs r2, #0xff
	cmp r0, #0
	bne _0801685C
	ldrb r2, [r6, #0x14]
_0801685C:
	adds r0, r1, #0
	adds r1, r4, #0
	bl PutNumberOrBlank
	adds r1, r7, #4
	mov r0, r8
	bl PutText
	mov r0, sb
	cmp r0, #0
	bne _0801687C
	movs r1, #1
	rsbs r1, r1, #0
	b _0801687E
	.align 2, 0
_08016878: .4byte 0x0885E068
_0801687C:
	ldrb r1, [r6, #0x1d]
_0801687E:
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r7, #0
	bl DrawIcon
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0


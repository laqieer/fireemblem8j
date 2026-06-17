	.syntax unified
	.set DrawIcon, 0x08003608 + 1
	.set PutNumberOrBlank, 0x08004A9C + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8003D98, 0x08003D98 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_800A118, 0x0800A118 + 1
	.section .text.sub_80165F0, "ax", %progbits
@ DrawItemMenuLine @ JP 0x080165F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global DrawItemMenuLine
	.thumb_func
DrawItemMenuLine:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r3, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	mov r8, r2
	movs r2, #0
	mov r0, r8
	cmp r0, #0
	bne _0801660C
	movs r2, #1
_0801660C:
	adds r0, r4, #0
	movs r1, #0
	bl sub_8003D98
	movs r0, #0xff
	ands r0, r6
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0801666C @ =0x0885E068
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
	adds r3, r7, #0
	adds r3, #0x16
	movs r4, #1
	mov r0, r8
	cmp r0, #0
	beq _0801664A
	movs r4, #2
_0801664A:
	ldr r0, [r5, #8]
	movs r1, #8
	ands r0, r1
	asrs r2, r6, #8
	cmp r0, #0
	beq _08016658
	movs r2, #0xff
_08016658:
	adds r0, r3, #0
	adds r1, r4, #0
	bl PutNumberOrBlank
	cmp r6, #0
	bne _08016670
	movs r1, #1
	rsbs r1, r1, #0
	b _08016672
	.align 2, 0
_0801666C: .4byte 0x0885E068
_08016670:
	ldrb r1, [r5, #0x1d]
_08016672:
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


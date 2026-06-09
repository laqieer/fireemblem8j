	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetManimLevelUpStatGain, 0x08080F48 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8080EE4, 0x08080EE4 + 1
	.set sub_80811C4, 0x080811C4 + 1
	.section .text.sub_80816DC, "ax", %progbits
@ sub_80816DC @ JP 0x080816DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80816DC
	.thumb_func
sub_80816DC:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	adds r1, r7, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, #0
	beq _080816F4
	subs r0, #1
	b _080817A6
_080816F4:
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r6, [r0]
	mov r8, r0
	b _08081700
_080816FE:
	adds r6, #1
_08081700:
	cmp r6, #8
	ble _0808170C
	adds r0, r7, #0
	bl sub_8002DE4
	b _080817A8
_0808170C:
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	adds r1, r6, #0
	bl GetManimLevelUpStatGain
	cmp r0, #0
	beq _080816FE
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	movs r1, #1
	str r1, [sp]
	movs r2, #1
	adds r3, r6, #0
	bl sub_8080EE4
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r1, _0808177C @ =0x08A1455C
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r5, [r0]
	lsls r5, r5, #3
	adds r5, #0x3e
	ldrb r4, [r0, #1]
	lsls r4, r4, #3
	movs r1, #0x32
	ldrsh r0, [r7, r1]
	subs r0, #0x17
	subs r4, r4, r0
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	adds r1, r6, #0
	bl GetManimLevelUpStatGain
	adds r3, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_80811C4
	cmp r6, #0
	bne _08081788
	ldr r0, _08081780 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808179A
	ldr r0, _08081784 @ =0x000002CD
	bl m4aSongNumStart
	b _0808179A
	.align 2, 0
_0808177C: .4byte 0x08A1455C
_08081780: .4byte 0x0202BCEC
_08081784: .4byte 0x000002CD
_08081788:
	ldr r0, _080817B4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808179A
	movs r0, #0x76
	bl m4aSongNumStart
_0808179A:
	adds r0, r6, #1
	mov r1, r8
	strb r0, [r1]
	adds r1, r7, #0
	adds r1, #0x31
	movs r0, #0x14
_080817A6:
	strb r0, [r1]
_080817A8:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080817B4: .4byte 0x0202BCEC


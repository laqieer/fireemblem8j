	.syntax unified
	.set sub_8013008, 0x08013008 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_80CC0F0, "ax", %progbits
@ OpAnim1_UpdateScrollOneLine @ JP 0x080CC0F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global OpAnim1_UpdateScrollOneLine
	.thumb_func
OpAnim1_UpdateScrollOneLine:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x63
	bhi _080CC15E
	movs r0, #0x1f
	bics r0, r6
	lsls r0, r0, #6
	ldr r1, _080CC168 @ =0x0600E800
	adds r7, r0, r1
	movs r0, #0x63
	subs r0, r0, r6
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	ldr r0, _080CC16C @ =0x08B3F308
	lsls r4, r6, #2
	adds r0, r4, r0
	ldr r5, [r0]
	adds r0, r6, #0
	movs r1, #0x16
	bl sub_80D637C
	adds r1, r0, #0
	lsls r1, r1, #0xa
	ldr r2, _080CC170 @ =0x06008000
	adds r1, r1, r2
	adds r0, r5, #0
	bl sub_8013008
	ldr r0, _080CC174 @ =0x08B3F498
	adds r4, r4, r0
	ldr r4, [r4]
	movs r5, #0
	movs r0, #0xfc
	lsls r0, r0, #8
	mov r8, r0
_080CC13E:
	adds r0, r6, #0
	movs r1, #0x16
	bl sub_80D637C
	ldrh r1, [r4]
	mov r2, r8
	ands r1, r2
	lsls r0, r0, #5
	adds r0, r0, r5
	orrs r1, r0
	strh r1, [r7]
	adds r5, #1
	adds r7, #2
	adds r4, #2
	cmp r5, #0x1d
	ble _080CC13E
_080CC15E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CC168: .4byte 0x0600E800
_080CC16C: .4byte 0x08B3F308
_080CC170: .4byte 0x06008000
_080CC174: .4byte 0x08B3F498


	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_8011688, 0x08011688 + 1
	.set sub_8018A48, 0x08018A48 + 1
	.section .text.sub_803281C, "ax", %progbits
@ sub_803281C @ JP 0x0803281C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803281C
	.thumb_func
sub_803281C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r7, #0
	ldr r6, _080328AC @ =0x0203A4E8
	movs r1, #0xb
	ldrsb r1, [r6, r1]
	adds r0, #0x64
	strh r1, [r0]
	ldr r4, _080328B0 @ =0x0203A568
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	mov r1, r8
	adds r1, #0x66
	strh r0, [r1]
	movs r0, #0x13
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne _08032858
	movs r0, #0xb
	ldrsb r0, [r6, r0]
	bl GetUnit
	adds r7, r0, #0
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r5, r0, #0
_08032858:
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08032874
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r7, r0, #0
	movs r0, #0xb
	ldrsb r0, [r6, r0]
	bl GetUnit
	adds r5, r0, #0
_08032874:
	cmp r7, #0
	beq _080328B4
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	ands r0, r1
	cmp r0, #0
	beq _080328B4
	ldrh r0, [r7, #0x1e]
	cmp r0, #0
	beq _080328B4
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _080328B4
	adds r0, r7, #0
	bl sub_8018A48
	adds r1, r0, #0
	adds r0, r5, #0
	mov r2, r8
	bl sub_8011688
	movs r0, #0
	b _080328B6
	.align 2, 0
_080328AC: .4byte 0x0203A4E8
_080328B0: .4byte 0x0203A568
_080328B4:
	movs r0, #1
_080328B6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1


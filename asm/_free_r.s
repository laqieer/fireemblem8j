	.syntax unified
	.set nullsub_7, 0x080D9960 + 1
	.set nullsub_8, 0x080D9964 + 1
	.set sub_80D8E9C, 0x080D8E9C + 1
	.section .text._free_r, "ax", %progbits
@ _free_r @ JP 0x080D8CDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _free_r
	.thumb_func
_free_r:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r4, r1, #0
	cmp r4, #0
	bne _080D8CEE
	b _080D8E92
_080D8CEE:
	bl nullsub_7
	adds r5, r4, #0
	subs r5, #8
	ldr r1, [r5, #4]
	movs r6, #2
	rsbs r6, r6, #0
	ands r6, r1
	adds r7, r5, r6
	ldr r4, [r7, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r4, r0
	ldr r0, _080D8D50 @ =0x08BB8A8C
	mov ip, r0
	ldr r0, [r0, #8]
	cmp r7, r0
	bne _080D8D5C
	adds r6, r6, r4
	movs r4, #1
	ands r1, r4
	cmp r1, #0
	bne _080D8D2A
	ldr r0, [r5]
	subs r5, r5, r0
	adds r6, r6, r0
	ldr r3, [r5, #0xc]
	ldr r2, [r5, #8]
	str r3, [r2, #0xc]
	str r2, [r3, #8]
_080D8D2A:
	adds r0, r6, #0
	orrs r0, r4
	str r0, [r5, #4]
	mov r2, ip
	str r5, [r2, #8]
	ldr r0, _080D8D54 @ =0x08BB8E94
	ldr r0, [r0]
	cmp r6, r0
	blo _080D8D46
	ldr r0, _080D8D58 @ =0x08BB8E98
	ldr r1, [r0]
	mov r0, sb
	bl sub_80D8E9C
_080D8D46:
	mov r0, sb
	bl nullsub_8
	b _080D8E92
	.align 2, 0
_080D8D50: .4byte 0x08BB8A8C
_080D8D54: .4byte 0x08BB8E94
_080D8D58: .4byte 0x08BB8E98
_080D8D5C:
	str r4, [r7, #4]
	movs r0, #0
	mov r8, r0
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne _080D8D88
	ldr r0, [r5]
	subs r5, r5, r0
	adds r6, r6, r0
	ldr r1, [r5, #8]
	mov r0, ip
	adds r0, #8
	cmp r1, r0
	bne _080D8D80
	movs r2, #1
	mov r8, r2
	b _080D8D88
_080D8D80:
	ldr r3, [r5, #0xc]
	adds r2, r1, #0
	str r3, [r2, #0xc]
	str r2, [r3, #8]
_080D8D88:
	adds r0, r7, r4
	ldr r0, [r0, #4]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080D8DC0
	adds r6, r6, r4
	ldr r1, [r7, #8]
	mov r0, r8
	cmp r0, #0
	bne _080D8DB8
	ldr r0, _080D8DB4 @ =0x08BB8A94
	cmp r1, r0
	bne _080D8DB8
	movs r2, #1
	mov r8, r2
	str r5, [r1, #0xc]
	str r5, [r1, #8]
	str r1, [r5, #0xc]
	str r1, [r5, #8]
	b _080D8DC0
	.align 2, 0
_080D8DB4: .4byte 0x08BB8A94
_080D8DB8:
	ldr r3, [r7, #0xc]
	adds r2, r1, #0
	str r3, [r2, #0xc]
	str r2, [r3, #8]
_080D8DC0:
	movs r1, #1
	adds r0, r6, #0
	orrs r0, r1
	str r0, [r5, #4]
	adds r0, r5, r6
	str r6, [r0]
	mov r0, r8
	cmp r0, #0
	bne _080D8E8C
	ldr r0, _080D8DF0 @ =0x000001FF
	cmp r6, r0
	bhi _080D8DF8
	lsrs r4, r6, #3
	ldr r2, _080D8DF4 @ =0x08BB8A8C
	adds r0, r4, #0
	asrs r0, r0, #2
	lsls r1, r0
	ldr r0, [r2, #4]
	orrs r0, r1
	str r0, [r2, #4]
	lsls r0, r4, #3
	adds r3, r0, r2
	ldr r2, [r3, #8]
	b _080D8E84
	.align 2, 0
_080D8DF0: .4byte 0x000001FF
_080D8DF4: .4byte 0x08BB8A8C
_080D8DF8:
	lsrs r1, r6, #9
	cmp r1, #0
	bne _080D8E02
	lsrs r4, r6, #3
	b _080D8E4A
_080D8E02:
	cmp r1, #4
	bhi _080D8E0E
	lsrs r0, r6, #6
	adds r4, r0, #0
	adds r4, #0x38
	b _080D8E4A
_080D8E0E:
	cmp r1, #0x14
	bhi _080D8E18
	adds r4, r1, #0
	adds r4, #0x5b
	b _080D8E4A
_080D8E18:
	cmp r1, #0x54
	bhi _080D8E24
	lsrs r0, r6, #0xc
	adds r4, r0, #0
	adds r4, #0x6e
	b _080D8E4A
_080D8E24:
	movs r0, #0xaa
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080D8E34
	lsrs r0, r6, #0xf
	adds r4, r0, #0
	adds r4, #0x77
	b _080D8E4A
_080D8E34:
	ldr r0, _080D8E44 @ =0x00000554
	cmp r1, r0
	bhi _080D8E48
	lsrs r0, r6, #0x12
	adds r4, r0, #0
	adds r4, #0x7c
	b _080D8E4A
	.align 2, 0
_080D8E44: .4byte 0x00000554
_080D8E48:
	movs r4, #0x7e
_080D8E4A:
	lsls r0, r4, #3
	ldr r7, _080D8E68 @ =0x08BB8A8C
	adds r3, r0, r7
	ldr r2, [r3, #8]
	cmp r2, r3
	bne _080D8E6C
	adds r0, r4, #0
	asrs r0, r0, #2
	movs r1, #1
	lsls r1, r0
	ldr r0, [r7, #4]
	orrs r0, r1
	str r0, [r7, #4]
	b _080D8E84
	.align 2, 0
_080D8E68: .4byte 0x08BB8A8C
_080D8E6C:
	ldr r0, [r2, #4]
	movs r1, #4
	rsbs r1, r1, #0
	b _080D8E7C
_080D8E74:
	ldr r2, [r2, #8]
	cmp r2, r3
	beq _080D8E82
	ldr r0, [r2, #4]
_080D8E7C:
	ands r0, r1
	cmp r6, r0
	blo _080D8E74
_080D8E82:
	ldr r3, [r2, #0xc]
_080D8E84:
	str r3, [r5, #0xc]
	str r2, [r5, #8]
	str r5, [r3, #8]
	str r5, [r2, #0xc]
_080D8E8C:
	mov r0, sb
	bl nullsub_8
_080D8E92:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7, pc}
	.align 2, 0


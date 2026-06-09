	.syntax unified
	.section .text._fpadd_parts, "ax", %progbits
@ _fpadd_parts @ JP 0x080DB870 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _fpadd_parts
	.thumb_func
_fpadd_parts:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	movs r0, #0
	ldr r2, [r6]
	cmp r2, #1
	bhi _080DB886
	movs r0, #1
_080DB886:
	cmp r0, #0
	beq _080DB88E
_080DB88A:
	adds r0, r6, #0
	b _080DB9E4
_080DB88E:
	movs r1, #0
	ldr r0, [r7]
	cmp r0, #1
	bhi _080DB898
	movs r1, #1
_080DB898:
	cmp r1, #0
	bne _080DB90C
	movs r1, #0
	cmp r2, #4
	bne _080DB8A4
	movs r1, #1
_080DB8A4:
	cmp r1, #0
	beq _080DB8C4
	movs r1, #0
	cmp r0, #4
	bne _080DB8B0
	movs r1, #1
_080DB8B0:
	cmp r1, #0
	beq _080DB88A
	ldr r1, [r6, #4]
	ldr r0, [r7, #4]
	cmp r1, r0
	beq _080DB88A
	ldr r0, _080DB8C0 @ =0x03002BF8
	b _080DB9E4
	.align 2, 0
_080DB8C0: .4byte 0x03002BF8
_080DB8C4:
	movs r1, #0
	cmp r0, #4
	bne _080DB8CC
	movs r1, #1
_080DB8CC:
	cmp r1, #0
	bne _080DB90C
	movs r1, #0
	cmp r0, #2
	bne _080DB8D8
	movs r1, #1
_080DB8D8:
	cmp r1, #0
	beq _080DB8FE
	movs r0, #0
	cmp r2, #2
	bne _080DB8E4
	movs r0, #1
_080DB8E4:
	cmp r0, #0
	beq _080DB88A
	adds r1, r5, #0
	adds r0, r6, #0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r6, #4]
	ldr r1, [r7, #4]
	ands r0, r1
	str r0, [r5, #4]
	b _080DB9E2
_080DB8FE:
	movs r1, #0
	ldr r0, [r6]
	cmp r0, #2
	bne _080DB908
	movs r1, #1
_080DB908:
	cmp r1, #0
	beq _080DB910
_080DB90C:
	adds r0, r7, #0
	b _080DB9E4
_080DB910:
	ldr r1, [r6, #8]
	ldr r3, [r7, #8]
	ldr r2, [r6, #0xc]
	ldr r4, [r7, #0xc]
	subs r0, r1, r3
	cmp r0, #0
	bge _080DB920
	rsbs r0, r0, #0
_080DB920:
	cmp r0, #0x1f
	bgt _080DB964
	ldr r6, [r6, #4]
	ldr r7, [r7, #4]
	mov r8, r7
	cmp r1, r3
	ble _080DB946
	movs r7, #1
	mov ip, r7
	subs r3, r1, r3
_080DB934:
	subs r3, #1
	adds r0, r4, #0
	mov r7, ip
	ands r0, r7
	lsrs r4, r4, #1
	orrs r4, r0
	cmp r3, #0
	bne _080DB934
	adds r3, r1, #0
_080DB946:
	cmp r3, r1
	ble _080DB976
	movs r0, #1
	mov ip, r0
	subs r1, r3, r1
_080DB950:
	subs r1, #1
	adds r0, r2, #0
	mov r7, ip
	ands r0, r7
	lsrs r2, r2, #1
	orrs r2, r0
	cmp r1, #0
	bne _080DB950
	adds r1, r3, #0
	b _080DB976
_080DB964:
	cmp r1, r3
	ble _080DB96C
	movs r4, #0
	b _080DB970
_080DB96C:
	adds r1, r3, #0
	movs r2, #0
_080DB970:
	ldr r6, [r6, #4]
	ldr r7, [r7, #4]
	mov r8, r7
_080DB976:
	cmp r6, r8
	beq _080DB9C0
	cmp r6, #0
	beq _080DB982
	subs r3, r4, r2
	b _080DB984
_080DB982:
	subs r3, r2, r4
_080DB984:
	cmp r3, #0
	blt _080DB992
	movs r0, #0
	str r0, [r5, #4]
	str r1, [r5, #8]
	str r3, [r5, #0xc]
	b _080DB99C
_080DB992:
	movs r0, #1
	str r0, [r5, #4]
	str r1, [r5, #8]
	rsbs r0, r3, #0
	str r0, [r5, #0xc]
_080DB99C:
	ldr r1, [r5, #0xc]
	subs r0, r1, #1
	ldr r2, _080DB9BC @ =0x3FFFFFFE
	cmp r0, r2
	bhi _080DB9C8
_080DB9A6:
	lsls r0, r1, #1
	str r0, [r5, #0xc]
	ldr r1, [r5, #8]
	subs r1, #1
	str r1, [r5, #8]
	adds r1, r0, #0
	subs r0, r1, #1
	cmp r0, r2
	bls _080DB9A6
	b _080DB9C8
	.align 2, 0
_080DB9BC: .4byte 0x3FFFFFFE
_080DB9C0:
	str r6, [r5, #4]
	str r1, [r5, #8]
	adds r0, r2, r4
	str r0, [r5, #0xc]
_080DB9C8:
	movs r0, #3
	str r0, [r5]
	ldr r1, [r5, #0xc]
	cmp r1, #0
	bge _080DB9E2
	movs r0, #1
	ands r0, r1
	lsrs r1, r1, #1
	orrs r0, r1
	str r0, [r5, #0xc]
	ldr r0, [r5, #8]
	adds r0, #1
	str r0, [r5, #8]
_080DB9E2:
	adds r0, r5, #0
_080DB9E4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}
	.align 2, 0


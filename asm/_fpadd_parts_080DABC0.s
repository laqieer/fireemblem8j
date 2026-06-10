	.syntax unified
	.set __negdi2, 0x080DC0BC + 1
	.section .text._fpadd_parts_080DABC0, "ax", %progbits
@ _fpadd_parts_080DABC0 @ JP 0x080DABC0-0x080DAE2C - region-different, gbadisasm descriptive asm (merged run, D24)
	.thumb
	.global _fpadd_parts_080DABC0
	.thumb_func
_fpadd_parts_080DABC0:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r3, r0, #0
	adds r4, r1, #0
	mov sl, r2
	movs r0, #0
	ldr r2, [r3]
	cmp r2, #1
	bhi _080DABDC
	movs r0, #1
_080DABDC:
	cmp r0, #0
	beq _080DABE4
_080DABE0:
	adds r0, r3, #0
	b _080DAE1C
_080DABE4:
	movs r1, #0
	ldr r0, [r4]
	cmp r0, #1
	bhi _080DABEE
	movs r1, #1
_080DABEE:
	cmp r1, #0
	bne _080DAC66
	movs r1, #0
	cmp r2, #4
	bne _080DABFA
	movs r1, #1
_080DABFA:
	cmp r1, #0
	beq _080DAC1C
	movs r1, #0
	cmp r0, #4
	bne _080DAC06
	movs r1, #1
_080DAC06:
	cmp r1, #0
	beq _080DABE0
	ldr r1, [r3, #4]
	ldr r0, [r4, #4]
	cmp r1, r0
	beq _080DABE0
	ldr r0, _080DAC18 @ =0x03002BE0
	b _080DAE1C
	.align 2, 0
_080DAC18: .4byte 0x03002BE0
_080DAC1C:
	movs r1, #0
	cmp r0, #4
	bne _080DAC24
	movs r1, #1
_080DAC24:
	cmp r1, #0
	bne _080DAC66
	movs r1, #0
	cmp r0, #2
	bne _080DAC30
	movs r1, #1
_080DAC30:
	cmp r1, #0
	beq _080DAC58
	movs r0, #0
	cmp r2, #2
	bne _080DAC3C
	movs r0, #1
_080DAC3C:
	cmp r0, #0
	beq _080DABE0
	mov r1, sl
	adds r0, r3, #0
	ldm r0!, {r2, r5, r6}
	stm r1!, {r2, r5, r6}
	ldm r0!, {r2, r5}
	stm r1!, {r2, r5}
	ldr r0, [r3, #4]
	ldr r1, [r4, #4]
	ands r0, r1
	mov r6, sl
	str r0, [r6, #4]
	b _080DAE1A
_080DAC58:
	movs r1, #0
	ldr r0, [r3]
	cmp r0, #2
	bne _080DAC62
	movs r1, #1
_080DAC62:
	cmp r1, #0
	beq _080DAC6A
_080DAC66:
	adds r0, r4, #0
	b _080DAE1C
_080DAC6A:
	ldr r0, [r3, #8]
	mov sb, r0
	ldr r1, [r4, #8]
	mov r8, r1
	ldr r6, [r3, #0xc]
	ldr r7, [r3, #0x10]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	str r0, [sp]
	str r1, [sp, #4]
	mov r1, sb
	mov r2, r8
	subs r0, r1, r2
	cmp r0, #0
	bge _080DAC8A
	rsbs r0, r0, #0
_080DAC8A:
	cmp r0, #0x3f
	bgt _080DAD08
	ldr r3, [r3, #4]
	mov ip, r3
	ldr r4, [r4, #4]
	str r4, [sp, #8]
	cmp sb, r8
	ble _080DACD4
	mov r3, sb
	mov r4, r8
	subs r3, r3, r4
	mov r8, r3
_080DACA2:
	movs r5, #1
	rsbs r5, r5, #0
	add r8, r5
	ldr r2, [sp]
	movs r0, #1
	ands r2, r0
	movs r3, #0
	ldr r1, [sp, #4]
	lsls r5, r1, #0x1f
	ldr r0, [sp]
	lsrs r4, r0, #1
	adds r0, r5, #0
	orrs r0, r4
	adds r4, r1, #0
	lsrs r1, r4, #1
	adds r5, r2, #0
	orrs r5, r0
	str r5, [sp]
	adds r4, r3, #0
	orrs r4, r1
	str r4, [sp, #4]
	mov r5, r8
	cmp r5, #0
	bne _080DACA2
	mov r8, sb
_080DACD4:
	cmp r8, sb
	ble _080DAD24
	mov r0, r8
	mov r1, sb
	subs r0, r0, r1
	mov sb, r0
_080DACE0:
	movs r2, #1
	rsbs r2, r2, #0
	add sb, r2
	movs r2, #1
	ands r2, r6
	movs r3, #0
	lsls r5, r7, #0x1f
	lsrs r4, r6, #1
	adds r0, r5, #0
	orrs r0, r4
	lsrs r1, r7, #1
	adds r6, r2, #0
	orrs r6, r0
	adds r7, r3, #0
	orrs r7, r1
	mov r3, sb
	cmp r3, #0
	bne _080DACE0
	mov sb, r8
	b _080DAD24
_080DAD08:
	cmp sb, r8
	ble _080DAD16
	movs r0, #0
	movs r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	b _080DAD1C
_080DAD16:
	mov sb, r8
	movs r6, #0
	movs r7, #0
_080DAD1C:
	ldr r3, [r3, #4]
	mov ip, r3
	ldr r4, [r4, #4]
	str r4, [sp, #8]
_080DAD24:
	ldr r1, [sp, #8]
	cmp ip, r1
	beq _080DADCC
	mov r2, ip
	cmp r2, #0
	beq _080DAD46
	adds r1, r7, #0
	adds r0, r6, #0
	bl __negdi2
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r4, [sp]
	ldr r5, [sp, #4]
	adds r2, r2, r4
	adcs r3, r5
	b _080DAD52
_080DAD46:
	adds r3, r7, #0
	adds r2, r6, #0
	ldr r0, [sp]
	ldr r1, [sp, #4]
	subs r2, r2, r0
	sbcs r3, r1
_080DAD52:
	cmp r3, #0
	blt _080DAD68
	movs r0, #0
	mov r1, sl
	str r0, [r1, #4]
	mov r4, sb
	str r4, [r1, #8]
	mov r5, sl
	str r2, [r5, #0xc]
	str r3, [r5, #0x10]
	b _080DAD80
_080DAD68:
	movs r0, #1
	mov r6, sl
	str r0, [r6, #4]
	mov r0, sb
	str r0, [r6, #8]
	adds r1, r3, #0
	adds r0, r2, #0
	bl __negdi2
	mov r2, sl
	str r0, [r2, #0xc]
	str r1, [r2, #0x10]
_080DAD80:
	mov r4, sl
	ldr r2, [r4, #0xc]
	ldr r3, [r4, #0x10]
	movs r0, #1
	rsbs r0, r0, #0
	asrs r1, r0, #0x1f
_080DAD8C:
	adds r2, r2, r0
	adcs r3, r1
	ldr r0, _080DADC8 @ =0x0FFFFFFF
	cmp r3, r0
	bhi _080DADE4
	cmp r3, r0
	bne _080DADA2
	movs r0, #2
	rsbs r0, r0, #0
	cmp r2, r0
	bhi _080DADE4
_080DADA2:
	mov r5, sl
	ldr r0, [r5, #0xc]
	ldr r1, [r5, #0x10]
	lsrs r3, r0, #0x1f
	lsls r2, r1, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r0, #1
	mov r6, sl
	str r0, [r6, #0xc]
	str r1, [r6, #0x10]
	ldr r2, [r6, #8]
	subs r2, #1
	str r2, [r6, #8]
	movs r2, #1
	rsbs r2, r2, #0
	asrs r3, r2, #0x1f
	b _080DAD8C
	.align 2, 0
_080DADC8: .4byte 0x0FFFFFFF
_080DADCC:
	mov r0, ip
	mov r1, sl
	str r0, [r1, #4]
	mov r2, sb
	str r2, [r1, #8]
	ldr r3, [sp]
	ldr r4, [sp, #4]
	adds r6, r6, r3
	adcs r7, r4
	mov r4, sl
	str r6, [r4, #0xc]
	str r7, [r4, #0x10]
_080DADE4:
	movs r0, #3
	mov r5, sl
	str r0, [r5]
	ldr r1, [r5, #0x10]
	ldr r0, _080DAE28 @ =0x1FFFFFFF
	cmp r1, r0
	bls _080DAE1A
	ldr r4, [r5, #0xc]
	ldr r5, [r5, #0x10]
	movs r2, #1
	adds r0, r4, #0
	ands r0, r2
	movs r1, #0
	lsls r6, r5, #0x1f
	mov r8, r6
	lsrs r6, r4, #1
	mov r2, r8
	orrs r2, r6
	lsrs r3, r5, #1
	orrs r0, r2
	orrs r1, r3
	mov r2, sl
	str r0, [r2, #0xc]
	str r1, [r2, #0x10]
	ldr r0, [r2, #8]
	adds r0, #1
	str r0, [r2, #8]
_080DAE1A:
	mov r0, sl
_080DAE1C:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080DAE28: .4byte 0x1FFFFFFF


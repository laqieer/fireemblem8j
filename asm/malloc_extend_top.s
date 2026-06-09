	.syntax unified
	.set _free_r, 0x080D8CDC + 1
	.set _sbrk_r, 0x080DA27C + 1
	.section .text.malloc_extend_top, "ax", %progbits
@ malloc_extend_top @ JP 0x080D9310 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global malloc_extend_top
	.thumb_func
malloc_extend_top:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	ldr r0, _080D9384 @ =0x08BB8A8C
	ldr r0, [r0, #8]
	mov r8, r0
	ldr r7, [r0, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r7, r0
	mov r2, r8
	adds r4, r2, r7
	ldr r0, _080D9388 @ =0x08BB8E98
	ldr r0, [r0]
	adds r1, r1, r0
	adds r6, r1, #0
	adds r6, #0x10
	ldr r3, _080D938C @ =0x08BB8E9C
	mov sl, r3
	ldr r0, [r3]
	movs r2, #1
	rsbs r2, r2, #0
	mov sb, r2
	cmp r0, sb
	beq _080D9352
	ldr r3, _080D9390 @ =0x0000100F
	adds r6, r1, r3
	ldr r0, _080D9394 @ =0xFFFFF000
	ands r6, r0
_080D9352:
	ldr r0, [sp]
	adds r1, r6, #0
	bl _sbrk_r
	adds r5, r0, #0
	cmp r5, sb
	beq _080D9454
	cmp r5, r4
	bhs _080D936A
	ldr r0, _080D9384 @ =0x08BB8A8C
	cmp r8, r0
	bne _080D9454
_080D936A:
	ldr r1, _080D9398 @ =0x08BB8EA8
	ldr r0, [r1]
	adds r2, r0, r6
	str r2, [r1]
	cmp r5, r4
	bne _080D939C
	adds r2, r6, r7
	ldr r3, _080D9384 @ =0x08BB8A8C
	ldr r1, [r3, #8]
	movs r0, #1
	orrs r2, r0
	str r2, [r1, #4]
	b _080D943C
	.align 2, 0
_080D9384: .4byte 0x08BB8A8C
_080D9388: .4byte 0x08BB8E98
_080D938C: .4byte 0x08BB8E9C
_080D9390: .4byte 0x0000100F
_080D9394: .4byte 0xFFFFF000
_080D9398: .4byte 0x08BB8EA8
_080D939C:
	mov r3, sl
	ldr r0, [r3]
	cmp r0, sb
	bne _080D93A8
	str r5, [r3]
	b _080D93AE
_080D93A8:
	subs r0, r5, r4
	adds r0, r2, r0
	str r0, [r1]
_080D93AE:
	adds r1, r5, #0
	adds r1, #8
	movs r0, #7
	ands r1, r0
	cmp r1, #0
	beq _080D93C2
	movs r0, #8
	subs r4, r0, r1
	adds r5, r5, r4
	b _080D93C4
_080D93C2:
	movs r4, #0
_080D93C4:
	adds r0, r5, r6
	movs r1, #0x80
	lsls r1, r1, #5
	subs r1, #1
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #5
	subs r0, r1, r0
	adds r4, r4, r0
	ldr r0, [sp]
	adds r1, r4, #0
	bl _sbrk_r
	adds r2, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _080D9454
	ldr r1, _080D940C @ =0x08BB8EA8
	ldr r0, [r1]
	adds r0, r0, r4
	str r0, [r1]
	ldr r1, _080D9410 @ =0x08BB8A8C
	str r5, [r1, #8]
	subs r0, r2, r5
	adds r2, r0, r4
	movs r3, #1
	orrs r2, r3
	str r2, [r5, #4]
	cmp r8, r1
	beq _080D943C
	cmp r7, #0xf
	bhi _080D9414
	str r3, [r5, #4]
	b _080D9454
	.align 2, 0
_080D940C: .4byte 0x08BB8EA8
_080D9410: .4byte 0x08BB8A8C
_080D9414:
	subs r7, #0xc
	movs r0, #8
	rsbs r0, r0, #0
	ands r7, r0
	mov r2, r8
	ldr r0, [r2, #4]
	ands r0, r3
	orrs r0, r7
	str r0, [r2, #4]
	adds r1, r2, r7
	movs r0, #5
	str r0, [r1, #4]
	str r0, [r1, #8]
	cmp r7, #0xf
	bls _080D943C
	mov r1, r8
	adds r1, #8
	ldr r0, [sp]
	bl _free_r
_080D943C:
	ldr r0, _080D9460 @ =0x08BB8EA8
	ldr r2, _080D9464 @ =0x08BB8EA0
	ldr r1, [r0]
	ldr r0, [r2]
	cmp r1, r0
	bls _080D944A
	str r1, [r2]
_080D944A:
	ldr r2, _080D9468 @ =0x08BB8EA4
	ldr r0, [r2]
	cmp r1, r0
	bls _080D9454
	str r1, [r2]
_080D9454:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D9460: .4byte 0x08BB8EA8
_080D9464: .4byte 0x08BB8EA0
_080D9468: .4byte 0x08BB8EA4


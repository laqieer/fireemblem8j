	.syntax unified
	.set _Balloc, 0x080D9968 + 1
	.set _Bfree, 0x080D99C0 + 1
	.section .text._lshift, "ax", %progbits
@ _lshift @ JP 0x080D9DE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _lshift
	.thumb_func
_lshift:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	mov r8, r1
	adds r5, r2, #0
	asrs r6, r5, #5
	ldr r1, [r1, #4]
	mov r2, r8
	ldr r0, [r2, #0x10]
	adds r0, r6, r0
	adds r7, r0, #1
	ldr r2, [r2, #8]
	cmp r7, r2
	ble _080D9E12
_080D9E0A:
	adds r1, #1
	lsls r2, r2, #1
	cmp r7, r2
	bgt _080D9E0A
_080D9E12:
	mov r0, sl
	bl _Balloc
	mov sb, r0
	mov r4, sb
	adds r4, #0x14
	mov r0, r8
	adds r0, #0x14
	cmp r6, #0
	ble _080D9E32
	movs r1, #0
	adds r2, r6, #0
_080D9E2A:
	stm r4!, {r1}
	subs r2, #1
	cmp r2, #0
	bne _080D9E2A
_080D9E32:
	adds r3, r0, #0
	mov r1, r8
	ldr r0, [r1, #0x10]
	lsls r0, r0, #2
	adds r6, r3, r0
	movs r0, #0x1f
	ands r5, r0
	cmp r5, #0
	beq _080D9E64
	movs r0, #0x20
	subs r1, r0, r5
	movs r2, #0
_080D9E4A:
	ldr r0, [r3]
	lsls r0, r5
	orrs r0, r2
	stm r4!, {r0}
	ldm r3!, {r2}
	lsrs r2, r1
	cmp r3, r6
	blo _080D9E4A
	str r2, [r4]
	cmp r2, #0
	beq _080D9E6C
	adds r7, #1
	b _080D9E6C
_080D9E64:
	ldm r3!, {r0}
	stm r4!, {r0}
	cmp r3, r6
	blo _080D9E64
_080D9E6C:
	subs r0, r7, #1
	mov r2, sb
	str r0, [r2, #0x10]
	mov r0, sl
	mov r1, r8
	bl _Bfree
	mov r0, sb
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0


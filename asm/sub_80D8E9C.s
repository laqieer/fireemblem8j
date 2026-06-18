	.syntax unified
	.set __udivsi3, 0x080D67D0 + 1
	.set _sbrk_r, 0x080DA27C + 1
	.set nullsub_7, 0x080D9960 + 1
	.set nullsub_8, 0x080D9964 + 1
	.section .text.sub_80D8E9C, "ax", %progbits
@ _malloc_trim_r @ JP 0x080D8E9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _malloc_trim_r
	.thumb_func
_malloc_trim_r:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r4, r1, #0
	bl nullsub_7
	ldr r0, _080D8F24 @ =0x08BB8A8C
	mov r8, r0
	ldr r0, [r0, #8]
	ldr r6, [r0, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r6, r0
	subs r4, r6, r4
	movs r5, #0x80
	lsls r5, r5, #5
	ldr r1, _080D8F28 @ =0x00000FEF
	adds r4, r4, r1
	adds r0, r4, #0
	adds r1, r5, #0
	bl __udivsi3
	subs r0, #1
	lsls r4, r0, #0xc
	cmp r4, r5
	blt _080D8F1A
	adds r0, r7, #0
	movs r1, #0
	bl _sbrk_r
	adds r2, r0, #0
	mov r1, r8
	ldr r0, [r1, #8]
	adds r0, r0, r6
	cmp r2, r0
	bne _080D8F1A
	rsbs r1, r4, #0
	adds r0, r7, #0
	bl _sbrk_r
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _080D8F34
	adds r0, r7, #0
	movs r1, #0
	bl _sbrk_r
	adds r2, r0, #0
	mov r0, r8
	ldr r3, [r0, #8]
	subs r6, r2, r3
	cmp r6, #0xf
	ble _080D8F1A
	ldr r1, _080D8F2C @ =0x08BB8EA8
	ldr r0, _080D8F30 @ =0x08BB8E9C
	ldr r0, [r0]
	subs r0, r2, r0
	str r0, [r1]
	movs r0, #1
	orrs r6, r0
	str r6, [r3, #4]
_080D8F1A:
	adds r0, r7, #0
	bl nullsub_8
	movs r0, #0
	b _080D8F50
	.align 2, 0
_080D8F24: .4byte 0x08BB8A8C
_080D8F28: .4byte 0x00000FEF
_080D8F2C: .4byte 0x08BB8EA8
_080D8F30: .4byte 0x08BB8E9C
_080D8F34:
	mov r1, r8
	ldr r2, [r1, #8]
	subs r0, r6, r4
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	ldr r1, _080D8F58 @ =0x08BB8EA8
	ldr r0, [r1]
	subs r0, r0, r4
	str r0, [r1]
	adds r0, r7, #0
	bl nullsub_8
	movs r0, #1
_080D8F50:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D8F58: .4byte 0x08BB8EA8


	.syntax unified
	.set _Bfree, 0x080D99C0 + 1
	.set _i2b, 0x080D9BD0 + 1
	.set _multiply, 0x080D9BE4 + 1
	.set sub_80D99D8, 0x080D99D8 + 1
	.section .text._pow5mult, "ax", %progbits
@ _pow5mult @ JP 0x080D9D50 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _pow5mult
	.thumb_func
_pow5mult:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r7, r1, #0
	adds r6, r2, #0
	movs r1, #3
	ands r1, r6
	cmp r1, #0
	beq _080D9D7A
	ldr r0, _080D9D9C @ =0x08577480
	subs r1, #1
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r2, [r1]
	mov r0, r8
	adds r1, r7, #0
	movs r3, #0
	bl sub_80D99D8
	adds r7, r0, #0
_080D9D7A:
	asrs r6, r6, #2
	cmp r6, #0
	beq _080D9DE0
	mov r0, r8
	ldr r5, [r0, #0x48]
	adds r4, r5, #0
	cmp r5, #0
	bne _080D9DBC
	ldr r1, _080D9DA0 @ =0x00000271
	bl _i2b
	mov r1, r8
	str r0, [r1, #0x48]
	adds r5, r0, #0
	str r4, [r5]
	b _080D9DBC
	.align 2, 0
_080D9D9C: .4byte 0x08577480
_080D9DA0: .4byte 0x00000271
_080D9DA4:
	ldr r0, [r5]
	adds r4, r0, #0
	cmp r0, #0
	bne _080D9DBA
	mov r0, r8
	adds r1, r5, #0
	adds r2, r5, #0
	bl _multiply
	str r0, [r5]
	str r4, [r0]
_080D9DBA:
	adds r5, r0, #0
_080D9DBC:
	movs r0, #1
	ands r0, r6
	cmp r0, #0
	beq _080D9DDA
	mov r0, r8
	adds r1, r7, #0
	adds r2, r5, #0
	bl _multiply
	adds r4, r0, #0
	mov r0, r8
	adds r1, r7, #0
	bl _Bfree
	adds r7, r4, #0
_080D9DDA:
	asrs r6, r6, #1
	cmp r6, #0
	bne _080D9DA4
_080D9DE0:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}


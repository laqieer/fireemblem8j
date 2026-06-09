	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_8027DE0, 0x08027DE0 + 1
	.section .text.sub_804D934, "ax", %progbits
@ sub_804D934 @ JP 0x0804D934 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804D934
	.thumb_func
sub_804D934:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	mov r8, r0
	b _0804D99C
_0804D948:
	mov r1, r8
	lsls r0, r1, #4
	ldr r1, [r4, #0x30]
	adds r5, r1, r0
	ldr r0, [r4, #0x38]
	movs r1, #1
	add r1, r8
	mov sl, r1
	cmp r5, r0
	bge _0804D99A
	ldr r0, [r4, #0x34]
	cmp r5, r0
	ble _0804D99A
	movs r6, #0
	mov r0, r8
	lsls r0, r0, #2
	mov sb, r0
	movs r7, #0
_0804D96C:
	mov r0, sb
	add r0, r8
	adds r0, r0, r6
	adds r0, #1
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2]
	cmp r0, #0
	beq _0804D992
	ldr r1, [r4, #0x2c]
	adds r1, r1, r7
	str r2, [sp]
	movs r0, #4
	adds r2, r5, #0
	movs r3, #0x80
	lsls r3, r3, #3
	bl sub_8027DE0
_0804D992:
	adds r7, #0xe
	adds r6, #1
	cmp r6, #4
	ble _0804D96C
_0804D99A:
	mov r8, sl
_0804D99C:
	ldr r0, [r4, #0x3c]
	cmp r8, r0
	blt _0804D948
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0


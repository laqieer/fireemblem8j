	.syntax unified
	.set memcpy, 0x080D6908 + 1
	.set sub_80D65E0, 0x080D65E0 + 1
	.section .text.sub_803B720, "ax", %progbits
@ sub_803B720 @ JP 0x0803B720 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803B720
	.thumb_func
sub_803B720:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r6, r1, #0
	adds r5, r3, #0
	mov sb, r2
	movs r0, #0xff
	mov r8, r0
	ldr r1, _0803B788 @ =0x080DCDD0
	mov r0, sp
	movs r2, #8
	bl memcpy
	mov r4, sp
	movs r2, #3
_0803B744:
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, r7, r0
	movs r1, #1
	ldrsb r1, [r4, r1]
	adds r1, r6, r1
	str r2, [sp, #8]
	bl sub_80D65E0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp, #8]
	cmp r0, #0xff
	beq _0803B776
	cmp r8, r0
	bls _0803B776
	mov r8, r0
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, r0, r7
	strh r0, [r5]
	movs r0, #1
	ldrsb r0, [r4, r0]
	adds r0, r0, r6
	strh r0, [r5, #2]
_0803B776:
	adds r4, #2
	subs r2, #1
	cmp r2, #0
	bge _0803B744
	mov r0, r8
	cmp r0, #0xff
	bne _0803B78C
	movs r0, #0
	b _0803B78E
	.align 2, 0
_0803B788: .4byte 0x080DCDD0
_0803B78C:
	movs r0, #1
_0803B78E:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1


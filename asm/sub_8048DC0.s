	.syntax unified
	.set __divsi3, 0x080D65F8 + 1
	.set __modsi3, 0x080D6690 + 1
	.set sub_8003E0C, 0x08003E0C + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_8048DC0, "ax", %progbits
@ sub_8048DC0 @ JP 0x08048DC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8048DC0
	.thumb_func
sub_8048DC0:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov sb, r0
	adds r7, r1, #0
	mov sl, r3
	lsls r2, r2, #0x18
	asrs r4, r2, #0x18
	str r4, [sp, #0x10]
	movs r6, #0
	cmp r7, #0
	bne _08048DE0
	b _08048F10
_08048DE0:
	cmp r7, #0x32
	bne _08048E0E
	movs r0, #0xe2
	bl sub_8009FA8
	bl sub_8003E0C
	adds r5, r0, #0
	cmp r4, #0
	beq _08048DFA
	movs r0, #0x30
	subs r0, r0, r5
	asrs r6, r0, #1
_08048DFA:
	movs r0, #0xe2
	bl sub_8009FA8
	adds r3, r0, #0
	mov r0, sb
	adds r1, r6, #0
	mov r2, sl
	bl sub_80043B8
	b _08048F10
_08048E0E:
	movs r0, #0xdf
	bl sub_8009FA8
	bl sub_8003E0C
	str r0, [sp]
	adds r5, r0, #0
	asrs r4, r7, #1
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	mov r8, r0
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	adds r4, r0, #0
	mov r0, r8
	cmp r0, #0
	beq _08048E4E
	ldr r1, _08048F20 @ =0x085D3EB8
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl sub_8009FA8
	bl sub_8003E0C
	subs r0, #1
	str r0, [sp, #4]
	adds r5, r5, r0
_08048E4E:
	lsls r0, r4, #1
	ldr r1, _08048F20 @ =0x085D3EB8
	adds r0, r0, r1
	str r0, [sp, #0x14]
	ldrh r0, [r0]
	bl sub_8009FA8
	bl sub_8003E0C
	subs r0, #1
	str r0, [sp, #8]
	adds r5, r5, r0
	movs r0, #0xe0
	bl sub_8009FA8
	bl sub_8003E0C
	str r0, [sp, #0xc]
	adds r5, r5, r0
	movs r4, #1
	ands r4, r7
	cmp r4, #0
	beq _08048E88
	movs r0, #0xe1
	bl sub_8009FA8
	bl sub_8003E0C
	adds r5, r5, r0
_08048E88:
	ldr r2, [sp, #0x10]
	cmp r2, #0
	beq _08048E94
	movs r0, #0x30
	subs r0, r0, r5
	asrs r6, r0, #1
_08048E94:
	movs r0, #0xdf
	bl sub_8009FA8
	adds r3, r0, #0
	mov r0, sb
	adds r1, r6, #0
	mov r2, sl
	bl sub_80043B8
	ldr r0, [sp]
	adds r6, r6, r0
	mov r0, r8
	cmp r0, #0
	beq _08048ECC
	lsls r0, r0, #1
	ldr r1, _08048F20 @ =0x085D3EB8
	adds r0, r0, r1
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r3, r0, #0
	mov r0, sb
	adds r1, r6, #0
	mov r2, sl
	bl sub_80043B8
	ldr r0, [sp, #4]
	adds r6, r6, r0
_08048ECC:
	ldr r2, [sp, #0x14]
	ldrh r0, [r2]
	bl sub_8009FA8
	adds r3, r0, #0
	mov r0, sb
	adds r1, r6, #0
	mov r2, sl
	bl sub_80043B8
	ldr r0, [sp, #8]
	adds r6, r6, r0
	movs r0, #0xe0
	bl sub_8009FA8
	adds r3, r0, #0
	mov r0, sb
	adds r1, r6, #0
	mov r2, sl
	bl sub_80043B8
	ldr r0, [sp, #0xc]
	adds r6, r6, r0
	cmp r4, #0
	beq _08048F10
	movs r0, #0xe1
	bl sub_8009FA8
	adds r3, r0, #0
	mov r0, sb
	adds r1, r6, #0
	mov r2, sl
	bl sub_80043B8
_08048F10:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048F20: .4byte 0x085D3EB8


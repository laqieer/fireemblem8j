	.syntax unified
	.set GetUnitSpritePalette, 0x0802710C + 1
	.set PutSprite, 0x080052F0 + 1
	.set sub_80176AC, 0x080176AC + 1
	.set sub_80267A0, 0x080267A0 + 1
	.section .text.sub_8027DE0, "ax", %progbits
@ sub_8027DE0 @ JP 0x08027DE0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8027DE0
	.thumb_func
sub_8027DE0:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	mov r8, r1
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, [sp, #0x20]
	bl sub_80176AC
	adds r4, r0, #0
	bl sub_80267A0
	adds r5, r0, #0
	adds r5, #0x80
	mov r1, r8
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08027EAA
	adds r0, r6, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _08027EAA
	ldr r1, _08027E30 @ =0x08903E0C
	movs r0, #0x7f
	ands r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _08027E60
	cmp r0, #1
	bgt _08027E34
	cmp r0, #0
	beq _08027E3A
	b _08027EAA
	.align 2, 0
_08027E30: .4byte 0x08903E0C
_08027E34:
	cmp r0, #2
	beq _08027E88
	b _08027EAA
_08027E3A:
	ldr r0, [sp, #0x20]
	bl GetUnitSpritePalette
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	adds r1, r7, r1
	adds r1, r1, r5
	ldr r3, _08027E5C @ =0x085B8CE4
	str r1, [sp]
	mov r0, sb
	mov r1, r8
	adds r2, r6, #0
	bl PutSprite
	b _08027EAA
	.align 2, 0
_08027E5C: .4byte 0x085B8CE4
_08027E60:
	ldr r0, [sp, #0x20]
	bl GetUnitSpritePalette
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	adds r1, r7, r1
	adds r1, r1, r5
	adds r2, r6, #0
	subs r2, #0x10
	ldr r3, _08027E84 @ =0x085B8D04
	str r1, [sp]
	mov r0, sb
	mov r1, r8
	bl PutSprite
	b _08027EAA
	.align 2, 0
_08027E84: .4byte 0x085B8D04
_08027E88:
	ldr r0, [sp, #0x20]
	bl GetUnitSpritePalette
	movs r4, #0xf
	ands r4, r0
	lsls r4, r4, #0xc
	adds r4, r7, r4
	adds r4, r4, r5
	mov r1, r8
	subs r1, #8
	adds r2, r6, #0
	subs r2, #0x10
	ldr r3, _08027EB8 @ =0x085B8CEC
	str r4, [sp]
	mov r0, sb
	bl PutSprite
_08027EAA:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027EB8: .4byte 0x085B8CEC


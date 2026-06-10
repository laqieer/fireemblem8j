	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.set sub_80176AC, 0x080176AC + 1
	.set sub_80267A0, 0x080267A0 + 1
	.section .text.sub_8027FA8, "ax", %progbits
@ sub_8027FA8 @ JP 0x08027FA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8027FA8
	.thumb_func
sub_8027FA8:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	adds r7, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x20]
	bl sub_80176AC
	adds r5, r0, #0
	bl sub_80267A0
	adds r4, r0, #0
	adds r4, #0x80
	adds r1, r7, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0802807C
	adds r0, r6, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _0802807C
	ldr r1, _08027FF8 @ =0x08903E0C
	movs r0, #0x7f
	ands r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _0802802C
	cmp r0, #1
	bgt _08027FFC
	cmp r0, #0
	beq _08028002
	b _0802807C
	.align 2, 0
_08027FF8: .4byte 0x08903E0C
_08027FFC:
	cmp r0, #2
	beq _08028058
	b _0802807C
_08028002:
	ldr r3, _08028024 @ =0x085C3E56
	add r4, r8
	str r4, [sp]
	mov r0, sb
	adds r1, r7, #0
	adds r2, r6, #0
	bl PutSprite
	ldr r3, _08028028 @ =0x085C3E6E
	str r4, [sp]
	mov r0, sb
	adds r1, r7, #0
	adds r2, r6, #0
	bl PutSprite
	b _0802807C
	.align 2, 0
_08028024: .4byte 0x085C3E56
_08028028: .4byte 0x085C3E6E
_0802802C:
	adds r5, r6, #0
	subs r5, #0x10
	ldr r3, _08028050 @ =0x085C3E5E
	add r4, r8
	str r4, [sp]
	mov r0, sb
	adds r1, r7, #0
	adds r2, r5, #0
	bl PutSprite
	ldr r3, _08028054 @ =0x085C3E76
	str r4, [sp]
	mov r0, sb
	adds r1, r7, #0
	adds r2, r5, #0
	bl PutSprite
	b _0802807C
	.align 2, 0
_08028050: .4byte 0x085C3E5E
_08028054: .4byte 0x085C3E76
_08028058:
	adds r5, r7, #0
	subs r5, #8
	subs r6, #0x10
	ldr r3, _0802808C @ =0x085C3E66
	add r4, r8
	str r4, [sp]
	mov r0, sb
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSprite
	ldr r3, _08028090 @ =0x085C3E7E
	str r4, [sp]
	mov r0, sb
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSprite
_0802807C:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802808C: .4byte 0x085C3E66
_08028090: .4byte 0x085C3E7E


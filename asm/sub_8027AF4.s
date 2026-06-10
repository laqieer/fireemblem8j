	.syntax unified
	.set GetUnitDisplayedSpritePalette, 0x080270E0 + 1
	.set PutSprite, 0x080052F0 + 1
	.set sub_80176AC, 0x080176AC + 1
	.set sub_80267A0, 0x080267A0 + 1
	.section .text.sub_8027AF4, "ax", %progbits
@ sub_8027AF4 @ JP 0x08027AF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8027AF4
	.thumb_func
sub_8027AF4:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	mov r8, r1
	adds r7, r2, #0
	adds r4, r3, #0
	adds r0, r4, #0
	bl sub_80176AC
	adds r5, r0, #0
	bl sub_80267A0
	adds r6, r0, #0
	mov r1, r8
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08027BCA
	adds r0, r7, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _08027BCA
	ldr r1, _08027B44 @ =0x08903E0C
	movs r0, #0x7f
	ands r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _08027B78
	cmp r0, #1
	bgt _08027B48
	cmp r0, #0
	beq _08027B4E
	b _08027BCA
	.align 2, 0
_08027B44: .4byte 0x08903E0C
_08027B48:
	cmp r0, #2
	beq _08027BA4
	b _08027BCA
_08027B4E:
	adds r0, r4, #0
	bl GetUnitDisplayedSpritePalette
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	movs r2, #0x88
	lsls r2, r2, #4
	adds r0, r6, r2
	adds r1, r1, r0
	ldr r3, _08027B74 @ =0x085B8CE4
	str r1, [sp]
	mov r0, sb
	mov r1, r8
	adds r2, r7, #0
	bl PutSprite
	b _08027BCA
	.align 2, 0
_08027B74: .4byte 0x085B8CE4
_08027B78:
	adds r0, r4, #0
	bl GetUnitDisplayedSpritePalette
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	movs r2, #0x88
	lsls r2, r2, #4
	adds r0, r6, r2
	adds r1, r1, r0
	adds r2, r7, #0
	subs r2, #0x10
	ldr r3, _08027BA0 @ =0x085B8D04
	str r1, [sp]
	mov r0, sb
	mov r1, r8
	bl PutSprite
	b _08027BCA
	.align 2, 0
_08027BA0: .4byte 0x085B8D04
_08027BA4:
	adds r0, r4, #0
	bl GetUnitDisplayedSpritePalette
	movs r4, #0xf
	ands r4, r0
	lsls r4, r4, #0xc
	movs r1, #0x88
	lsls r1, r1, #4
	adds r0, r6, r1
	adds r4, r4, r0
	mov r1, r8
	subs r1, #8
	adds r2, r7, #0
	subs r2, #0x10
	ldr r3, _08027BD8 @ =0x085B8CEC
	str r4, [sp]
	mov r0, sb
	bl PutSprite
_08027BCA:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027BD8: .4byte 0x085B8CEC


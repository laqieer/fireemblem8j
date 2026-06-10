	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set DrawIcon, 0x08003608 + 1
	.set GetItemIconId, 0x080174A8 + 1
	.set GetItemMaxUses, 0x08017358 + 1
	.set GetItemUses, 0x0801732C + 1
	.set GetUnitInfoWindowX, 0x080348DC + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.set IsItemHammernable, 0x08016E28 + 1
	.set PutNumberOrBlank, 0x08004A9C + 1
	.set PutSpecialChar, 0x08004A14 + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_801729C, 0x0801729C + 1
	.set sub_8034744, 0x08034744 + 1
	.section .text.sub_8034D64, "ax", %progbits
@ sub_8034D64 @ JP 0x08034D64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8034D64
	.thumb_func
sub_8034D64:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #8]
	bl GetUnitItemCount
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	movs r1, #0x10
	bl GetUnitInfoWindowX
	mov sb, r0
	movs r0, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x10]
	str r0, [sp, #4]
	movs r0, #0
	ldr r1, [sp, #8]
	mov r2, sb
	movs r3, #0
	bl sub_8034744
	movs r1, #0
	str r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	cmp r1, r2
	bge _08034E88
	mov r1, sb
	adds r1, #0x6c
	str r1, [sp, #0x14]
	mov r2, sb
	adds r2, #0x63
	str r2, [sp, #0x18]
	movs r1, #0x60
	mov sl, r1
	adds r7, r0, #0
	adds r7, #0x38
_08034DB4:
	ldr r2, [sp, #0xc]
	lsls r0, r2, #1
	ldr r1, [sp, #8]
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r6, [r1]
	adds r0, r6, #0
	bl IsItemHammernable
	movs r5, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08034DD0
	movs r5, #1
_08034DD0:
	adds r0, r7, #0
	bl sub_8003CF8
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_8003D90
	adds r0, r6, #0
	bl sub_801729C
	adds r1, r0, #0
	adds r0, r7, #0
	bl sub_8003F28
	ldr r0, [sp, #0x18]
	lsls r1, r0, #1
	ldr r2, _08034EA0 @ =0x02022CA8
	mov r8, r2
	add r1, r8
	adds r0, r7, #0
	bl PutText
	ldr r1, [sp, #0x14]
	lsls r0, r1, #1
	add r0, r8
	adds r1, r5, #0
	movs r2, #0x16
	bl PutSpecialChar
	adds r0, r6, #0
	bl IsItemHammernable
	lsls r0, r0, #0x18
	movs r5, #1
	cmp r0, #0
	beq _08034E1A
	movs r5, #2
_08034E1A:
	mov r4, sl
	adds r4, #0xb
	add r4, sb
	lsls r4, r4, #1
	add r4, r8
	adds r0, r6, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	mov r4, sl
	adds r4, #0xe
	add r4, sb
	lsls r4, r4, #1
	add r4, r8
	adds r0, r6, #0
	bl GetItemMaxUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	mov r4, sl
	adds r4, #1
	add r4, sb
	lsls r4, r4, #1
	add r4, r8
	adds r0, r6, #0
	bl GetItemIconId
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	ldr r2, [sp, #0x14]
	adds r2, #0x40
	str r2, [sp, #0x14]
	ldr r0, [sp, #0x18]
	adds r0, #0x40
	str r0, [sp, #0x18]
	movs r1, #0x40
	add sl, r1
	adds r7, #8
	ldr r2, [sp, #0xc]
	adds r2, #1
	str r2, [sp, #0xc]
	ldr r0, [sp, #0x10]
	cmp r2, r0
	blt _08034DB4
_08034E88:
	movs r0, #3
	bl BG_EnableSyncByMask
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08034EA0: .4byte 0x02022CA8


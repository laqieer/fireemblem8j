	.syntax unified
	.set DrawIcon, 0x08003608 + 1
	.set GetItemIconId, 0x080174A8 + 1
	.set GetItemUses, 0x0801732C + 1
	.set GetUnitInfoWindowX, 0x080348DC + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.set IsItemStealable, 0x08016DFC + 1
	.set PutNumberOrBlank, 0x08004A9C + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_801729C, 0x0801729C + 1
	.set sub_8034744, 0x08034744 + 1
	.section .text.sub_8034C54, "ax", %progbits
@ sub_8034C54 @ JP 0x08034C54 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8034C54
	.thumb_func
sub_8034C54:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #8]
	bl GetUnitItemCount
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	movs r1, #0xd
	bl GetUnitInfoWindowX
	str r0, [sp, #0x10]
	movs r0, #0xd
	str r0, [sp]
	ldr r0, [sp, #0xc]
	str r0, [sp, #4]
	movs r0, #0
	ldr r1, [sp, #8]
	ldr r2, [sp, #0x10]
	movs r3, #0
	bl sub_8034744
	movs r1, #0
	mov sl, r1
	ldr r1, [sp, #0xc]
	cmp sl, r1
	bge _08034D4E
	ldr r1, [sp, #0x10]
	adds r1, #0x6b
	str r1, [sp, #0x14]
	ldr r1, [sp, #0x10]
	adds r1, #0x63
	str r1, [sp, #0x18]
	movs r1, #0x60
	str r1, [sp, #0x1c]
	adds r7, r0, #0
	adds r7, #0x38
_08034CA4:
	mov r1, sl
	lsls r0, r1, #1
	ldr r1, [sp, #8]
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r6, [r1]
	adds r0, r6, #0
	bl IsItemStealable
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov sb, r0
	adds r0, r7, #0
	bl sub_8003CF8
	movs r1, #0
	mov r0, sb
	cmp r0, #0
	bne _08034CCC
	movs r1, #1
_08034CCC:
	adds r0, r7, #0
	bl sub_8003D90
	adds r0, r6, #0
	bl sub_801729C
	adds r1, r0, #0
	adds r0, r7, #0
	bl sub_8003F28
	ldr r0, [sp, #0x18]
	lsls r1, r0, #1
	ldr r0, _08034D60 @ =0x02022CA8
	mov r8, r0
	add r1, r8
	adds r0, r7, #0
	bl PutText
	ldr r1, [sp, #0x14]
	lsls r0, r1, #1
	mov r1, r8
	adds r4, r0, r1
	movs r5, #1
	mov r0, sb
	cmp r0, #0
	beq _08034D02
	movs r5, #2
_08034D02:
	adds r0, r6, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	ldr r4, [sp, #0x1c]
	adds r4, #1
	ldr r1, [sp, #0x10]
	adds r4, r4, r1
	lsls r4, r4, #1
	add r4, r8
	adds r0, r6, #0
	bl GetItemIconId
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	ldr r0, [sp, #0x14]
	adds r0, #0x40
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	adds r1, #0x40
	str r1, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	adds r0, #0x40
	str r0, [sp, #0x1c]
	adds r7, #8
	movs r1, #1
	add sl, r1
	ldr r0, [sp, #0xc]
	cmp sl, r0
	blt _08034CA4
_08034D4E:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08034D60: .4byte 0x02022CA8


	.syntax unified
	.set DrawIcon, 0x08003608 + 1
	.set GetItemIconId, 0x080174A8 + 1
	.set GetItemUses, 0x0801732C + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.set IsItemDisplayUsable, 0x08016C8C + 1
	.set PutNumberOrBlank, 0x08004A9C + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_801729C, 0x0801729C + 1
	.set sub_8029E8C, 0x08029E8C + 1
	.section .text.sub_809DA14, "ax", %progbits
@ sub_809DA14 @ JP 0x0809DA14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809DA14
	.thumb_func
sub_809DA14:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r4, r0, #0
	mov sb, r1
	mov sl, r2
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	str r3, [sp, #8]
	movs r1, #0xb
	movs r2, #9
	movs r3, #0
	bl j_TmFillRect
	mov r0, sl
	bl GetUnitItemCount
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	cmp r0, r1
	bge _0809DAE4
	adds r0, r4, #4
	str r0, [sp, #0x14]
	mov r8, r4
_0809DA4E:
	ldr r0, [sp, #0xc]
	lsls r1, r0, #1
	mov r0, sl
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r6, [r0]
	ldr r1, [sp, #8]
	cmp r1, #0
	beq _0809DA6A
	mov r0, sl
	adds r1, r6, #0
	bl sub_8029E8C
	b _0809DA72
_0809DA6A:
	mov r0, sl
	adds r1, r6, #0
	bl IsItemDisplayUsable
_0809DA72:
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	mov r0, sb
	bl sub_8003CF8
	adds r0, r6, #0
	bl sub_801729C
	adds r1, r0, #0
	movs r2, #0
	cmp r4, #0
	bne _0809DA8C
	movs r2, #1
_0809DA8C:
	movs r0, #0
	str r0, [sp]
	str r1, [sp, #4]
	mov r0, sb
	ldr r1, [sp, #0x14]
	movs r3, #0
	bl sub_8004374
	mov r5, r8
	adds r5, #0x16
	movs r7, #1
	cmp r4, #0
	beq _0809DAA8
	movs r7, #2
_0809DAA8:
	adds r0, r6, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	bl PutNumberOrBlank
	adds r0, r6, #0
	bl GetItemIconId
	adds r1, r0, #0
	mov r0, r8
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	movs r0, #8
	add sb, r0
	ldr r1, [sp, #0x14]
	adds r1, #0x80
	str r1, [sp, #0x14]
	movs r0, #0x80
	add r8, r0
	ldr r1, [sp, #0xc]
	adds r1, #1
	str r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	blt _0809DA4E
_0809DAE4:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0


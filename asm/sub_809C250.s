	.syntax unified
	.set DrawIcon, 0x08003608 + 1
	.set GetItemIconId, 0x080174A8 + 1
	.set GetItemUses, 0x0801732C + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.set IsItemDisplayUsable, 0x08016C8C + 1
	.set PutNumberOrBlank, 0x08004A9C + 1
	.set PutText, 0x08003DA0 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_80034D0, 0x080034D0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_801729C, 0x0801729C + 1
	.set sub_8029E8C, 0x08029E8C + 1
	.section .text.sub_809C250, "ax", %progbits
@ sub_809C250 @ JP 0x0809C250 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809C250
	.thumb_func
sub_809C250:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp]
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #0x14
	movs r3, #0
	bl j_TmFillRect
	movs r0, #2
	ldr r1, [sp]
	ands r0, r1
	cmp r0, #0
	beq _0809C282
	bl sub_80034D0
_0809C282:
	mov r0, r8
	cmp r0, #0
	beq _0809C350
	bl GetUnitItemCount
	str r0, [sp, #4]
	movs r1, #0
	mov sb, r1
	cmp sb, r0
	bge _0809C350
	adds r0, r4, #0
	adds r0, #0x16
	str r0, [sp, #8]
	adds r1, r4, #4
	str r1, [sp, #0xc]
	mov sl, r4
_0809C2A2:
	mov r1, sb
	lsls r0, r1, #1
	mov r1, r8
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	movs r0, #4
	ldr r1, [sp]
	ands r0, r1
	cmp r0, #0
	beq _0809C2C2
	mov r0, r8
	adds r1, r5, #0
	bl sub_8029E8C
	b _0809C2CA
_0809C2C2:
	mov r0, r8
	adds r1, r5, #0
	bl IsItemDisplayUsable
_0809C2CA:
	movs r7, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809C2D4
	movs r7, #1
_0809C2D4:
	movs r0, #1
	ldr r1, [sp]
	ands r0, r1
	cmp r0, #0
	bne _0809C302
	adds r0, r6, #0
	bl sub_8003CF8
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_8003D90
	adds r0, r6, #0
	movs r1, #0
	bl sub_8003D84
	adds r0, r5, #0
	bl sub_801729C
	adds r1, r0, #0
	adds r0, r6, #0
	bl sub_8003F28
_0809C302:
	adds r0, r5, #0
	bl GetItemIconId
	adds r1, r0, #0
	mov r0, sl
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	adds r0, r6, #0
	ldr r1, [sp, #0xc]
	bl PutText
	movs r4, #1
	cmp r7, #0
	bne _0809C324
	movs r4, #2
_0809C324:
	adds r0, r5, #0
	bl GetItemUses
	adds r2, r0, #0
	ldr r0, [sp, #8]
	adds r1, r4, #0
	bl PutNumberOrBlank
	adds r6, #8
	ldr r0, [sp, #8]
	adds r0, #0x80
	str r0, [sp, #8]
	ldr r1, [sp, #0xc]
	adds r1, #0x80
	str r1, [sp, #0xc]
	movs r0, #0x80
	add sl, r0
	movs r1, #1
	add sb, r1
	ldr r0, [sp, #4]
	cmp sb, r0
	blt _0809C2A2
_0809C350:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0


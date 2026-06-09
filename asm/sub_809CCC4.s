	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set DrawIcon, 0x08003608 + 1
	.set GetItemIconId, 0x080174A8 + 1
	.set GetItemUses, 0x0801732C + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.set IsItemDisplayUsable, 0x08016C8C + 1
	.set PutNumberOrBlank, 0x08004A9C + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_80034C4, 0x080034C4 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_801729C, 0x0801729C + 1
	.section .text.sub_809CCC4, "ax", %progbits
@ sub_809CCC4 @ JP 0x0809CCC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809CCC4
	.thumb_func
sub_809CCC4:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	bl sub_80034C4
	ldr r4, _0809CDB0 @ =0x02022DEA
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0xa
	movs r3, #0
	bl j_TmFillRect
	adds r0, r7, #0
	bl GetUnitItemCount
	str r0, [sp, #8]
	movs r0, #0
	mov r8, r0
	ldr r2, [sp, #8]
	cmp r8, r2
	bge _0809CD98
	movs r0, #0x14
	adds r0, r0, r4
	mov sl, r0
	mov sb, r4
	movs r2, #0xa0
	lsls r2, r2, #1
	str r2, [sp, #0xc]
_0809CD04:
	mov r0, r8
	lsls r1, r0, #1
	adds r0, r7, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemIconId
	adds r1, r0, #0
	mov r0, sb
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	mov r2, r8
	lsls r1, r2, #3
	ldr r0, _0809CDB4 @ =0x02013600
	adds r5, r1, r0
	adds r0, r5, #0
	bl sub_8003CF8
	adds r0, r7, #0
	adds r1, r4, #0
	bl IsItemDisplayUsable
	movs r6, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809CD42
	movs r6, #1
_0809CD42:
	adds r0, r4, #0
	bl sub_801729C
	ldr r1, _0809CDB8 @ =0x02022CAA
	adds r1, #4
	ldr r2, [sp, #0xc]
	adds r1, r2, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl sub_8004374
	adds r0, r7, #0
	adds r1, r4, #0
	bl IsItemDisplayUsable
	lsls r0, r0, #0x18
	movs r5, #1
	cmp r0, #0
	beq _0809CD72
	movs r5, #2
_0809CD72:
	adds r0, r4, #0
	bl GetItemUses
	adds r2, r0, #0
	mov r0, sl
	adds r1, r5, #0
	bl PutNumberOrBlank
	movs r0, #0x80
	add sl, r0
	add sb, r0
	ldr r2, [sp, #0xc]
	adds r2, #0x80
	str r2, [sp, #0xc]
	movs r0, #1
	add r8, r0
	ldr r2, [sp, #8]
	cmp r8, r2
	blt _0809CD04
_0809CD98:
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CDB0: .4byte 0x02022DEA
_0809CDB4: .4byte 0x02013600
_0809CDB8: .4byte 0x02022CAA


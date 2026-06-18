	.syntax unified
	.set DrawIcon, 0x08003608 + 1
	.set GetItemIconId, 0x080174A8 + 1
	.set GetItemUses, 0x0801732C + 1
	.set GetUnitInfoWindowX, 0x080348DC + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.set PutNumberOrBlank, 0x08004A9C + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_801729C, 0x0801729C + 1
	.set sub_8034744, 0x08034744 + 1
	.section .text.sub_8034B44, "ax", %progbits
@ RefreshUnitInventoryInfoWindow @ JP 0x08034B44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global RefreshUnitInventoryInfoWindow
	.thumb_func
RefreshUnitInventoryInfoWindow:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #8]
	bl GetUnitItemCount
	mov sl, r0
	ldr r0, [sp, #8]
	movs r1, #0xd
	bl GetUnitInfoWindowX
	adds r5, r0, #0
	movs r0, #0xd
	str r0, [sp]
	mov r0, sl
	str r0, [sp, #4]
	cmp r0, #0
	bne _08034B72
	movs r0, #1
	str r0, [sp, #4]
_08034B72:
	movs r0, #0
	ldr r1, [sp, #8]
	adds r2, r5, #0
	movs r3, #0
	bl sub_8034744
	adds r4, r0, #0
	mov r0, sl
	cmp r0, #0
	bne _08034BBC
	adds r4, #0x38
	adds r0, r4, #0
	bl sub_8003CF8
	ldr r0, _08034BB4 @ =0x00000533
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	bl sub_80043B8
	adds r1, r5, #0
	adds r1, #0x63
	lsls r1, r1, #1
	ldr r0, _08034BB8 @ =0x02022CA8
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	b _08034C40
	.align 2, 0
_08034BB4: .4byte 0x00000533
_08034BB8: .4byte 0x02022CA8
_08034BBC:
	movs r0, #0
	mov sb, r0
	cmp sb, sl
	bge _08034C40
	ldr r3, _08034C50 @ =0x02022CA8
	adds r2, r5, #0
	adds r2, #0x61
	adds r1, r5, #0
	adds r1, #0x6b
	adds r0, r5, #0
	adds r0, #0x63
	adds r5, r4, #0
	adds r5, #0x38
	lsls r0, r0, #1
	adds r0, r0, r3
	mov r8, r0
	lsls r1, r1, #1
	adds r7, r1, r3
	lsls r2, r2, #1
	adds r6, r2, r3
_08034BE4:
	mov r0, sb
	lsls r1, r0, #1
	ldr r0, [sp, #8]
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r5, #0
	bl sub_8003CF8
	adds r0, r4, #0
	bl sub_801729C
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_8003F28
	adds r0, r5, #0
	mov r1, r8
	bl PutText
	adds r0, r4, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r7, #0
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r4, #0
	bl GetItemIconId
	adds r1, r0, #0
	adds r0, r6, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	adds r6, #0x80
	adds r7, #0x80
	movs r0, #0x80
	add r8, r0
	adds r5, #8
	movs r0, #1
	add sb, r0
	cmp sb, sl
	blt _08034BE4
_08034C40:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08034C50: .4byte 0x02022CA8


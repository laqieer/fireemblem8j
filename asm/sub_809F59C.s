	.syntax unified
	.set DrawIcon, 0x08003608 + 1
	.set GetItemIconId, 0x080174A8 + 1
	.set GetItemUses, 0x0801732C + 1
	.set IsItemDisplayUsable, 0x08016C8C + 1
	.set PutNumberOrBlank, 0x08004A9C + 1
	.set PutText, 0x08003DA0 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_801729C, 0x0801729C + 1
	.section .text.sub_809F59C, "ax", %progbits
@ sub_809F59C @ JP 0x0809F59C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809F59C
	.thumb_func
sub_809F59C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	mov sl, r1
	str r2, [sp, #4]
	str r3, [sp, #8]
	mov r0, sl
	movs r1, #0xc
	movs r2, #0x1f
	movs r3, #0
	bl j_TmFillRect
	ldr r1, _0809F5E8 @ =0x02012F56
	ldrh r0, [r1]
	cmp r0, #0
	bne _0809F5F0
	ldr r0, [sp]
	bl sub_8003CF8
	ldr r0, _0809F5EC @ =0x00000533
	bl sub_8009FA8
	adds r3, r0, #0
	ldr r0, [sp]
	movs r1, #0
	movs r2, #1
	bl sub_80043B8
	mov r1, sl
	adds r1, #6
	ldr r0, [sp]
	bl PutText
	b _0809F69A
	.align 2, 0
_0809F5E8: .4byte 0x02012F56
_0809F5EC: .4byte 0x00000533
_0809F5F0:
	ldr r6, [sp, #4]
	adds r0, r6, #7
	cmp r6, r0
	bge _0809F69A
	ldrh r1, [r1]
	cmp r6, r1
	bge _0809F69A
_0809F5FE:
	movs r0, #7
	ands r0, r6
	lsls r0, r0, #3
	ldr r1, [sp]
	adds r1, r1, r0
	mov r8, r1
	ldr r1, _0809F6AC @ =0x020122D4
	lsls r0, r6, #2
	adds r0, r0, r1
	ldrh r7, [r0, #2]
	ldr r0, [sp, #8]
	adds r1, r7, #0
	bl IsItemDisplayUsable
	movs r1, #0
	mov sb, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809F628
	movs r0, #1
	mov sb, r0
_0809F628:
	mov r0, r8
	bl sub_8003CF8
	adds r0, r7, #0
	bl sub_801729C
	adds r3, r0, #0
	mov r0, r8
	movs r1, #0
	mov r2, sb
	bl sub_80043B8
	lsls r5, r6, #1
	movs r0, #0x1f
	ands r5, r0
	lsls r5, r5, #6
	adds r4, r5, #2
	add r4, sl
	adds r0, r7, #0
	bl GetItemIconId
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	adds r1, r5, #6
	add r1, sl
	mov r0, r8
	bl PutText
	adds r5, #0x18
	mov r1, sl
	adds r4, r1, r5
	movs r5, #1
	mov r0, sb
	cmp r0, #0
	bne _0809F678
	movs r5, #2
_0809F678:
	adds r0, r7, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	adds r6, #1
	ldr r0, [sp, #4]
	adds r0, #7
	cmp r6, r0
	bge _0809F69A
	ldr r0, _0809F6B0 @ =0x02012F56
	ldrh r0, [r0]
	cmp r6, r0
	blt _0809F5FE
_0809F69A:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809F6AC: .4byte 0x020122D4
_0809F6B0: .4byte 0x02012F56


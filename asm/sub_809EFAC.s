	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set DrawIcon, 0x08003608 + 1
	.set GetItemIconId, 0x080174A8 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003E0C, 0x08003E0C + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_809EFAC, "ax", %progbits
@ sub_809EFAC @ JP 0x0809EFAC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809EFAC
	.thumb_func
sub_809EFAC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	adds r0, r3, #0
	bl sub_8009FA8
	mov sb, r0
	ldr r0, [sp, #0x28]
	bl GetItemIconId
	mov r8, r0
	mov r0, sb
	bl sub_8003E0C
	mov sl, r0
	mov r0, r8
	cmp r0, #0
	beq _0809EFF8
	lsls r4, r7, #5
	adds r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _0809F064 @ =0x02023CA8
	adds r4, r4, r0
	ldr r0, [sp, #0x28]
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl DrawIcon
_0809EFF8:
	ldr r4, _0809F068 @ =0x02013570
	adds r0, r4, #0
	bl sub_8003CF8
	lsls r0, r7, #5
	mov r1, r8
	cmp r1, #0
	beq _0809F00A
	adds r0, #2
_0809F00A:
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r1, _0809F064 @ =0x02023CA8
	adds r1, r0, r1
	movs r0, #0
	str r0, [sp]
	mov r0, sb
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8004374
	movs r0, #4
	bl BG_EnableSyncByMask
	lsls r0, r5, #3
	subs r0, #4
	str r0, [r6, #0x40]
	lsls r0, r7, #3
	subs r0, #4
	str r0, [r6, #0x44]
	mov r0, sl
	cmp r0, #0
	bge _0809F03E
	adds r0, #7
_0809F03E:
	asrs r1, r0, #3
	adds r0, r1, #1
	str r0, [r6, #0x48]
	mov r0, r8
	cmp r0, #0
	beq _0809F04E
	adds r0, r1, #3
	str r0, [r6, #0x48]
_0809F04E:
	movs r0, #2
	str r0, [r6, #0x4c]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809F064: .4byte 0x02023CA8
_0809F068: .4byte 0x02013570


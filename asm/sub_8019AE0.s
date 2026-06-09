	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set DisplayBmTile, 0x080197F0 + 1
	.set DisplayMovementViewTile, 0x08019864 + 1
	.section .text.sub_8019AE0, "ax", %progbits
@ sub_8019AE0 @ JP 0x08019AE0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8019AE0
	.thumb_func
sub_8019AE0:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _08019B54 @ =0x0202BCAC
	ldrh r2, [r4, #0xc]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x14
	adds r1, r0, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	ldrh r1, [r4, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	lsls r3, r1, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	ldrh r3, [r4, #0x24]
	subs r2, r2, r3
	adds r7, r0, r2
	movs r0, #0xf
	ands r7, r0
	ldrh r0, [r4, #0x26]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	ldrb r1, [r4, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08019B5C
	movs r6, #0xa
	movs r4, #0xf
_08019B2E:
	mov r0, sb
	adds r2, r0, r6
	ands r2, r4
	mov r1, sl
	adds r0, r1, r6
	str r0, [sp]
	ldr r0, _08019B58 @ =0x020244A8
	adds r1, r7, #0
	mov r3, r8
	bl DisplayBmTile
	subs r6, #1
	cmp r6, #0
	bge _08019B2E
	movs r0, #8
	bl BG_EnableSyncByMask
	b _08019B92
	.align 2, 0
_08019B54: .4byte 0x0202BCAC
_08019B58: .4byte 0x020244A8
_08019B5C:
	movs r6, #0xa
_08019B5E:
	mov r0, sb
	adds r4, r0, r6
	movs r0, #0xf
	ands r4, r0
	mov r1, sl
	adds r5, r1, r6
	str r5, [sp]
	ldr r0, _08019BA4 @ =0x020244A8
	adds r1, r7, #0
	adds r2, r4, #0
	mov r3, r8
	bl DisplayBmTile
	str r4, [sp]
	ldr r0, _08019BA8 @ =0x02023CA8
	mov r1, r8
	adds r2, r5, #0
	adds r3, r7, #0
	bl DisplayMovementViewTile
	subs r6, #1
	cmp r6, #0
	bge _08019B5E
	movs r0, #0xc
	bl BG_EnableSyncByMask
_08019B92:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019BA4: .4byte 0x020244A8
_08019BA8: .4byte 0x02023CA8


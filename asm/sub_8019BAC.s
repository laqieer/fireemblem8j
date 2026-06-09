	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set DisplayBmTile, 0x080197F0 + 1
	.set DisplayMovementViewTile, 0x08019864 + 1
	.section .text.sub_8019BAC, "ax", %progbits
@ sub_8019BAC @ JP 0x08019BAC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8019BAC
	.thumb_func
sub_8019BAC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _08019C20 @ =0x0202BCAC
	ldrh r2, [r4, #0xc]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x14
	lsls r1, r2, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	ldrh r3, [r4, #0xe]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x14
	adds r1, r0, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	ldrh r1, [r4, #0x24]
	subs r2, r2, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	ldrh r1, [r4, #0x26]
	subs r3, r3, r1
	adds r7, r0, r3
	movs r0, #0xf
	ands r7, r0
	ldrb r1, [r4, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08019C28
	movs r6, #0xf
	movs r4, #0xf
_08019BFA:
	mov r0, sb
	adds r1, r0, r6
	ands r1, r4
	mov r0, sl
	adds r3, r0, r6
	mov r0, r8
	str r0, [sp]
	ldr r0, _08019C24 @ =0x020244A8
	adds r2, r7, #0
	bl DisplayBmTile
	subs r6, #1
	cmp r6, #0
	bge _08019BFA
	movs r0, #8
	bl BG_EnableSyncByMask
	b _08019C60
	.align 2, 0
_08019C20: .4byte 0x0202BCAC
_08019C24: .4byte 0x020244A8
_08019C28:
	movs r6, #0xf
_08019C2A:
	mov r0, sb
	adds r4, r0, r6
	movs r0, #0xf
	ands r4, r0
	mov r0, sl
	adds r5, r0, r6
	mov r0, r8
	str r0, [sp]
	ldr r0, _08019C70 @ =0x020244A8
	adds r1, r4, #0
	adds r2, r7, #0
	adds r3, r5, #0
	bl DisplayBmTile
	str r7, [sp]
	ldr r0, _08019C74 @ =0x02023CA8
	adds r1, r5, #0
	mov r2, r8
	adds r3, r4, #0
	bl DisplayMovementViewTile
	subs r6, #1
	cmp r6, #0
	bge _08019C2A
	movs r0, #0xc
	bl BG_EnableSyncByMask
_08019C60:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019C70: .4byte 0x020244A8
_08019C74: .4byte 0x02023CA8


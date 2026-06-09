	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set DisplayBmTile, 0x080197F0 + 1
	.section .text.sub_8019914, "ax", %progbits
@ sub_8019914 @ JP 0x08019914 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8019914
	.thumb_func
sub_8019914:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r0, _08019988 @ =0x0202BCAC
	ldrh r1, [r0, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	strh r1, [r0, #0x24]
	ldrh r1, [r0, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	strh r1, [r0, #0x26]
	movs r5, #9
	adds r7, r0, #0
_0801992E:
	movs r4, #0xe
	subs r6, r5, #1
_08019932:
	movs r0, #0x24
	ldrsh r3, [r7, r0]
	adds r3, r3, r4
	movs r1, #0x26
	ldrsh r0, [r7, r1]
	adds r0, r0, r5
	str r0, [sp]
	ldr r0, _0801998C @ =0x020244A8
	adds r1, r4, #0
	adds r2, r5, #0
	bl DisplayBmTile
	subs r4, #1
	cmp r4, #0
	bge _08019932
	adds r5, r6, #0
	cmp r5, #0
	bge _0801992E
	movs r0, #8
	bl BG_EnableSyncByMask
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r2, _08019990 @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019988: .4byte 0x0202BCAC
_0801998C: .4byte 0x020244A8
_08019990: .4byte 0x03003020


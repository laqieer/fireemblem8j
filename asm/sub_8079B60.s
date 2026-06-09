	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8073418, 0x08073418 + 1
	.section .text.sub_8079B60, "ax", %progbits
@ sub_8079B60 @ JP 0x08079B60 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8079B60
	.thumb_func
sub_8079B60:
	push {r4, r5, lr}
	sub sp, #0x10
	adds r3, r0, #0
	adds r2, r1, #0
	asrs r4, r3, #3
	movs r1, #7
	asrs r5, r2, #3
	ands r2, r1
	movs r0, #3
	ands r1, r3
	bl BG_SetPosition
	lsls r4, r4, #1
	lsls r0, r5, #5
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _08079BAC @ =0x0201D428
	adds r0, r0, r1
	adds r4, r4, r0
	ldr r2, _08079BB0 @ =0x020244A8
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	subs r0, #0x21
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl sub_8073418
	movs r0, #8
	bl BG_EnableSyncByMask
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08079BAC: .4byte 0x0201D428
_08079BB0: .4byte 0x020244A8


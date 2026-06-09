	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set GetWMFaceTileXAndScroll, 0x080BD138 + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.set sub_800663C, 0x0800663C + 1
	.section .text.sub_80BD194, "ax", %progbits
@ sub_80BD194 @ JP 0x080BD194 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BD194
	.thumb_func
sub_80BD194:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	mov sb, r1
	adds r0, r2, #0
	adds r6, r3, #0
	ldr r1, [sp, #0x24]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov sl, r1
	mov r1, sp
	bl GetWMFaceTileXAndScroll
	mov r8, r0
	adds r4, r6, #0
	cmp r6, #0
	bge _080BD1C0
	adds r4, r6, #7
_080BD1C0:
	asrs r4, r4, #3
	lsls r5, r4, #3
	subs r5, r5, r6
	adds r0, r7, #0
	bl sub_8001BC0
	lsls r4, r4, #6
	adds r0, r0, r4
	mov r2, r8
	lsls r1, r2, #1
	adds r0, r0, r1
	mov r2, sb
	lsrs r1, r2, #5
	movs r2, #0x80
	lsls r2, r2, #7
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r2, sl
	bl sub_800663C
	movs r0, #1
	lsls r0, r7
	bl BG_EnableSyncByMask
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [sp]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r2, r5, #0
	bl BG_SetPosition
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0


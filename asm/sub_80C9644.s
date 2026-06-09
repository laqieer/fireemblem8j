	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80C9644, "ax", %progbits
@ sub_80C9644 @ JP 0x080C9644 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C9644
	.thumb_func
sub_80C9644:
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	bl GetBackgroundTileDataOffset
	adds r4, r0, #0
	ldr r0, _080C9694 @ =0x08BABE04
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r4, r2
	bl sub_8013008
	movs r0, #0
	str r0, [sp]
	ldr r0, _080C9698 @ =0x06005000
	adds r4, r4, r0
	ldr r5, _080C969C @ =0x01000008
	mov r0, sp
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80D636C
	movs r0, #1
	lsls r0, r6
	bl BG_EnableSyncByMask
	ldr r0, _080C96A0 @ =0x08A708A7
	str r0, [sp, #4]
	add r0, sp, #4
	ldr r1, _080C96A4 @ =0x02022A68
	adds r2, r5, #0
	bl sub_80D636C
	bl sub_8001EE4
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C9694: .4byte 0x08BABE04
_080C9698: .4byte 0x06005000
_080C969C: .4byte 0x01000008
_080C96A0: .4byte 0x08A708A7
_080C96A4: .4byte 0x02022A68


	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_80C9644, 0x080C9644 + 1
	.set sub_80C96A8, 0x080C96A8 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80C9E58, "ax", %progbits
@ sub_80C9E58 @ JP 0x080C9E58 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C9E58
	.thumb_func
sub_80C9E58:
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #1
	bl sub_80C9644
	movs r4, #0
	str r4, [sp]
	ldr r1, _080C9EA8 @ =0x02022A88
	ldr r2, _080C9EAC @ =0x01000008
	mov r0, sp
	bl sub_80D636C
	movs r0, #1
	bl sub_80C96A8
	movs r0, #2
	bl BG_EnableSyncByMask
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, _080C9EB0 @ =0x06005000
	ldr r2, _080C9EB4 @ =0x01000400
	bl sub_80D636C
	ldr r0, _080C9EB8 @ =0x02022CA8
	movs r1, #0xa0
	lsls r1, r1, #2
	bl sub_80011D0
	movs r0, #1
	bl BG_EnableSyncByMask
	movs r0, #0x16
	strh r0, [r5, #0x2a]
	strh r4, [r5, #0x2c]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C9EA8: .4byte 0x02022A88
_080C9EAC: .4byte 0x01000008
_080C9EB0: .4byte 0x06005000
_080C9EB4: .4byte 0x01000400
_080C9EB8: .4byte 0x02022CA8


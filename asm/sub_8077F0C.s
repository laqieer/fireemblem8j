	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8077E84, 0x08077E84 + 1
	.set sub_8077EA4, 0x08077EA4 + 1
	.set sub_8077EE8, 0x08077EE8 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8077F0C, "ax", %progbits
@ sub_8077F0C @ JP 0x08077F0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8077F0C
	.thumb_func
sub_8077F0C:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_8077E84
	movs r5, #0
	str r5, [sp]
	ldr r1, _08077F48 @ =0x0600FFE0
	ldr r2, _08077F4C @ =0x01000008
	mov r0, sp
	bl sub_80D636C
	adds r0, r4, #0
	bl sub_8077EA4
	adds r0, r4, #0
	bl sub_8077EE8
	ldr r0, _08077F50 @ =0x020228A8
	strh r5, [r0]
	movs r0, #8
	bl BG_EnableSyncByMask
	bl sub_8001EE4
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077F48: .4byte 0x0600FFE0
_08077F4C: .4byte 0x01000008
_08077F50: .4byte 0x020228A8


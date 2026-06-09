	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8056130, "ax", %progbits
@ sub_8056130 @ JP 0x08056130 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8056130
	.thumb_func
sub_8056130:
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, _08056150 @ =0x020234A8
	ldr r2, _08056154 @ =0x01000200
	mov r0, sp
	bl sub_80D636C
	movs r0, #2
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08056150: .4byte 0x020234A8
_08056154: .4byte 0x01000200


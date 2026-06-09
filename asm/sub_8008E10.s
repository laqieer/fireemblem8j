	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set CheckTalkFlag, 0x080069E0 + 1
	.section .text.sub_8008E10, "ax", %progbits
@ sub_8008E10 @ JP 0x08008E10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8008E10
	.thumb_func
sub_8008E10:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x20
	bl CheckTalkFlag
	cmp r0, #0
	bne _08008E24
	adds r0, r4, #0
	bl BG_EnableSyncByMask
_08008E24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0


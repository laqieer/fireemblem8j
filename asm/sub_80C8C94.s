	.syntax unified
	.set GetCurrentBgmSong, 0x080021A8 + 1
	.set IsBgmPlaying, 0x080021B4 + 1
	.set sub_809C23C, 0x0809C23C + 1
	.section .text.sub_80C8C94, "ax", %progbits
@ sub_80C8C94 @ JP 0x080C8C94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C8C94
	.thumb_func
sub_80C8C94:
	push {r4, lr}
	adds r4, r0, #0
	bl IsBgmPlaying
	adds r1, r4, #0
	adds r1, #0x30
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C8CAE
	bl GetCurrentBgmSong
	str r0, [r4, #0x34]
_080C8CAE:
	adds r0, r4, #0
	bl sub_809C23C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0


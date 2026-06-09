	.syntax unified
	.set IsSoundRoomSongPlayable, 0x080B390C + 1
	.set sub_80B4C30, 0x080B4C30 + 1
	.section .text.sub_80B4498, "ax", %progbits
@ sub_80B4498 @ JP 0x080B4498 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B4498
	.thumb_func
sub_80B4498:
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x35
	ldrb r1, [r4]
	bl IsSoundRoomSongPlayable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B44B2
	ldrb r0, [r4]
	bl sub_80B4C30
	b _080B44BA
_080B44B2:
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_80B4C30
_080B44BA:
	pop {r4}
	pop {r0}
	bx r0


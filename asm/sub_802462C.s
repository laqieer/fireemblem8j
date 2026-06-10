	.syntax unified
	.set RefreshUnitTakeRescueInfoWindows, 0x080350D4 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8035610, 0x08035610 + 1
	.section .text.sub_802462C, "ax", %progbits
@ sub_802462C @ JP 0x0802462C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802462C
	.thumb_func
sub_802462C:
	push {r4, lr}
	adds r4, r0, #0
	bl RefreshUnitTakeRescueInfoWindows
	ldr r0, _08024648 @ =0x000007E6
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8035610
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024648: .4byte 0x000007E6


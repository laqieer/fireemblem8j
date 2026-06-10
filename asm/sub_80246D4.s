	.syntax unified
	.set RefreshUnitTakeRescueInfoWindows, 0x080350D4 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8035610, 0x08035610 + 1
	.section .text.sub_80246D4, "ax", %progbits
@ sub_80246D4 @ JP 0x080246D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80246D4
	.thumb_func
sub_80246D4:
	push {r4, lr}
	adds r4, r0, #0
	bl RefreshUnitTakeRescueInfoWindows
	movs r0, #0xfd
	lsls r0, r0, #3
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8035610
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0


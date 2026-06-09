	.syntax unified
	.set __udivsi3, 0x080D67D0 + 1
	.set sub_80D63D4, 0x080D63D4 + 1
	.section .text.sub_80C2228, "ax", %progbits
@ sub_80C2228 @ JP 0x080C2228 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C2228
	.thumb_func
sub_80C2228:
	push {lr}
	adds r2, r0, #0
	muls r2, r0, r2
	adds r0, r2, #0
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	lsls r0, r0, #4
	bl sub_80D63D4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #5
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1


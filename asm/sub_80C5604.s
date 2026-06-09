	.syntax unified
	.set sub_80D63D4, 0x080D63D4 + 1
	.section .text.sub_80C5604, "ax", %progbits
@ sub_80C5604 @ JP 0x080C5604 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C5604
	.thumb_func
sub_80C5604:
	push {r4, lr}
	ldr r4, [sp, #8]
	subs r2, r2, r0
	subs r3, r3, r1
	adds r0, r2, #0
	muls r0, r2, r0
	adds r1, r3, #0
	muls r1, r3, r1
	adds r0, r0, r1
	lsls r0, r4
	bl sub_80D63D4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0


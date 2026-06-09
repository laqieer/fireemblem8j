	.syntax unified
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.set sub_80860E8, 0x080860E8 + 1
	.set sub_80860F0, 0x080860F0 + 1
	.section .text.sub_80A7B94, "ax", %progbits
@ sub_80A7B94 @ JP 0x080A7B94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A7B94
	.thumb_func
sub_80A7B94:
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_80860E8
	adds r5, r0, #0
	bl sub_80860F0
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl WriteAndVerifySramFast
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0


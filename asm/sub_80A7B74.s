	.syntax unified
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.set sub_80860F4, 0x080860F4 + 1
	.set sub_80860FC, 0x080860FC + 1
	.section .text.sub_80A7B74, "ax", %progbits
@ sub_80A7B74 @ JP 0x080A7B74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A7B74
	.thumb_func
sub_80A7B74:
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_80860F4
	adds r5, r0, #0
	bl sub_80860FC
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl WriteAndVerifySramFast
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0


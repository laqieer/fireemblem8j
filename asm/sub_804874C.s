	.syntax unified
	.set EraseSaveRankData, 0x080A83F8 + 1
	.set sub_80A7828, 0x080A7828 + 1
	.set sub_80A886C, 0x080A886C + 1
	.set sub_80A89C8, 0x080A89C8 + 1
	.section .text.sub_804874C, "ax", %progbits
@ sub_804874C @ JP 0x0804874C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804874C
	.thumb_func
sub_804874C:
	push {lr}
	bl sub_80A7828
	bl EraseSaveRankData
	bl sub_80A886C
	bl sub_80A89C8
	pop {r0}
	bx r0
	.align 2, 0


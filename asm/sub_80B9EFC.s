	.syntax unified
	.set DisplayShopUiArrows, 0x080B9F08 + 1
	.section .text.sub_80B9EFC, "ax", %progbits
@ sub_80B9EFC @ JP 0x080B9EFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9EFC
	.thumb_func
sub_80B9EFC:
	push {lr}
	bl DisplayShopUiArrows
	pop {r0}
	bx r0
	.align 2, 0


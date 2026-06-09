	.syntax unified
	.set SaveBonusContentData, 0x080A8394 + 1
	.section .text.sub_80AF1B8, "ax", %progbits
@ sub_80AF1B8 @ JP 0x080AF1B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AF1B8
	.thumb_func
sub_80AF1B8:
	push {lr}
	ldr r0, _080AF1C8 @ =0x08A9D3E4
	ldr r0, [r0]
	bl SaveBonusContentData
	pop {r0}
	bx r0
	.align 2, 0
_080AF1C8: .4byte 0x08A9D3E4


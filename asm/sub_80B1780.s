	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80B1780, "ax", %progbits
@ sub_80B1780 @ JP 0x080B1780 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B1780
	.thumb_func
sub_80B1780:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B1790 @ =0x08A9DAFC
	bl sub_8002BCC
	pop {r1}
	bx r1
	.align 2, 0
_080B1790: .4byte 0x08A9DAFC


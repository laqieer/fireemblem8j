	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80B8C64, "ax", %progbits
@ sub_80B8C64 @ JP 0x080B8C64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B8C64
	.thumb_func
sub_80B8C64:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B8C74 @ =0x08AAFE9C
	bl sub_8002BCC
	pop {r1}
	bx r1
	.align 2, 0
_080B8C74: .4byte 0x08AAFE9C


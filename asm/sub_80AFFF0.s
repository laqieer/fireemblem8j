	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80AFFF0, "ax", %progbits
@ sub_80AFFF0 @ JP 0x080AFFF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AFFF0
	.thumb_func
sub_80AFFF0:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B0000 @ =0x08A9D604
	bl sub_8002BCC
	pop {r1}
	bx r1
	.align 2, 0
_080B0000: .4byte 0x08A9D604


	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80B5224, "ax", %progbits
@ sub_80B5224 @ JP 0x080B5224 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B5224
	.thumb_func
sub_80B5224:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B5234 @ =0x08A9E4D0
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_080B5234: .4byte 0x08A9E4D0


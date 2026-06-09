	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80C2A10, "ax", %progbits
@ sub_80C2A10 @ JP 0x080C2A10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C2A10
	.thumb_func
sub_80C2A10:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080C2A20 @ =0x08AC1C80
	bl sub_8002BCC
	pop {r1}
	bx r1
	.align 2, 0
_080C2A20: .4byte 0x08AC1C80


	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_807E574, "ax", %progbits
@ sub_807E574 @ JP 0x0807E574 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807E574
	.thumb_func
sub_807E574:
	push {lr}
	ldr r0, _0807E584 @ =0x08A13E9C
	movs r1, #3
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_0807E584: .4byte 0x08A13E9C


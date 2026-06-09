	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8078890, "ax", %progbits
@ sub_8078890 @ JP 0x08078890 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8078890
	.thumb_func
sub_8078890:
	push {lr}
	ldr r0, _080788A0 @ =0x087E1B78
	movs r1, #3
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_080788A0: .4byte 0x087E1B78


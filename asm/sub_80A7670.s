	.syntax unified
	.section .text.sub_80A7670, "ax", %progbits
@ sub_80A7670 @ JP 0x080A7670 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A7670
	.thumb_func
sub_80A7670:
	ldr r0, _080A7678 @ =0x0203E880
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_080A7678: .4byte 0x0203E880


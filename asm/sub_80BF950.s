	.syntax unified
	.section .text.sub_80BF950, "ax", %progbits
@ sub_80BF950 @ JP 0x080BF950 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BF950
	.thumb_func
sub_80BF950:
	ldr r1, _080BF958 @ =0x03001DD8
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080BF958: .4byte 0x03001DD8


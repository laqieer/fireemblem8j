	.syntax unified
	.section .text.sub_80153A4, "ax", %progbits
@ sub_80153A4 @ JP 0x080153A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80153A4
	.thumb_func
sub_80153A4:
	ldr r0, _080153AC @ =0x0202BCAC
	ldrb r0, [r0, #1]
	bx lr
	.align 2, 0
_080153AC: .4byte 0x0202BCAC


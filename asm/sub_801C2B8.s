	.syntax unified
	.section .text.sub_801C2B8, "ax", %progbits
@ sub_801C2B8 @ JP 0x0801C2B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801C2B8
	.thumb_func
sub_801C2B8:
	ldr r1, _0801C2C0 @ =0x085C2F1C
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0801C2C0: .4byte 0x085C2F1C


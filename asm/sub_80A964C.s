	.syntax unified
	.section .text.sub_80A964C, "ax", %progbits
@ sub_80A964C @ JP 0x080A964C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A964C
	.thumb_func
sub_80A964C:
	ldr r0, _080A9654 @ =0x0202BCEC
	ldrb r0, [r0, #0x1b]
	bx lr
	.align 2, 0
_080A9654: .4byte 0x0202BCEC


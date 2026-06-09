	.syntax unified
	.set sub_8003520, 0x08003520 + 1
	.set sub_80B9F40, 0x080B9F40 + 1
	.section .text.sub_80B6540, "ax", %progbits
@ sub_80B6540 @ JP 0x080B6540 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B6540
	.thumb_func
sub_80B6540:
	push {lr}
	movs r0, #1
	movs r1, #0x12
	bl sub_8003520
	movs r0, #0x80
	movs r1, #3
	bl sub_80B9F40
	pop {r0}
	bx r0
	.align 2, 0


	.syntax unified
	.set sub_8014B50, 0x08014B50 + 1
	.section .text.sub_807FB5C, "ax", %progbits
@ sub_807FB5C @ JP 0x0807FB5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807FB5C
	.thumb_func
sub_807FB5C:
	push {lr}
	ldr r2, _0807FB6C @ =0x0000010F
	ldr r1, [r0, #0x30]
	adds r0, r2, #0
	bl sub_8014B50
	pop {r0}
	bx r0
	.align 2, 0
_0807FB6C: .4byte 0x0000010F


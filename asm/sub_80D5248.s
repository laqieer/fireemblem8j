	.syntax unified
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_80D5248, "ax", %progbits
@ sub_80D5248 @ JP 0x080D5248 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D5248
	.thumb_func
sub_80D5248:
	push {lr}
	ldr r1, _080D5258 @ =0x030064F8
	ldr r1, [r1]
	bl sub_80D65C0
	pop {r0}
	bx r0
	.align 2, 0
_080D5258: .4byte 0x030064F8


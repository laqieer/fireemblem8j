	.syntax unified
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_80D525C, "ax", %progbits
@ sub_80D525C @ JP 0x080D525C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D525C
	.thumb_func
sub_80D525C:
	push {lr}
	ldr r1, _080D526C @ =0x030064FC
	ldr r1, [r1]
	bl sub_80D65C0
	pop {r0}
	bx r0
	.align 2, 0
_080D526C: .4byte 0x030064FC


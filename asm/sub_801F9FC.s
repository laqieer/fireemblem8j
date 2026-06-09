	.syntax unified
	.set sub_801F940, 0x0801F940 + 1
	.section .text.sub_801F9FC, "ax", %progbits
@ sub_801F9FC @ JP 0x0801F9FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801F9FC
	.thumb_func
sub_801F9FC:
	push {lr}
	ldr r2, _0801FA08 @ =0x0000080E
	bl sub_801F940
	pop {r0}
	bx r0
	.align 2, 0
_0801FA08: .4byte 0x0000080E


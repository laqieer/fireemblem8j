	.syntax unified
	.set sub_801F940, 0x0801F940 + 1
	.section .text.sub_801FA0C, "ax", %progbits
@ sub_801FA0C @ JP 0x0801FA0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801FA0C
	.thumb_func
sub_801FA0C:
	push {lr}
	ldr r2, _0801FA18 @ =0x0000080F
	bl sub_801F940
	pop {r0}
	bx r0
	.align 2, 0
_0801FA18: .4byte 0x0000080F


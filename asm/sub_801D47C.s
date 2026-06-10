	.syntax unified
	.set sub_801C984, 0x0801C984 + 1
	.section .text.sub_801D47C, "ax", %progbits
@ sub_801D47C @ JP 0x0801D47C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801D47C
	.thumb_func
sub_801D47C:
	push {lr}
	ldr r1, _0801D494 @ =0x085775CC
	ldr r2, [r1]
	movs r3, #0
	movs r1, #1
	strh r1, [r2, #8]
	strh r3, [r2, #6]
	bl sub_801C984
	pop {r0}
	bx r0
	.align 2, 0
_0801D494: .4byte 0x085775CC


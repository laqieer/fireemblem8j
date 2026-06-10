	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_801C2A4, "ax", %progbits
@ sub_801C2A4 @ JP 0x0801C2A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801C2A4
	.thumb_func
sub_801C2A4:
	push {lr}
	ldr r0, _0801C2B4 @ =0x085C2F04
	movs r1, #3
	bl sub_8002BCC
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_0801C2B4: .4byte 0x085C2F04


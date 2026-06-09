	.syntax unified
	.set sub_800BC00, 0x0800BC00 + 1
	.set sub_800BC44, 0x0800BC44 + 1
	.set sub_800BC84, 0x0800BC84 + 1
	.set sub_800BCA8, 0x0800BCA8 + 1
	.section .text.sub_800EDC4, "ax", %progbits
@ sub_800EDC4 @ JP 0x0800EDC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800EDC4
	.thumb_func
sub_800EDC4:
	push {lr}
	movs r0, #3
	movs r1, #2
	movs r2, #0xa
	bl sub_800BC00
	movs r0, #3
	movs r1, #2
	movs r2, #1
	bl sub_800BC44
	movs r0, #8
	movs r1, #0
	movs r2, #6
	bl sub_800BC84
	movs r1, #8
	rsbs r1, r1, #0
	movs r0, #2
	bl sub_800BCA8
	ldr r2, _0800EE10 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_0800EE10: .4byte 0x03003020


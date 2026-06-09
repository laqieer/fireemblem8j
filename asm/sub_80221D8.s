	.syntax unified
	.set sub_804F610, 0x0804F610 + 1
	.section .text.sub_80221D8, "ax", %progbits
@ sub_80221D8 @ JP 0x080221D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80221D8
	.thumb_func
sub_80221D8:
	push {lr}
	ldr r2, _080221FC @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	bl sub_804F610
	pop {r0}
	bx r0
	.align 2, 0
_080221FC: .4byte 0x03003020


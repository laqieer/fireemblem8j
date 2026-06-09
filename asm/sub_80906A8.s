	.syntax unified
	.section .text.sub_80906A8, "ax", %progbits
@ sub_80906A8 @ JP 0x080906A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80906A8
	.thumb_func
sub_80906A8:
	ldr r2, _080906C4 @ =0x03003020
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
	bx lr
	.align 2, 0
_080906C4: .4byte 0x03003020


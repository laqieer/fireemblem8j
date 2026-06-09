	.syntax unified
	.section .text.sub_80986E8, "ax", %progbits
@ sub_80986E8 @ JP 0x080986E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80986E8
	.thumb_func
sub_80986E8:
	ldr r2, _08098704 @ =0x03003020
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
_08098704: .4byte 0x03003020


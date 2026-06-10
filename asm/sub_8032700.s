	.syntax unified
	.set sub_8018E64, 0x08018E64 + 1
	.section .text.sub_8032700, "ax", %progbits
@ sub_8032700 @ JP 0x08032700 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8032700
	.thumb_func
sub_8032700:
	push {lr}
	bl sub_8018E64
	cmp r0, #0
	bne _0803270E
	movs r0, #1
	b _08032710
_0803270E:
	movs r0, #0
_08032710:
	pop {r1}
	bx r1


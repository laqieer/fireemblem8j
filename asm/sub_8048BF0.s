	.syntax unified
	.section .text.sub_8048BF0, "ax", %progbits
@ sub_8048BF0 @ JP 0x08048BF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8048BF0
	.thumb_func
sub_8048BF0:
	push {lr}
	ldrb r0, [r0]
	cmp r0, #2
	bgt _08048C00
	cmp r0, #0
	blt _08048C00
	movs r0, #1
	b _08048C02
_08048C00:
	movs r0, #0
_08048C02:
	pop {r1}
	bx r1
	.align 2, 0


	.syntax unified
	.section .text.sub_8048D60, "ax", %progbits
@ sub_8048D60 @ JP 0x08048D60 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8048D60
	.thumb_func
sub_8048D60:
	push {lr}
	ldrb r0, [r0]
	cmp r0, #0x66
	beq _08048D6C
	movs r0, #0
	b _08048D6E
_08048D6C:
	movs r0, #1
_08048D6E:
	pop {r1}
	bx r1
	.align 2, 0


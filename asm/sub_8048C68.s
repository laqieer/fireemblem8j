	.syntax unified
	.section .text.sub_8048C68, "ax", %progbits
@ sub_8048C68 @ JP 0x08048C68 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8048C68
	.thumb_func
sub_8048C68:
	push {lr}
	ldrb r0, [r0]
	cmp r0, #0x55
	beq _08048C74
	movs r0, #0
	b _08048C76
_08048C74:
	movs r0, #1
_08048C76:
	pop {r1}
	bx r1
	.align 2, 0


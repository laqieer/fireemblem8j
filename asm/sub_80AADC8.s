	.syntax unified
	.set sub_80A776C, 0x080A776C + 1
	.section .text.sub_80AADC8, "ax", %progbits
@ sub_80AADC8 @ JP 0x080AADC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AADC8
	.thumb_func
sub_80AADC8:
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl sub_80A776C
	mov r0, sp
	adds r0, #0x63
	ldrb r0, [r0]
	cmp r0, #1
	beq _080AADE0
	movs r0, #0
	b _080AADE2
_080AADE0:
	movs r0, #1
_080AADE2:
	add sp, #0x64
	pop {r1}
	bx r1


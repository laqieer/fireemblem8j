	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80C6E4C, "ax", %progbits
@ sub_80C6E4C @ JP 0x080C6E4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C6E4C
	.thumb_func
sub_80C6E4C:
	push {lr}
	adds r2, r0, #0
	adds r0, #0x29
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080C6E62
	adds r0, r2, #0
	bl sub_8002DE4
_080C6E62:
	pop {r0}
	bx r0
	.align 2, 0


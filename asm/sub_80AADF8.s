	.syntax unified
	.set sub_80A776C, 0x080A776C + 1
	.set sub_80A7814, 0x080A7814 + 1
	.section .text.sub_80AADF8, "ax", %progbits
@ sub_80AADF8 @ JP 0x080AADF8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AADF8
	.thumb_func
sub_80AADF8:
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl sub_80A776C
	movs r2, #0
	mov r1, sp
	adds r1, #0x63
	ldrb r0, [r1]
	cmp r0, #0
	bne _080AAE10
	movs r2, #1
_080AAE10:
	strb r2, [r1]
	mov r0, sp
	bl sub_80A7814
	add sp, #0x64
	pop {r0}
	bx r0
	.align 2, 0


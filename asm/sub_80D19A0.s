	.syntax unified
	.set sub_80A776C, 0x080A776C + 1
	.set sub_80A7828, 0x080A7828 + 1
	.section .text.sub_80D19A0, "ax", %progbits
@ sub_80D19A0 @ JP 0x080D19A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D19A0
	.thumb_func
sub_80D19A0:
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl sub_80A776C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080D19BA
	bl sub_80A7828
	mov r0, sp
	bl sub_80A776C
_080D19BA:
	mov r0, sp
	ldrb r1, [r0, #0xe]
	movs r0, #0x1c
	ands r0, r1
	cmp r0, #0
	beq _080D19D2
	movs r0, #0xe0
	ands r0, r1
	cmp r0, #0
	beq _080D19D2
	movs r0, #1
	b _080D19D4
_080D19D2:
	movs r0, #0
_080D19D4:
	add sp, #0x64
	pop {r1}
	bx r1
	.align 2, 0


	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_80265CC, 0x080265CC + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80901D8, "ax", %progbits
@ sub_80901D8 @ JP 0x080901D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80901D8
	.thumb_func
sub_80901D8:
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08090200
	movs r0, #0
	str r0, [sp]
	ldr r1, _080901F8 @ =0x02022C48
	ldr r2, _080901FC @ =0x01000008
	mov r0, sp
	bl sub_80D636C
	bl sub_8001EE4
	b _08090204
	.align 2, 0
_080901F8: .4byte 0x02022C48
_080901FC: .4byte 0x01000008
_08090200:
	bl sub_80265CC
_08090204:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0


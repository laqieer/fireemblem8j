	.syntax unified
	.set IsExtraMapAvailable, 0x080AB634 + 1
	.set sub_80A776C, 0x080A776C + 1
	.section .text.sub_80A7E08, "ax", %progbits
@ sub_80A7E08 @ JP 0x080A7E08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A7E08
	.thumb_func
sub_80A7E08:
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl sub_80A776C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A7E26
	bl IsExtraMapAvailable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A7E26
	movs r0, #1
	b _080A7E28
_080A7E26:
	movs r0, #0
_080A7E28:
	add sp, #0x64
	pop {r1}
	bx r1
	.align 2, 0


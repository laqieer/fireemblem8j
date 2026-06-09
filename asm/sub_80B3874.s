	.syntax unified
	.set sub_80A776C, 0x080A776C + 1
	.section .text.sub_80B3874, "ax", %progbits
@ sub_80B3874 @ JP 0x080B3874 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B3874
	.thumb_func
sub_80B3874:
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl sub_80A776C
	movs r0, #0
	add sp, #0x64
	pop {r1}
	bx r1
	.align 2, 0


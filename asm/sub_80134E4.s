	.syntax unified
	.set memcpy, 0x080D6908 + 1
	.section .text.sub_80134E4, "ax", %progbits
@ sub_80134E4 @ JP 0x080134E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80134E4
	.thumb_func
sub_80134E4:
	push {lr}
	sub sp, #0x10
	ldr r1, _08013500 @ =0x080DC584
	mov r0, sp
	movs r2, #0xd
	bl memcpy
	mov r0, sp
	bl sub_80134E4
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_08013500: .4byte 0x080DC584


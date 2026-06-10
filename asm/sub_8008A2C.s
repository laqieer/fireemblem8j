	.syntax unified
	.set sub_80148F0, 0x080148F0 + 1
	.section .text.sub_8008A2C, "ax", %progbits
@ sub_8008A2C @ JP 0x08008A2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8008A2C
	.thumb_func
sub_8008A2C:
	push {lr}
	ldr r0, _08008A3C @ =sub_8008A20
	movs r1, #1
	bl sub_80148F0
	pop {r0}
	bx r0
	.align 2, 0
_08008A3C: .4byte 0x08008A21  @ sub_8008A20


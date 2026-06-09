	.syntax unified
	.set sub_8019994, 0x08019994 + 1
	.section .text.sub_8033D94, "ax", %progbits
@ sub_8033D94 @ JP 0x08033D94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8033D94
	.thumb_func
sub_8033D94:
	push {lr}
	ldr r0, _08033DA8 @ =0x0202BCEC
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08033DA2
	bl sub_8019994
_08033DA2:
	pop {r0}
	bx r0
	.align 2, 0
_08033DA8: .4byte 0x0202BCEC


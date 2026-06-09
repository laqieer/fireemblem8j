	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80975B4, 0x080975B4 + 1
	.set sub_8097B20, 0x08097B20 + 1
	.section .text.sub_809874C, "ax", %progbits
@ sub_809874C @ JP 0x0809874C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809874C
	.thumb_func
sub_809874C:
	push {lr}
	ldr r0, _08098764 @ =0x08A93FE8
	movs r1, #3
	bl sub_8002BCC
	bl sub_8097B20
	bl sub_80975B4
	pop {r0}
	bx r0
	.align 2, 0
_08098764: .4byte 0x08A93FE8


	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8081BB8, "ax", %progbits
@ sub_8081BB8 @ JP 0x08081BB8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8081BB8
	.thumb_func
sub_8081BB8:
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _08081BCC
	ldr r0, _08081BC8 @ =0x08A149D4
	bl Proc_StartBlocking
	b _08081BD4
	.align 2, 0
_08081BC8: .4byte 0x08A149D4
_08081BCC:
	ldr r0, _08081BD8 @ =0x08A149D4
	movs r1, #3
	bl sub_8002BCC
_08081BD4:
	pop {r0}
	bx r0
	.align 2, 0
_08081BD8: .4byte 0x08A149D4


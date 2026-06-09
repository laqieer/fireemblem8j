	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_809897C, "ax", %progbits
@ sub_809897C @ JP 0x0809897C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809897C
	.thumb_func
sub_809897C:
	push {lr}
	ldr r0, _08098990 @ =0x08A94238
	bl Proc_Find
	cmp r0, #0
	beq _0809898A
	movs r0, #1
_0809898A:
	pop {r1}
	bx r1
	.align 2, 0
_08098990: .4byte 0x08A94238


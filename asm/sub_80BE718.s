	.syntax unified
	.set Proc_BlockEachMarked, 0x08002F3C + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80BE718, "ax", %progbits
@ sub_80BE718 @ JP 0x080BE718 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BE718
	.thumb_func
sub_80BE718:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #8
	bl Proc_BlockEachMarked
	ldr r0, _080BE734 @ =0x08BABD6C
	adds r1, r4, #0
	bl Proc_StartBlocking
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080BE734: .4byte 0x08BABD6C


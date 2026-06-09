	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80C7FB4, "ax", %progbits
@ sub_80C7FB4 @ JP 0x080C7FB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C7FB4
	.thumb_func
sub_80C7FB4:
	push {lr}
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #0
	beq _080C7FC4
	cmp r1, #1
	beq _080C7FCC
_080C7FC4:
	movs r1, #1
	bl Proc_Goto
	b _080C7FD2
_080C7FCC:
	movs r1, #2
	bl Proc_Goto
_080C7FD2:
	pop {r0}
	bx r0
	.align 2, 0


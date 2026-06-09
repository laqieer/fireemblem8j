	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80C7F7C, "ax", %progbits
@ sub_80C7F7C @ JP 0x080C7F7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C7F7C
	.thumb_func
sub_80C7F7C:
	push {lr}
	adds r2, r0, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080C7F94
	adds r0, r2, #0
	movs r1, #0
	bl Proc_Goto
_080C7F94:
	pop {r0}
	bx r0


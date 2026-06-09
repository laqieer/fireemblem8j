	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80A2BC0, "ax", %progbits
@ sub_80A2BC0 @ JP 0x080A2BC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A2BC0
	.thumb_func
sub_80A2BC0:
	push {lr}
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #1
	beq _080A2BE4
	cmp r1, #1
	bgt _080A2BD6
	cmp r1, #0
	beq _080A2BDC
	b _080A2BF2
_080A2BD6:
	cmp r1, #2
	beq _080A2BEC
	b _080A2BF2
_080A2BDC:
	movs r1, #2
	bl Proc_Goto
	b _080A2BF2
_080A2BE4:
	movs r1, #3
	bl Proc_Goto
	b _080A2BF2
_080A2BEC:
	movs r1, #4
	bl Proc_Goto
_080A2BF2:
	pop {r0}
	bx r0
	.align 2, 0


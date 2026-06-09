	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_8009AB4, "ax", %progbits
@ sub_8009AB4 @ JP 0x08009AB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009AB4
	.thumb_func
sub_8009AB4:
	push {lr}
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #0
	beq _08009AC6
	cmp r1, #1
	beq _08009ACE
	b _08009AD4
_08009AC6:
	movs r1, #3
	bl Proc_Goto
	b _08009AD4
_08009ACE:
	movs r1, #0
	bl Proc_Goto
_08009AD4:
	pop {r0}
	bx r0


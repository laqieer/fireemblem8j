	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_808767C, "ax", %progbits
@ sub_808767C @ JP 0x0808767C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808767C
	.thumb_func
sub_808767C:
	push {lr}
	adds r2, r0, #0
	ldr r0, _08087698 @ =0x0202BCEC
	ldrb r1, [r0, #0x14]
	movs r0, #0x88
	ands r0, r1
	cmp r0, #0
	beq _08087694
	adds r0, r2, #0
	movs r1, #0
	bl Proc_Goto
_08087694:
	pop {r0}
	bx r0
	.align 2, 0
_08087698: .4byte 0x0202BCEC


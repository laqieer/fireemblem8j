	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80BCEA0, "ax", %progbits
@ sub_80BCEA0 @ JP 0x080BCEA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BCEA0
	.thumb_func
sub_80BCEA0:
	push {lr}
	adds r2, r0, #0
	ldr r0, _080BCEBC @ =0x0202BCEC
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080BCEC0
	adds r0, r2, #0
	movs r1, #1
	bl Proc_Goto
	b _080BCEC8
	.align 2, 0
_080BCEBC: .4byte 0x0202BCEC
_080BCEC0:
	adds r0, r2, #0
	movs r1, #0
	bl Proc_Goto
_080BCEC8:
	pop {r0}
	bx r0


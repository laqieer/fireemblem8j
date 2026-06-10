	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8097C50, 0x08097C50 + 1
	.section .text.sub_80332B4, "ax", %progbits
@ sub_80332B4 @ JP 0x080332B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80332B4
	.thumb_func
sub_80332B4:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8097C50
	cmp r0, #0
	beq _080332CC
	adds r0, r4, #0
	movs r1, #0x37
	bl Proc_Goto
	movs r0, #1
	b _080332CE
_080332CC:
	movs r0, #0
_080332CE:
	pop {r4}
	pop {r1}
	bx r1


	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_8009CCC, "ax", %progbits
@ sub_8009CCC @ JP 0x08009CCC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009CCC
	.thumb_func
sub_8009CCC:
	push {lr}
	adds r2, r0, #0
	ldr r0, _08009CE8 @ =0x0202BCEC
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08009CEC
	adds r0, r2, #0
	movs r1, #9
	bl Proc_Goto
	b _08009CF4
	.align 2, 0
_08009CE8: .4byte 0x0202BCEC
_08009CEC:
	adds r0, r2, #0
	movs r1, #8
	bl Proc_Goto
_08009CF4:
	pop {r0}
	bx r0


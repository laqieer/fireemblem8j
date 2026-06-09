	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_8009CA4, "ax", %progbits
@ sub_8009CA4 @ JP 0x08009CA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009CA4
	.thumb_func
sub_8009CA4:
	push {lr}
	adds r2, r0, #0
	ldr r0, _08009CC8 @ =0x0202BCEC
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08009CC4
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08009CC4
	adds r0, r2, #0
	movs r1, #0x10
	bl Proc_Goto
_08009CC4:
	pop {r0}
	bx r0
	.align 2, 0
_08009CC8: .4byte 0x0202BCEC


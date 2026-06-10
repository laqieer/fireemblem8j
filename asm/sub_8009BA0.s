	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_8009BA0, "ax", %progbits
@ sub_8009BA0 @ JP 0x08009BA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009BA0
	.thumb_func
sub_8009BA0:
	push {lr}
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #0
	beq _08009BB6
	cmp r1, #1
	bne _08009BB6
	movs r1, #0x12
	bl Proc_Goto
_08009BB6:
	pop {r0}
	bx r0
	.align 2, 0


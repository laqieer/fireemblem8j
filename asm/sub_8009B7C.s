	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_8009B7C, "ax", %progbits
@ sub_8009B7C @ JP 0x08009B7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009B7C
	.thumb_func
sub_8009B7C:
	push {lr}
	adds r1, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #5
	bne _08009B90
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Goto
_08009B90:
	pop {r0}
	bx r0


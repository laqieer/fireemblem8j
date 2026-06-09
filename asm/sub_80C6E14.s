	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80C6E14, "ax", %progbits
@ sub_80C6E14 @ JP 0x080C6E14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C6E14
	.thumb_func
sub_80C6E14:
	push {lr}
	adds r2, r0, #0
	adds r0, #0x29
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080C6E2C
	adds r0, r2, #0
	movs r1, #0
	bl Proc_Goto
_080C6E2C:
	pop {r0}
	bx r0


	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80ADA2C, "ax", %progbits
@ sub_80ADA2C @ JP 0x080ADA2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80ADA2C
	.thumb_func
sub_80ADA2C:
	push {lr}
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	bl Proc_Goto
	pop {r0}
	bx r0


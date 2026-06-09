	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80AEF3C, "ax", %progbits
@ sub_80AEF3C @ JP 0x080AEF3C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AEF3C
	.thumb_func
sub_80AEF3C:
	push {lr}
	adds r1, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #3
	bne _080AEF52
	adds r0, r1, #0
	movs r1, #2
	bl Proc_Goto
	b _080AEF5A
_080AEF52:
	adds r0, r1, #0
	movs r1, #5
	bl Proc_Goto
_080AEF5A:
	pop {r0}
	bx r0
	.align 2, 0


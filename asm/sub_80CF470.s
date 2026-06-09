	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.section .text.sub_80CF470, "ax", %progbits
@ sub_80CF470 @ JP 0x080CF470 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CF470
	.thumb_func
sub_80CF470:
	push {lr}
	ldr r0, _080CF4A0 @ =0x08B3F670
	bl Proc_EndEach
	ldr r2, _080CF4A4 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	bl SetDefaultColorEffects
	pop {r0}
	bx r0
	.align 2, 0
_080CF4A0: .4byte 0x08B3F670
_080CF4A4: .4byte 0x03003020


	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80AE850, "ax", %progbits
@ sub_80AE850 @ JP 0x080AE850 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AE850
	.thumb_func
sub_80AE850:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r1, r3, #0
	ldr r0, _080AE86C @ =0x08A9CF94
	bl Proc_StartBlocking
	str r4, [r0, #0x58]
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AE86C: .4byte 0x08A9CF94


	.syntax unified
	.set GetPhaseAbleUnitCount, 0x08024C9C + 1
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_801EF04, "ax", %progbits
@ sub_801EF04 @ JP 0x0801EF04 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801EF04
	.thumb_func
sub_801EF04:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801EF20 @ =0x0202BCEC
	ldrb r0, [r0, #0xf]
	bl GetPhaseAbleUnitCount
	cmp r0, #0
	bne _0801EF1A
	adds r0, r4, #0
	bl Proc_End
_0801EF1A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801EF20: .4byte 0x0202BCEC


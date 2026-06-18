	.syntax unified
	.set GetUnitItemCount, 0x08017780 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_809EF04, "ax", %progbits
@ PrepItemUse_PostPromotion @ JP 0x0809EF04 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PrepItemUse_PostPromotion
	.thumb_func
PrepItemUse_PostPromotion:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r1, r0, #0
	cmp r1, #0
	bne _0809EF1E
	adds r0, r4, #0
	movs r1, #7
	bl Proc_Goto
	b _0809EF2E
_0809EF1E:
	ldr r0, [r4, #0x30]
	cmp r0, r1
	blt _0809EF28
	subs r0, #1
	str r0, [r4, #0x30]
_0809EF28:
	adds r0, r4, #0
	bl sub_8002DE4
_0809EF2E:
	pop {r4}
	pop {r0}
	bx r0


	.syntax unified
	.set sub_8004504, 0x08004504 + 1
	.set sub_808C834, 0x0808C834 + 1
	.section .text.sub_808D42C, "ax", %progbits
@ sub_808D42C @ JP 0x0808D42C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808D42C
	.thumb_func
sub_808D42C:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0808D484 @ =0x0203E7FC
	adds r0, r4, #0
	bl sub_8004504
	adds r0, r4, #0
	adds r0, #8
	bl sub_8004504
	adds r0, r4, #0
	adds r0, #0x10
	bl sub_8004504
	bl sub_808C834
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808D470
	bl sub_808C834
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _0808D470
	adds r0, r4, #0
	adds r0, #0x18
	bl sub_8004504
	adds r0, r4, #0
	adds r0, #0x20
	bl sub_8004504
_0808D470:
	adds r0, r5, #0
	adds r0, #0x58
	movs r1, #0
	strb r1, [r0]
	subs r0, #0x10
	strh r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808D484: .4byte 0x0203E7FC


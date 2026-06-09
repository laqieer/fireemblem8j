	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set StartItemHelpBox, 0x0808B0EC + 1
	.section .text.sub_8024590, "ax", %progbits
@ sub_8024590 @ JP 0x08024590 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024590
	.thumb_func
sub_8024590:
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, _080245C4 @ =0x0203A954
	ldrb r0, [r0, #0xd]
	bl GetUnit
	movs r1, #0x2a
	ldrsh r3, [r4, r1]
	lsls r3, r3, #3
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	lsls r1, r1, #3
	adds r4, #0x3c
	movs r2, #0
	ldrsb r2, [r4, r2]
	lsls r2, r2, #1
	adds r0, #0x1e
	adds r0, r0, r2
	ldrh r2, [r0]
	adds r0, r3, #0
	bl StartItemHelpBox
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080245C4: .4byte 0x0203A954


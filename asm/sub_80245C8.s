	.syntax unified
	.set StartItemHelpBox, 0x0808B0EC + 1
	.set sub_8037A24, 0x08037A24 + 1
	.section .text.sub_80245C8, "ax", %progbits
@ sub_80245C8 @ JP 0x080245C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80245C8
	.thumb_func
sub_80245C8:
	push {r4, r5, lr}
	movs r0, #0x2a
	ldrsh r5, [r1, r0]
	lsls r5, r5, #3
	movs r0, #0x2c
	ldrsh r4, [r1, r0]
	lsls r4, r4, #3
	ldr r0, _080245F8 @ =0x03004DF0
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_8037A24
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl StartItemHelpBox
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080245F8: .4byte 0x03004DF0


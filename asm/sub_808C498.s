	.syntax unified
	.set __divsi3, 0x080D65F8 + 1
	.set sub_808C74C, 0x0808C74C + 1
	.set sub_808C754, 0x0808C754 + 1
	.section .text.sub_808C498, "ax", %progbits
@ sub_808C498 @ JP 0x0808C498 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808C498
	.thumb_func
sub_808C498:
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_808C754
	ldr r0, [r4, #0x2c]
	ldrb r1, [r0, #0x10]
	ldrb r2, [r0, #0x11]
	adds r0, r4, #0
	bl sub_808C74C
	adds r5, r4, #0
	adds r5, #0x4a
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #3
	bl __divsi3
	strh r0, [r5]
	adds r4, #0x48
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0


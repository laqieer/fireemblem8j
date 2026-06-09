	.syntax unified
	.set __divsi3, 0x080D65F8 + 1
	.set sub_808B54C, 0x0808B54C + 1
	.section .text.sub_808CCAC, "ax", %progbits
@ sub_808CCAC @ JP 0x0808CCAC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808CCAC
	.thumb_func
sub_808CCAC:
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_808B54C
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


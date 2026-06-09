	.syntax unified
	.set sub_808B750, 0x0808B750 + 1
	.section .text.sub_80AEF60, "ax", %progbits
@ sub_80AEF60 @ JP 0x080AEF60 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AEF60
	.thumb_func
sub_80AEF60:
	push {lr}
	adds r3, r0, #0
	adds r0, #0x42
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _080AEF7A
	movs r0, #0xc0
	movs r1, #8
	movs r2, #8
	bl sub_808B750
_080AEF7A:
	pop {r0}
	bx r0
	.align 2, 0


	.syntax unified
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_808B670, "ax", %progbits
@ sub_808B670 @ JP 0x0808B670 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808B670
	.thumb_func
sub_808B670:
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x2c]
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _0808B680
	movs r0, #0
	b _0808B69A
_0808B680:
	str r0, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x50
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, [r2, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _0808B698
	adds r0, r2, #0
	bl sub_80D65C0
_0808B698:
	movs r0, #1
_0808B69A:
	pop {r1}
	bx r1
	.align 2, 0


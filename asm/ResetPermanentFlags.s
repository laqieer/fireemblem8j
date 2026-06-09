	.syntax unified
	.section .text.ResetPermanentFlags, "ax", %progbits
@ ResetPermanentFlags @ JP 0x08086040 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ResetPermanentFlags
	.thumb_func
ResetPermanentFlags:
	push {lr}
	ldr r1, _08086058 @ =0x03005240
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x18
_0808604A:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _0808604A
	pop {r0}
	bx r0
	.align 2, 0
_08086058: .4byte 0x03005240


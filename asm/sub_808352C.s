	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.section .text.sub_808352C, "ax", %progbits
@ sub_808352C @ JP 0x0808352C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808352C
	.thumb_func
sub_808352C:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	adds r4, #0x40
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0


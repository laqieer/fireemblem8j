	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set sub_804F610, 0x0804F610 + 1
	.section .text.sub_808F44C, "ax", %progbits
@ sub_808F44C @ JP 0x0808F44C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808F44C
	.thumb_func
sub_808F44C:
	push {lr}
	ldr r0, _0808F478 @ =0x08A739C4
	bl Proc_EndEach
	ldr r0, _0808F47C @ =0x08A73A4C
	bl Proc_EndEach
	ldr r0, _0808F480 @ =0x08A73964
	bl Proc_EndEach
	ldr r0, _0808F484 @ =0x08A73A9C
	bl Proc_EndEach
	ldr r0, _0808F488 @ =0x08A73AFC
	bl Proc_EndEach
	bl SetDefaultColorEffects
	bl sub_804F610
	pop {r0}
	bx r0
	.align 2, 0
_0808F478: .4byte 0x08A739C4
_0808F47C: .4byte 0x08A73A4C
_0808F480: .4byte 0x08A73964
_0808F484: .4byte 0x08A73A9C
_0808F488: .4byte 0x08A73AFC


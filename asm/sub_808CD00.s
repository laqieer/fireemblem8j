	.syntax unified
	.set Proc_BreakEach, 0x08002FE4 + 1
	.set sub_808DDB4, 0x0808DDB4 + 1
	.section .text.sub_808CD00, "ax", %progbits
@ sub_808CD00 @ JP 0x0808CD00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808CD00
	.thumb_func
sub_808CD00:
	push {lr}
	bl sub_808DDB4
	ldr r0, _0808CD10 @ =0x08A737F8
	bl Proc_BreakEach
	pop {r0}
	bx r0
	.align 2, 0
_0808CD10: .4byte 0x08A737F8


	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_808DE84, "ax", %progbits
@ sub_808DE84 @ JP 0x0808DE84 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808DE84
	.thumb_func
sub_808DE84:
	push {lr}
	ldr r0, _0808DEA8 @ =0x08A73798
	bl Proc_EndEach
	ldr r0, _0808DEAC @ =0x08A738D0
	bl Proc_EndEach
	ldr r0, _0808DEB0 @ =0x08A737F8
	bl Proc_EndEach
	ldr r0, _0808DEB4 @ =0x08A73818
	bl Proc_EndEach
	ldr r0, _0808DEB8 @ =0x08A738B8
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0808DEA8: .4byte 0x08A73798
_0808DEAC: .4byte 0x08A738D0
_0808DEB0: .4byte 0x08A737F8
_0808DEB4: .4byte 0x08A73818
_0808DEB8: .4byte 0x08A738B8


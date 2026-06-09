	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_808DE54, "ax", %progbits
@ sub_808DE54 @ JP 0x0808DE54 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808DE54
	.thumb_func
sub_808DE54:
	push {lr}
	ldr r0, _0808DE64 @ =0x08A738D0
	movs r1, #0
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_0808DE64: .4byte 0x08A738D0


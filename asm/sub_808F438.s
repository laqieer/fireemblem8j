	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_808F438, "ax", %progbits
@ sub_808F438 @ JP 0x0808F438 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808F438
	.thumb_func
sub_808F438:
	push {lr}
	ldr r0, _0808F448 @ =0x08A73A7C
	movs r1, #3
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_0808F448: .4byte 0x08A73A7C


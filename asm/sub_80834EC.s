	.syntax unified
	.set sub_8014494, 0x08014494 + 1
	.section .text.sub_80834EC, "ax", %progbits
@ sub_80834EC @ JP 0x080834EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80834EC
	.thumb_func
sub_80834EC:
	push {lr}
	bl sub_8014494
	ldr r2, _0808350C @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_0808350C: .4byte 0x03003020


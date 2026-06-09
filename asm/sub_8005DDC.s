	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8005DDC, "ax", %progbits
@ sub_8005DDC @ JP 0x08005DDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8005DDC
	.thumb_func
sub_8005DDC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08005DF0 @ =0x085B8FCC
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x54]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005DF0: .4byte 0x085B8FCC


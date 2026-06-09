	.syntax unified
	.set sub_8013008, 0x08013008 + 1
	.set sub_808B750, 0x0808B750 + 1
	.section .text.sub_8033458, "ax", %progbits
@ sub_8033458 @ JP 0x08033458 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8033458
	.thumb_func
sub_8033458:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xc
	movs r1, #0x8c
	movs r2, #2
	adds r3, r4, #0
	bl sub_808B750
	ldr r0, _0803347C @ =0x08A95E80
	ldr r1, _08033480 @ =0x06017000
	bl sub_8013008
	movs r0, #0
	str r0, [r4, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803347C: .4byte 0x08A95E80
_08033480: .4byte 0x06017000


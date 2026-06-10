	.syntax unified
	.set StoreRNState, 0x08000C24 + 1
	.set sub_80316E0, 0x080316E0 + 1
	.section .text.sub_80317C0, "ax", %progbits
@ sub_80317C0 @ JP 0x080317C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80317C0
	.thumb_func
sub_80317C0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080317D8 @ =0x0203A95A
	bl StoreRNState
	adds r0, r4, #0
	bl sub_80316E0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080317D8: .4byte 0x0203A95A


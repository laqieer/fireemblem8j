	.syntax unified
	.set sub_800D340, 0x0800D340 + 1
	.set sub_802DDA4, 0x0802DDA4 + 1
	.set sub_802E064, 0x0802E064 + 1
	.section .text.sub_802E0A0, "ax", %progbits
@ sub_802E0A0 @ JP 0x0802E0A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802E0A0
	.thumb_func
sub_802E0A0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0802E0BC @ =0x085C4188
	movs r1, #3
	bl sub_800D340
	adds r0, r4, #0
	bl sub_802E064
	bl sub_802DDA4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E0BC: .4byte 0x085C4188


	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_808B2A4, 0x0808B2A4 + 1
	.section .text.sub_80AF17C, "ax", %progbits
@ sub_80AF17C @ JP 0x080AF17C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AF17C
	.thumb_func
sub_80AF17C:
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0x1e
	ble _080AF1AC
	ldr r0, _080AF1A8 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _080AF1B0
	bl sub_808B2A4
	adds r0, r4, #0
	bl sub_8002DE4
	b _080AF1B0
	.align 2, 0
_080AF1A8: .4byte 0x085775CC
_080AF1AC:
	adds r0, r2, #1
	strh r0, [r1]
_080AF1B0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0


	.syntax unified
	.section .text.sub_80BFE10, "ax", %progbits
@ sub_80BFE10 @ JP 0x080BFE10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BFE10
	.thumb_func
sub_80BFE10:
	push {lr}
	lsls r2, r2, #0x18
	lsls r1, r1, #2
	adds r0, #0x34
	adds r0, r0, r1
	ldr r3, [r0]
	cmp r2, #0
	beq _080BFE28
	ldrh r1, [r3, #0x2a]
	movs r0, #2
	orrs r0, r1
	b _080BFE2E
_080BFE28:
	ldrh r1, [r3, #0x2a]
	ldr r0, _080BFE34 @ =0x0000FFFD
	ands r0, r1
_080BFE2E:
	strh r0, [r3, #0x2a]
	pop {r0}
	bx r0
	.align 2, 0
_080BFE34: .4byte 0x0000FFFD


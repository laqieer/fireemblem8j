	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_805C28C, "ax", %progbits
@ sub_805C28C @ JP 0x0805C28C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805C28C
	.thumb_func
sub_805C28C:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0805C2CC @ =0x085FF1E8
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r5, [r0, #0x44]
	ldr r2, _0805C2D0 @ =0x0201FDC4
_0805C2A6:
	lsrs r0, r1, #1
	rsbs r0, r0, #0
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x77
	bls _0805C2A6
	ldr r2, _0805C2D4 @ =0x0201FF04
	movs r1, #0
_0805C2B8:
	lsrs r0, r1, #1
	rsbs r0, r0, #0
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x77
	bls _0805C2B8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C2CC: .4byte 0x085FF1E8
_0805C2D0: .4byte 0x0201FDC4
_0805C2D4: .4byte 0x0201FF04


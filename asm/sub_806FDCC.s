	.syntax unified
	.section .text.sub_806FDCC, "ax", %progbits
@ sub_806FDCC @ JP 0x0806FDCC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806FDCC
	.thumb_func
sub_806FDCC:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _0806FE10 @ =0x0201FDB8
	ldr r0, [r0]
	ldr r3, _0806FE14 @ =0x0201FDC4
	cmp r0, #0
	bne _0806FDDC
	ldr r3, _0806FE18 @ =0x0201FF04
_0806FDDC:
	movs r2, #0
	movs r6, #0x88
	lsls r6, r6, #0x10
	movs r5, #0x88
	ldr r4, _0806FE1C @ =0x086037A4
_0806FDE6:
	cmp r2, #0x77
	bhi _0806FE2E
	movs r0, #0
	ldrsh r1, [r4, r0]
	ldr r0, [r7, #0x44]
	muls r0, r1, r0
	lsls r0, r0, #4
	asrs r1, r0, #0x10
	cmp r1, #0
	beq _0806FE2A
	cmp r2, #0x3b
	bhi _0806FE24
	adds r0, r2, #0
	subs r0, #0x88
	cmp r1, r0
	bhs _0806FE2A
	ldr r1, _0806FE20 @ =0x0000FF78
	adds r0, r2, r1
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	b _0806FE2A
	.align 2, 0
_0806FE10: .4byte 0x0201FDB8
_0806FE14: .4byte 0x0201FDC4
_0806FE18: .4byte 0x0201FF04
_0806FE1C: .4byte 0x086037A4
_0806FE20: .4byte 0x0000FF78
_0806FE24:
	cmp r1, r5
	bls _0806FE2A
	asrs r1, r6, #0x10
_0806FE2A:
	strh r1, [r3]
	b _0806FE32
_0806FE2E:
	movs r0, #0
	strh r0, [r3]
_0806FE32:
	adds r3, #2
	ldr r0, _0806FE48 @ =0xFFFF0000
	adds r6, r6, r0
	subs r5, #1
	adds r4, #2
	adds r2, #1
	cmp r2, #0x9f
	bls _0806FDE6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FE48: .4byte 0xFFFF0000


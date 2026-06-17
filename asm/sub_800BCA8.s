	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.section .text.sub_800BCA8, "ax", %progbits
@ BgChangeChr @ JP 0x0800BCA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BgChangeChr
	.thumb_func
BgChangeChr:
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	asrs r4, r1, #0x18
	adds r0, r5, #0
	bl sub_8001BC0
	adds r2, r0, #0
	movs r3, #0
	ldr r7, _0800BCEC @ =0x00000FFF
	ldr r6, _0800BCF0 @ =0x000003FF
_0800BCC0:
	ldrh r0, [r2]
	lsrs r1, r0, #0xc
	adds r1, r1, r4
	lsls r1, r1, #0x18
	ands r0, r7
	lsrs r1, r1, #0xc
	orrs r0, r1
	strh r0, [r2]
	adds r2, #2
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r6
	bls _0800BCC0
	movs r0, #1
	lsls r0, r5
	bl BG_EnableSyncByMask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800BCEC: .4byte 0x00000FFF
_0800BCF0: .4byte 0x000003FF


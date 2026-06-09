	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_8066444, "ax", %progbits
@ sub_8066444 @ JP 0x08066444 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8066444
	.thumb_func
sub_8066444:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _080664A0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080664A4 @ =0x086017C0
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl GetAnimAnotherSide
	ldr r3, _080664A8 @ =0x085FF1C0
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r4, #0x60]
	ldrh r2, [r0, #8]
	ldr r1, _080664AC @ =0x0000F3FF
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	ldr r0, _080664B0 @ =0x0876361C
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _080664B4 @ =0x08763310
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080664A0: .4byte 0x0201774C
_080664A4: .4byte 0x086017C0
_080664A8: .4byte 0x085FF1C0
_080664AC: .4byte 0x0000F3FF
_080664B0: .4byte 0x0876361C
_080664B4: .4byte 0x08763310


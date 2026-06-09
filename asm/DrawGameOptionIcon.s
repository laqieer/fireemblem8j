	.syntax unified
	.section .text.DrawGameOptionIcon, "ax", %progbits
@ DrawGameOptionIcon @ JP 0x080B6320 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global DrawGameOptionIcon
	.thumb_func
DrawGameOptionIcon:
	push {r4, r5, lr}
	lsls r2, r0, #1
	adds r2, r2, r1
	movs r4, #0x1f
	ands r2, r4
	lsls r2, r2, #5
	ldr r3, _080B638C @ =0x08AAF700
	ldr r1, _080B6390 @ =0x08AAF6DC
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x2c
	muls r0, r1, r0
	adds r0, r0, r3
	adds r0, #0x24
	ldrb r1, [r0]
	adds r3, r1, #0
	ands r3, r4
	lsls r0, r1, #1
	ldr r1, _080B6394 @ =0x0000FFC0
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r3, r3, r0
	movs r0, #0x80
	lsls r0, r0, #7
	adds r1, r3, r0
	ldr r4, _080B6398 @ =0x020234A8
	adds r0, r2, #2
	lsls r0, r0, #1
	adds r0, r0, r4
	strh r1, [r0]
	adds r0, r2, #3
	lsls r0, r0, #1
	adds r0, r0, r4
	ldr r5, _080B639C @ =0x00004001
	adds r1, r3, r5
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x22
	lsls r0, r0, #1
	adds r0, r0, r4
	adds r5, #0x1f
	adds r1, r3, r5
	strh r1, [r0]
	adds r2, #0x23
	lsls r2, r2, #1
	adds r2, r2, r4
	ldr r0, _080B63A0 @ =0x00004021
	adds r3, r3, r0
	strh r3, [r2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B638C: .4byte 0x08AAF700
_080B6390: .4byte 0x08AAF6DC
_080B6394: .4byte 0x0000FFC0
_080B6398: .4byte 0x020234A8
_080B639C: .4byte 0x00004001
_080B63A0: .4byte 0x00004021


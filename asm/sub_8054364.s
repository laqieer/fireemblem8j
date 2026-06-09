	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8054364, "ax", %progbits
@ sub_8054364 @ JP 0x08054364 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8054364
	.thumb_func
sub_8054364:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0805439C @ =0x085E39CC
	movs r1, #3
	bl sub_8002BCC
	ldr r2, _080543A0 @ =0x085E39E4
	lsls r1, r4, #3
	adds r1, r1, r2
	ldr r1, [r1]
	str r1, [r0, #0x44]
	lsls r4, r4, #1
	adds r4, #1
	lsls r4, r4, #2
	adds r4, r4, r2
	ldr r1, [r4]
	adds r3, r0, #0
	adds r3, #0x29
	movs r2, #0
	strb r1, [r3]
	adds r1, r0, #0
	adds r1, #0x2a
	strb r5, [r1]
	strh r2, [r0, #0x2c]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805439C: .4byte 0x085E39CC
_080543A0: .4byte 0x085E39E4


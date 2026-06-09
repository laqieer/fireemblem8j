	.syntax unified
	.set LockGame, 0x08015384 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_800D374, "ax", %progbits
@ sub_800D374 @ JP 0x0800D374 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D374
	.thumb_func
sub_800D374:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r6, r1, #0
	ldr r0, _0800D3F8 @ =0x085B98A0
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	movs r2, #0
	str r2, [r5, #0x2c]
	str r4, [r5, #0x30]
	str r4, [r5, #0x34]
	str r4, [r5, #0x38]
	movs r3, #0
	strh r2, [r5, #0x3c]
	strh r2, [r5, #0x3e]
	adds r1, r5, #0
	adds r1, #0x40
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x41
	strb r6, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r4, r5, #0
	adds r4, #0x43
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r4]
	adds r0, r5, #0
	adds r0, #0x44
	strh r2, [r0]
	str r2, [r5, #0x48]
	adds r0, #8
	strh r2, [r0]
	adds r0, #2
	strb r3, [r0]
	ldr r0, _0800D3FC @ =0x03003020
	adds r0, #0x46
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _0800D3DA
	ldrh r0, [r5, #0x3c]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #0x3c]
_0800D3DA:
	cmp r6, #0
	beq _0800D3F0
	cmp r6, #0
	blt _0800D3F0
	cmp r6, #2
	bgt _0800D3F0
	ldr r0, _0800D400 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	strb r0, [r4]
	bl LockGame
_0800D3F0:
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800D3F8: .4byte 0x085B98A0
_0800D3FC: .4byte 0x03003020
_0800D400: .4byte 0x0202BCEC


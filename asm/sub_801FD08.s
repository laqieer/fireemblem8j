	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_801FD08, "ax", %progbits
@ sub_801FD08 @ JP 0x0801FD08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801FD08
	.thumb_func
sub_801FD08:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r4, _0801FD7C @ =0x020234A8
	cmp r5, #0
	bne _0801FD1A
	movs r5, #0xc0
	lsls r5, r5, #0x13
_0801FD1A:
	ldr r0, _0801FD80 @ =0x08BB059C
	lsls r1, r6, #5
	movs r2, #0x40
	bl sub_8000D68
	ldr r0, _0801FD84 @ =0x08BABE04
	adds r1, r5, #0
	bl sub_8013008
	movs r1, #0xf
	adds r0, r6, #0
	ands r0, r1
	lsls r2, r0, #0xc
	adds r0, r6, #1
	ands r0, r1
	lsls r1, r0, #0xc
	movs r3, #0
_0801FD3C:
	adds r0, r3, r2
	strh r0, [r4]
	adds r4, #2
	adds r3, #1
	cmp r3, #0xdf
	ble _0801FD3C
	ldr r5, _0801FD88 @ =0x0000019F
	ldr r6, _0801FD8C @ =0x085C3588
	cmp r3, r5
	bgt _0801FD5C
_0801FD50:
	adds r0, r3, r1
	strh r0, [r4]
	adds r4, #2
	adds r3, #1
	cmp r3, r5
	ble _0801FD50
_0801FD5C:
	ldr r1, _0801FD90 @ =0x0000027F
	cmp r3, r1
	bgt _0801FD6E
_0801FD62:
	adds r0, r3, r2
	strh r0, [r4]
	adds r4, #2
	adds r3, #1
	cmp r3, r1
	ble _0801FD62
_0801FD6E:
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_8002BCC
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801FD7C: .4byte 0x020234A8
_0801FD80: .4byte 0x08BB059C
_0801FD84: .4byte 0x08BABE04
_0801FD88: .4byte 0x0000019F
_0801FD8C: .4byte 0x085C3588
_0801FD90: .4byte 0x0000027F


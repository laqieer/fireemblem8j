	.syntax unified
	.set __udivsi3, 0x080D67D0 + 1
	.set __umodsi3, 0x080D6848 + 1
	.section .text.sub_800DA1C, "ax", %progbits
@ sub_800DA1C @ JP 0x0800DA1C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800DA1C
	.thumb_func
sub_800DA1C:
	push {r4, r5, r6, lr}
	ldr r2, [r0, #0x38]
	ldrb r0, [r2]
	movs r1, #0xf
	adds r4, r1, #0
	ands r4, r0
	ldrh r0, [r2, #2]
	adds r3, r1, #0
	ands r3, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x14
	ands r5, r1
	lsrs r6, r0, #0x18
	ands r6, r1
	cmp r4, #9
	bls _0800DA3E
	b _0800DB98
_0800DA3E:
	lsls r0, r4, #2
	ldr r1, _0800DA48 @ =_0800DA4C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800DA48: .4byte _0800DA4C
_0800DA4C: @ jump table
	.4byte _0800DA74 @ case 0
	.4byte _0800DA90 @ case 1
	.4byte _0800DAAC @ case 2
	.4byte _0800DACC @ case 3
	.4byte _0800DAE8 @ case 4
	.4byte _0800DB08 @ case 5
	.4byte _0800DB24 @ case 6
	.4byte _0800DB40 @ case 7
	.4byte _0800DB5C @ case 8
	.4byte _0800DB78 @ case 9
_0800DA74:
	ldr r2, _0800DA8C @ =0x030004B0
	lsls r3, r3, #2
	adds r3, r3, r2
	lsls r1, r5, #2
	adds r1, r1, r2
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	adds r1, r1, r0
	b _0800DB8C
	.align 2, 0
_0800DA8C: .4byte 0x030004B0
_0800DA90:
	ldr r2, _0800DAA8 @ =0x030004B0
	lsls r3, r3, #2
	adds r3, r3, r2
	lsls r1, r5, #2
	adds r1, r1, r2
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	subs r1, r1, r0
	b _0800DB8C
	.align 2, 0
_0800DAA8: .4byte 0x030004B0
_0800DAAC:
	ldr r2, _0800DAC8 @ =0x030004B0
	lsls r3, r3, #2
	adds r3, r3, r2
	lsls r1, r5, #2
	adds r1, r1, r2
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	muls r0, r1, r0
	str r0, [r3]
	movs r0, #0
	b _0800DB9A
	.align 2, 0
_0800DAC8: .4byte 0x030004B0
_0800DACC:
	ldr r2, _0800DAE4 @ =0x030004B0
	lsls r4, r3, #2
	adds r4, r4, r2
	lsls r0, r5, #2
	adds r0, r0, r2
	lsls r1, r6, #2
	adds r1, r1, r2
	ldr r0, [r0]
	ldr r1, [r1]
	bl __udivsi3
	b _0800DAFE
	.align 2, 0
_0800DAE4: .4byte 0x030004B0
_0800DAE8:
	ldr r2, _0800DB04 @ =0x030004B0
	lsls r4, r3, #2
	adds r4, r4, r2
	lsls r0, r5, #2
	adds r0, r0, r2
	lsls r1, r6, #2
	adds r1, r1, r2
	ldr r0, [r0]
	ldr r1, [r1]
	bl __umodsi3
_0800DAFE:
	str r0, [r4]
	movs r0, #0
	b _0800DB9A
	.align 2, 0
_0800DB04: .4byte 0x030004B0
_0800DB08:
	ldr r2, _0800DB20 @ =0x030004B0
	lsls r3, r3, #2
	adds r3, r3, r2
	lsls r1, r5, #2
	adds r1, r1, r2
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	ands r1, r0
	b _0800DB8C
	.align 2, 0
_0800DB20: .4byte 0x030004B0
_0800DB24:
	ldr r2, _0800DB3C @ =0x030004B0
	lsls r3, r3, #2
	adds r3, r3, r2
	lsls r1, r5, #2
	adds r1, r1, r2
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	orrs r1, r0
	b _0800DB8C
	.align 2, 0
_0800DB3C: .4byte 0x030004B0
_0800DB40:
	ldr r2, _0800DB58 @ =0x030004B0
	lsls r3, r3, #2
	adds r3, r3, r2
	lsls r1, r5, #2
	adds r1, r1, r2
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	eors r1, r0
	b _0800DB8C
	.align 2, 0
_0800DB58: .4byte 0x030004B0
_0800DB5C:
	ldr r2, _0800DB74 @ =0x030004B0
	lsls r3, r3, #2
	adds r3, r3, r2
	lsls r1, r5, #2
	adds r1, r1, r2
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	lsls r1, r0
	b _0800DB8C
	.align 2, 0
_0800DB74: .4byte 0x030004B0
_0800DB78:
	ldr r2, _0800DB94 @ =0x030004B0
	lsls r3, r3, #2
	adds r3, r3, r2
	lsls r1, r5, #2
	adds r1, r1, r2
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	lsrs r1, r0
_0800DB8C:
	str r1, [r3]
	movs r0, #0
	b _0800DB9A
	.align 2, 0
_0800DB94: .4byte 0x030004B0
_0800DB98:
	movs r0, #6
_0800DB9A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1


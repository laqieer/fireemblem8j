	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_806C45C, 0x0806C45C + 1
	.section .text.sub_806C510, "ax", %progbits
@ sub_806C510 @ JP 0x0806C510 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806C510
	.thumb_func
sub_806C510:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x2c]
	movs r2, #0x2c
	ldrsh r0, [r4, r2]
	cmp r0, #0x2b
	ble _0806C520
	b _0806C6C8
_0806C520:
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #0x1f
	bls _0806C52A
	b _0806C6C8
_0806C52A:
	lsls r0, r0, #2
	ldr r1, _0806C534 @ =_0806C538
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806C534: .4byte _0806C538
_0806C538: @ jump table
	.4byte _0806C5B8 @ case 0
	.4byte _0806C638 @ case 1
	.4byte _0806C5F8 @ case 2
	.4byte _0806C678 @ case 3
	.4byte _0806C5C0 @ case 4
	.4byte _0806C640 @ case 5
	.4byte _0806C600 @ case 6
	.4byte _0806C680 @ case 7
	.4byte _0806C5C8 @ case 8
	.4byte _0806C648 @ case 9
	.4byte _0806C608 @ case 10
	.4byte _0806C688 @ case 11
	.4byte _0806C5D0 @ case 12
	.4byte _0806C650 @ case 13
	.4byte _0806C610 @ case 14
	.4byte _0806C690 @ case 15
	.4byte _0806C5D8 @ case 16
	.4byte _0806C658 @ case 17
	.4byte _0806C618 @ case 18
	.4byte _0806C698 @ case 19
	.4byte _0806C5E0 @ case 20
	.4byte _0806C660 @ case 21
	.4byte _0806C620 @ case 22
	.4byte _0806C6A0 @ case 23
	.4byte _0806C5E8 @ case 24
	.4byte _0806C668 @ case 25
	.4byte _0806C628 @ case 26
	.4byte _0806C6AE @ case 27
	.4byte _0806C5F0 @ case 28
	.4byte _0806C670 @ case 29
	.4byte _0806C630 @ case 30
	.4byte _0806C6BC @ case 31
_0806C5B8:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0
	b _0806C6B4
_0806C5C0:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #4
	b _0806C6A6
_0806C5C8:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #1
	b _0806C6B4
_0806C5D0:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #5
	b _0806C6A6
_0806C5D8:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #2
	b _0806C6B4
_0806C5E0:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #6
	b _0806C6A6
_0806C5E8:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #3
	b _0806C6B4
_0806C5F0:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #7
	b _0806C6A6
_0806C5F8:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #8
	b _0806C6B4
_0806C600:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0xc
	b _0806C6A6
_0806C608:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #9
	b _0806C6B4
_0806C610:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0xd
	b _0806C6A6
_0806C618:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0xa
	b _0806C6B4
_0806C620:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0xe
	b _0806C6A6
_0806C628:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0xb
	b _0806C6B4
_0806C630:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0xf
	b _0806C6A6
_0806C638:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x10
	b _0806C6B4
_0806C640:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x14
	b _0806C6A6
_0806C648:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x11
	b _0806C6B4
_0806C650:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x15
	b _0806C6A6
_0806C658:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x12
	b _0806C6B4
_0806C660:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x16
	b _0806C6A6
_0806C668:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x13
	b _0806C6B4
_0806C670:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x17
	b _0806C6A6
_0806C678:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x18
	b _0806C6B4
_0806C680:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x1c
	b _0806C6A6
_0806C688:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x19
	b _0806C6B4
_0806C690:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x1d
	b _0806C6A6
_0806C698:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x1a
	b _0806C6B4
_0806C6A0:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x1e
_0806C6A6:
	movs r3, #1
	bl sub_806C45C
	b _0806C6C8
_0806C6AE:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x1b
_0806C6B4:
	movs r3, #0
	bl sub_806C45C
	b _0806C6C8
_0806C6BC:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x1f
	movs r3, #1
	bl sub_806C45C
_0806C6C8:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x30
	bne _0806C6E4
	ldr r1, _0806C6EC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_0806C6E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806C6EC: .4byte 0x0201774C


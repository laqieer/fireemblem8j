	.syntax unified
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_808E688, "ax", %progbits
@ sub_808E688 @ JP 0x0808E688 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808E688
	.thumb_func
sub_808E688:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _0808E6AC @ =0x0000016F
	cmp r1, #0
	beq _0808E748
	adds r1, #0x30
	ldrb r0, [r1]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	adds r6, r1, #0
	cmp r0, #0xd
	bhi _0808E71C
	lsls r0, r0, #2
	ldr r1, _0808E6B0 @ =_0808E6B4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808E6AC: .4byte 0x0000016F
_0808E6B0: .4byte _0808E6B4
_0808E6B4: @ jump table
	.4byte _0808E748 @ case 0
	.4byte _0808E6EC @ case 1
	.4byte _0808E6F0 @ case 2
	.4byte _0808E6F4 @ case 3
	.4byte _0808E6FA @ case 4
	.4byte _0808E700 @ case 5
	.4byte _0808E706 @ case 6
	.4byte _0808E70C @ case 7
	.4byte _0808E712 @ case 8
	.4byte _0808E748 @ case 9
	.4byte _0808E748 @ case 10
	.4byte _0808E718 @ case 11
	.4byte _0808E71C @ case 12
	.4byte _0808E718 @ case 13
_0808E6EC:
	movs r2, #0
	b _0808E71C
_0808E6F0:
	movs r2, #0xa0
	b _0808E71C
_0808E6F4:
	movs r2, #0xa0
	lsls r2, r2, #1
	b _0808E71C
_0808E6FA:
	movs r2, #0xf0
	lsls r2, r2, #1
	b _0808E71C
_0808E700:
	movs r2, #0xa0
	lsls r2, r2, #2
	b _0808E71C
_0808E706:
	movs r2, #0xc8
	lsls r2, r2, #2
	b _0808E71C
_0808E70C:
	movs r2, #0xf0
	lsls r2, r2, #2
	b _0808E71C
_0808E712:
	movs r2, #0x8c
	lsls r2, r2, #3
	b _0808E71C
_0808E718:
	movs r2, #0xa0
	lsls r2, r2, #3
_0808E71C:
	ldr r0, _0808E750 @ =0x08A92B38
	adds r0, r2, r0
	ldr r1, _0808E754 @ =0x06002DE0
	movs r2, #0x28
	bl sub_80D636C
	strh r4, [r5]
	adds r4, #1
	strh r4, [r5, #2]
	adds r4, #1
	strh r4, [r5, #4]
	adds r4, #1
	strh r4, [r5, #6]
	adds r4, #1
	strh r4, [r5, #8]
	movs r0, #0
	strh r0, [r5, #0xa]
	ldrb r0, [r6]
	lsrs r0, r0, #4
	ldr r1, _0808E758 @ =0x00001128
	adds r0, r0, r1
	strh r0, [r5, #0xc]
_0808E748:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808E750: .4byte 0x08A92B38
_0808E754: .4byte 0x06002DE0
_0808E758: .4byte 0x00001128


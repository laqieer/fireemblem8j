	.syntax unified
	.section .text.sub_8076A74, "ax", %progbits
@ sub_8076A74 @ JP 0x08076A74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8076A74
	.thumb_func
sub_8076A74:
	push {r4, r5, r6, lr}
	ldr r0, _08076AC0 @ =0x0201FDB8
	ldr r0, [r0]
	ldr r3, _08076AC4 @ =0x0201FB38
	cmp r0, #0
	bne _08076A82
	ldr r3, _08076AC8 @ =0x0201FC78
_08076A82:
	ldr r2, _08076ACC @ =0x0201FDC4
	cmp r0, #0
	bne _08076A8A
	ldr r2, _08076AD0 @ =0x0201FF04
_08076A8A:
	movs r4, #0
	movs r5, #0
	ldr r0, _08076AD4 @ =0x087A9950
	adds r6, r0, #0
	subs r6, #0x50
_08076A94:
	cmp r4, #0x27
	bls _08076AE0
	cmp r4, #0x47
	bhi _08076ADC
	movs r0, #0
	ldrsh r1, [r6, r0]
	ldr r0, _08076AD8 @ =0x02020134
	ldrh r0, [r0]
	muls r0, r1, r0
	lsls r0, r0, #4
	asrs r0, r0, #0x10
	adds r1, r4, r0
	cmp r1, #0x2e
	bls _08076AB4
	cmp r1, #0x51
	bls _08076AB8
_08076AB4:
	movs r0, #0x20
	rsbs r0, r0, #0
_08076AB8:
	strh r0, [r3]
	adds r3, #2
	strh r0, [r2]
	b _08076AE6
	.align 2, 0
_08076AC0: .4byte 0x0201FDB8
_08076AC4: .4byte 0x0201FB38
_08076AC8: .4byte 0x0201FC78
_08076ACC: .4byte 0x0201FDC4
_08076AD0: .4byte 0x0201FF04
_08076AD4: .4byte 0x087A9950
_08076AD8: .4byte 0x02020134
_08076ADC:
	cmp r4, #0x9f
	bhi _08076AE8
_08076AE0:
	strh r5, [r3]
	adds r3, #2
	strh r5, [r2]
_08076AE6:
	adds r2, #2
_08076AE8:
	adds r6, #2
	adds r4, #1
	cmp r4, #0x9f
	bls _08076A94
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0


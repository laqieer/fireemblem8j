	.syntax unified
	.section .text.EfxUpdatePartsofScroll, "ax", %progbits
@ EfxUpdatePartsofScroll @ JP 0x080769D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global EfxUpdatePartsofScroll
	.thumb_func
EfxUpdatePartsofScroll:
	push {r4, r5, r6, lr}
	ldr r0, _08076A00 @ =0x0201FDB8
	ldr r0, [r0]
	ldr r2, _08076A04 @ =0x0201FB38
	cmp r0, #0
	bne _080769E2
	ldr r2, _08076A08 @ =0x0201FC78
_080769E2:
	ldr r1, _08076A0C @ =0x0201FDC4
	cmp r0, #0
	bne _080769EA
	ldr r1, _08076A10 @ =0x0201FF04
_080769EA:
	movs r3, #0
	movs r6, #0
	ldr r5, _08076A14 @ =0x02020134
	ldr r4, _08076A18 @ =0x02020136
_080769F2:
	cmp r3, #0x27
	bhi _08076A1C
	strh r6, [r2]
	adds r2, #2
	strh r6, [r1]
	b _08076A38
	.align 2, 0
_08076A00: .4byte 0x0201FDB8
_08076A04: .4byte 0x0201FB38
_08076A08: .4byte 0x0201FC78
_08076A0C: .4byte 0x0201FDC4
_08076A10: .4byte 0x0201FF04
_08076A14: .4byte 0x02020134
_08076A18: .4byte 0x02020136
_08076A1C:
	cmp r3, #0x47
	bhi _08076A2A
	ldrh r0, [r5]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r5]
	b _08076A36
_08076A2A:
	cmp r3, #0x9f
	bhi _08076A3A
	ldrh r0, [r4]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r4]
_08076A36:
	strh r0, [r1]
_08076A38:
	adds r1, #2
_08076A3A:
	adds r3, #1
	cmp r3, #0x9f
	bls _080769F2
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0


	.syntax unified
	.set GetChapterTitleWM, 0x0808BAAC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_801569C, 0x0801569C + 1
	.set sub_808B824, 0x0808B824 + 1
	.set sub_808B894, 0x0808B894 + 1
	.section .text.sub_8090A88, "ax", %progbits
@ sub_8090A88 @ JP 0x08090A88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8090A88
	.thumb_func
sub_8090A88:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_801569C
	ldr r0, _08090AD8 @ =0x08AAEE7C
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _08090ADC @ =0x08AAF654
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _08090AE0 @ =0x08AAEB40
	ldr r1, _08090AE4 @ =0x06016800
	bl sub_8013008
	adds r4, #0x64
	movs r0, #0
	strh r0, [r4]
	movs r0, #0x80
	movs r1, #0x13
	bl sub_808B824
	movs r4, #0xb8
	lsls r4, r4, #4
	ldr r0, _08090AE8 @ =0x0202BCEC
	bl GetChapterTitleWM
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_808B894
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08090AD8: .4byte 0x08AAEE7C
_08090ADC: .4byte 0x08AAF654
_08090AE0: .4byte 0x08AAEB40
_08090AE4: .4byte 0x06016800
_08090AE8: .4byte 0x0202BCEC


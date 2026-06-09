	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_8076FC8, "ax", %progbits
@ sub_8076FC8 @ JP 0x08076FC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8076FC8
	.thumb_func
sub_8076FC8:
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r2, _08077014 @ =0x08A1D090
	ldr r1, _08077018 @ =0x000003FF
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _0807701C @ =0x06010000
	adds r1, r1, r0
	adds r0, r2, #0
	bl sub_8013008
	ldr r4, _08077020 @ =0x08A1D030
	adds r1, r5, #0
	adds r1, #0x10
	lsls r1, r1, #5
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_8000D68
	adds r1, r5, #0
	adds r1, #0x11
	lsls r1, r1, #5
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _08077024 @ =0x087A9A98
	movs r1, #3
	bl sub_8002BCC
	movs r1, #0
	strh r5, [r0, #0x2c]
	ldr r0, _08077028 @ =0x02020138
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077014: .4byte 0x08A1D090
_08077018: .4byte 0x000003FF
_0807701C: .4byte 0x06010000
_08077020: .4byte 0x08A1D030
_08077024: .4byte 0x087A9A98
_08077028: .4byte 0x02020138


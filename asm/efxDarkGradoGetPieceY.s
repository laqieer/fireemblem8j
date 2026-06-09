	.syntax unified
	.section .text.efxDarkGradoGetPieceY, "ax", %progbits
@ efxDarkGradoGetPieceY @ JP 0x0806BAA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global efxDarkGradoGetPieceY
	.thumb_func
efxDarkGradoGetPieceY:
	push {lr}
	adds r3, r0, #0
	cmp r1, #5
	bhi _0806BB04
	lsls r0, r1, #2
	ldr r1, _0806BAB8 @ =_0806BABC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806BAB8: .4byte _0806BABC
_0806BABC: @ jump table
	.4byte _0806BAD4 @ case 0
	.4byte _0806BADC @ case 1
	.4byte _0806BAE4 @ case 2
	.4byte _0806BAEC @ case 3
	.4byte _0806BAF4 @ case 4
	.4byte _0806BAFC @ case 5
_0806BAD4:
	ldr r1, _0806BAD8 @ =0x08602B24
	b _0806BB06
	.align 2, 0
_0806BAD8: .4byte 0x08602B24
_0806BADC:
	ldr r1, _0806BAE0 @ =0x08602B74
	b _0806BB06
	.align 2, 0
_0806BAE0: .4byte 0x08602B74
_0806BAE4:
	ldr r1, _0806BAE8 @ =0x08602BC4
	b _0806BB06
	.align 2, 0
_0806BAE8: .4byte 0x08602BC4
_0806BAEC:
	ldr r1, _0806BAF0 @ =0x08602C14
	b _0806BB06
	.align 2, 0
_0806BAF0: .4byte 0x08602C14
_0806BAF4:
	ldr r1, _0806BAF8 @ =0x08602C64
	b _0806BB06
	.align 2, 0
_0806BAF8: .4byte 0x08602C64
_0806BAFC:
	ldr r1, _0806BB00 @ =0x08602CB4
	b _0806BB06
	.align 2, 0
_0806BB00: .4byte 0x08602CB4
_0806BB04:
	ldr r1, _0806BB18 @ =0x08602D04
_0806BB06:
	lsls r0, r3, #2
	adds r0, r0, r1
	movs r1, #2
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #8
	pop {r1}
	bx r1
	.align 2, 0
_0806BB18: .4byte 0x08602D04


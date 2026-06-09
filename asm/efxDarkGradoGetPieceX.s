	.syntax unified
	.section .text.efxDarkGradoGetPieceX, "ax", %progbits
@ efxDarkGradoGetPieceX @ JP 0x0806BA2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global efxDarkGradoGetPieceX
	.thumb_func
efxDarkGradoGetPieceX:
	push {lr}
	adds r3, r0, #0
	cmp r1, #5
	bhi _0806BA8C
	lsls r0, r1, #2
	ldr r1, _0806BA40 @ =_0806BA44
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806BA40: .4byte _0806BA44
_0806BA44: @ jump table
	.4byte _0806BA5C @ case 0
	.4byte _0806BA64 @ case 1
	.4byte _0806BA6C @ case 2
	.4byte _0806BA74 @ case 3
	.4byte _0806BA7C @ case 4
	.4byte _0806BA84 @ case 5
_0806BA5C:
	ldr r1, _0806BA60 @ =0x08602B24
	b _0806BA8E
	.align 2, 0
_0806BA60: .4byte 0x08602B24
_0806BA64:
	ldr r1, _0806BA68 @ =0x08602B74
	b _0806BA8E
	.align 2, 0
_0806BA68: .4byte 0x08602B74
_0806BA6C:
	ldr r1, _0806BA70 @ =0x08602BC4
	b _0806BA8E
	.align 2, 0
_0806BA70: .4byte 0x08602BC4
_0806BA74:
	ldr r1, _0806BA78 @ =0x08602C14
	b _0806BA8E
	.align 2, 0
_0806BA78: .4byte 0x08602C14
_0806BA7C:
	ldr r1, _0806BA80 @ =0x08602C64
	b _0806BA8E
	.align 2, 0
_0806BA80: .4byte 0x08602C64
_0806BA84:
	ldr r1, _0806BA88 @ =0x08602CB4
	b _0806BA8E
	.align 2, 0
_0806BA88: .4byte 0x08602CB4
_0806BA8C:
	ldr r1, _0806BAA0 @ =0x08602D04
_0806BA8E:
	lsls r0, r3, #2
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #8
	pop {r1}
	bx r1
	.align 2, 0
_0806BAA0: .4byte 0x08602D04


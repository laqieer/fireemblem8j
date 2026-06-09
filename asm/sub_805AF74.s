	.syntax unified
	.section .text.sub_805AF74, "ax", %progbits
@ sub_805AF74 @ JP 0x0805AF74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805AF74
	.thumb_func
sub_805AF74:
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bhi _0805AFB8
	lsls r0, r0, #2
	ldr r1, _0805AF88 @ =_0805AF8C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805AF88: .4byte _0805AF8C
_0805AF8C: @ jump table
	.4byte _0805AFB8 @ case 0
	.4byte _0805AFB8 @ case 1
	.4byte _0805AFB8 @ case 2
	.4byte _0805AFB8 @ case 3
	.4byte _0805AFB8 @ case 4
	.4byte _0805AFB8 @ case 5
	.4byte _0805AFB4 @ case 6
	.4byte _0805AFB4 @ case 7
	.4byte _0805AFB4 @ case 8
	.4byte _0805AFB8 @ case 9
_0805AFB4:
	movs r0, #1
	b _0805AFBA
_0805AFB8:
	movs r0, #0
_0805AFBA:
	pop {r1}
	bx r1
	.align 2, 0


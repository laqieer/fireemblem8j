	.syntax unified
	.section .text.sub_805AFC0, "ax", %progbits
@ sub_805AFC0 @ JP 0x0805AFC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805AFC0
	.thumb_func
sub_805AFC0:
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bhi _0805B004
	lsls r0, r0, #2
	ldr r1, _0805AFD4 @ =_0805AFD8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805AFD4: .4byte _0805AFD8
_0805AFD8: @ jump table
	.4byte _0805B000 @ case 0
	.4byte _0805B000 @ case 1
	.4byte _0805B000 @ case 2
	.4byte _0805B000 @ case 3
	.4byte _0805B004 @ case 4
	.4byte _0805B004 @ case 5
	.4byte _0805B004 @ case 6
	.4byte _0805B004 @ case 7
	.4byte _0805B004 @ case 8
	.4byte _0805B000 @ case 9
_0805B000:
	movs r0, #1
	b _0805B006
_0805B004:
	movs r0, #0
_0805B006:
	pop {r1}
	bx r1
	.align 2, 0


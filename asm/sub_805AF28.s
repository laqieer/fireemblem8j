	.syntax unified
	.section .text.sub_805AF28, "ax", %progbits
@ sub_805AF28 @ JP 0x0805AF28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805AF28
	.thumb_func
sub_805AF28:
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bhi _0805AF6C
	lsls r0, r0, #2
	ldr r1, _0805AF3C @ =_0805AF40
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805AF3C: .4byte _0805AF40
_0805AF40: @ jump table
	.4byte _0805AF6C @ case 0
	.4byte _0805AF6C @ case 1
	.4byte _0805AF6C @ case 2
	.4byte _0805AF6C @ case 3
	.4byte _0805AF68 @ case 4
	.4byte _0805AF68 @ case 5
	.4byte _0805AF6C @ case 6
	.4byte _0805AF6C @ case 7
	.4byte _0805AF6C @ case 8
	.4byte _0805AF6C @ case 9
_0805AF68:
	movs r0, #1
	b _0805AF6E
_0805AF6C:
	movs r0, #0
_0805AF6E:
	pop {r1}
	bx r1
	.align 2, 0


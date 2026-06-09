	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056120, 0x08056120 + 1
	.set sub_806F4D8, 0x0806F4D8 + 1
	.section .text.sub_806F3A4, "ax", %progbits
@ sub_806F3A4 @ JP 0x0806F3A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806F3A4
	.thumb_func
sub_806F3A4:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r0, _0806F3E8 @ =0x0201774C
	ldr r5, [r0]
	cmp r5, #0
	beq _0806F3B4
	b _0806F4B6
_0806F3B4:
	bl sub_8056120
	ldr r0, _0806F3EC @ =0x086035E4
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	strh r5, [r4, #0x2c]
	adds r0, r6, #0
	bl GetAnimPosition
	ldr r1, _0806F3F0 @ =0x0203E17E
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, #0x6a
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2a
	bhi _0806F4AE
	lsls r0, r0, #2
	ldr r1, _0806F3F4 @ =_0806F3F8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806F3E8: .4byte 0x0201774C
_0806F3EC: .4byte 0x086035E4
_0806F3F0: .4byte 0x0203E17E
_0806F3F4: .4byte _0806F3F8
_0806F3F8: @ jump table
	.4byte _0806F4A4 @ case 0
	.4byte _0806F4A4 @ case 1
	.4byte _0806F4AE @ case 2
	.4byte _0806F4AE @ case 3
	.4byte _0806F4AE @ case 4
	.4byte _0806F4AE @ case 5
	.4byte _0806F4AE @ case 6
	.4byte _0806F4AE @ case 7
	.4byte _0806F4AE @ case 8
	.4byte _0806F4AE @ case 9
	.4byte _0806F4AE @ case 10
	.4byte _0806F4AE @ case 11
	.4byte _0806F4AE @ case 12
	.4byte _0806F4AE @ case 13
	.4byte _0806F4AE @ case 14
	.4byte _0806F4AE @ case 15
	.4byte _0806F4AE @ case 16
	.4byte _0806F4AE @ case 17
	.4byte _0806F4AE @ case 18
	.4byte _0806F4AE @ case 19
	.4byte _0806F4AE @ case 20
	.4byte _0806F4AE @ case 21
	.4byte _0806F4AE @ case 22
	.4byte _0806F4AE @ case 23
	.4byte _0806F4AE @ case 24
	.4byte _0806F4AE @ case 25
	.4byte _0806F4AE @ case 26
	.4byte _0806F4AE @ case 27
	.4byte _0806F4AE @ case 28
	.4byte _0806F4AE @ case 29
	.4byte _0806F4AE @ case 30
	.4byte _0806F4AE @ case 31
	.4byte _0806F4AE @ case 32
	.4byte _0806F4AE @ case 33
	.4byte _0806F4AE @ case 34
	.4byte _0806F4AE @ case 35
	.4byte _0806F4AE @ case 36
	.4byte _0806F4AE @ case 37
	.4byte _0806F4AE @ case 38
	.4byte _0806F4AE @ case 39
	.4byte _0806F4AE @ case 40
	.4byte _0806F4AE @ case 41
	.4byte _0806F4A4 @ case 42
_0806F4A4:
	ldr r0, [r4, #0x5c]
	adds r1, r7, #0
	bl sub_806F4D8
	b _0806F4B6
_0806F4AE:
	ldr r0, [r4, #0x5c]
	adds r1, r7, #2
	bl sub_806F4D8
_0806F4B6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0


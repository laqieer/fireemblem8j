	.syntax unified
	.section .text.GetSaveWriteAddr, "ax", %progbits
@ GetSaveWriteAddr @ JP 0x080A7AA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetSaveWriteAddr
	.thumb_func
GetSaveWriteAddr:
	push {lr}
	cmp r0, #6
	bhi _080A7B50
	lsls r0, r0, #2
	ldr r1, _080A7AB8 @ =_080A7ABC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A7AB8: .4byte _080A7ABC
_080A7ABC: @ jump table
	.4byte _080A7AD8 @ case 0
	.4byte _080A7AEC @ case 1
	.4byte _080A7B00 @ case 2
	.4byte _080A7B14 @ case 3
	.4byte _080A7B20 @ case 4
	.4byte _080A7B34 @ case 5
	.4byte _080A7B48 @ case 6
_080A7AD8:
	ldr r0, _080A7AE4 @ =0x08A9CA20
	ldr r0, [r0]
	ldr r1, _080A7AE8 @ =0x00003FC4
	adds r0, r0, r1
	b _080A7B52
	.align 2, 0
_080A7AE4: .4byte 0x08A9CA20
_080A7AE8: .4byte 0x00003FC4
_080A7AEC:
	ldr r0, _080A7AF8 @ =0x08A9CA20
	ldr r0, [r0]
	ldr r1, _080A7AFC @ =0x00004D8C
	adds r0, r0, r1
	b _080A7B52
	.align 2, 0
_080A7AF8: .4byte 0x08A9CA20
_080A7AFC: .4byte 0x00004D8C
_080A7B00:
	ldr r0, _080A7B0C @ =0x08A9CA20
	ldr r0, [r0]
	ldr r1, _080A7B10 @ =0x00005B54
	adds r0, r0, r1
	b _080A7B52
	.align 2, 0
_080A7B0C: .4byte 0x08A9CA20
_080A7B10: .4byte 0x00005B54
_080A7B14:
	ldr r0, _080A7B1C @ =0x08A9CA20
	ldr r0, [r0]
	adds r0, #0xd4
	b _080A7B52
	.align 2, 0
_080A7B1C: .4byte 0x08A9CA20
_080A7B20:
	ldr r0, _080A7B2C @ =0x08A9CA20
	ldr r0, [r0]
	ldr r1, _080A7B30 @ =0x0000204C
	adds r0, r0, r1
	b _080A7B52
	.align 2, 0
_080A7B2C: .4byte 0x08A9CA20
_080A7B30: .4byte 0x0000204C
_080A7B34:
	ldr r0, _080A7B40 @ =0x08A9CA20
	ldr r0, [r0]
	ldr r1, _080A7B44 @ =0x0000691C
	adds r0, r0, r1
	b _080A7B52
	.align 2, 0
_080A7B40: .4byte 0x08A9CA20
_080A7B44: .4byte 0x0000691C
_080A7B48:
	ldr r0, _080A7B4C @ =0x0E007400
	b _080A7B52
	.align 2, 0
_080A7B4C: .4byte 0x0E007400
_080A7B50:
	movs r0, #0
_080A7B52:
	pop {r1}
	bx r1
	.align 2, 0


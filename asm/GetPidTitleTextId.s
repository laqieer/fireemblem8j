	.syntax unified
	.section .text.GetPidTitleTextId, "ax", %progbits
@ GetPidTitleTextId @ JP 0x080BB1F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetPidTitleTextId
	.thumb_func
GetPidTitleTextId:
	push {lr}
	adds r2, r0, #0
	ldr r1, _080BB200 @ =0x08AC09E8
	b _080BB210
	.align 2, 0
_080BB200: .4byte 0x08AC09E8
_080BB204:
	ldrb r0, [r1]
	cmp r0, r2
	bne _080BB20E
	ldr r0, [r1, #4]
	b _080BB218
_080BB20E:
	adds r1, #8
_080BB210:
	ldrb r0, [r1]
	cmp r0, #0
	bne _080BB204
	movs r0, #0
_080BB218:
	pop {r1}
	bx r1


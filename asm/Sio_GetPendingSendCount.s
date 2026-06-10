	.syntax unified
	.section .text.Sio_GetPendingSendCount, "ax", %progbits
@ Sio_GetPendingSendCount @ JP 0x080421B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Sio_GetPendingSendCount
	.thumb_func
Sio_GetPendingSendCount:
	push {lr}
	ldr r0, _080421D4 @ =0x085D31E8
	ldr r0, [r0]
	ldr r2, _080421D8 @ =0x00001B75
	adds r1, r0, r2
	ldr r3, _080421DC @ =0x00001B74
	adds r2, r0, r3
	ldrb r0, [r1]
	ldrb r3, [r2]
	cmp r0, r3
	bhs _080421E0
	ldrb r1, [r2]
	subs r1, #0x20
	b _080421E4
	.align 2, 0
_080421D4: .4byte 0x085D31E8
_080421D8: .4byte 0x00001B75
_080421DC: .4byte 0x00001B74
_080421E0:
	ldrb r0, [r1]
	ldrb r1, [r2]
_080421E4:
	subs r0, r0, r1
	pop {r1}
	bx r1
	.align 2, 0


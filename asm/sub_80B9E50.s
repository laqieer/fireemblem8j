	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set ResetText, 0x08003BC4 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_80034C4, 0x080034C4 + 1
	.set sub_8003508, 0x08003508 + 1
	.set sub_804F8F4, 0x0804F8F4 + 1
	.set sub_808BB14, 0x0808BB14 + 1
	.section .text.sub_80B9E50, "ax", %progbits
@ sub_80B9E50 @ JP 0x080B9E50 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9E50
	.thumb_func
sub_80B9E50:
	push {lr}
	ldr r2, _080B9EE8 @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x20
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _080B9EEC @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080B9EF0 @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080B9EF4 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080B9EF8 @ =0x020244A8
	movs r1, #0
	bl sub_80011D0
	movs r0, #0xf
	bl BG_EnableSyncByMask
	bl ResetText
	bl sub_804F8F4
	bl sub_80034C4
	movs r0, #4
	bl sub_8003508
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl sub_808BB14
	pop {r0}
	bx r0
	.align 2, 0
_080B9EE8: .4byte 0x03003020
_080B9EEC: .4byte 0x02022CA8
_080B9EF0: .4byte 0x020234A8
_080B9EF4: .4byte 0x02023CA8
_080B9EF8: .4byte 0x020244A8


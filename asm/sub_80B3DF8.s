	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80B3DF8, "ax", %progbits
@ sub_80B3DF8 @ JP 0x080B3DF8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B3DF8
	.thumb_func
sub_80B3DF8:
	push {r4, r5, lr}
	movs r1, #0
	ldr r5, _080B3E30 @ =0x08AAA9C8
	ldr r3, _080B3E34 @ =0x0201F19C
	movs r2, #0
	adds r4, r3, #0
	adds r4, #0x31
_080B3E06:
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, r4
	strb r2, [r0]
	adds r1, #1
	cmp r1, #0x30
	ble _080B3E06
	ldr r1, _080B3E38 @ =0x06010800
	adds r0, r5, #0
	bl sub_8013008
	ldr r0, _080B3E3C @ =0x08AAAA38
	movs r1, #0xe8
	lsls r1, r1, #2
	movs r2, #0x60
	bl sub_8000D68
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B3E30: .4byte 0x08AAA9C8
_080B3E34: .4byte 0x0201F19C
_080B3E38: .4byte 0x06010800
_080B3E3C: .4byte 0x08AAAA38


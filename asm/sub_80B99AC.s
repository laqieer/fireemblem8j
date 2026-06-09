	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80B9A10, 0x080B9A10 + 1
	.set sub_80B9A5C, 0x080B9A5C + 1
	.section .text.sub_80B99AC, "ax", %progbits
@ sub_80B99AC @ JP 0x080B99AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B99AC
	.thumb_func
sub_80B99AC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B99F8 @ =0x08A1E080
	ldr r1, _080B99FC @ =0x06014C00
	bl sub_8013008
	ldr r0, _080B9A00 @ =0x08ABCAB8
	adds r1, r4, #0
	bl sub_8002BCC
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0xac
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x2d
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080B9A04 @ =0x00004260
	strh r0, [r1]
	ldr r0, _080B9A08 @ =0x085E0D94
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	ldr r4, _080B9A0C @ =0x02022E60
	adds r0, r4, #0
	bl sub_80B9A10
	subs r4, #2
	adds r0, r4, #0
	bl sub_80B9A5C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B99F8: .4byte 0x08A1E080
_080B99FC: .4byte 0x06014C00
_080B9A00: .4byte 0x08ABCAB8
_080B9A04: .4byte 0x00004260
_080B9A08: .4byte 0x085E0D94
_080B9A0C: .4byte 0x02022E60


	.syntax unified
	.set InitText, 0x08003C8C + 1
	.set sub_8003BE8, 0x08003BE8 + 1
	.section .text.sub_80B0250, "ax", %progbits
@ sub_80B0250 @ JP 0x080B0250 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B0250
	.thumb_func
sub_80B0250:
	push {lr}
	ldr r0, _080B026C @ =0x02000920
	ldr r1, _080B0270 @ =0x06001000
	movs r2, #0x80
	movs r3, #4
	bl sub_8003BE8
	ldr r0, _080B0274 @ =0x02000938
	movs r1, #0xa
	bl InitText
	pop {r0}
	bx r0
	.align 2, 0
_080B026C: .4byte 0x02000920
_080B0270: .4byte 0x06001000
_080B0274: .4byte 0x02000938


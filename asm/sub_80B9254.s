	.syntax unified
	.set sub_8031568, 0x08031568 + 1
	.set sub_80B8CF0, 0x080B8CF0 + 1
	.section .text.sub_80B9254, "ax", %progbits
@ sub_80B9254 @ JP 0x080B9254 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9254
	.thumb_func
sub_80B9254:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8031568
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B9270
	ldr r0, _080B926C @ =0x00000867
	adds r1, r4, #0
	bl sub_80B8CF0
	b _080B9278
	.align 2, 0
_080B926C: .4byte 0x00000867
_080B9270:
	ldr r0, _080B9280 @ =0x0000086A
	adds r1, r4, #0
	bl sub_80B8CF0
_080B9278:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9280: .4byte 0x0000086A


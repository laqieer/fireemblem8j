	.syntax unified
	.set sub_802A4F0, 0x0802A4F0 + 1
	.set sub_802CB70, 0x0802CB70 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.set sub_807DAE0, 0x0807DAE0 + 1
	.section .text.sub_80324CC, "ax", %progbits
@ sub_80324CC @ JP 0x080324CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80324CC
	.thumb_func
sub_80324CC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080324F0 @ =0x0203A4E8
	ldr r1, _080324F4 @ =0x03004DF0
	ldr r1, [r1]
	bl sub_802A4F0
	adds r0, r4, #0
	bl sub_802CB70
	bl sub_807B4B8
	bl sub_807DAE0
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080324F0: .4byte 0x0203A4E8
_080324F4: .4byte 0x03004DF0


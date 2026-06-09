	.syntax unified
	.set sub_802A4F0, 0x0802A4F0 + 1
	.set sub_802CB70, 0x0802CB70 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.set sub_807DA88, 0x0807DA88 + 1
	.section .text.sub_80324A0, "ax", %progbits
@ sub_80324A0 @ JP 0x080324A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80324A0
	.thumb_func
sub_80324A0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080324C4 @ =0x0203A4E8
	ldr r1, _080324C8 @ =0x03004DF0
	ldr r1, [r1]
	bl sub_802A4F0
	adds r0, r4, #0
	bl sub_802CB70
	bl sub_807B4B8
	bl sub_807DA88
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080324C4: .4byte 0x0203A4E8
_080324C8: .4byte 0x03004DF0


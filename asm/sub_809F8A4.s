	.syntax unified
	.set InitSpriteText, 0x080044E0 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80044A4, 0x080044A4 + 1
	.section .text.sub_809F8A4, "ax", %progbits
@ sub_809F8A4 @ JP 0x0809F8A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809F8A4
	.thumb_func
sub_809F8A4:
	push {r4, lr}
	ldr r4, _0809F8D4 @ =0x02013640
	ldr r1, _0809F8D8 @ =0x06011000
	adds r0, r4, #0
	movs r2, #0xb
	bl sub_80044A4
	ldr r0, _0809F8DC @ =0x085C7420
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	adds r4, #0x90
	adds r0, r4, #0
	bl InitSpriteText
	movs r0, #0
	bl SetTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809F8D4: .4byte 0x02013640
_0809F8D8: .4byte 0x06011000
_0809F8DC: .4byte 0x085C7420


	.syntax unified
	.set GetPortraitData, 0x0800541C + 1
	.set StartPalFadeToBlack, 0x080139A8 + 1
	.set sub_8005DDC, 0x08005DDC + 1
	.section .text.sub_8005E3C, "ax", %progbits
@ sub_8005E3C @ JP 0x08005E3C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8005E3C
	.thumb_func
sub_8005E3C:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	bl GetPortraitData
	ldr r1, _08005E6C @ =0x0202A688
	adds r0, r4, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	adds r0, #0x10
	movs r1, #0xc
	adds r2, r4, #0
	bl StartPalFadeToBlack
	adds r0, r4, #0
	bl sub_8005DDC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005E6C: .4byte 0x0202A688


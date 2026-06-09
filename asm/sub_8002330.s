	.syntax unified
	.set m4aMPlayFadeOut, 0x080D508C + 1
	.section .text.sub_8002330, "ax", %progbits
@ sub_8002330 @ JP 0x08002330 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8002330
	.thumb_func
sub_8002330:
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _0800233A
	movs r4, #6
_0800233A:
	ldr r0, _0800237C @ =0x03006680
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r1, r4, #0
	bl m4aMPlayFadeOut
	ldr r0, _08002380 @ =0x03006750
	adds r1, r4, #0
	bl m4aMPlayFadeOut
	ldr r0, _08002384 @ =0x030066C0
	adds r1, r4, #0
	bl m4aMPlayFadeOut
	ldr r0, _08002388 @ =0x030063B0
	adds r1, r4, #0
	bl m4aMPlayFadeOut
	ldr r0, _0800238C @ =0x030063F0
	adds r1, r4, #0
	bl m4aMPlayFadeOut
	ldr r0, _08002390 @ =0x03006600
	adds r1, r4, #0
	bl m4aMPlayFadeOut
	ldr r0, _08002394 @ =0x03006710
	adds r1, r4, #0
	bl m4aMPlayFadeOut
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800237C: .4byte 0x03006680
_08002380: .4byte 0x03006750
_08002384: .4byte 0x030066C0
_08002388: .4byte 0x030063B0
_0800238C: .4byte 0x030063F0
_08002390: .4byte 0x03006600
_08002394: .4byte 0x03006710


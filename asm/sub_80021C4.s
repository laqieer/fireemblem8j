	.syntax unified
	.set m4aMPlayVolumeControl, 0x080D5E9C + 1
	.section .text.sub_80021C4, "ax", %progbits
@ sub_80021C4 @ JP 0x080021C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80021C4
	.thumb_func
sub_80021C4:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0800221C @ =0x03006680
	ldr r5, _08002220 @ =0x0000FFFF
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	bl m4aMPlayVolumeControl
	ldr r0, _08002224 @ =0x03006750
	adds r1, r5, #0
	adds r2, r4, #0
	bl m4aMPlayVolumeControl
	ldr r0, _08002228 @ =0x030066C0
	adds r1, r5, #0
	adds r2, r4, #0
	bl m4aMPlayVolumeControl
	ldr r0, _0800222C @ =0x030063B0
	adds r1, r5, #0
	adds r2, r4, #0
	bl m4aMPlayVolumeControl
	ldr r0, _08002230 @ =0x030063F0
	adds r1, r5, #0
	adds r2, r4, #0
	bl m4aMPlayVolumeControl
	ldr r0, _08002234 @ =0x03006600
	adds r1, r5, #0
	adds r2, r4, #0
	bl m4aMPlayVolumeControl
	ldr r0, _08002238 @ =0x03006710
	adds r1, r5, #0
	adds r2, r4, #0
	bl m4aMPlayVolumeControl
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800221C: .4byte 0x03006680
_08002220: .4byte 0x0000FFFF
_08002224: .4byte 0x03006750
_08002228: .4byte 0x030066C0
_0800222C: .4byte 0x030063B0
_08002230: .4byte 0x030063F0
_08002234: .4byte 0x03006600
_08002238: .4byte 0x03006710


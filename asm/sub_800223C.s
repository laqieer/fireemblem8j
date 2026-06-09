	.syntax unified
	.set m4aMPlayVolumeControl, 0x080D5E9C + 1
	.section .text.sub_800223C, "ax", %progbits
@ sub_800223C @ JP 0x0800223C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800223C
	.thumb_func
sub_800223C:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08002260 @ =0x03006430
	ldr r5, _08002264 @ =0x0000FFFF
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	bl m4aMPlayVolumeControl
	ldr r0, _08002268 @ =0x03006640
	adds r1, r5, #0
	adds r2, r4, #0
	bl m4aMPlayVolumeControl
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08002260: .4byte 0x03006430
_08002264: .4byte 0x0000FFFF
_08002268: .4byte 0x03006640


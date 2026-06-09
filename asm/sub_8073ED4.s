	.syntax unified
	.set CheckEfxSoundSeExist, 0x08073F88 + 1
	.set RegisterEfxSoundSeExist, 0x08073F7C + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80021C4, 0x080021C4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8073ED4, "ax", %progbits
@ sub_8073ED4 @ JP 0x08073ED4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8073ED4
	.thumb_func
sub_8073ED4:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	bne _08073EEE
	adds r0, r4, #0
	bl sub_8002DE4
	b _08073F1C
_08073EEE:
	bl CheckEfxSoundSeExist
	cmp r0, #0
	bne _08073F1C
	bl RegisterEfxSoundSeExist
	ldr r0, [r4, #0x44]
	bl sub_80021C4
	ldr r0, _08073F24 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08073F16
	ldr r0, [r4, #0x48]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
_08073F16:
	adds r0, r4, #0
	bl sub_8002DE4
_08073F1C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073F24: .4byte 0x0202BCEC


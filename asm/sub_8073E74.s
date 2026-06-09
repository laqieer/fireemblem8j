	.syntax unified
	.set CheckEfxSoundSeExist, 0x08073F88 + 1
	.set RegisterEfxSoundSeExist, 0x08073F7C + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80021C4, 0x080021C4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8073E74, "ax", %progbits
@ sub_8073E74 @ JP 0x08073E74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8073E74
	.thumb_func
sub_8073E74:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r0, _08073EB4 @ =0x0202BCAC
	ldrb r1, [r0, #4]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _08073ECA
	bl CheckEfxSoundSeExist
	cmp r0, #0
	bne _08073EBC
	bl RegisterEfxSoundSeExist
	adds r0, r5, #0
	bl sub_80021C4
	ldr r0, _08073EB8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08073ECA
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
	b _08073ECA
	.align 2, 0
_08073EB4: .4byte 0x0202BCAC
_08073EB8: .4byte 0x0202BCEC
_08073EBC:
	ldr r0, _08073ED0 @ =0x087A8F7C
	movs r1, #3
	bl sub_8002BCC
	str r5, [r0, #0x44]
	str r6, [r0, #0x48]
	strh r4, [r0, #0x2c]
_08073ECA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08073ED0: .4byte 0x087A8F7C


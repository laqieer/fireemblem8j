	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set SetBackgroundTileDataOffset, 0x08000F8C + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_804F610, 0x0804F610 + 1
	.section .text.sub_8021D68, "ax", %progbits
@ sub_8021D68 @ JP 0x08021D68 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8021D68
	.thumb_func
sub_8021D68:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	ldr r2, _08021E08 @ =0x06002000
	movs r1, #0
	ldr r4, _08021E0C @ =0x11111111
	movs r3, #0x1f
_08021D7A:
	movs r0, #7
_08021D7C:
	stm r2!, {r1}
	subs r0, #1
	cmp r0, #0
	bge _08021D7C
	adds r1, r1, r4
	subs r3, #1
	cmp r3, #0
	bge _08021D7A
	movs r3, #0
	ldr r0, _08021E10 @ =0x020228A8
	adds r4, r0, #0
	adds r4, #0x40
_08021D94:
	lsls r0, r3, #1
	lsls r1, r3, #0xb
	lsls r2, r3, #6
	adds r1, r1, r2
	adds r1, r1, r0
	strh r1, [r4]
	adds r4, #2
	adds r3, #1
	cmp r3, #0xf
	ble _08021D94
	movs r4, #0
	bl sub_8001EE4
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_804F610
	movs r0, #0
	movs r1, #0
	bl SetBackgroundTileDataOffset
	ldr r0, _08021E14 @ =0x085C39A0
	adds r1, r5, #0
	bl sub_8002BCC
	str r6, [r0, #0x2c]
	str r7, [r0, #0x30]
	adds r0, #0x4c
	strh r4, [r0]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08021E08: .4byte 0x06002000
_08021E0C: .4byte 0x11111111
_08021E10: .4byte 0x020228A8
_08021E14: .4byte 0x085C39A0


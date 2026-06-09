	.syntax unified
	.set EfxTmCpyBG, 0x080733B8 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set RegisterDataMove, 0x08001F64 + 1
	.set SetupFaceGfxData, 0x0800544C + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8005544, 0x08005544 + 1
	.set sub_8075A08, 0x08075A08 + 1
	.set sub_80D636C, 0x080D636C + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_8076170, "ax", %progbits
@ sub_8076170 @ JP 0x08076170 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8076170
	.thumb_func
sub_8076170:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, _08076208 @ =0x0203E184
	ldr r0, [r0]
	mov sb, r0
	ldr r0, _0807620C @ =0x0203E188
	ldr r0, [r0]
	mov r8, r0
	ldr r6, [r7, #0x5c]
	ldr r0, _08076210 @ =0x08857B08
	ldr r5, _08076214 @ =0x02017790
	adds r1, r5, #0
	bl sub_80D6394
	ldr r0, _08076218 @ =0x08857F40
	ldr r4, _0807621C @ =0x02019790
	adds r1, r4, #0
	bl sub_80D6394
	ldr r1, _08076220 @ =0x02023628
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x14
	bl EfxTmCpyBG
	ldr r1, _08076224 @ =0x06002000
	movs r2, #0x8c
	lsls r2, r2, #4
	adds r0, r5, #0
	bl RegisterDataMove
	ldr r0, _08076228 @ =0x08858068
	ldr r4, _0807622C @ =0x020228C8
	adds r1, r4, #0
	movs r2, #8
	bl sub_80D636C
	ldr r0, _08076230 @ =0x085E52F8
	ldr r5, _08076234 @ =0x0201A790
	adds r1, r5, #0
	bl sub_80D6394
	ldr r1, _08076238 @ =0x06011400
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r5, #0
	bl RegisterDataMove
	ldr r0, _0807623C @ =0x085E550C
	movs r1, #0x80
	lsls r1, r1, #2
	adds r4, r4, r1
	adds r1, r4, #0
	movs r2, #8
	bl sub_80D636C
	bl sub_8001EE4
	movs r0, #0x50
	strh r0, [r7, #0x2c]
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08076240
	mov r1, sb
	b _08076242
	.align 2, 0
_08076208: .4byte 0x0203E184
_0807620C: .4byte 0x0203E188
_08076210: .4byte 0x08857B08
_08076214: .4byte 0x02017790
_08076218: .4byte 0x08857F40
_0807621C: .4byte 0x02019790
_08076220: .4byte 0x02023628
_08076224: .4byte 0x06002000
_08076228: .4byte 0x08858068
_0807622C: .4byte 0x020228C8
_08076230: .4byte 0x085E52F8
_08076234: .4byte 0x0201A790
_08076238: .4byte 0x06011400
_0807623C: .4byte 0x085E550C
_08076240:
	mov r1, r8
_08076242:
	ldr r0, [r1]
	ldrh r4, [r0, #6]
	ldr r0, _0807628C @ =0x087A9800
	bl SetupFaceGfxData
	ldr r0, _08076290 @ =0x00001042
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0xbc
	movs r3, #0x50
	bl sub_8005544
	ldr r0, _08076294 @ =0x03004920
	ldr r1, [r0]
	movs r2, #0
	movs r0, #0xa0
	strh r0, [r1, #0x36]
	str r2, [sp, #8]
	ldr r1, _08076298 @ =0x02023CA8
	ldr r2, _0807629C @ =0x01000200
	add r0, sp, #8
	bl sub_80D636C
	adds r0, r7, #0
	bl sub_8075A08
	adds r0, r7, #0
	bl sub_8002DE4
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807628C: .4byte 0x087A9800
_08076290: .4byte 0x00001042
_08076294: .4byte 0x03004920
_08076298: .4byte 0x02023CA8
_0807629C: .4byte 0x01000200


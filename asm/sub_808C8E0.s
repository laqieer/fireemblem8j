	.syntax unified
	.set ClearAllTalkFlags, 0x0800699C + 1
	.set InitSpriteText, 0x080044E0 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80044A4, 0x080044A4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_808C834, 0x0808C834 + 1
	.section .text.sub_808C8E0, "ax", %progbits
@ sub_808C8E0 @ JP 0x0808C8E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808C8E0
	.thumb_func
sub_808C8E0:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r5, #0
	bne _0808C8EC
	ldr r5, _0808C944 @ =0x06013000
_0808C8EC:
	cmp r6, #0
	bge _0808C8F2
	movs r6, #5
_0808C8F2:
	movs r0, #0xf
	ands r0, r6
	adds r6, r0, #0
	adds r6, #0x10
	bl sub_808C834
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808C95C
	ldr r0, _0808C948 @ =0x08A74A60
	movs r2, #0xd8
	lsls r2, r2, #2
	adds r1, r5, r2
	bl sub_8013008
	ldr r0, _0808C94C @ =0x08A74AD4
	movs r2, #0xec
	lsls r2, r2, #3
	adds r1, r5, r2
	bl sub_8013008
	ldr r0, _0808C950 @ =0x08A74B4C
	movs r2, #0xb6
	lsls r2, r2, #4
	adds r1, r5, r2
	bl sub_8013008
	ldr r0, _0808C954 @ =0x08A74BF4
	movs r2, #0xf8
	lsls r2, r2, #4
	adds r1, r5, r2
	bl sub_8013008
	ldr r0, _0808C958 @ =0x08A74C64
	movs r2, #0x9c
	lsls r2, r2, #5
	adds r1, r5, r2
	bl sub_8013008
	b _0808C998
	.align 2, 0
_0808C944: .4byte 0x06013000
_0808C948: .4byte 0x08A74A60
_0808C94C: .4byte 0x08A74AD4
_0808C950: .4byte 0x08A74B4C
_0808C954: .4byte 0x08A74BF4
_0808C958: .4byte 0x08A74C64
_0808C95C:
	ldr r0, _0808CA0C @ =0x08A74914
	movs r2, #0xd8
	lsls r2, r2, #2
	adds r1, r5, r2
	bl sub_8013008
	ldr r0, _0808CA10 @ =0x08A7493C
	movs r2, #0xec
	lsls r2, r2, #3
	adds r1, r5, r2
	bl sub_8013008
	ldr r0, _0808CA14 @ =0x08A74964
	movs r2, #0xb6
	lsls r2, r2, #4
	adds r1, r5, r2
	bl sub_8013008
	ldr r0, _0808CA18 @ =0x08A749CC
	movs r2, #0xf6
	lsls r2, r2, #4
	adds r1, r5, r2
	bl sub_8013008
	ldr r0, _0808CA1C @ =0x08A74A38
	movs r2, #0x9b
	lsls r2, r2, #5
	adds r1, r5, r2
	bl sub_8013008
_0808C998:
	bl ClearAllTalkFlags
	bl sub_808C834
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _0808CA38
	ldr r4, _0808CA20 @ =0x0203E7E4
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_80044A4
	adds r0, r4, #0
	adds r0, #0x18
	bl InitSpriteText
	adds r0, r4, #0
	adds r0, #0x20
	bl InitSpriteText
	adds r0, r4, #0
	adds r0, #0x28
	bl InitSpriteText
	bl sub_808C834
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808C9F4
	bl sub_808C834
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _0808C9F4
	adds r0, r4, #0
	adds r0, #0x30
	bl InitSpriteText
	adds r0, r4, #0
	adds r0, #0x38
	bl InitSpriteText
_0808C9F4:
	movs r0, #0
	bl SetTextFont
	bl sub_808C834
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808CA28
	ldr r0, _0808CA24 @ =0x085C74A0
	b _0808CA2A
	.align 2, 0
_0808CA0C: .4byte 0x08A74914
_0808CA10: .4byte 0x08A7493C
_0808CA14: .4byte 0x08A74964
_0808CA18: .4byte 0x08A749CC
_0808CA1C: .4byte 0x08A74A38
_0808CA20: .4byte 0x0203E7E4
_0808CA24: .4byte 0x085C74A0
_0808CA28:
	ldr r0, _0808CA34 @ =0x085C7480
_0808CA2A:
	lsls r1, r6, #5
	movs r2, #0x20
	bl sub_8000D68
	b _0808CA74
	.align 2, 0
_0808CA34: .4byte 0x085C7480
_0808CA38:
	ldr r0, _0808CA48 @ =0x0203E7E4
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_80044A4
	movs r4, #0
	lsls r7, r6, #5
	b _0808CA58
	.align 2, 0
_0808CA48: .4byte 0x0203E7E4
_0808CA4C:
	lsls r0, r4, #3
	ldr r1, _0808CAAC @ =0x0203E7FC
	adds r0, r0, r1
	bl InitSpriteText
	adds r4, #1
_0808CA58:
	bl sub_808C834
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt _0808CA4C
	movs r0, #0
	bl SetTextFont
	ldr r0, _0808CAB0 @ =0x085C7420
	adds r1, r7, #0
	movs r2, #0x20
	bl sub_8000D68
_0808CA74:
	ldr r2, _0808CAB4 @ =0x0203E7E4
	lsls r1, r5, #0x11
	lsrs r1, r1, #0x16
	movs r0, #0xf
	ands r0, r6
	lsls r0, r0, #0xc
	adds r1, r1, r0
	adds r2, #0x40
	strh r1, [r2]
	bl sub_808C834
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808CAA4
	ldr r0, _0808CAB8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808CAA4
	ldr r0, _0808CABC @ =0x000002E6
	bl m4aSongNumStart
_0808CAA4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808CAAC: .4byte 0x0203E7FC
_0808CAB0: .4byte 0x085C7420
_0808CAB4: .4byte 0x0203E7E4
_0808CAB8: .4byte 0x0202BCEC
_0808CABC: .4byte 0x000002E6

